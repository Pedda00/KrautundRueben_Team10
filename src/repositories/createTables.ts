import * as fs from "fs";
import * as path from "path";
import connection from "../db/setup/connection";
import { fileURLToPath } from "url";
import { PoolConnection } from "mysql2/promise";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const sqlDir = path.join(__dirname, "../db/migrations");

interface sqlSet {
  filePath: string;
  tableName: string;
  dependsOn: string[] | null;
}

const regexReferencedTable =
  /REFERENCES\s+([`"\[]?[A-Za-z0-9_\.]+[`"\]]?)\s*\(/gi;

const regexTable =
  /CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?([`"\[]?[A-Za-z0-9_\.]+[`"\]]?)/i;

function normalizeSQL(rawSQL: string): string {
  const sqlStand = rawSQL
    .trim()
    .replace(/^`|`$/g, "")
    .replace(/^"|"$/g, "")
    .replace(/^\[|\]$/g, "")
    .replace(/.+\./, "");
  return sqlStand.toLowerCase();
}

function filterReferencedTable(sqlStand: string): string[] | null {
  const referencedTables: string[] = Array.from(
    sqlStand.matchAll(regexReferencedTable),
    (m) => m[1]
  );
  return referencedTables;
}

function filterTable(sqlStand: string): string {
  // const tableName = regexTable.exec(sqlStand);
  const tableName = sqlStand.match(regexTable);
  if (tableName === null) {
    throw new Error(
      "Die .sql-Datei enthält kein Befehl zur Erstellung einer Tabelle!."
    );
  }
  return tableName[1];
}

export function constSQLSets(): sqlSet[] {
  const files = fs.readdirSync(sqlDir).filter((f) => f.endsWith(".sql"));
  const sqlSets: sqlSet[] = files.map((file) => {
    const filePath = path.join(sqlDir, file);
    const sql = normalizeSQL(fs.readFileSync(filePath, "utf-8"));
    const tableName = filterTable(sql);
    const dependsOn = filterReferencedTable(sql);
    return { filePath, tableName, dependsOn };
  });
  return sqlSets;
}

export function sortSQLSetsTop(sqlSets: sqlSet[]) {
  // statische Map für Struktur
  const graph = new Map<string, Set<string>>();
  // dynamische Map mit sich verändernden Zahlenwerten
  const indegree = new Map<string, number>();

  for (const set of sqlSets) {
    // Namen von Tabellen zusammen mit einem leeren Set, also ohne von ihr ahängige Tabellen
    graph.set(set.tableName, new Set());
    indegree.set(set.tableName, 0);
  }

  for (const set of sqlSets) {
    // Falls null []
    const deps = set.dependsOn ?? [];
    for (const dep of deps) {
      if (!graph.has(dep)) {
        continue;
      }
      // get kann als Rückgabewert die value des key oder undefined haben, wenn der Schlüssel nicht existiert. Typescript möchte für add garantiereren, dass nicht undefined gegeben wird
      graph.get(dep)!.add(set.tableName);
      indegree.set(set.tableName, (indegree.get(set.tableName) ?? 0) + 1);
    }
  }

  const queue: string[] = [];
  // entries() gibt alle Schlüsselwertpaare zurück, Aufschlüsselung in name und count
  for (const [name, count] of indegree.entries()) {
    if (count === 0) queue.push(name);
  }

  const order: string[] = [];
  while (queue.length > 0) {
    // shift gibt erstes Element aus queue an current
    const current = queue.shift()!;
    order.push(current);

    for (const dependent of graph.get(current) ?? []) {
      indegree.set(dependent, indegree.get(dependent)! - 1);
      if (indegree.get(dependent) === 0) queue.push(dependent);
    }
  }
  if (order.length !== sqlSets.length) {
    console.warn("Zyklische oder fehlende Abhängigkeiten erkannt!");
  }
  const lookup = new Map(sqlSets.map((s) => [s.tableName, s]));
  const orderSQLTables = order.map((name) => lookup.get(name)!).filter(Boolean);
  return orderSQLTables;
}

export async function executeOrderSQLTables(
  orderSQLTables: sqlSet[]
): Promise<void> {
  let connec: PoolConnection | null = null;
  try {
    connec = await connection.adminPool.getConnection();
    await connec.beginTransaction();
    for (const set of orderSQLTables) {
      const sql = fs.readFileSync(set.filePath, "utf-8");
      try {
        await connec.query(sql);
        // prettier-ignore
        console.log(`Tabelle ${set.tableName} erfolgreich erstellt.`);
      } catch (err) {
        // prettier-ignore
        console.error(`Fehler in Datei ${path.basename(set.filePath)}:`, err);
        throw err;
      }
    }
    await connec.commit();
    console.log("Alle Tabellen wurde erfolgreich erstellt.");
  } catch (err) {
    console.error("Fehler beim Erstellen der Tabellen:", err);
    if (connec) {
      console.log("Rollback der Transaktion.");
      await connec.rollback();
    }
  } finally {
    if (connec) connec.release();
  }
}

export default { executeOrderSQLTables, sortSQLSetsTop, constSQLSets };

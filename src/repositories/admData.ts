import { PoolConnection, RowDataPacket } from "mysql2/promise";
import connection from "../db/setup/connection";
import * as fs from "fs";
import * as path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export async function insertTestData(): Promise<void> {
  let connec: PoolConnection | null = null;
  try {
    connec = await connection.adminPool.getConnection();
    await connec.beginTransaction();
    const filePath = path.join(__dirname, "../db/seeders/dml_insert_data.sql");
    const sql = fs.readFileSync(filePath, "utf-8");
    try {
      await connec.query(sql);
    } catch (err) {}
    await connec.commit();
    console.log("Testdaten den Tabellen erfolgreich hinzugefügt.");
  } catch (err) {
    console.log("Fehler beim hinzufügen der Daten.", err);
    if (connec) {
      console.log("Rollback der Transaktion.");
      await connec.rollback();
    }
  } finally {
    if (connec) connec.release();
  }
}

async function deleteData(
  table: string,
  connec: PoolConnection
): Promise<void> {
  const sqlDelete = `DELETE FROM ${table};`;
  const sqlAutoInc = `ALTER TABLE ${table} AUTO_INCREMENT = 1`;
  try {
    await connec.query(sqlDelete);
    await connec.query(sqlAutoInc);
  } catch (err) {
    console.error(`Fehler beim löschen der Daten aus Tabelle: ${table}`, err);
  }
}

export async function deleteDataTable(tables: string[]): Promise<void> {
  let connec: PoolConnection | null = null;
  try {
    connec = await connection.adminPool.getConnection();
    await connec.beginTransaction();
    const tableDeleted: Record<string, boolean> = {};
    for (const table in tables) {
      tableDeleted[table] = false;
    }
    for (const table of tables) {
      await deleteData(table, connec);
      tableDeleted[table] = true;
    }
    await connec.commit();
    const deletedTables = Object.entries(tableDeleted)
      .filter(([_, value]) => value)
      .map(([key]) => key);
    const deletedTablesString = deletedTables.join(", ");
    console.log(
      `Aus folgende(n/r) Tabelle(n) wurden alle Daten gelöscht: ${deletedTablesString}.`
    );
  } catch (err) {
    console.error(
      `Fehler beim löschen der Daten in den Tabellen: . Mit diesem Fehler:`,
      err
    );
    if (connec) {
      console.log("Rollback der Transaktion.");
      await connec.rollback();
    }
  } finally {
    if (connec) connec.release();
  }
}

export default { insertTestData, deleteDataTable };

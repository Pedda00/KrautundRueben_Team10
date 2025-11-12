import { PoolConnection, RowDataPacket } from "mysql2/promise";
import connection from "../db/setup/connection";
import * as fs from "fs";
import * as path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export async function deleteAllTables(): Promise<void> {
  let connec: PoolConnection | null = null;
  try {
    connec = await connection.adminPool.getConnection();
    await connec.beginTransaction();
    await connec.query("SET FOREIGN_KEY_CHECKS = 0;");
    const [rows] = await connec.query<RowDataPacket[]>(`
      SELECT table_name
      FROM information_schema.tables
      WHERE table_schema = DATABASE();
    `);
    if (rows.length === 0) {
      console.log("Keine Tabellen im aktuellen Schema gefunden.");
    } else {
      for (const row of rows) {
        const tableName = row.TABLE_NAME;
        const dropSQL = `DROP TABLE IF EXISTS \`${tableName}\``;
        await connec.query(dropSQL);
        console.log(`Tabelle ${tableName} gelöscht`);
      }
    }
    await connec.query("SET FOREIGN_KEY_CHECKS = 1;");
    await connec.commit();
    console.log(
      "Alle Tabellen erfolgreich gelöscht und Transaktion bestätigt."
    );
  } catch (err) {
    console.log("Fehler beim löschen der Tabellen:", err);
    if (connec) {
      console.log("Rollback der Transaktion.");
      await connec.rollback();
    }
  } finally {
    if (connec) connec.release();
  }
}

import { PoolConnection } from "mysql2/promise";
import connection from "../db/setup/connection";
import * as fs from "fs";
import * as path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export async function deleteAllTables(): Promise<void> {
  let connec: PoolConnection | null = null;

  try {
    connec = await connection.pool.getConnection();

    await connec.beginTransaction();

    // Einfügen
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

import mysql, { Pool } from "mysql2/promise";
import * as dotenv from "dotenv";

dotenv.config();

const defaultPool: Pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  connectionLimit: 20, // Gleichzeitige offene Verbindung zur Datenbank möglich
  queueLimit: 100, // Maximale Anfragen ion der Warteschlage
});

// Pool-Manaqgement
defaultPool.on("acquire", function (connection) {
  console.log(
    "Verbindung zur Datenbank mit der ID %d aus Pool entnommen.",
    connection.threadId
  );
});

defaultPool.on("connection", function (connection) {
  console.log(
    "Verbindung zur Datenbank mit der ID %d hergestellt.",
    connection.threadId
  );
});

defaultPool.on("release", function (connection) {
  console.log(
    "Verbindung zur Datenbank mit der ID %d wieder dem Pool hinzugefügt.",
    connection.threadId
  );
});

defaultPool.on("enqueue", function () {
  console.log("Warten auf eine verfügbare Verbindung aus dem Pool ...");
});

(async () => {
  try {
    const connection = await defaultPool.getConnection(); // Keine Callback-Funktion
    try {
      connection.release();
    } catch (err) {
      console.error("Verbindung zur Datenbank konnte nicht getrennt werden.");
    }
  } catch (err) {
    console.error("Fehler bei der Verbindung zur Datenbank:", err);
  }
})();

// Admin Pool
const adminPool: Pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  multipleStatements: true,
  connectionLimit: 20, // Gleichzeitige offene Verbindung zur Datenbank möglich
  queueLimit: 100, // Maximale Anfragen ion der Warteschlage
});

// Pool-Manaqgement
adminPool.on("acquire", function (connection) {
  console.log(
    "Verbindung zur Datenbank mit der ID %d aus Pool entnommen.",
    connection.threadId
  );
});

adminPool.on("connection", function (connection) {
  console.log(
    "Verbindung zur Datenbank mit der ID %d hergestellt.",
    connection.threadId
  );
});

adminPool.on("release", function (connection) {
  console.log(
    "Verbindung zur Datenbank mit der ID %d wieder dem Pool hinzugefügt.",
    connection.threadId
  );
});

adminPool.on("enqueue", function () {
  console.log("Warten auf eine verfügbare Verbindung aus dem Pool ...");
});

(async () => {
  try {
    const connection = await adminPool.getConnection(); // Keine Callback-Funktion
    try {
      connection.release();
    } catch (err) {
      console.error("Verbindung zur Datenbank konnte nicht getrennt werden.");
    }
  } catch (err) {
    console.error("Fehler bei der Verbindung zur Datenbank:", err);
  }
})();

export default { defaultPool, adminPool };

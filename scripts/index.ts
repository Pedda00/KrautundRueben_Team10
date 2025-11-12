import {
  executeOrderSQLTables,
  sortSQLSetsTop,
  constSQLSets,
} from "../src/repositories/createTables";
import { deleteAllTables } from "../src/repositories/admTables";
import { insertTestData, deleteDataTable } from "../src/repositories/admData";

// await executeOrderSQLTables(sortSQLSetsTop(constSQLSets()));

// await deleteAllTables();

// await insertTestData();
await deleteDataTable(["adresse"]);

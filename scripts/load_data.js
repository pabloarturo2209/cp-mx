import dotenv from "dotenv";
dotenv.config();

import pool from "../src/database/db.js";
import fs from "fs";
import { from } from "pg-copy-streams";
import { pipeline } from "stream/promises";

async function loadData() {
  const client = await pool.connect();

  try {
    await client.query("BEGIN");

    const createTablesQuery = fs.readFileSync(
      "./src/database/scripts/create_tables.sql",
      "utf-8",
    );
    await client.query(createTablesQuery);
    console.log("Tables created successfully");

    const copyStream = client.query(
      from(`
        COPY codigos_postales(
          d_codigo, d_asenta, d_tipo_asenta, d_mnpio,
          d_estado, d_ciudad, d_cp, c_estado,
          c_oficina, c_cp, c_tipo_asenta,
          c_mnpio, id_asenta_cpcons,
          d_zona, c_cve_ciudad
        )
        FROM STDIN
        WITH (
          FORMAT csv,
          DELIMITER '|',
          HEADER true
        )
      `),
    );

    const fileStream = fs.createReadStream("./CPdescarga.txt");

    await pipeline(fileStream, copyStream);
    console.log("data from csv loaded successfully");

    const insertDataQuery = fs.readFileSync(
      "./src/database/scripts/insert_data.sql",
      "utf-8",
    );

    await client.query(insertDataQuery);
    console.log("Data inserted successfully");

    await client.query("COMMIT");
    console.log("Transaction committed successfully");
  } catch (err) {
    await client.query("ROLLBACK");
    console.error("Error loading data, transaction rolled back:", err);
  } finally {
    client.release();
  }
}

loadData();

import mysql from "mysql2";
import { Router } from "express";
const storageCita = Router();

let con = undefined;

storageCita.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageCita.get("/", (req, res) => {
  con.query(
    `SELECT * FROM cita ORDER BY (cit_fecha) ASC;`,

    (err, data, fil) => {
      res.send(JSON.stringify(data));
    }
  );
});


export default storageCita;
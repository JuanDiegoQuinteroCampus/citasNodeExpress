import mysql from "mysql2";
import { Router } from "express";
const storageMedico = Router();

let con = undefined;

storageMedico.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageMedico.get("/", (req, res) => {
  con.query(
    `SELECT med_nombreCompleto
    FROM medico
    INNER JOIN especialidad ON medico.med_especialidad = especialidad.esp_id
    WHERE especialidad.esp_nombre ;
    `,

    (err, data, fil) => {
      res.send(JSON.stringify(data));
    }
  );
});

export default storageMedico;

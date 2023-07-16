import mysql from "mysql2";
import { Router } from "express";
const storageMedConsultorio = Router();

let con = undefined;

storageMedConsultorio.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageMedConsultorio.get('/medconsultorio', (req, res) => {
  con.query(
    `SELECT m.med_nroMatriculaProsional, m.med_nombreCompleto, c.cons_codigo
    FROM medico m
    INNER JOIN consultorio c ON m.med_consultorio = c.cons_codigo;`,
    (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Error en la base de datos' });
      } else {
        res.json({ medicos: results });
      }
    }
  );
});

export default storageMedConsultorio;

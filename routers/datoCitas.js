import mysql from "mysql2";
import { Router } from "express";
const storageDatosCita = Router();

let con = undefined;

storageDatosCita.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageDatosCita.get('/citas/rechazadas/:mes', (req, res) => {
  const mes = req.params.mes;
  
  con.query(
    `SELECT c.cit_fecha, u.usu_nombre, m.med_nombreCompleto
    FROM cita c
    INNER JOIN usuario u ON c.cit_datosUsuario = u.usu_id
    INNER JOIN medico m ON c.cit_medico = m.med_nroMatriculaProsional
    WHERE c.cit_estadoCita = 'rechazada' AND MONTH(c.cit_fecha) = ?;`,
    [mes],
    (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Error en la base de datos' });
      } else if (results.length === 0) {
        res.status(404).json({ message: 'No se encontraron citas rechazadas para el mes especificado' });
      } else {
        res.json({ citas: results });
      }
    }
  );
});

export default storageDatosCita;

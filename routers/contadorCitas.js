import mysql from "mysql2";
import { Router } from "express";
const storageContadorCitas = Router();

let con = undefined;

storageContadorCitas.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageContadorCitas.get('/citas/:medico_id/:fecha', (req, res) => {
  const medico_id = req.params.medico_id;
  const fecha = req.params.fecha;
  
  con.query(
    `SELECT COUNT(*) AS num_citas
    FROM cita
    WHERE cit_medico = ? AND cit_fecha = ?;`,
    [medico_id, fecha],
    (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Error en la base de datos' });
      } else {
        const num_citas = results[0].num_citas;
        res.json({ num_citas });
      }
    }
  );
});

export default storageContadorCitas;

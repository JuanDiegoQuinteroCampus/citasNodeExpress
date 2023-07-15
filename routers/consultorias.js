import mysql from "mysql2";
import { Router } from "express";
const storageConsultorias = Router();

let con = undefined;

storageConsultorias.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageConsultorias.get('/:usu_id/pacientes', (req, res) => {
  const usu_id = req.params.usu_id;
  
  con.query(
    `SELECT c.*
    FROM cita c
    INNER JOIN usuario u ON c.cit_datosUsuario = u.usu_id
    WHERE u.usu_id = ?;`,
    [usu_id],
    (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Error en la base de datos' });
      } else if (results.length === 0) {
        res.status(404).json({ message: 'No se encontraron consultorías' });
      } else {
        res.json({ consultorias: results });
      }
    }
  );
});

export default storageConsultorias;
import mysql from "mysql2";
import { Router } from "express";
const storageCitasGenero = Router();

let con = undefined;

storageCitasGenero.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageCitasGenero.get('/citas/:genero_id', (req, res) => {
  const genero_id = req.params.genero_id;
  
  con.query(
    `SELECT c.*
    FROM cita c
    INNER JOIN usuario u ON c.cit_datosUsuario = u.usu_id
    INNER JOIN genero g ON u.usu_genero = g.gen_id
    WHERE g.gen_id = ? AND c.cit_estadoCita = 1;`,
    [genero_id],
    (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Error en la base de datos' });
      } else if (results.length === 0) {
        res.status(404).json({ message: 'No se encontraron citas para el género y estado especificados' });
      } else {
        res.json({ citas: results });
      }
    }
  );
});

export default storageCitasGenero;

import mysql from "mysql2";
import { Router } from "express";
const storageProxCita = Router();

let con = undefined;

storageProxCita.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageProxCita.get('/:usu_id/cita/proxima', (req, res) => {
    const usu_id = req.params.usu_id;
  
    con.query(
        `SELECT cita.*
    FROM cita
    INNER JOIN usuario ON cita.cit_datosUsuario = usuario.usu_id
    WHERE usuario.usu_id = ? AND cita.cit_fecha >= CURDATE()
    ORDER BY cita.cit_fecha LIMIT 1`,
      [usu_id],
      (err, results) => {
        if (err) {

          res.status(500).json({ error: 'Error en la base de datos' });

        } else if (results.length === 0) {
          res.status(404).json({ message: 'No se encontró ninguna cita' });
        } else {
          res.json({ cita: results[0] });
        }
      }
    );
  });

export default storageProxCita;
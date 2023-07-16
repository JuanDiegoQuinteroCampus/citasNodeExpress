import mysql from "mysql2";
import { Router } from "express";
const storageConsultorioCitas = Router();

let con = undefined;

storageConsultorioCitas.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageConsultorioCitas.get('/pacientes/:usu_id/consultorios', (req, res) => {
  const usu_id = req.params.usu_id;
  
  con.query(
    `SELECT c.cons_codigo, c.cons_nombre
    FROM cita ci
    INNER JOIN consultorio c ON ci.cit_medico = c.cons_codigo
    WHERE ci.cit_datosUsuario = ?;`,
    [usu_id],
    (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Error en la base de datos' });
      } else if (results.length === 0) {
        res.status(404).json({ message: 'No se encontraron consultorios' });
      } else {
        res.json({ consultorios: results });
      }
    }
  );
});

export default storageConsultorioCitas;

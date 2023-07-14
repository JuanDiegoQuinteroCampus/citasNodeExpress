import mysql from "mysql2";
import { Router } from "express";
const storageCitaMedico = Router();

let con = undefined;

storageCitaMedico.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageCitaMedico.get('/:med_nroMatriculaProsional/pacientes', (req, res) => {
    const med_nroMatriculaProsional = req.params.med_nroMatriculaProsional ;
  
    con.query(
      `SELECT u.*
      FROM usuario u
      INNER JOIN cita c ON u.usu_id = c.cit_datosUsuario
      WHERE c.cit_medico = ?;`,
      [med_nroMatriculaProsional],
      (err, results) => {
        if (err) {

          res.status(500).json({ error: 'Error en la base de datos' });

        } else if (results.length === 0) {
          res.status(404).json({ message: 'No se encontró paciente con cita con un medigo en especifico' });
        } else {
          res.json({ pacientes: results });
        }
      }
    );
  });



export default storageCitaMedico;
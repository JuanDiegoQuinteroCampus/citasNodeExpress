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

  
  con.query(
    `SELECT consultorio.cons_codigo as consultorioCodigo, consultorio.cons_nombre as consultorioNombre, usuario.usu_id as pacienteCodigo, usuario.usu_nombre as pacienteNombre, usuario.usu_primer_apellido_usuar as pacienteApellido1, cita.cit_fecha as citaFecha FROM usuario INNER JOIN cita ON cita.cit_datosUsuario = usuario.usu_id INNER JOIN medico ON medico.med_nroMatriculaProsional = cita.cit_medico INNER JOIN consultorio ON consultorio.cons_codigo = medico.med_consultorio WHERE usuario.usu_id = ${req.params.usu_id};`,

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

export default storageConsultorias;
import mysql from "mysql2";
import { Router } from "express";
const storageCitasGenero = Router();

let con = undefined;

storageCitasGenero.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageCitasGenero.get('/citas/:genero/:estado', (req, res) => {
  let data = req.params;
    con.query(
         `SELECT cita.cit_fecha as fecha, usuario.usu_nombre as paciente, estado_cita.estcita_nombre as estado, genero.gen_nombre as genero from cita INNER JOIN usuario on usuario.usu_id=cita.cit_datosUsuario INNER JOIN genero on genero.gen_id=usuario.usu_genero INNER JOIN estado_cita on estado_cita.estcita_id=cita.cit_estadoCita where genero.gen_nombre=? and estado_cita.estcita_nombre=? `,
        Object.values(data),
        (err,data,fill)=>{
            res.send(data);
        }
    )
});

export default storageCitasGenero;

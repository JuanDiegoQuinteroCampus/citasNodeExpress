import mysql from "mysql2";
import { Router } from "express";
const storageMedico = Router();

let con = undefined;

storageMedico.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageMedico.get("/:especialidad", (req, res) => {
  const especialidad = req.params.especialidad;
  con.query(
    `SELECT med_nombreCompleto
    FROM medico
    INNER JOIN especialidad ON medico.med_especialidad = especialidad.esp_id
    WHERE especialidad.esp_nombre = ?;
    `,
    [especialidad],
    (err, results) => {
      if (err) {
        res.status(500).json({ error: "Error en la base de datos" });
      } else if (results.length === 0) {
        res
          .status(404)
          .json({ message: "No se encontraron médicos con la especialidad especificada" });
      } else {
        res.json({ medicos: results });
      }
    }
  );
});

export default storageMedico;

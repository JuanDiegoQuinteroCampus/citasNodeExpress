import mysql from "mysql2";
import { Router } from "express";
const storageEncontrarCita = Router();

let con = undefined;

storageEncontrarCita.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageEncontrarCita.get("/citas/:fecha", (req, res) => {
  const fecha = req.params.fecha;

  con.query(
    `SELECT *
    FROM cita
    WHERE cit_fecha = ?;`,
    [fecha],
    (err, results) => {
      if (err) {
        res.status(500).json({ error: "Error en la base de datos" });
      } else if (results.length === 0) {
        res
          .status(404)
          .json({ message: "No se encontraron citas para el día específico" });
      } else {
        res.json({ citas: results });
      }
    }
  );
});

export default storageEncontrarCita;

import mysql from "mysql2";
import { Router } from "express";
const storageUsuario = Router();

let con = undefined;

storageUsuario.use((req, res, next) => {
  let myConfig = JSON.parse(process.env.MY_CONNECT);
  con = mysql.createPool(myConfig);
  next();
});

storageUsuario.get("/", (req, res) => {
  con.query(
    `SELECT * FROM usuario ORDER BY (usu_nombre) ASC;`,

    (err, data, fil) => {
      res.send(JSON.stringify(data));
    }
  );
});
// storageUsuario.post("/", (req, res) => {
//   const {
//     id,
//     nombre,
//     id_responsable,
//     estado,
//     created_by,
//     update_by,
//     created_at,
//   } = req.body;

//   const sql = `
//       INSERT INTO bodegas (id, nombre, id_responsable, estado, created_by, update_by, created_at)
//       VALUES (?, ?, ?, ?, ?, ?, ?)
//     `;
//   /* datos a ingresar
//     {
//   "id": 51,
//   "nombre": "A Bodegas",
//   "id_responsable": 11,
//   "estado": 1,
//   "created_by": null,
//   "update_by": null,
//   "created_at": "2023-05-25 01:02:57"
// }
//  */
//   const values = [
//     id,
//     nombre,
//     id_responsable,
//     estado,
//     created_by,
//     update_by,
//     created_at,
//   ];

//   con.query(sql, values, (err, result) => {
//     if (err) {
//       console.error("Error al insertar la bodega:", err);
//       return res.status(500).json({ error: "Error interno del servidor." });
//     }

//     res.status(201).json({ mensaje: "Bodega insertada con éxito." });
//   });
// });

export default storageUsuario;

/* `INSERT INTO bodegas (id, nombre, id_responsable,estado,created_by,update_by,created_at)
        VALUES (51, 'A Bodegas', 11, 1, NULL, NULL, '2023-05-25 01:02:57', '2023-06-07 01:02:57', NULL);`, */

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

export default storageUsuario;


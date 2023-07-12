import dotenv from 'dotenv';
import express from 'express';
import storageUsuario from './routers/usuario.js';
import storageCita from './routers/cita.js';
/* 
import storageMedico from './routers/medico.js'; */
// import storageInventarios from './routers/inventarios.js';
dotenv.config();
const appExpress = express();//levanta todo el sevicio

appExpress.use(express.json());
appExpress.use("/usuario", storageUsuario);
appExpress.use("/cita", storageCita);
/* 
appExpress.use("/medico", storageMedico); */


const config = JSON.parse(process.env.MY_CONFIG);

appExpress.listen(config, ()=>{console.log(`http://${config.hostname}:${config.port}`);});
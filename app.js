import dotenv from 'dotenv';
import express from 'express';
import storageUsuario from './routers/usuario.js';

dotenv.config();
const appExpress = express();//levanta todo el sevicio

appExpress.use(express.json());
appExpress.use("/usuario", storageUsuario);



const config = JSON.parse(process.env.MY_CONFIG);

appExpress.listen(config, ()=>{console.log(`http://${config.hostname}:${config.port}`);});
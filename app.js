import dotenv from 'dotenv';
import express from 'express';
import storageUsuario from './routers/usuario.js';


dotenv.config();
const appExpress = express();//levanta todo el sevicio

appExpress.use(express.json());
appExpress.use("/usuario", storageUsuario);
appExpress.use("/cita", storageCita);
appExpress.use("/medico", storageMedico);
appExpress.use("/pacientes", storageProxCita);
appExpress.use("/citaMedico", storageCitaMedico);
appExpress.use("/consultorias", storageConsultorias);
appExpress.use("/buscar", storageEncontrarCita);
appExpress.use("/obtener", storageMedConsultorio);
appExpress.use("/contar", storageContadorCitas);
appExpress.use("/aplicar", storageConsultorioCitas);
appExpress.use("/genero", storageCitasGenero);
/* appExpress.use("/genero", storageCitasGenero); */
appExpress.use("/rechazadas", storageDatosCita);


const config = JSON.parse(process.env.MY_CONFIG);

appExpress.listen(config, ()=>{console.log(`http://${config.hostname}:${config.port}`);});
import dotenv from 'dotenv';
import express from 'express';
import storageUsuario from './routers/usuario.js';
import storageCita from './routers/cita.js';
import storageMedico from './routers/medico.js';
import storageProxCita from './routers/proxCita.js';
import storageCitaMedico from './routers/citaMedico.js';
import storageConsultorias from './routers/consultorias.js';
import storageEncontrarCita from './routers/encontrarCita.js';
import storageMedConsultorio from './routers/mediConsultorio.js';
import storageContadorCitas from './routers/contadorCitas.js';
import storageConsultorioCitas from './routers/consultorioDeCitas.js';
import storageCitasGenero from './routers/pacientesGenero.js';
/* import storageCitasGenero from './routers/pacientesGenero.js'; */
import storageDatosCita from './routers/datoCitas.js';

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
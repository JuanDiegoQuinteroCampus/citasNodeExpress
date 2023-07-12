CREATE DATABASE db_Citas_Medicas;

USE db_Citas_Medicas;

CREATE TABLE
    tipo_documento(
        tipdoc_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        tipdoc_nombre VARCHAR(20) NOT NULL,
        tipdoc_abreviatura VARCHAR(20) NOT NULL
    );

/* INSERT INTO `tipo_documento` (`tipdoc_id`, `tipdoc_nombre`, `tipdoc_abreviatura`) VALUES
 (1, 'gola', 'sds'); */

CREATE TABLE
    genero(
        gen_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        gen_nombre VARCHAR(20) NOT NULL,
        gen_abreviatura VARCHAR(20) NOT NULL
    );

CREATE TABLE
    usuario(
        usu_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        usu_nombre VARCHAR(50) NOT NULL,
        usu_segdo_nombre VARCHAR(45) NOT NULL,
        usu_primer_apellido_usuar VARCHAR(50) NOT NULL,
        usu_segdo_apellido_usuar VARCHAR(50) NOT NULL,
        usu_telefono VARCHAR(50) NOT NULL,
        usu_direccion VARCHAR(100) NOT NULL,
        usu_email VARCHAR(100) NOT NULL,
        usu_tipodoc INT NOT NULL,
        usu_genero INT NOT NULL,
        usu_acudiente INT NOT NULL,
        Foreign Key (usu_genero) REFERENCES genero(gen_id),
        Foreign Key (usu_tipodoc) REFERENCES tipo_documento(tipdoc_id),
        Foreign Key (usu_acudiente) REFERENCES acudiente(acu_codigo)
    );

CREATE TABLE
    acudiente(
        acu_codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        acu_nombreCompleto VARCHAR(100) NOT NULL,
        acu_telefono VARCHAR(100) NOT NULL,
        acu_direccion VARCHAR(200) NOT NULL
    );

CREATE TABLE
    cita(
        cit_codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        cit_fecha DATE NOT NULL,
        cit_estadoCita INT NOT NULL,
        cit_medico INT NOT NULL,
        cit_datosUsuario INT NOT NULL,
        Foreign Key (cit_datosUsuario) REFERENCES usuario(usu_id),
        Foreign Key (cit_estadoCita) REFERENCES estado_cita(estcita_id),
        Foreign Key (cit_medico) REFERENCES medico(med_nroMaticulaProsional)
    );

CREATE TABLE
    estado_cita(
        estcita_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        estcita_nombre VARCHAR(20) NOT NULL
    );

CREATE TABLE
    medico(
        med_nroMaticulaProsional INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        med_nombreCompleto VARCHAR(120) NOT NULL,
        med_consultorio INT NOT NULL,
        med_especialidad INT NOT NULL,
        Foreign Key (med_especialidad) REFERENCES especialidad(esp_id),
        Foreign Key (med_consultorio) REFERENCES consultorio(cons_codigo)
    );
ALTER TABLE medico CHANGE med_nroMatriculaProfesional med_nroMatriculaProsional INT NOT NULL  ;



CREATE TABLE
    especialidad(
        esp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        esp_nombre VARCHAR(20) NOT NULL
    );

CREATE TABLE
    consultorio(
        cons_codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        cons_nombre VARCHAR(50) NOT NULL
    );

DROP TABLE tipo_documento;

DROP TABLE genero;

DROP TABLE acudiente;

DROP TABLE cita;

DROP TABLE estado_cita;

DROP TABLE especialidad;

DROP TABLE consultorio;
INSERT INTO
    tipo_documento (
        tipdoc_nombre,
        tipdoc_abreviatura
    )
VALUES ("Tarjeta de Identidad", "TI");
INSERT INTO
    genero (gen_nombre, gen_abreviatura)
VALUES ("Femenino", "Fem");
INSERT INTO
    acudiente (
        acu_nombreCompleto,
        acu_telefono,
        acu_direccion
    )
VALUES (
        "Paco Alberto Escalante Prada",
        "3155466998",
        "Calle 21 nº 41-25"
    );
INSERT INTO especialidad(esp_nombre) VALUES("Medicina General");
INSERT INTO
    consultorio(cons_nombre)
VALUES ("El Prado");
INSERT INTO
    estado_cita (estcita_nombre)
VALUES ("ACTIVA"), ('SUPENDIDA'), ('CANCELADA'), ('PERDIDA');
INSERT INTO
    medico (
        med_nroMatriculaProsional,
        med_nombreCompleto,
        med_consultorio,
        med_especialidad
    )
VALUES (
        "465899584",
        "David Rojas",
        1,
        1
    );
INSERT INTO
    usuario (
        usu_id,
        usu_nombre,
        usu_segdo_nombre,
        usu_primer_apellido_usuar,
        usu_segdo_apellido_usuar,
        usu_telefono,
        usu_direccion,
        usu_email,
        usu_tipodoc,
        usu_genero,
        usu_acudiente
    ) VALUES (
        1095303358,
        "Daniela",
        "",
        "Zapata",
        "Mora",
        "3158696969",
        "Parque de los gatos",
        "daniLaMasViral@gmail.com",
        1,
        1,
        1
    );
INSERT INTO cita(cit_fecha,cit_estadoCita,cit_medico,cit_datosUsuario) VALUES ("2023-07-12 10:30:00",1,465899584,1098817567);

insert into tipo_documento (tipdoc_nombre,tipdoc_abreviatura) values ('Cedula de Ciudadania','Cc');
insert into tipo_documento (tipdoc_nombre,tipdoc_abreviatura) values ('Tarjeta de Identidad','T.i');
insert into tipo_documento (tipdoc_nombre,tipdoc_abreviatura) values ('Pasaporte','Past');

insert into genero (gen_nombre,gen_abreviatura) values ('Masculino','M');
insert into genero (gen_nombre,gen_abreviatura) values ('Femenino','F');
insert into genero (gen_nombre,gen_abreviatura) values ('Otro','Otro');

insert into acudiente (acu_nombreCompleto, acu_telefono, acu_direccion) values ('Edgar Eduardo Mantilla Garcia','3167965248', 'Lebrija Santander');
insert into acudiente (acu_nombreCompleto, acu_telefono, acu_direccion) values ('Stiven Carvajal','3147854987', 'Palomitas Floridablanca');


INSERT INTO usuario (usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usuar, usu_segdo_apellido_usuar, usu_telefono, usu_direccion, usu_email, usu_tipodoc, usu_genero, usu_acudiente) VALUES ('123','Andres','Santiago','Carvajal','Peliño','3154784596','Bucaramanga','santiagoyo@gmail.com',1,1,1);
INSERT INTO usuario (usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usuar, usu_segdo_apellido_usuar, usu_telefono, usu_direccion, usu_email, usu_tipodoc, usu_genero, usu_acudiente) VALUES ('321','Fabio','Alberto','Morales','Petriño','3174578496','Giron','fabio478@outlook.es',1,1,1);
INSERT INTO usuario (usu_id, usu_nombre, usu_primer_apellido_usuar, usu_segdo_apellido_usuar, usu_telefono, usu_direccion, usu_email, usu_tipodoc, usu_genero, usu_acudiente) VALUES ('74','Alejandra','Mantilla','Garcia','3007845647','Lebrija','aleja78@outlook.es',2,2,2);

INSERT INTO especialidad (esp_id, esp_nombre) VALUES (1, 'Cardiología');
INSERT INTO especialidad (esp_id, esp_nombre) VALUES (2, 'Dermatología');
INSERT INTO especialidad (esp_id, esp_nombre) VALUES (3, 'Pediatría');
INSERT INTO especialidad (esp_id, esp_nombre) VALUES (4, 'Oftalmología');
INSERT INTO especialidad (esp_id, esp_nombre) VALUES (5, 'Gastroenterología');



INSERT INTO consultorio (cons_codigo, cons_nombre) VALUES (1, 'Consultorio A');
INSERT INTO consultorio (cons_codigo, cons_nombre) VALUES (2, 'Consultorio B');
INSERT INTO consultorio (cons_codigo, cons_nombre) VALUES (3, 'Consultorio C');
INSERT INTO consultorio (cons_codigo, cons_nombre) VALUES (4, 'Consultorio D');
INSERT INTO consultorio (cons_codigo, cons_nombre) VALUES (5, 'Consultorio E');



INSERT INTO medico (med_nroMatriculaProsional, med_nombreCompleto, med_consultorio, med_especialidad) VALUES (123456, 'Dr. Juan Pérez', 1, 1);
INSERT INTO medico (med_nroMatriculaProsional, med_nombreCompleto, med_consultorio, med_especialidad) VALUES (234567, 'Dra. Ana Rodríguez', 2, 2);
INSERT INTO medico (med_nroMatriculaProsional, med_nombreCompleto, med_consultorio, med_especialidad) VALUES (345678, 'Dr. Luis Martínez', 3, 3);
INSERT INTO medico (med_nroMatriculaProsional, med_nombreCompleto, med_consultorio, med_especialidad) VALUES (456789, 'Dra. Laura Gómez', 4, 4);
INSERT INTO medico (med_nroMatriculaProsional, med_nombreCompleto, med_consultorio, med_especialidad) VALUES (567890, 'Dr. Carlos Sánchez', 5, 5);

INSERT INTO estado_cita (estcita_id, estcita_nombre) VALUES (1, 'Pendiente');
INSERT INTO estado_cita (estcita_id, estcita_nombre) VALUES (2, 'Confirmada');
INSERT INTO estado_cita (estcita_id, estcita_nombre) VALUES (3, 'Cancelada');
INSERT INTO estado_cita (estcita_id, estcita_nombre) VALUES (4, 'Realizada');
INSERT INTO estado_cita (estcita_id, estcita_nombre) VALUES (5, 'Ausente');



INSERT INTO tipo_documento (tipdoc_id, tipdoc_nombre, tipdoc_abreviatura) VALUES (1, 'Cédula de Ciudadanía', 'CC');
INSERT INTO tipo_documento (tipdoc_id, tipdoc_nombre, tipdoc_abreviatura) VALUES (2, 'Tarjeta de Identidad', 'TI');
INSERT INTO tipo_documento (tipdoc_id, tipdoc_nombre, tipdoc_abreviatura) VALUES (3, 'Cédula de Extranjería', 'CE');
INSERT INTO tipo_documento (tipdoc_id, tipdoc_nombre, tipdoc_abreviatura) VALUES (4, 'Pasaporte', 'PAS');
INSERT INTO tipo_documento (tipdoc_id, tipdoc_nombre, tipdoc_abreviatura) VALUES (5, 'Registro Civil', 'RC');



INSERT INTO genero (gen_id, gen_nombre, gen_abreviatura) VALUES (1, 'Masculino', 'M');
INSERT INTO genero (gen_id, gen_nombre, gen_abreviatura) VALUES (2, 'Femenino', 'F');
INSERT INTO genero (gen_id, gen_nombre, gen_abreviatura) VALUES (3, 'Otro', 'O');
INSERT INTO genero (gen_id, gen_nombre, gen_abreviatura) VALUES (4, 'No especificado', 'NE');
INSERT INTO genero (gen_id, gen_nombre, gen_abreviatura) VALUES (5, 'Prefiero no decirlo', 'PND');



INSERT INTO acudiente (acu_codigo, acu_nombreCompleto, acu_telefono, acu_direccion) VALUES (1, 'Luisa Pérez', '1234567890', 'Calle 123, Ciudad');
INSERT INTO acudiente (acu_codigo, acu_nombreCompleto, acu_telefono, acu_direccion) VALUES (2, 'Pedro Gómez', '9876543210', 'Avenida 456, Ciudad');
INSERT INTO acudiente (acu_codigo, acu_nombreCompleto, acu_telefono, acu_direccion) VALUES (3, 'María Rodríguez', '5555555555', 'Carrera 789, Ciudad');
INSERT INTO acudiente (acu_codigo, acu_nombreCompleto, acu_telefono, acu_direccion) VALUES (4, 'Andrés Torres', '9999999999', 'Calle Principal, Ciudad');
INSERT INTO acudiente (acu_codigo, acu_nombreCompleto, acu_telefono, acu_direccion) VALUES (5, 'Laura Sánchez', '1111111111', 'Avenida Central, Ciudad');



INSERT INTO usuario (usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usuar, usu_segdo_apellido_usuar, usu_telefono, usu_direccion, usu_email, usu_tipodoc, usu_genero, usu_acudiente) VALUES (1, 'Juan', 'David', 'Pérez', 'Gómez', '1234567890', 'Calle 123, Ciudad', 'juan@example.com', 1, 1, 1);
INSERT INTO usuario (usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usuar, usu_segdo_apellido_usuar, usu_telefono, usu_direccion, usu_email, usu_tipodoc, usu_genero, usu_acudiente) VALUES (2, 'María', 'Fernanda', 'Rodríguez', 'García', '9876543210', 'Avenida 456, Ciudad', 'maria@example.com', 2, 2, 2);
INSERT INTO usuario (usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usuar, usu_segdo_apellido_usuar, usu_telefono, usu_direccion, usu_email, usu_tipodoc, usu_genero, usu_acudiente) VALUES (3, 'Carlos', '', 'González', 'Sánchez', '5555555555', 'Carrera 789, Ciudad', 'carlos@example.com', 1, 1, 3);
INSERT INTO usuario (usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usuar, usu_segdo_apellido_usuar, usu_telefono, usu_direccion, usu_email, usu_tipodoc, usu_genero, usu_acudiente) VALUES (4, 'Ana', 'María', 'López', 'Torres', '9999999999', 'Calle Principal, Ciudad', 'ana@example.com', 3, 2, 4);
INSERT INTO usuario (usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usuar, usu_segdo_apellido_usuar, usu_telefono, usu_direccion, usu_email, usu_tipodoc, usu_genero, usu_acudiente) VALUES (5, 'Pedro', '', 'Ramírez', 'Sánchez', '1111111111', 'Avenida Central, Ciudad', 'pedro@example.com', 4, 3, 5);



INSERT INTO cita (cit_codigo, cit_fecha, cit_estadoCita, cit_medico, cit_datosUsuario) VALUES (1, '2023-07-13', 1, 123456, 1);
INSERT INTO cita (cit_codigo, cit_fecha, cit_estadoCita, cit_medico, cit_datosUsuario) VALUES (2, '2023-07-14', 2, 234567, 2);
INSERT INTO cita (cit_codigo, cit_fecha, cit_estadoCita, cit_medico, cit_datosUsuario) VALUES (3, '2023-07-15', 3, 345678, 3);
INSERT INTO cita (cit_codigo, cit_fecha, cit_estadoCita, cit_medico, cit_datosUsuario) VALUES (4, '2023-07-16', 4, 456789, 4);
INSERT INTO cita (cit_codigo, cit_fecha, cit_estadoCita, cit_medico, cit_datosUsuario) VALUES (5, '2023-07-17', 5, 567890, 5);
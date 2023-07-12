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
INSERT INTO cita(cit_fecha,cit_estadoCita,cit_medico,cit_datosUsuario) VALUES ("2023-07-12 10:30:00",1,465899584,1098817567)
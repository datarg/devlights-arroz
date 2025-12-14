-- Database: db_arroz

-- DROP DATABASE IF EXISTS db_arroz;

/*CREATE DATABASE db_arroz
    WITH
    OWNER = myuser
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;*/

CREATE TABLE registros(
id SERIAL PRIMARY KEY,
cultivo_id INT NOT NULL,
campania_id INT NOT NULL,
departamento_id INT NOT NULL,
superficie_sembrada_ha INT NOT NULL,
superficie_cosechada_ha INT NOT NULL,
produccion_tm INT NOT NULL,
rendimiento_kgxha INT NOT NULL
);

CREATE TABLE campania(
id INT UNIQUE,
nombre VARCHAR (30) NOT NULL,
anio INT NOT NULL
);

CREATE TABLE departamento(
id INT UNIQUE,
nombre VARCHAR (50) NOT NULL,
codigo INT NOT NULL,
provincia_id INT NOT NULL
);

CREATE TABLE provincia(
id INT UNIQUE,
nombre VARCHAR (30) NOT NULL,
codigo INT NOT NULL
);

CREATE TABLE cultivo (
id INT UNIQUE,
nombre VARCHAR (30) NOT NULL
);

-- 1.1. Establecer PK para cultivo
ALTER TABLE cultivo ADD PRIMARY KEY (id);

-- 1.2. Establecer PK para provincia
ALTER TABLE provincia ADD PRIMARY KEY (id);

-- 1.3. Establecer PK para departamento
ALTER TABLE departamento ADD PRIMARY KEY (id);

-- 1.4. Establecer PK para campania
ALTER TABLE campania ADD PRIMARY KEY (id);

-- 2.1. Relación registros con cultivo
ALTER TABLE registros
ADD CONSTRAINT fk_registros_cultivo
FOREIGN KEY (cultivo_id)
REFERENCES cultivo (id);

-- 2.2. Relación registros con campania
ALTER TABLE registros
ADD CONSTRAINT fk_registros_campania
FOREIGN KEY (campania_id)
REFERENCES campania (id);

-- 2.3. Relación registros con departamento
ALTER TABLE registros
ADD CONSTRAINT fk_registros_departamento
FOREIGN KEY (departamento_id)
REFERENCES departamento (id);

ALTER TABLE departamento
ADD CONSTRAINT fk_departamento_provincia
FOREIGN KEY (provincia_id)
REFERENCES provincia (id);
CREATE TABLE IF NOT EXISTS estados (
    id SERIAL PRIMARY KEY,
    c_estado VARCHAR(2),
    nombre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS municipios (
    id SERIAL PRIMARY KEY,
    c_mnpio VARCHAR(3),
    nombre VARCHAR(100),
    estado_id INTEGER,
    CONSTRAINT fk_municipio_estado
        FOREIGN KEY (estado_id)
        REFERENCES estados(id)
);

CREATE TABLE IF NOT EXISTS colonias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150),
    tipo VARCHAR(50),
    codigo_postal VARCHAR(5),
    municipio_id INTEGER,
    CONSTRAINT fk_colonia_municipio
        FOREIGN KEY (municipio_id)
        REFERENCES municipios(id)
);

CREATE TABLE IF NOT EXISTS codigos_postales (
    id SERIAL PRIMARY KEY,
    d_codigo VARCHAR(5),
    d_asenta VARCHAR(150),
    d_tipo_asenta VARCHAR(50),
    d_mnpio VARCHAR(100),
    d_estado VARCHAR(100),
    d_ciudad VARCHAR(100),
    d_cp VARCHAR(5),
    c_estado VARCHAR(2),
    c_oficina VARCHAR(10),
    c_cp VARCHAR(5),
    c_tipo_asenta VARCHAR(2),
    c_mnpio VARCHAR(3),
    id_asenta_cpcons VARCHAR(10),
    d_zona VARCHAR(20),
    c_cve_ciudad VARCHAR(5)
);
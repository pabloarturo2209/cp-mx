INSERT INTO estados (c_estado, nombre)
SELECT DISTINCT
    c_estado,
    d_estado
FROM codigos_postales;

INSERT INTO municipios (c_mnpio, nombre, estado_id)
SELECT DISTINCT
    cp.c_mnpio,
    cp.d_mnpio,
    e.id
FROM codigos_postales cp
JOIN estados e
    ON e.c_estado = cp.c_estado;

INSERT INTO colonias (nombre, tipo, codigo_postal, municipio_id)
SELECT
    cp.d_asenta,
    cp.d_tipo_asenta,
    cp.d_codigo,
    m.id
FROM codigos_postales cp
JOIN municipios m
    ON m.c_mnpio = cp.c_mnpio
JOIN estados e
    ON e.id = m.estado_id
   AND e.c_estado = cp.c_estado;
-- select * from registros WHERE campania_id=1;
SELECT registros.id AS "N° REGISTRO",
cultivo.nombre AS "CULTIVO",
campania.nombre AS "CAMPAÑA",
campania.anio AS "AÑO",
departamento.nombre AS "DEPARTAMENTO",
provincia.nombre AS "PROVINCIA",
registros.superficie_sembrada_ha AS "SUPERFICIE SEMBRADA",
registros.superficie_cosechada_ha AS "SUPERFICIE COSECHADA",
registros.produccion_tm AS "PRODUCCIÓN en TONELADAS",
registros.rendimiento_kgxha AS "RENDIMIENTO" 
FROM registros
LEFT JOIN cultivo on registros.cultivo_id = cultivo.id
LEFT JOIN campania on campania_id = campania.id
LEFT JOIN departamento on departamento_id = departamento.id
JOIN provincia on departamento.provincia_id = provincia.id
;|
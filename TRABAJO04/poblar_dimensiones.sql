USE BD_redes_sociales;  -- Base de datos origen
GO

-- 1. Poblado de Dimensiones
-----------------------------------------------

-- Dimensión Usuario (SCD Tipo 2 básico)
SELECT 
id_usuario,
username,
pais
FROM Usuario;

-- Dimensión Publicación
SELECT 
    p.id_publicacion,
    CAST(p.contenido AS NVARCHAR(MAX)) as 'contenido',  -- Conversión segura para SSAS
    u.username as 'creador_username'
FROM Publicacion p
INNER JOIN Usuario u ON p.id_usuario = u.id_usuario;

-- Dimensión Fecha (Usar misma población para todas las tablas)
-- Dim Tiempo
UPDATE Publicacion
SET created_at = DATEADD(
    DAY, 
    ABS(CHECKSUM(NEWID()) % 365), -- genera un número entre 0 y 364
    '2023-01-01'
);

UPDATE Comentario
SET created_at = DATEADD(
    DAY, 
    ABS(CHECKSUM(NEWID()) % 365), 
    '2023-01-01'
);

UPDATE Likes
SET created_at = DATEADD(
    DAY, 
    ABS(CHECKSUM(NEWID()) % 365), 
    '2023-01-01'
);

UPDATE Usuario
SET created_at = DATEADD(
    DAY, 
    ABS(CHECKSUM(NEWID()) % 365), 
    '2023-01-01'
);

UPDATE Seguir
SET created_at = DATEADD(
    DAY, 
    ABS(CHECKSUM(NEWID()) % 365), 
    '2023-01-01'
);

SELECT 
    CONVERT(INT, CONVERT(VARCHAR(8), fecha, 112)) AS id,  -- Formato AAAAMMDD
    fecha,
    YEAR(fecha) AS anio,
    DATEPART(QUARTER, fecha) AS trimestre,
    MONTH(fecha) AS mes,
    DAY(fecha) AS dia,
    CAST(DATENAME(WEEKDAY, fecha) AS VARCHAR(20)) AS dia_semana
FROM (
    SELECT DISTINCT CAST(created_at AS DATE) AS fecha FROM Usuario
    UNION
    SELECT DISTINCT CAST(created_at AS DATE) FROM Publicacion
    UNION
    SELECT DISTINCT CAST(created_at AS DATE) FROM Comentario
    UNION
    SELECT DISTINCT CAST(created_at AS DATE) FROM Likes
    UNION
    SELECT DISTINCT CAST(created_at AS DATE) FROM Seguir
) AS todas_fechas;

-- Dimensión Comentario (Manejo de jerarquía)
SELECT 
    c.id_comentario,
    CAST(c.comentario AS NVARCHAR(MAX)) AS 'comentario',
    CASE 
        WHEN c.id_Comentario_r IS NULL THEN 1 
        ELSE 2 
    END AS nivel_jerarquia,
    cr.id_comentario AS 'comentario_padre_key'
FROM Comentario c
LEFT JOIN Comentario cr ON c.id_Comentario_r = cr.id_comentario;

-- 2. Poblado de Hechos
-----------------------------------------------
-- Hechos de Likes
SELECT 
	id_like as 'like_id',
	id_usuario as 'usuario_id',
	id_publicacion as 'publicacion_id',
	CONVERT(INT, CONVERT(VARCHAR(8), created_at, 112)) as 'fecha_id',
	1 AS cantidad  -- Cada registro es un like individual
FROM Likes



-- Hechos de Comentarios
SELECT 
	c.id_usuario as 'usuario_id',
	c.id_publicacion as 'publicacion_id',
	c.id_comentario as 'comentario_id',
	CONVERT(INT, CONVERT(VARCHAR(8), created_at, 112)) as 'fecha_id',
	CASE WHEN c.id_Comentario_r IS NOT NULL THEN 1 ELSE 0 END as 'es_respuesta'
FROM Comentario c;
	

-- Hechos de Seguimientos
SELECT 
	s.id_seguimiento,
	s.id_seguidor,
	CONVERT(INT, CONVERT(VARCHAR(8), created_at, 112)) as 'fecha_id',
	DATEDIFF(DAY, s.created_at, GETDATE()) as 'duracion_seguimiento_dias'
FROM Seguir s;
	
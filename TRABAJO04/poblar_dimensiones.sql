USE BD_redes_sociales;
GO

-- Dimension Usuario
SELECT 
id_usuario,
username,
pais
FROM Usuario;

-- Dimension publicacion
SELECT 
    p.id_publicacion,
    p.contenido,
    u.username AS creador
FROM Publicacion p
    -- Creador de la publicación
    INNER JOIN Usuario u ON p.id_usuario = u.id_usuario
ORDER BY p.created_at DESC;

-- Dimension comentarios
SELECT
    c.id_publicacion,
    uc.username AS comentarista,
    c.comentario AS comentario_padre,
    ur.username AS replicador,
    cr.comentario AS comentario_hijo
FROM Comentario c
    -- Comentario hijo
    LEFT JOIN Comentario cr 
        ON c.id_comentario = cr.id_Comentario_r
    
    -- Usuario que comentó (padre)
    LEFT JOIN Usuario uc 
        ON c.id_usuario = uc.id_usuario
    
    -- Usuario que respondió (hijo)
    LEFT JOIN Usuario ur 
        ON cr.id_usuario = ur.id_usuario

-- Opcional: Filtrar si deseas ver solo los comentarios padres
-- WHERE c.id_Comentario_r IS NULL
ORDER BY c.id_publicacion;

-- Dim Likes

SELECT
    p.id_publicacion,
    p.contenido,
    u.username AS liker
FROM Likes l
INNER JOIN Publicacion p
    ON l.id_publicacion = p.id_publicacion
INNER JOIN Usuario u
    ON l.id_usuario = u.id_usuario;


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


SELECT 
    fecha,
    YEAR(fecha) AS anio,
    MONTH(fecha) AS mes,
    DAY(fecha) AS dia
FROM (
    SELECT DISTINCT CAST(created_at AS DATE) AS fecha FROM Usuario
    UNION
    SELECT DISTINCT CAST(created_at AS DATE) AS fecha FROM Publicacion
    UNION
    SELECT DISTINCT CAST(created_at AS DATE) AS fecha FROM Comentario
    UNION
    SELECT DISTINCT CAST(created_at AS DATE) AS fecha FROM Likes
    UNION
    SELECT DISTINCT CAST(created_at AS DATE) AS fecha FROM Seguir
) AS Fechas
ORDER BY fecha;


-- Poblar fact_interaccion

-- Comentarios
SELECT 
    id_usuario, 
    id_publicacion, 
    id_comentario, 
    NULL, 
    NULL,
    CONVERT(INT, CONVERT(VARCHAR(8), created_at, 112)) AS fecha_id,
    'COMMENT' AS tipo_interaccion,
    1 AS cantidad
FROM BD_redes_sociales.dbo.Comentario;
-- likes
SELECT 
    id_usuario, 
    id_publicacion, 
    NULL, 
    id_like, 
    NULL,
    CONVERT(INT, CONVERT(VARCHAR(8), created_at, 112)) AS fecha_id,
    'LIKE' AS tipo_interaccion,
    1 AS cantidad
FROM BD_redes_sociales.dbo.Likes;
-- Seguidores
SELECT
    id_seguidor, 
    NULL, 
    NULL, 
    NULL, 
    id_seguido,
    CONVERT(INT, CONVERT(VARCHAR(8), created_at, 112)) AS fecha_id,
    'FOLLOW' AS tipo_interaccion,
    1 AS cantidad
FROM BD_redes_sociales.dbo.Seguir;



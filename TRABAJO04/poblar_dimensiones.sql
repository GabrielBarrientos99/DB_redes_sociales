USE BD_redes_sociales;
GO

-- Dimension Usuario
SELECT 
id_usuario as 'id_usuario',
username as 'username',
pais as 'pais'

FROM Usuario;

-- Dimension publicacion
SELECT
    p.id_publicacion AS 'id_publicacion',
    p.id_usuario AS 'id_usuario',
    p.contenido AS 'contenido'
FROM Publicacion p;

-- Dim Tiempo

SELECT DISTINCT
    CONVERT(INT, CONVERT(VARCHAR(8), x.created_at, 112)) AS 'id',
    x.created_at                                       AS 'fecha',
    YEAR(x.created_at)                                 AS 'anio',
    MONTH(x.created_at)                                AS 'mes',
    DAY(x.created_at)                                  AS 'dia'
FROM (   
    SELECT created_at FROM Publicacion
) x;


-- Poblar fact_interaccion para Likes
SELECT
    l.id_like AS id_like,
    NULL AS id_comentario,
    NULL AS id_seguimiento,
    l.id_usuario,
    l.id_publicacion,
    NULL AS usuario_seguido,
    CONVERT(INT, FORMAT(CAST(l.created_at AS DATE), 'yyyyMMdd')) AS fecha_id,
    1 AS tipo_interaccion_id  -- 1 = Like
FROM BD_redes_sociales.dbo.Likes l;

-- Poblar fact_interaccion para Comentarios y Respuestas
SELECT
    NULL AS id_like,
    c.id_comentario,
    NULL AS id_seguimiento,
    c.id_usuario,
    c.id_publicacion,
    NULL AS usuario_seguido,
    CONVERT(INT, FORMAT(CAST(c.created_at AS DATE), 'yyyyMMdd')) AS fecha_id,
    CASE 
        WHEN c.id_Comentario_r IS NULL THEN 2  -- 2 = Comentario
        ELSE 3                                  -- 3 = Respuesta
    END AS tipo_interaccion_id
FROM BD_redes_sociales.dbo.Comentario c;

-- Poblar fact_interaccion para Seguimientos
SELECT
    NULL AS id_like,
    NULL AS id_comentario,
    s.id_seguimiento,
    s.id_seguidor AS id_usuario,
    NULL AS id_publicacion,
    s.id_seguido AS usuario_seguido,
    CONVERT(INT, FORMAT(CAST(s.created_at AS DATE), 'yyyyMMdd')) AS fecha_id,
    4 AS tipo_interaccion_id  -- 4 = Seguimiento
FROM BD_redes_sociales.dbo.Seguir s;
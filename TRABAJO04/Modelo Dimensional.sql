

USE master;
ALTER DATABASE BI_red_social SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE BI_red_social;

CREATE DATABASE BI_red_social;
USE BI_red_social;
GO

-- 1. Dimensiones
-------------------------------------------

CREATE TABLE dim_usuarios(
    id INT IDENTITY(1,1) PRIMARY KEY,
	id_usuario INT NOT NULL,
    username VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL  
);


CREATE TABLE dim_publicaciones(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_publicacion INT NOT NULL,
	contenido NVARCHAR(MAX) NOT NULL,
	creador_username VARCHAR(50) NOT NULL,
);

-- Dimensión Fecha (Clave única numérica)
CREATE TABLE dim_fecha (
    id INT PRIMARY KEY,              -- Formato: AAAAMMDD
    fecha DATETIME NOT NULL,
    anio INT NOT NULL,
    trimestre INT NOT NULL,
    mes INT NOT NULL,
    dia INT NOT NULL,
    dia_semana VARCHAR(20) NOT NULL
);

-- Dimensión Comentarios (Maneja jerarquía recursiva)
CREATE TABLE dim_comentario (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_comentario INT NOT NULL,             -- ID original del OLTP
    comentario NVARCHAR(MAX) NOT NULL,      -- Cambiado de TEXT
    nivel_jerarquia INT DEFAULT 1,          -- Para navegación en SSAS
    comentario_padre_key INT NULL,          -- Autoreferencia
    FOREIGN KEY (comentario_padre_key) REFERENCES dim_comentario(id)
);

-- 2. Tablas de Hechos (Separadas por tipo de interacción)
-------------------------------------------

-- Hechos de Likes
CREATE TABLE fact_likes (
    like_id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT NOT NULL,
    publicacion_id INT NOT NULL,
    fecha_id INT NOT NULL,
    cantidad INT DEFAULT 1,
    FOREIGN KEY (usuario_id) REFERENCES dim_usuarios(id),
    FOREIGN KEY (publicacion_id) REFERENCES dim_publicaciones(id),
    FOREIGN KEY (fecha_id) REFERENCES dim_fecha(id)
);

-- Hechos de Comentarios
CREATE TABLE fact_comentarios (
    comentario_fact_id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT NOT NULL,
    publicacion_id INT NOT NULL,
    comentario_id INT NOT NULL,            -- Relación con dimensión de comentarios
    fecha_id INT NOT NULL,
    es_respuesta BIT DEFAULT 0,
    FOREIGN KEY (usuario_id) REFERENCES dim_usuarios(id),
    FOREIGN KEY (publicacion_id) REFERENCES dim_publicaciones(id),
    FOREIGN KEY (comentario_id) REFERENCES dim_comentario(id),
    FOREIGN KEY (fecha_id) REFERENCES dim_fecha(id)
);

-- Hechos de Seguimientos
CREATE TABLE fact_seguimientos (
    seguimiento_id INT IDENTITY(1,1) PRIMARY KEY,
    seguidor_id INT NOT NULL,              -- Usuario que sigue
    seguido_id INT NOT NULL,               -- Usuario seguido
    fecha_id INT NOT NULL,
    duracion_seguimiento_dias INT NULL,     -- Métrica calculada
    FOREIGN KEY (seguidor_id) REFERENCES dim_usuarios(id),
    FOREIGN KEY (seguido_id) REFERENCES dim_usuarios(id),
    FOREIGN KEY (fecha_id) REFERENCES dim_fecha(id)
);



DELETE FROM fact_likes;
DBCC CHECKIDENT ('fact_likes', RESEED, 0);

DELETE FROM fact_comentarios;
DBCC CHECKIDENT ('fact_comentarios', RESEED, 0);

DELETE FROM fact_seguimientos;
DBCC CHECKIDENT ('fact_seguimientos', RESEED, 0);

DELETE FROM dim_publicaciones;
DBCC CHECKIDENT ('dim_publicaciones', RESEED, 0);

DELETE FROM dim_usuarios;
DBCC CHECKIDENT ('dim_usuarios', RESEED, 0);

DELETE FROM dim_fecha;
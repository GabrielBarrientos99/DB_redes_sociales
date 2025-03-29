

USE master;
ALTER DATABASE BI_red_social SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE BI_red_social;

CREATE DATABASE BI_red_social;
USE BI_red_social;
GO

CREATE TABLE dim_usuarios(
    id INT IDENTITY(1,1) PRIMARY KEY,
	id_usuario INT NOT NULL,
    username VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL  
);


CREATE TABLE dim_publicaciones(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_publicacion INT NOT NULL,
	contenido TEXT,	
	creador VARCHAR(50) NULL,
);

CREATE TABLE dim_comentarios(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_comentario INT NOT NULL,
	id_publicacion INT NOT NULL,
	comentarista VARCHAR(50),
	comentario_padre TEXT,
	replicador VARCHAR(50),
	comentario_hijo TEXT,
);

CREATE TABLE dim_likes(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_publicacion INT NOT NULL,
	id_like INT NOT NULL,
	contenido TEXT,	
	liker VARCHAR(50)
);

CREATE TABLE dim_fecha (
    fecha DATETIME NOT NULL,
	tipo VARCHAR(20) NOT NULL,
    anio INT NOT NULL,
    mes INT NOT NULL,
    dia INT NOT NULL,
	CONSTRAINT PK_dim_fecha PRIMARY KEY (fecha, tipo)
);

CREATE TABLE fact_interaccion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT NOT NULL,              -- Usuario que realiza la acción
    publicacion_id INT,                   -- Publicación relacionada (para comentarios y likes)
    comentario_id INT,                    -- Solo para comentarios
    like_id INT,                          -- Solo para likes
    usuario_followed_id INT,              -- Solo para follows
    fecha datetime NOT NULL,
    tipo_interaccion VARCHAR(20) NOT NULL,  -- Ej: 'COMMENT', 'LIKE', 'FOLLOW'
    cantidad INT DEFAULT 1,
  
    FOREIGN KEY (usuario_id) REFERENCES dim_usuarios(id),
    FOREIGN KEY (publicacion_id) REFERENCES dim_publicaciones(id),
    FOREIGN KEY (comentario_id) REFERENCES dim_comentarios(id),
    FOREIGN KEY (like_id) REFERENCES dim_likes(id),
    FOREIGN KEY (usuario_followed_id) REFERENCES dim_usuarios(id),
    FOREIGN KEY (fecha, tipo_interaccion) REFERENCES dim_fecha(fecha, tipo)
);


DELETE FROM fact_interaccion;
DBCC CHECKIDENT ('fact_interaccion', RESEED, 0);

DELETE FROM dim_likes;
DBCC CHECKIDENT ('dim_likes', RESEED, 0);

DELETE FROM dim_comentarios;
DBCC CHECKIDENT ('dim_comentarios', RESEED, 0);

DELETE FROM dim_publicaciones;
DBCC CHECKIDENT ('dim_publicaciones', RESEED, 0);

DELETE FROM dim_usuarios;
DBCC CHECKIDENT ('dim_usuarios', RESEED, 0);

DELETE FROM dim_fecha;
DBCC CHECKIDENT ('dim_fecha', RESEED, 0); 
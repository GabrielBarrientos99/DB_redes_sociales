CREATE DATABASE BI_red_social;
USE BI_red_social;
GO
DROP DATABASE BI_red_social;

CREATE TABLE dim_usuarios(
    id INT IDENTITY(1,1) PRIMARY KEY,
	id_usuario INT NOT NULL,
    username VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL  
);


CREATE TABLE dim_publicaciones(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_publicacion INT NOT NULL,
	id_usuario INT NOT NULL,
	id_likes INT NOT NULL,
	id_comentario INT NOT NULL,
	contenido TEXT,
);

CREATE TABLE dim_fecha (
    id INT PRIMARY KEY, 
    fecha DATE NOT NULL,
    anio INT NOT NULL,
    mes INT NOT NULL,
    dia INT NOT NULL
);


CREATE TABLE fact_interaccion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT NOT NULL,
    publicacion_id INT NULL,
    usuario_followed_id INT NULL,
    fecha_id INT NOT NULL,
    cantidad INT DEFAULT 1,
  

    FOREIGN KEY (usuario_id) REFERENCES dim_usuarios(id),
    FOREIGN KEY (publicacion_id) REFERENCES dim_publicaciones(id),
    FOREIGN KEY (usuario_followed_id) REFERENCES dim_usuarios(id),
    FOREIGN KEY (fecha_id) REFERENCES dim_fecha(id),
);


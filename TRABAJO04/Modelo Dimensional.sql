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
	id_usuario INT NOT NULL,
	contenido TEXT,
);

CREATE TABLE dim_fecha (
    id INT PRIMARY KEY, 
    fecha DATE NOT NULL,
    anio INT NOT NULL,
    mes INT NOT NULL,
    dia INT NOT NULL
);

-- Crear dimensión para tipos de interacción
CREATE TABLE dim_tipo_interaccion (
    id_tipo INT PRIMARY KEY,
    nombre_tipo VARCHAR(20) NOT NULL
);

-- Insertar tipos de interacción básicos
INSERT INTO dim_tipo_interaccion (id_tipo, nombre_tipo)
VALUES
    (1, 'LIKE'),
    (2, 'COMMENT'),
    (3, 'REPLY'),
    (4, 'FOLLOW');

CREATE TABLE fact_interaccion (
    interaccion_id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT NOT NULL,
    publicacion_id INT NULL,
    usuario_followed_id INT NULL,
    fecha_id INT NOT NULL,
    tipo_interaccion_id INT NOT NULL,
    cantidad INT DEFAULT 1,
    -- Degenerate dimensions para referencias opcionales
    id_like INT NULL,
    id_comentario INT NULL,
    id_seguimiento INT NULL,

    FOREIGN KEY (usuario_id) REFERENCES dim_usuarios(id),
    FOREIGN KEY (publicacion_id) REFERENCES dim_publicaciones(id),
    FOREIGN KEY (usuario_followed_id) REFERENCES dim_usuarios(id),
    FOREIGN KEY (fecha_id) REFERENCES dim_fecha(id),
    FOREIGN KEY (tipo_interaccion_id) REFERENCES dim_tipo_interaccion(id_tipo)
);

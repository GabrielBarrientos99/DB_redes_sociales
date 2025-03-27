CREATE DATABASE BD_redes_sociales;
GO
USE BD_redes_sociales;
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Usuario')
BEGIN
CREATE TABLE Usuario (
	id_usuario INT PRIMARY KEY IDENTITY(1,1),
	username VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	telefono VARCHAR(20) NULL,
	pais VARCHAR(50) NULL,
	direccion VARCHAR(255) NULL,
	created_at DATETIME DEFAULT GETDATE()
)
END

GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Publicacion')
BEGIN
-- Tabla Publicación
CREATE TABLE Publicacion (
    id_publicacion INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT NOT NULL, -- Relación con Usuario
    contenido TEXT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) 
);
END

GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Comentario')
BEGIN
-- Tabla Comentario
CREATE TABLE Comentario (
    id_comentario INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT NOT NULL, -- Usuario que comenta
    id_publicacion INT NOT NULL, -- Publicación comentada
    comentario TEXT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
	id_Comentario_r INT NULL,  -- Para la relación recursiva
	FOREIGN KEY (id_Comentario_r) REFERENCES Comentario(id_comentario),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion)
);
END

GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Imagen')
BEGIN
-- Tabla Imagen
CREATE TABLE Imagen (
    id_imagen INT PRIMARY KEY IDENTITY(1,1),
    id_publicacion INT NOT NULL, -- Relación con Publicación
    url VARCHAR(255) NOT NULL,  -- URL de la imagen
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion) 
);
END

GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Likes')
BEGIN
-- Tabla Dar Likes (Relación N:M entre Usuario y Publicación)
CREATE TABLE Likes (
    id_like INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT NOT NULL,
    id_publicacion INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion)
);
END

GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Seguir')
BEGIN
-- Tabla Seguir (Relación N:M entre Usuarios)
CREATE TABLE Seguir (
    id_seguimiento INT PRIMARY KEY IDENTITY(1,1),
    id_seguidor INT NOT NULL,
    id_seguido INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_seguidor) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_seguido) REFERENCES Usuario(id_usuario) 
);
END

GO
-- Eliminar la tabla DarLikes si existe
DROP TABLE IF EXISTS DarLikes;
DROP TABLE IF EXISTS Comentario;
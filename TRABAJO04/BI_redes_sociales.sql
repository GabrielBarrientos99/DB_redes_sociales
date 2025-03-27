CREATE TABLE Dim_Usuario (
    id_usuario INTEGER PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20) NULL,
    pais VARCHAR(50) NULL,
    direccion VARCHAR(100) NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Dim_Publicacion (
    id_publicacion INTEGER PRIMARY KEY IDENTITY(1,1),
    id_usuario INTEGER NOT NULL,
    contenido TEXT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Dim_Usuario(id_usuario)
);

CREATE TABLE Dim_Tiempo (
    id_tiempo INTEGER PRIMARY KEY IDENTITY(1,1),
    fecha DATE UNIQUE NOT NULL,
    anio INTEGER NOT NULL,
    mes INTEGER NOT NULL,
    dia INTEGER NOT NULL,
    dia_semana VARCHAR(20) NOT NULL,
    trimestre INTEGER NOT NULL
);

CREATE TABLE Dim_Interaccion (
    id_interaccion INTEGER PRIMARY KEY IDENTITY(1,1),
    tipo VARCHAR(50) NOT NULL -- ('Like', 'Comentario', 'Publicacion', 'Seguimiento')
);

CREATE TABLE Hechos_Interacciones (
    id_hecho INTEGER PRIMARY KEY IDENTITY(1,1),
    id_usuario INTEGER NOT NULL,
    id_publicacion INTEGER NULL,
    id_interaccion INTEGER NOT NULL,
    id_tiempo INTEGER NOT NULL,
    cantidad INTEGER DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Dim_Usuario(id_usuario),
    FOREIGN KEY (id_publicacion) REFERENCES Dim_Publicacion(id_publicacion),
    FOREIGN KEY (id_interaccion) REFERENCES Dim_Interaccion(id_interaccion),
    FOREIGN KEY (id_tiempo) REFERENCES Dim_Tiempo(id_tiempo)
);

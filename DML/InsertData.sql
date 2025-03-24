USE BD_redes_sociales
GO

-- Inserciones
--- Usuario

SELECT * FROM Usuario;
EXEC SP_HELP Usuario;

INSERT INTO Usuario (username, email, telefono, pais, direccion)
VALUES 
('userb1', 'userb1@example.com', '987654321', 'México', 'Calle Falsa 123'),
('userb2', 'userb2@example.com', '654321987', 'España', 'Av. Real 456'),
('userb3', 'userb3@example.com', '321987654', 'Argentina', 'Paseo del Sol 789'),
('userb4', 'userb4@example.com', '987123456', 'Colombia', 'Carrera 10 #45-67'),
('userb5', 'userb5@example.com', '456789123', 'Perú', 'Jr. Los Olivos 321'),
('userb6', 'userb6@example.com', '123456789', 'Chile', 'Alameda 987'),
('user7', 'user7@example.com', '789654123', 'Brasil', 'Rua das Palmeiras 222'),
('user8', 'user8@example.com', '654789321', 'Ecuador', 'Av. Amazonas 555'),
('user9', 'user9@example.com', '147258369', 'Uruguay', 'Bulevar Artigas 777'),
('user10', 'user10@example.com', '369258147', 'Bolivia', 'Calle Illampu 102'),
('user11', 'user11@example.com', '951753852', 'Paraguay', 'Calle Palma 321'),
('user12', 'user12@example.com', '852369741', 'Venezuela', 'Av. Bolívar 987'),
('user13', 'user13@example.com', '789123456', 'Costa Rica', 'Calle Central 654'),
('user14', 'user14@example.com', '321654987', 'Panamá', 'Av. Balboa 333'),
('user15', 'user15@example.com', '963852741', 'Honduras', 'Barrio El Centro 888'),
('user16', 'user16@example.com', '741852963', 'Guatemala', 'Zona 10 #123'),
('user17', 'user17@example.com', '852147963', 'El Salvador', 'Calle Roosevelt 999'),
('user18', 'user18@example.com', '369741852', 'Nicaragua', 'Avenida Norte 456'),
('user19', 'user19@example.com', '258369147', 'Cuba', 'Malecón 789'),
('user20', 'user20@example.com', '159357486', 'Rep. Dominicana', 'Av. Duarte 654'),
('user21', 'user21@example.com', '357951486', 'Puerto Rico', 'Calle Fortaleza 741'),
('user22', 'user22@example.com', '951486357', 'Estados Unidos', '5th Avenue 111'),
('user23', 'user23@example.com', '123789456', 'Canadá', 'Bay Street 555'),
('user24', 'user24@example.com', '789456123', 'Francia', 'Champs-Élysées 222'),
('user25', 'user25@example.com', '456123789', 'Italia', 'Via Roma 333');


SELECT * FROM Usuario;


--- Publicaciones
INSERT INTO Publicacion (id_usuario, contenido)
VALUES 
(1, 'Este es mi primer post en la red social. ¡Hola a todos!'),
(2, 'Amo compartir fotos de mis viajes. Aquí les dejo una increíble puesta de sol.'),
(3, 'La tecnología blockchain está revolucionando el mundo. ¿Qué opinan?'),
(4, 'Hoy probé una nueva receta de pasta, quedó deliciosa.'),
(5, 'Empezando un nuevo libro: "Cien años de soledad". ¿Alguien lo ha leído?'),
(6, '¡Nuevo video en mi canal de YouTube! No se lo pierdan.'),
(7, 'Explorando la selva amazónica, la naturaleza es increíble.'),
(8, 'Consejos de fitness: la constancia es la clave para ver resultados.'),
(9, 'Reflexionando sobre la vida y la importancia de vivir el momento.'),
(10, '¡Feliz cumpleaños para mí! Gracias a todos por sus mensajes.');

SELECT * FROM Publicacion;

-- Comentario
INSERT INTO Comentario (id_usuario, id_publicacion, comentario)
VALUES 
(2, 1, '¡Bienvenido a la red social!'),
(3, 1, '¡Hola! Espero que disfrutes la plataforma.'),
(4, 2, 'Esa puesta de sol se ve increíble.'),
(5, 3, 'Blockchain cambiará muchas industrias.'),
(6, 4, '¿Podrías compartir la receta?'),
(7, 5, 'Es un libro increíble, te atrapará desde el inicio.'),
(8, 6, 'Voy a ver tu video ahora mismo.'),
(9, 7, 'Me encantaría visitar la selva amazónica algún día.'),
(10, 8, 'Totalmente de acuerdo, la constancia es clave.'),
(1, 9, 'Gran reflexión, vivir el presente es lo más importante.');


-- Imagen
INSERT INTO Imagen (id_publicacion, url)
VALUES 
(2, 'https://ejemplo.com/imagen1.jpg'),
(3, 'https://ejemplo.com/imagen2.jpg'),
(4, 'https://ejemplo.com/imagen3.jpg'),
(7, 'https://ejemplo.com/imagen4.jpg'),
(8, 'https://ejemplo.com/imagen5.jpg');


INSERT INTO DarLikes (id_usuario, id_publicacion)
VALUES 
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

INSERT INTO Seguir (id_seguidor, id_seguido)
VALUES 
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(4, 8),
(5, 9),
(6, 10),
(7, 1);
USE BD_redes_sociales
GO

-- Inserciones
--- Usuario

SELECT * FROM Usuario;
EXEC SP_HELP Usuario;

INSERT INTO Usuario (username, email, telefono, pais, direccion)
VALUES 
('userb1', 'userb1@example.com', '987654321', 'M�xico', 'Calle Falsa 123'),
('userb2', 'userb2@example.com', '654321987', 'Espa�a', 'Av. Real 456'),
('userb3', 'userb3@example.com', '321987654', 'Argentina', 'Paseo del Sol 789'),
('userb4', 'userb4@example.com', '987123456', 'Colombia', 'Carrera 10 #45-67'),
('userb5', 'userb5@example.com', '456789123', 'Per�', 'Jr. Los Olivos 321'),
('userb6', 'userb6@example.com', '123456789', 'Chile', 'Alameda 987'),
('user7', 'user7@example.com', '789654123', 'Brasil', 'Rua das Palmeiras 222'),
('user8', 'user8@example.com', '654789321', 'Ecuador', 'Av. Amazonas 555'),
('user9', 'user9@example.com', '147258369', 'Uruguay', 'Bulevar Artigas 777'),
('user10', 'user10@example.com', '369258147', 'Bolivia', 'Calle Illampu 102'),
('user11', 'user11@example.com', '951753852', 'Paraguay', 'Calle Palma 321'),
('user12', 'user12@example.com', '852369741', 'Venezuela', 'Av. Bol�var 987'),
('user13', 'user13@example.com', '789123456', 'Costa Rica', 'Calle Central 654'),
('user14', 'user14@example.com', '321654987', 'Panam�', 'Av. Balboa 333'),
('user15', 'user15@example.com', '963852741', 'Honduras', 'Barrio El Centro 888'),
('user16', 'user16@example.com', '741852963', 'Guatemala', 'Zona 10 #123'),
('user17', 'user17@example.com', '852147963', 'El Salvador', 'Calle Roosevelt 999'),
('user18', 'user18@example.com', '369741852', 'Nicaragua', 'Avenida Norte 456'),
('user19', 'user19@example.com', '258369147', 'Cuba', 'Malec�n 789'),
('user20', 'user20@example.com', '159357486', 'Rep. Dominicana', 'Av. Duarte 654'),
('user21', 'user21@example.com', '357951486', 'Puerto Rico', 'Calle Fortaleza 741'),
('user22', 'user22@example.com', '951486357', 'Estados Unidos', '5th Avenue 111'),
('user23', 'user23@example.com', '123789456', 'Canad�', 'Bay Street 555'),
('user24', 'user24@example.com', '789456123', 'Francia', 'Champs-�lys�es 222'),
('user25', 'user25@example.com', '456123789', 'Italia', 'Via Roma 333');


--- Publicaciones
INSERT INTO Publicacion (id_usuario, contenido)
VALUES 
(1, 'Este es mi primer post en la red social. �Hola a todos!'),
(2, 'Amo compartir fotos de mis viajes. Aqu� les dejo una incre�ble puesta de sol.'),
(3, 'La tecnolog�a blockchain est� revolucionando el mundo. �Qu� opinan?'),
(4, 'Hoy prob� una nueva receta de pasta, qued� deliciosa.'),
(5, 'Empezando un nuevo libro: "Cien a�os de soledad". �Alguien lo ha le�do?'),
(6, '�Nuevo video en mi canal de YouTube! No se lo pierdan.'),
(7, 'Explorando la selva amaz�nica, la naturaleza es incre�ble.'),
(8, 'Consejos de fitness: la constancia es la clave para ver resultados.'),
(9, 'Reflexionando sobre la vida y la importancia de vivir el momento.'),
(10, '�Feliz cumplea�os para m�! Gracias a todos por sus mensajes.');

SELECT * FROM Publicacion;


SELECT * FROM Comentario;
-- Comentario
-- Inserci�n de Comentarios con relaci�n recursiva
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r)
VALUES 
(2, 1, '�Bienvenido a la red social!', NULL),  -- Comentario principal
(3, 1, '�Hola! Espero que disfrutes la plataforma.', 1), -- Responde al comentario 1
(4, 1, 'No me gusta.',1),
(4, 2, 'Esa puesta de sol se ve incre�ble.', NULL), 
(5, 2, 'Esa puesta de sol se ve incre�ble.', 4),
(5, 3, 'Blockchain cambiar� muchas industrias.', NULL);

SELECT * FROM Comentario;

-- Imagen
INSERT INTO Imagen (id_publicacion, url)
VALUES 
(2, 'https://ejemplo.com/imagen1.jpg'),
(3, 'https://ejemplo.com/imagen2.jpg'),
(4, 'https://ejemplo.com/imagen3.jpg'),
(7, 'https://ejemplo.com/imagen4.jpg'),
(8, 'https://ejemplo.com/imagen5.jpg');
SELECT * FROM Imagen;

INSERT INTO Likes (id_usuario, id_publicacion)
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
SELECT * FROM Likes;

SELECT * FROM Seguir;

INSERT INTO Seguir (id_seguidor, id_seguido)
VALUES 
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(4, 7),
(5, 7),
(6, 1),
(7, 1);


SELECT COUNT(*) AS cantidad_seguidores
FROM Seguir
WHERE id_seguido = 7;


SELECT U.username AS nombre_seguidor
FROM Seguir S
JOIN Usuario U ON S.id_seguidor = U.id_usuario
WHERE S.id_seguido = 7;


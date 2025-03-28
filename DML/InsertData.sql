USE BD_redes_sociales
GO

-- Inserciones
--- Usuario

SELECT * FROM Usuario;
EXEC SP_HELP Usuario;



INSERT INTO Usuario (username, email, telefono, pais, direccion) VALUES
('Gabriel', 'gabriel@example.com', '5551234567', 'México', 'Calle Reforma 123, CDMX'),
('Gabo', 'gabo123@example.com', '5559876543', 'México', 'Av. Juárez 456, Monterrey'),
('Mariana', 'mariana@example.com', '5554567890', 'México', 'Calle Insurgentes 789, Guadalajara'),
('Juanito', 'juanito@example.com', '5557654321', 'México', 'Paseo de la Reforma 321, CDMX'),
('Sofía', 'sofia@example.com', '5551112223', 'México', 'Calle Morelos 654, Puebla'),

('Carlos', 'carlos@example.com', '34961234567', 'España', 'Calle Mayor 12, Madrid'),
('Carlitos', 'carlitos@example.com', '34962345678', 'España', 'Gran Vía 45, Barcelona'),
('Lucía', 'lucia@example.com', '34963456789', 'España', 'Av. Andalucía 87, Sevilla'),
('Antonio', 'antonio@example.com', '34964567890', 'España', 'Plaza Mayor 22, Valencia'),
('Sara', 'sara@example.com', '34965678901', 'España', 'Calle Serrano 76, Madrid'),
('Pablo', 'pablo@example.com', '34966789012', 'España', 'Calle de la Princesa 19, Bilbao'),

('Martín', 'martin@example.com', '541112345678', 'Argentina', 'Av. Corrientes 1234, Buenos Aires'),
('Martina', 'martina@example.com', '541123456789', 'Argentina', 'Calle Santa Fe 567, Córdoba'),
('Facu', 'facu@example.com', '541134567890', 'Argentina', 'Av. Rivadavia 345, Rosario'),
('Agustina', 'agus@example.com', '541145678901', 'Argentina', 'Calle Mitre 678, Mendoza'),
('Nico', 'nico@example.com', '541156789012', 'Argentina', 'Av. Belgrano 90, La Plata'),
('Julieta', 'julieta@example.com', '541167890123', 'Argentina', 'Calle Florida 234, Buenos Aires'),

('Andrés', 'andres@example.com', '573011234567', 'Colombia', 'Carrera 10 #20-30, Bogotá'),
('Laura', 'laura@example.com', '573022345678', 'Colombia', 'Calle 45 #12-34, Medellín'),
('Camilo', 'camilo@example.com', '573033456789', 'Colombia', 'Av. El Poblado 567, Cali'),
('Valeria', 'valeria@example.com', '573044567890', 'Colombia', 'Carrera 7 #56-78, Barranquilla'),
('Juanda', 'juanda@example.com', '573055678901', 'Colombia', 'Calle 100 #20-50, Bogotá'),
('Sebas', 'sebas@example.com', '573066789012', 'Colombia', 'Av. Caracas 98, Cartagena'),
('Daniela', 'daniela@example.com', '573077890123', 'Colombia', 'Carrera 8 #45-67, Bucaramanga');


--- Publicaciones
INSERT INTO Publicacion (id_usuario, contenido) VALUES
-- Publicaciones sobre IA 🤖
(1, 'La inteligencia artificial está revolucionando el mundo. ¿Estamos listos para el cambio?'),
(6, 'ChatGPT es una de las herramientas más poderosas en procesamiento de lenguaje natural.'),
(13, '¿Sabías que la IA puede generar imágenes hiperrealistas en segundos?'),
(19, 'Las redes neuronales pueden aprender patrones complejos de datos con sorprendente precisión.'),
(24, 'La automatización con IA reducirá millones de empleos, pero creará otros nuevos.'),
(3, 'El machine learning está presente en casi todas las aplicaciones modernas.'),

-- Publicaciones de noticias 📰
(2, 'Última hora: un avance científico promete mejorar la energía renovable.'),
(7, 'El cambio climático sigue siendo el mayor desafío del siglo XXI.'),
(14, 'La bolsa de valores experimentó una caída inesperada esta semana.'),
(20, 'Descubren un exoplaneta que podría albergar vida.'),
(9, 'Nueva ley en España busca regular el teletrabajo.'),
(4, 'Los avances en biotecnología permitirán tratamientos personalizados para enfermedades raras.'),

-- Publicaciones de frases motivacionales 💪
(5, 'Nunca es tarde para empezar de nuevo. ¡Hoy es el mejor día!'),
(10, 'El éxito es la suma de pequeños esfuerzos repetidos día tras día.'),
(15, 'No importa cuántas veces caigas, sino cuántas te levantes.'),
(22, 'Atrévete a soñar en grande y trabaja duro para lograrlo.'),
(11, 'No hay límites para lo que puedes lograr si crees en ti mismo.'),
(17, 'Convierte tus fracasos en aprendizajes y sigue adelante.'),

-- Publicaciones sobre tecnología y ciencia 🔬
(8, 'El futuro de la computación cuántica es prometedor pero aún incierto.'),
(12, 'Los autos eléctricos están ganando popularidad en todo el mundo.'),
(18, 'Las impresoras 3D podrían revolucionar la fabricación en el futuro.'),
(23, 'Los dispositivos portátiles están monitoreando nuestra salud en tiempo real.'),
(21, 'El metaverso cambiará la forma en que interactuamos en internet.'),

-- Publicaciones sobre entretenimiento 🎬
(16, 'La última temporada de mi serie favorita no me ha decepcionado.'),
(24, 'Los videojuegos son una forma de arte que nos permite vivir experiencias únicas.'),
(5, 'El cine independiente sigue siendo una joya poco apreciada.'),
(13, 'Los libros de ciencia ficción nos permiten imaginar futuros alternativos.'),
(6, 'La música tiene el poder de transportarnos a otro estado emocional.'),

-- Publicaciones sobre viajes ✈️
(9, 'Colombia tiene algunos de los paisajes más hermosos del mundo.'),
(1, 'Siempre quise visitar la Patagonia, un destino increíble.'),
(19, 'España tiene una cultura y gastronomía fascinante.'),
(11, 'Los viajes enriquecen el alma y nos enseñan a ver el mundo con otros ojos.'),
(24, 'México tiene playas espectaculares y una historia increíble.'),

-- Publicaciones diversas 🌍
(7, 'El minimalismo me ha ayudado a vivir con menos estrés.'),
(10, 'La educación financiera debería enseñarse en todas las escuelas.'),
(20, 'Los deportes electrónicos están creciendo exponencialmente.'),
(3, 'Las criptomonedas son el futuro de las transacciones digitales.'),
(14, 'La meditación diaria puede mejorar la salud mental.'),
(22, 'El veganismo es una opción de vida más sostenible.'),
(18, 'Las habilidades blandas son tan importantes como las técnicas en el mundo laboral.'),
(12, 'La creatividad es la clave para resolver problemas complejos.');


SELECT * FROM Publicacion;


SELECT * FROM Comentario;
-- Comentario
-- Inserción de Comentarios con relación recursiva
-- Comentario 1: Usuario 2 comenta en la publicación 1 (tema: IA)
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(2, 1, 'Interesante perspectiva sobre la IA, muy informativo.', NULL);
-- Se asume que este comentario recibirá el id_comentario = 1

-- Comentario 2: Usuario 3 responde al comentario 1
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(3, 1, 'Totalmente de acuerdo, la IA cambiará nuestras vidas.', 1);

-----------------------------------------------------------
-- Comentario 3: Usuario 10 comenta en la publicación 2 (tema: Noticias)
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(10, 2, 'Esta noticia me preocupa, necesitamos más soluciones.', NULL);
-- Se asume id_comentario = 3

-- Comentario 4: Usuario 11 responde al comentario 3
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(11, 2, 'Creo que la tecnología puede ayudarnos a superar este reto.', 3);

-----------------------------------------------------------
-- Comentario 5: Usuario 4 comenta en la publicación 10 (tema: Noticias)
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(4, 10, 'Un descubrimiento asombroso, definitivamente vale la pena investigar más.', NULL);

-----------------------------------------------------------
-- Comentario 6: Usuario 5 comenta en la publicación 15 (tema: Frases motivacionales)
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(5, 15, 'Una frase que me inspira a seguir adelante cada día.', NULL);
-- Se asume id_comentario = 6

-- Comentario 7: Usuario 1 responde al comentario 6
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(1, 15, '¡Exacto! La motivación es clave para el éxito.', 6);

-----------------------------------------------------------
-- Comentario 8: Usuario 16 comenta en la publicación 23 (tema: Tecnología y ciencia)
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(16, 23, 'Me fascina cómo estos dispositivos pueden monitorizar nuestra salud en tiempo real.', NULL);

-----------------------------------------------------------
-- Comentario 9: Usuario 12 comenta en la publicación 30 (tema: Viajes)
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(12, 30, 'Viajar siempre me abre la mente y enriquece mis experiencias.', NULL);
-- Se asume id_comentario = 9

-- Comentario 10: Usuario 13 responde al comentario 9
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(13, 30, 'Totalmente, cada viaje es una nueva aventura.', 9);

-----------------------------------------------------------
-- Comentario 11: Usuario 22 comenta en la publicación 35 (tema: Publicaciones diversas)
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(22, 35, 'La meditación realmente mejora mi bienestar diario.', NULL);

-----------------------------------------------------------
-- Comentario 12: Usuario 24 comenta en la publicación 41 (tema: Publicaciones diversas)
INSERT INTO Comentario (id_usuario, id_publicacion, comentario, id_Comentario_r) VALUES
(24, 41, 'La creatividad es fundamental en la resolución de problemas.', NULL);

SELECT * FROM Comentario;

INSERT INTO Imagen (id_publicacion, url) VALUES
(1, 'https://example.com/images/ia_tech.jpg'),
(2, 'https://example.com/images/noticias_actualidad.jpg'),
(3, 'https://example.com/images/frase_motivacional.jpg'),
(4, 'https://example.com/images/biotecnologia.jpg'),
(5, 'https://example.com/images/cultura_gastronomica.jpg'),
(6, 'https://example.com/images/machine_learning.jpg'),
(7, 'https://example.com/images/cambio_climatico.jpg'),
(8, 'https://example.com/images/computacion_cuantica.jpg'),
(9, 'https://example.com/images/viaje_colombia.jpg'),
(10, 'https://example.com/images/vida_minimalista.jpg');

SELECT * FROM Imagen;

INSERT INTO Likes (id_usuario, id_publicacion) VALUES
-- Likes en publicaciones sobre IA (usuarios que repiten likes en este tema)
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(1, 5),
(2, 5),
(1, 6),
(2, 6),

-- Likes en publicaciones de Noticias (usuarios que repiten likes en este tema)
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(3, 11),
(4, 11),
(3, 12),
(4, 12),

-- Likes en publicaciones de Frases motivacionales (usuarios que repiten likes en este tema)
(5, 13),
(5, 14),
(5, 15),
(6, 13),
(6, 14),
(6, 15),
(5, 16),
(6, 16);

SELECT * FROM Likes;

SELECT * FROM Seguir;

-- Usuario 1 sigue a usuarios 2, 3, 4 y 5
INSERT INTO Seguir (id_seguidor, id_seguido) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5);

-- Usuario 2 sigue a usuarios 1, 3 y 5
INSERT INTO Seguir (id_seguidor, id_seguido) VALUES
(2, 1),
(2, 3),
(2, 5);

-- Usuario 3 sigue a usuarios 1, 2, 4 y 6
INSERT INTO Seguir (id_seguidor, id_seguido) VALUES
(3, 1),
(3, 2),
(3, 4),
(3, 6);

-- Usuario 4 sigue a usuarios 1, 2, 3 y 5
INSERT INTO Seguir (id_seguidor, id_seguido) VALUES
(4, 1),
(4, 2),
(4, 3),
(4, 5);

-- Usuario 5 sigue a usuarios 1, 2 y 3
INSERT INTO Seguir (id_seguidor, id_seguido) VALUES
(5, 1),
(5, 2),
(5, 3);

SELECT COUNT(*) AS cantidad_seguidores
FROM Seguir
WHERE id_seguido = 3;


SELECT U.username AS nombre_seguidor
FROM Seguir S
JOIN Usuario U ON S.id_seguidor = U.id_usuario
WHERE S.id_seguido = 7;


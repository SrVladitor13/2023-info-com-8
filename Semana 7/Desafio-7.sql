-- Creacion de tablas

CREATE TABLE USUARIO(
    id INT,
    nombre CHAR(30),
    apellido CHAR(30),
    telefono CHAR(15),
    username CHAR(30) NOT NULL,
    email CHAR(30) NOT NULL,
    contrasena CHAR(30),
    estado CHAR(8) CHECK (estado = 'activo' OR estado = 'inactivo') DEFAULT "activo",
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    avatar CHAR(255),
    es_publico CHAR(3) CHECK (es_publico = 'si' OR es_publico = 'no'),
    es_colaborador CHAR(3) CHECK (es_colaborador = 'si' OR es_colaborador = 'no'),
    es_admin CHAR(3) CHECK (es_admin = 'si' OR es_admin = 'no'),
    PRIMARY KEY(id)


);

CREATE TABLE ARTICULO(
    id INT,
    id_usuario INT NOT NULL,
    titulo CHAR(20),
    resumen TEXT,
    contenido TEXT,
    fecha_publicacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado CHAR(8) CHECK (estado = 'activo' OR estado = 'inactivo') DEFAULT 'activo',
    imagen CHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY(id_usuario) REFERENCES USUARIO(id)

);

CREATE TABLE CATEGORIA(
    id INT,
    id_categoria INT NOT NULL,
    nombre CHAR(30),
    descripcion TEXT NOT NULL,
    imagen CHAR(255) NOT NULL,
    estado CHAR(8) CHECK (estado = 'activo' OR estado = 'inactivo') DEFAULT 'activo',
    PRIMARY KEY (id),
    FOREIGN KEY(id_categoria) REFERENCES CATEGORIA(id)
);

CREATE TABLE COMENTARIO(
    id INT,
    id_articulo INT NOT NULL,
    id_usuario INT NOT NULL,
    contenido CHAR(50),
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado CHAR(8) CHECK (estado = 'activo' OR estado = 'inactivo') DEFAULT "activo",
    PRIMARY KEY (id),
    FOREIGN KEY(id_usuario) REFERENCES USUARIO(id),
    FOREIGN KEY(id_articulo) REFERENCES ARTICULO(id)

);



-- Agregar el comando necesario que introduzca en la tabla usuario, 1 usuario con rol
-- de admin, 4 con rol de colaborador y 5 con rol de público. Donde los campos:
-- es_publico, es_colaborador y es_admin son booleanos.

INSERT INTO usuario(
    id,
    nombre,
    apellido,
    telefono,
    username,
    email,
    contrasena,
    estado,
    avatar,
    es_publico,
    es_colaborador,
    es_admin
) VALUES(
    1011,
    "Admin",
    "Uno",
    36241011,
    "Admin1",
    "Admin1@gmail.com",
    "admin1",
    "activo",
    "link.com/admin1.png",
    "no",
    "no",
    "si"
);

INSERT INTO usuario(
    id,
    nombre,
    apellido,
    telefono,
    username,
    email,
    contrasena,
    estado,
    avatar,
    es_publico,
    es_colaborador,
    es_admin
) VALUES(
    1021,
    "Colab",
    "Uno",
    36241021,
    "Colab1",
    "Colab1@gmail.com",
    "colab1",
    "activo",
    "link.com/colab1.png",
    "no",
    "si",
    "no"
);

INSERT INTO usuario(
    id,
    nombre,
    apellido,
    telefono,
    username,
    email,
    contrasena,
    estado,
    avatar,
    es_publico,
    es_colaborador,
    es_admin
) VALUES(
    1022,
    "Colab",
    "Dos",
    36241022,
    "Colab2",
    "Colab2@gmail.com",
    "colab2",
    "activo",
    "link.com/colab2.png",
    "no",
    "si",
    "no"
);

INSERT INTO usuario(
    id,
    nombre,
    apellido,
    telefono,
    username,
    email,
    contrasena,
    estado,
    avatar,
    es_publico,
    es_colaborador,
    es_admin
) VALUES(
    1023,
    "Colab",
    "Tres",
    32641023,
    "Colab3",
    "Colab3@gmail.com",
    "colab3",
    "activo",
    "link.com/colab3.png",
    "no",
    "si",
    "no"
);

INSERT INTO usuario(
    id,
    nombre,
    apellido,
    telefono,
    username,
    email,
    contrasena,
    estado,
    avatar,
    es_publico,
    es_colaborador,
    es_admin
) VALUES(
    1024,
    "Colab",
    "Cuatro",
    36241024,
    "Colab4",
    "Colab4@gmail.com",
    "colab4",
    "activo",
    "link.com/colab4.png",
    "no",
    "si",
    "no"
);

INSERT INTO usuario(
    id,
    nombre,
    apellido,
    telefono,
    username,
    email,
    contrasena,
    estado,
    avatar,
    es_publico,
    es_colaborador,
    es_admin
) VALUES(
    1031,
    "Publico",
    "Uno",
    36241031,
    "Publico1",
    "Publico1@gmail.com",
    "publico1",
    "activo",
    "link.com/publico1.png",
    "no",
    "no",
    "si"
);

INSERT INTO usuario(
    id,
    nombre,
    apellido,
    telefono,
    username,
    email,
    contrasena,
    estado,
    avatar,
    es_publico,
    es_colaborador,
    es_admin
) VALUES(
    1032,
    "Publico",
    "Dos",
    36241032,
    "Publico2",
    "Publico2@gmail.com",
    "publico2",
    "activo",
    "link.com/publico2.png",
    "no",
    "no",
    "si"
);

INSERT INTO usuario(
    id,
    nombre,
    apellido,
    telefono,
    username,
    email,
    contrasena,
    estado,
    avatar,
    es_publico,
    es_colaborador,
    es_admin
) VALUES(
    1033,
    "Publico",
    "Tres",
    36241033,
    "Publico3",
    "Publico3@gmail.com",
    "publico3",
    "activo",
    "link.com/publico3.png",
    "no",
    "no",
    "si"
);

INSERT INTO usuario(
    id,
    nombre,
    apellido,
    telefono,
    username,
    email,
    contrasena,
    estado,
    avatar,
    es_publico,
    es_colaborador,
    es_admin
) VALUES(
    1034,
    "Publico",
    "Cuatro",
    36241034,
    "Publico4",
    "Publico4@gmail.com",
    "publico4",
    "activo",
    "link.com/publico4.png",
    "no",
    "no",
    "si"
);

INSERT INTO usuario(
    id,
    nombre,
    apellido,
    telefono,
    username,
    email,
    contrasena,
    estado,
    avatar,
    es_publico,
    es_colaborador,
    es_admin
) VALUES(
    1035,
    "Publico",
    "Cinco",
    36241035,
    "Publico5",
    "Publico5@gmail.com",
    "publico5",
    "activo",
    "link.com/publico5.png",
    "no",
    "no",
    "si"
);



-- Agregar el comando necesario para actualizar el rol a admin de uno de los usuarios
-- agregado con rol de colaborador

UPDATE usuario SET es_colaborador = "no", es_admin = "si" WHERE id = 1021;



-- Agregar el comando necesario que introduzca en la tabla articulo, 3 artículos con
-- estado TRUE y uno con estado FALSE. Donde el campo estado en todas las tablas es
-- Booleano.

INSERT INTO articulo (
    id,
    id_usuario,
    titulo,
    resumen,
    contenido,
    estado,
    imagen
) VALUES(
    2011,
    1021,
    "Articulo 1",
    "What is Lorem Ipsum?",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
    "activo",
    "link.com/articulo1.png"
);

INSERT INTO articulo (
    id,
    id_usuario,
    titulo,
    resumen,
    contenido,
    estado,
    imagen
) VALUES(
    2012,
    1022,
    "Articulo 2",
    "Where does it come from?",
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old",
    "activo",
    "link.com/articulo2.png"
);

INSERT INTO articulo (
    id,
    id_usuario,
    titulo,
    resumen,
    contenido,
    estado,
    imagen
) VALUES(
    2013,
    1023,
    "Articulo 3",
    "Why do we use it?",
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters",
    "activo",
    "link.com/articulo3.png"
);

INSERT INTO articulo (
    id,
    id_usuario,
    titulo,
    resumen,
    contenido,
    estado,
    imagen
) VALUES(
    2021,
    1024,
    "Articulo 4",
    "Where can I get some?",
    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable",
    "inactivo",
    "link.com/articulo4.png"
);



-- Agregar el comando necesario para eliminar el artículo que tenga estado FALSE.

DELETE FROM articulo WHERE estado = "inactivo";



-- Agregar el comando necesario que introduzca 3 comentarios al primer artículo
-- agregado y 2 comentarios al segundo artículo.

INSERT INTO comentario (
    id,
    id_articulo,
    id_usuario,
    contenido,
    estado
) VALUES(
    3011,
    2011,
    1031,
    "Comentario11",
    "activo"
);

INSERT INTO comentario (
    id,
    id_articulo,
    id_usuario,
    contenido,
    estado
) VALUES(
    3012,
    2011,
    1032,
    "Comentario12",
    "activo"
);
INSERT INTO comentario (
    id,
    id_articulo,
    id_usuario,
    contenido,
    estado
) VALUES(
    3013,
    2011,
    1033,
    "Comentario13",
    "activo"
);
INSERT INTO comentario (
    id,
    id_articulo,
    id_usuario,
    contenido,
    estado
) VALUES(
    3021,
    2012,
    1034,
    "Comentario21",
    "activo"
);
INSERT INTO comentario (
    id,
    id_articulo,
    id_usuario,
    contenido,
    estado
) VALUES(
    3022,
    2012,
    1035,
    "Comentario22",
    "activo"
);



-- Agregar el comando necesario para listar todos los artículos que tengan
-- comentarios, mostrando el título del artículo, la fecha_publicacion del artículo, el
-- nombre del usuario que realizo el comentario y la fecha_hora que realizó dicho
-- comentario, agrupados por artículos.

SELECT articulo.titulo, articulo.fecha_publicacion, usuario.nombre, comentario.fecha_hora
FROM articulo, usuario, comentario
WHERE articulo.id LIKE comentario.id_articulo AND usuario.id LIKE comentario.id_usuario
ORDER BY articulo.titulo;

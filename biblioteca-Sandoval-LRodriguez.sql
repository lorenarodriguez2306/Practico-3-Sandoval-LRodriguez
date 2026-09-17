CREATE DATABASE biblioteca_arq;
USE biblioteca_arq;
create table socio (
id_socio int auto_increment primary key,
nombre VARCHAR(50),
apellido VARCHAR(50),
cuota VARCHAR(20)
);
create table editorial (
id_editorial int auto_increment primary key,
nombre VARCHAR(50)
);
create table tema (
id_tema int auto_increment primary key,
nombre_tema VARCHAR(70)
);
create table autor (
id_autor int auto_increment primary key,
NyA VARCHAR(100)
);
create table libro (
id_libro int auto_increment primary key,
id_editorial int,
id_tema int,
nombre_libro VARCHAR(100),
estado VARCHAR(30),
foreign key (id_editorial) references editorial(id_editorial),
foreign key (id_tema) references tema(id_tema)
);
create table autor_libro (
id_libro int,
id_autor int,
primary key (id_libro, id_autor),
foreign key (id_libro) references libro(id_libro),
foreign key (id_autor) references autor(id_autor)
);
create  table prestamo (
id_prestamo int auto_increment primary key,
id_socio int,
id_libro int,
fecha_prestamo date,
fecha_devolucion date,
estado_devolucion VARCHAR(30),
foreign key (id_socio) references socio(id_socio),
foreign key (id_libro) references libro(id_libro)
);

INSERT INTO editorial (nombre) VALUES ("Kapelusz"), ("Eudeba"), ("Aique"), ("Estrada");
INSERT INTO tema (nombre_tema) VALUES ("Programación"), ("Redes"), ("Electronica"), ("Literatura");
INSERT INTO autor (NyA) VALUES ("Marcos Lopez"), ("Ana García"), ("Carlos Paz");
INSERT INTO socio (nombre, apellido, cuota) VALUES 
('Lucas', 'Gómez', 'Al día'),
('Martina', 'López', 'Debe'),
('Mateo', 'Díaz', 'Al día'),
('Sofía', 'Pérez', 'Debe'),
('Joaquín', 'Romero', 'Al día'),
('Valentina', 'Sosa', 'Debe'),
('Benjamín', 'Torres', 'Al día'),
('Camila', 'Ruiz', 'Al día'),
('Thiago', 'Álvarez', 'Debe'),
('Lola', 'Benítez', 'Al día');
INSERT INTO libro (id_editorial, id_tema, nombre_libro, estado) VALUES 
(1, 1, 'Sistemas Operativos', 'Buen estado'),
(2, 2, 'Redes de Computadoras', 'Buen estado'),
(1, 1, 'Bases de Datos', 'Buen estado'),
(4, 3, 'El Aleph', 'Deteriorado'),
(3, 3, 'Ficciones', 'Deteriorado'),
(4, 4, 'Circuitos Digitales', 'Deteriorado'),
(2, 1, 'Algoritmos Complejos', 'No encontrado'),
(4, 2, 'Seguridad Informática', 'No encontrado'),
(1, 1, 'Lenguaje C', 'Buen estado'),
(2, 3, 'Cien Años de Soledad', 'Buen estado');
INSERT INTO prestamo (id_socio, id_libro, fecha_prestamo, fecha_devolucion, estado_devolucion)VALUES 
(2, 1, '2026-09-01', '2026-09-15', 'Pendiente'),
(4, 4, '2026-09-03', '2026-09-17', 'Pendiente'),
(1, 2, '2026-08-10', '2026-08-24', 'Devuelto'),
(6, 7, '2026-09-05', '2026-09-19', 'Pendiente'),
(3, 9, '2026-08-15', '2026-08-29', 'Devuelto');
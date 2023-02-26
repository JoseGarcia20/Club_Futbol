create database profesores; 

use profesores;

create table profesor ( 
    id int(5) NOT NULL AUTO_INCREMENT,
    cedula varchar(15),
    nombres varchar(50), 
    area varchar(50), 
    telefono varchar(50), 
    idCategoria int,
    constraint pk_1 PRIMARY key(id) 
);

create table categoria (
    id integer not null AUTO_INCREMENT,
    descripcion varchar(15) not null,
    constraint pk_2 primary key(id)
);

insert into profesor (cedula,nombres,area,telefono,idCategoria) values ('123456','Jose Garcia','123','456789',1);
insert into profesor (cedula,nombres,area,telefono,idCategoria) values ('478521','Sebastian Perez','2323','66666',2);

INSERT INTO `categoria`( `descripcion`) VALUES ('Profesional');
INSERT INTO `categoria`(`descripcion`) VALUES ('Doctorado');
INSERT INTO `categoria`( `descripcion`) VALUES ('Especialista');
INSERT INTO `categoria`(`descripcion`) VALUES ('Maestria');

select profesor.id, profesor.nombres, profesor.area, profesor.telefono, categoria.descripcion
from profesor
left join categoria
on profesor.idCategoria=categoria.id; 
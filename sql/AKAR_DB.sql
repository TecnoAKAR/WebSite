drop database if exists AKAR;
create database AKAR;
use AKAR;
create table Usuario(
idUsuario int primary key auto_increment, Nombre varchar(40), 
 ApellidoP varchar(40), ApellidoM varchar(40), Correo varchar(40), Contrasena varchar(40),
 NomUsuario varchar(40), Fecha date
);
create table Tarea(
idTarea int primary key auto_increment,
idResponsable int, idusuario int, NomTarea varchar(40), Problema varchar(520), Departamento varchar(40),
Estatus varchar(20), Solu varchar(520), SoluMan varchar(520),Fecha datetime,
foreign key (idResponsable) references Usuario(idUsuario),
foreign key (idUsuario) references Usuario(idUsuario));

create table RelTareaUsu(
idRelTareaUsu int primary key auto_increment,
idUsuario int, idTarea int, Fecha datetime,
foreign key (idUsuario) references Usuario(idUsuario),
foreign key (idTarea) references Tarea(idTarea));

create table TipoUsuario(
idTipo int primary key auto_increment,
Tipo varchar(40));

create table RelTipoUsuario(
idRelTipoUsuario int primary key auto_increment,
idUsuario int, idTipo int,
foreign key (idUsuario) references Usuario(idUsuario),
foreign key (idTipo) references TipoUsuario(idTipo)
);

create table Juego(
idJuego int primary key auto_increment,
NombreJuego varchar(40));

create table RelJuegoUsuario(
idRelJuegoUsuario int primary key auto_increment,
idJuego int,idUsuario int,puntaje int,
foreign key (idJuego) references Juego(idJuego),
foreign key (idUsuario) references Usuario(idUsuario));

create table Mensajes(
idMensaje int primary key auto_increment,
Mensaje  varchar(200),
Hora datetime );

create table Chat(
idChat int primary key auto_increment,
idUsuario1 int, idUsuario2 int,
foreign key (idUsuario1) references Usuario(idUsuario),
foreign key (idUsuario2) references Usuario(idUsuario));


create table RelChatMensaje(
idRelChatMensaje int primary key auto_increment,
idChat int, idMensaje int,
foreign key(idChat) references Chat(idChat),
foreign key(idMensaje) references Mensajes(idMensaje));

create table RelTutorUCSA(
idRelTutorUCSA int primary key auto_increment,
idUsuario1 int, idUsuario2 int,
foreign key (idUsuario1) references Usuario(idUsuario),
foreign key (idUsuario2) references Usuario(idUsuario));

create table resPass(
	idToken int primary key auto_increment,
    token varchar(43) not null,
    exp timestamp not null
);

create table RelUsuarioResPass(
	idRelUsRess int primary key auto_increment,
    idUsuario int,
    idResPass int,
    foreign key(idUsuario) references Usuario(idUsuario),
    foreign key(idResPass) references resPass(idToken)
);

insert into TipoUsuario (Tipo) values ('Psicólogo'), ('UCSA'),('Tutor'),('Externo'),
('Asistente'),('Gerente_Soporte'),('Ingeniero_Soporte'),('Gerente_Mantenimiento'),('Ingeniero_Mantenimiento');


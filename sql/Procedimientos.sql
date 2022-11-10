use AKAR;
drop procedure if exists registro;
delimiter //

create procedure registro( in nom nvarchar(50), pat nvarchar(50),
mat nvarchar(50), fecha date, correo nvarchar(50),contraseña nvarchar (50), usuario nvarchar(50),tipo int)
begin
declare xIdPersona int;
declare xIdTipo int;
	
    insert into Usuario( Nombre, ApellidoP, ApellidoM, Correo, Contrasena, NomUsuario, Fecha)
    values (nom, pat, mat, correo, contraseña, usuario, fecha);
    set xIdPersona=( select idUsuario from Usuario where Nombre= nom and ApellidoP= pat);
    set xIdTipo= tipo;
    insert into RelTipoUsuario( idUsuario, idTipo) values (xIdPersona,xIdTipo);

end; //

use AKAR;
drop procedure if exists registro;
drop procedure if exists login;



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

create procedure login(correo nvarchar(50),contraseña nvarchar(50))
begin
declare xidPersona int;
declare existe int;
declare xMsj nvarchar(50);
		set existe=(select count(*) from Usuario where Correo=correo and Contrasena=contrasena);
        if(existe=0) then
			set xMsj="No existe usuario";
        elseif(existe=1)then
			set xidPersona=(select idUsuario from Usuario where Correo=correo and Contrasena=contrasena);
			select * from Usuario where idusuario=xidPersona;
		end if;
end; //

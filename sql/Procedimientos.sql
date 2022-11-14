use AKAR;
drop procedure if exists sp_Registro;
drop procedure if exists sp_Login;
drop procedure if exists sp_Registromenordeedad;
drop procedure if exists sp_ActualizarUsuario;


delimiter //

create procedure sp_Registro( in nom nvarchar(50), pat nvarchar(50),
mat nvarchar(50), fecha date, correo nvarchar(50),contrasena nvarchar (50), usuario nvarchar(50),tipo int)
begin
declare xIdPersona int;
declare xIdTipo int;
	
    insert into Usuario( Nombre, ApellidoP, ApellidoM, Correo, Contrasena, NomUsuario, Fecha)
    values (nom, pat, mat, correo, contrasena, usuario, fecha);
    set xIdPersona=( select idUsuario from Usuario where Nombre= nom and ApellidoP= pat);
    set xIdTipo= tipo;
    insert into RelTipoUsuario( idUsuario, idTipo) values (xIdPersona,xIdTipo);

end; //

create procedure sp_Login(in correoP nvarchar(50),contrasenaP nvarchar(50))
begin
declare xidPersona int;
declare existe int;
declare xMsj nvarchar(50);
		set existe=(select count(*) from Usuario where Correo=correoP and Contrasena=contrasenaP);
        if(existe=0) then
			set xMsj="No existe usuario";
        elseif(existe=1)then
			set xidPersona=(select idUsuario from Usuario where Correo = correoP and Contrasena = contrasenaP);
			select RelTipoUsuario.idRelTipoUsuario, RelTipoUsuario.idUsuario, RelTipoUsuario.idTipo, Usuario.Nombre, Usuario.ApellidoP, Usuario.ApellidoM, Usuario.Correo, Usuario.NomUsuario  from RelTipoUsuario inner join Usuario  on RelTipoUsuario.idUsuario = Usuario.idUsuario inner join TipoUsuario on RelTipoUsuario.idTipo = TipoUsuario.idTipo where RelTipoUsuario.idUsuario = xidPersona;
		end if;
end; //

create procedure sp_Registromenordeedad ( in nom nvarchar(50), pat nvarchar(50),
mat nvarchar(50), fecha date, correo nvarchar(50),contrasena nvarchar (50), usuario nvarchar(50),nom2 nvarchar(50), pat2 nvarchar(50),
mat2 nvarchar(50), fecha2 date, correo2 nvarchar(50),contrasena2 nvarchar (50), usuario2 nvarchar(50))
begin
declare xIdPersona int;
declare xIdPersona2 int;
declare xIdTipo int;
declare xIdTipo2 int;

	
    insert into Usuario( Nombre, ApellidoP, ApellidoM, Correo, Contrasena, NomUsuario, Fecha)
    values (nom, pat, mat, correo, contrasena, usuario, fecha),(nom2, pat2, mat2, correo2, contrasena2, usuario2, fecha2);
    set xIdPersona=( select idUsuario from Usuario where Nombre= nom and ApellidoP= pat);
    set xIdPersona2=( select idUsuario from Usuario where Nombre= nom2 and ApellidoP= pat2);
    set xIdTipo= 2;
	set xIdTipo= 3;
    insert into RelTipoUsuario( idUsuario, idTipo) values (xIdPersona,xIdTipo),(xIdPersona2,xIdTipo2);
	insert into RelTutorUCSA ( idUsuario1, idUsuario2) values( xIdPersona,xIdPersona2);
    
    
end; //


create procedure sp_ActualizarUsuario(in nom nvarchar(50), pat nvarchar(50),
mat nvarchar(50), fecha date, correo nvarchar(50),contrasena nvarchar (50), usuario nvarchar(50),idpersona varchar(50))
begin
declare xIdPersona int;
	set xIdPersona= idpersona;
	update Usuario set Nombre=nom , ApellidoP = pat, ApellidoM = mat , Correo= correo ,Contrasena= contrasena,NomUsuario= usuario where idUsuario=xIdPersona;
end;//



end; //

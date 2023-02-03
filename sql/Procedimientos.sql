use AKAR;
drop procedure if exists sp_Registro;
drop procedure if exists sp_Login;
drop procedure if exists sp_Registromenordeedad;
drop procedure if exists sp_ActualizarUsuario;
drop procedure if exists sp_ActualizarContrasena;


delimiter //

create procedure sp_Registro( in nom nvarchar(50), pat nvarchar(50),
mat nvarchar(50), fecha date, correo nvarchar(50),contrasena nvarchar (50), usuario nvarchar(50),tipo int)
begin
declare xIdPersona int;
declare xIdTipo int;
declare existe int;
declare xMsj nvarchar(50);
	set existe=(select count(*) from usuario where Correo=correo and Nombre=nom);
    if (existe=0) then
		insert into Usuario( Nombre, ApellidoP, ApellidoM, Correo, Contrasena, NomUsuario, Fecha)
		values (nom, pat, mat, correo, sha(contrasena), usuario, fecha);
		set xIdPersona=( select idUsuario from Usuario where Nombre= nom and ApellidoP= pat);
		set xIdTipo= tipo;
		insert into RelTipoUsuario( idUsuario, idTipo) values (xIdPersona,xIdTipo);
        select RelTipoUsuario.idRelTipoUsuario, 
    RelTipoUsuario.idUsuario, RelTipoUsuario.idTipo, Usuario.Nombre, Usuario.ApellidoP, 
    Usuario.ApellidoM, Usuario.Correo, Usuario.NomUsuario  from RelTipoUsuario inner join Usuario  on RelTipoUsuario.idUsuario = Usuario.idUsuario inner join TipoUsuario on RelTipoUsuario.idTipo = TipoUsuario.idTipo where RelTipoUsuario.idUsuario = xidPersona;
	else
		if(existe>0)then
		set xMsj="Usuario Registrado";
        select xMsj;
end if;
end if;
end; //

create procedure sp_Login(in correoP nvarchar(50),contrasenaP nvarchar(50))
begin
declare xidPersona int;
declare existe int;
declare xMsj nvarchar(50);
declare xContraSha nvarchar(200);
set xContraSha =(select sha(contrasenaP));
		set existe=(select count(*) from Usuario where Correo=correoP and Contrasena=xContraSha);
        if(existe=0) then
			set xMsj="No existe usuario";
        else
			if(existe = 1)then
				set xidPersona=(select idUsuario from Usuario where Correo = correoP and Contrasena = xContraSha );
				select RelTipoUsuario.idRelTipoUsuario, RelTipoUsuario.idUsuario, RelTipoUsuario.idTipo, Usuario.Nombre,Usuario.ApellidoP, Usuario.ApellidoM, Usuario.Correo, Usuario.NomUsuario from RelTipoUsuario inner join Usuario  on RelTipoUsuario.idUsuario = Usuario.idUsuario inner join TipoUsuario on RelTipoUsuario.idTipo = TipoUsuario.idTipo where RelTipoUsuario.idUsuario = xidPersona;
		end if;
        end if;
end; //

create procedure sp_Registromenordeedad ( in nom nvarchar(50), pat nvarchar(50),
mat nvarchar(50), fecha date, correo nvarchar(50),contrasena nvarchar (50), usuario nvarchar(50),correo2 nvarchar(50),usuario2 nvarchar(50))
begin
declare xIdPersona int;
declare xIdPersona2 int;
declare xIdTipo int;
declare existe int;
declare menor int;
declare xMsj nvarchar(50);
    set menor= (select count(*) from Usuario where Correo=correo and Nombre=nom);
			if(menor=0)then
			insert into Usuario( Nombre, ApellidoP, ApellidoM, Correo, Contrasena, NomUsuario, Fecha)
			values (nom, pat, mat, correo, sha(contrasena), usuario, fecha);
			set xIdPersona=( select idUsuario from Usuario where Nombre= nom and ApellidoP= pat);
			set xIdPersona2=( select idUsuario from Usuario where Correo= correo2 and NomUsuario= usuario2);
			set xIdTipo= 2;
			insert into RelTipoUsuario( idUsuario, idTipo) values (xIdPersona,xIdTipo);
			insert into RelTutorUCSA ( idUsuario1, idUsuario2) values( xIdPersona,xIdPersona2);
			select RelTipoUsuario.idRelTipoUsuario, RelTipoUsuario.idUsuario, RelTipoUsuario.idTipo, Usuario.Nombre,Usuario.ApellidoP, Usuario.ApellidoM, Usuario.Correo, Usuario.NomUsuario from RelTipoUsuario inner join Usuario  on RelTipoUsuario.idUsuario = Usuario.idUsuario inner join TipoUsuario on RelTipoUsuario.idTipo = TipoUsuario.idTipo where RelTipoUsuario.idUsuario = xidPersona;
			else
				if(menor>0)then
					set xMsj= "Menor ya registrado";
					select xMsj;
end if;
end if;  
end; //


create procedure sp_ActualizarUsuario(in nom nvarchar(50), pat nvarchar(50),
mat nvarchar(50), usuario nvarchar(50), idpersona varchar(50))
begin
declare xIdPersona int;
declare xContraSha nvarchar(200);
	set xIdPersona= idpersona;	
	update Usuario set Nombre=nom , ApellidoP = pat, ApellidoM = mat , NomUsuario= usuario where idUsuario=xIdPersona;
        select RelTipoUsuario.idRelTipoUsuario, RelTipoUsuario.idUsuario, RelTipoUsuario.idTipo, Usuario.Nombre,Usuario.ApellidoP, Usuario.ApellidoM, Usuario.Correo, Usuario.NomUsuario from RelTipoUsuario inner join Usuario  on RelTipoUsuario.idUsuario = Usuario.idUsuario inner join TipoUsuario on RelTipoUsuario.idTipo = TipoUsuario.idTipo where RelTipoUsuario.idUsuario = xidPersona;
end;//

create procedure sp_ActualizarContrasena(in contrasena nvarchar (50),idpersona varchar(50))
begin
declare xIdPersona int;
declare xContraSha nvarchar(200);
	set xIdPersona= idpersona;
	set xContraSha =(select sha(contrasena));
	update Usuario set Contrasena= xContraSha where idUsuario=xIdPersona;
end;//




use database AKAR;

CREATE PROCEDURE sp_insert_usuario
@nombre VARCHAR(50), 
@apellidoP VARCHAR(50)
@correo VARCHAR(50), 
@apellidoM VARCHAR(50)
@contraseña VARCHAR(50)
@nombreUs VARCHAR(50), 
@fecha DATE
AS 
INSERT INTO Usuario ([Nombre],[ApellidoP],[ApellidoM],[Correo],[Contraseña],[NomUsuario],[Fecha])
VALUES (@nombre, @apellidoP, @correo, @apellidoM,@contraseña @nombreUs,@fecha) 
GO

CREATE PROCEDURE sp_select_usuario
@id INT
AS 
SELECT * FROM Usuario WHERE id = @id
GO


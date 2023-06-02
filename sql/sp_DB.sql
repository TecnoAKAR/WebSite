#PROCEDIMIENTOS ALMACENADOS
USE AKAR;
DROP PROCEDURE IF EXISTS sp_REGISTRO;
DROP PROCEDURE IF EXISTS sp_ASIS;
DROP PROCEDURE IF EXISTS sp_LOGIN;
DROP PROCEDURE IF EXISTS sp_REGISTROMENORDEEDAD;
DROP PROCEDURE IF EXISTS sp_ACTUALIZARUSUARIO;
DROP PROCEDURE IF EXISTS sp_ACTUALIZARCONTRASENA;
DROP PROCEDURE IF EXISTS sp_ASIGNARTOKEN;
DROP PROCEDURE IF EXISTS sp_RECDATOSTOKEN;
DROP PROCEDURE IF EXISTS sp_MSJFORO;
DROP PROCEDURE IF EXISTS sp_GETMSJF;
DROP PROCEDURE IF EXISTS sp_DELMSJ;
DROP PROCEDURE IF EXISTS sp_VERCUENTA;
DROP PROCEDURE IF EXISTS sp_SOPORTE;
DROP PROCEDURE IF EXISTS sp_MANTENIMIENTO;
DROP PROCEDURE IF EXISTS sp_GERENTESOPING;
DROP PROCEDURE IF EXISTS sp_GERENTESOPMAN;
DROP PROCEDURE IF EXISTS sp_GERENTEMANSOP;
DROP PROCEDURE IF EXISTS sp_GERENTEMANING;
DROP PROCEDURE IF EXISTS sp_ADDREPORTE;
DROP PROCEDURE IF EXISTS sp_GETUSUARIOS;

delimiter //

CREATE PROCEDURE sp_REGISTRO( IN NOM NVARCHAR(50), PAT NVARCHAR(50),
MAT NVARCHAR(50), FECHA DATE, CORREO NVARCHAR(50),CONTRASENA NVARCHAR (50), USUARIO NVARCHAR(50),TIPO INT)
BEGIN
DECLARE XIDPERSONA INT;
DECLARE XIDTIPO INT;
DECLARE EXISTE INT;
DECLARE XMSJ NVARCHAR(50);
	SET EXISTE=(SELECT COUNT(*) FROM USUARIO WHERE USUARIO.CORREO=CORREO OR USUARIO.NOMUSUARIO = USUARIO);
    IF (EXISTE=0) THEN
		INSERT INTO USUARIO( NOMBRE, APELLIDOP, APELLIDOM, CORREO, CONTRASENA, NOMUSUARIO, FECHA, VER)
		VALUES (NOM, PAT, MAT, CORREO, SHA(CONTRASENA), USUARIO, FECHA, FALSE);
		SET XIDPERSONA=( SELECT IDUSUARIO FROM USUARIO WHERE NOMBRE= NOM AND APELLIDOP= PAT);
		SET XIDTIPO= TIPO;
		INSERT INTO RELTIPOUSUARIO( IDUSUARIO, IDTIPO) VALUES (XIDPERSONA,XIDTIPO);
        SELECT RELTIPOUSUARIO.IDRELTIPOUSUARIO, 
    RELTIPOUSUARIO.IDUSUARIO, RELTIPOUSUARIO.IDTIPO, USUARIO.NOMBRE, USUARIO.APELLIDOP, 
    USUARIO.APELLIDOM, USUARIO.CORREO, USUARIO.NOMUSUARIO  FROM RELTIPOUSUARIO INNER JOIN USUARIO  ON RELTIPOUSUARIO.IDUSUARIO = USUARIO.IDUSUARIO INNER JOIN TIPOUSUARIO ON RELTIPOUSUARIO.IDTIPO = TIPOUSUARIO.IDTIPO WHERE RELTIPOUSUARIO.IDUSUARIO = XIDPERSONA;
	ELSE
		IF(EXISTE>0)THEN
		SET XMSJ="USUARIO O CORREO EN USO";
        SELECT XMSJ;
END IF;
END IF;
END; //

CREATE PROCEDURE sp_LOGIN(IN NOMU NVARCHAR(50),CONTRASENAP NVARCHAR(50))
BEGIN
DECLARE XIDPERSONA INT;
DECLARE EXISTE INT;
DECLARE XMSJ NVARCHAR(50);
DECLARE XCONTRASHA NVARCHAR(200);
DECLARE XVER BOOLEAN;
SET XCONTRASHA =(SELECT SHA(CONTRASENAP));
		SET EXISTE=(SELECT COUNT(*) FROM USUARIO WHERE NOMUSUARIO=NOMU AND CONTRASENA=XCONTRASHA);
        IF(EXISTE=0) THEN
			SET XMSJ="NO EXISTE USUARIO";
            SELECT XMSJ;
        ELSE
			IF(EXISTE = 1)THEN
				SET XIDPERSONA=(SELECT IDUSUARIO FROM USUARIO WHERE NOMUSUARIO=NOMU AND CONTRASENA = XCONTRASHA );
                SET XVER = (SELECT VER FROM USUARIO WHERE IDUSUARIO = XIDPERSONA);
                IF(XVER = TRUE)THEN
					SELECT RELTIPOUSUARIO.IDRELTIPOUSUARIO, RELTIPOUSUARIO.IDUSUARIO, RELTIPOUSUARIO.IDTIPO, USUARIO.NOMBRE,USUARIO.APELLIDOP, USUARIO.APELLIDOM, USUARIO.CORREO, USUARIO.NOMUSUARIO FROM RELTIPOUSUARIO INNER JOIN USUARIO  ON RELTIPOUSUARIO.IDUSUARIO = USUARIO.IDUSUARIO INNER JOIN TIPOUSUARIO ON RELTIPOUSUARIO.IDTIPO = TIPOUSUARIO.IDTIPO WHERE RELTIPOUSUARIO.IDUSUARIO = XIDPERSONA;
				ELSE
					SET XMSJ="USUARIO NO VERIFICADO";
                    SELECT XMSJ;
        END IF;            
		END IF;
        END IF;
END; //

CREATE PROCEDURE sp_REGISTROMENORDEEDAD ( IN NOM NVARCHAR(50), PAT NVARCHAR(50),
MAT NVARCHAR(50), FECHA DATE, CORREO NVARCHAR(50),CONTRASENA NVARCHAR (50), USUARIO NVARCHAR(50), TIPO INT, CORREO2 NVARCHAR(50))
BEGIN
DECLARE XIDPERSONA INT;
DECLARE XIDPERSONA2 INT;
DECLARE XIDTIPO INT;
DECLARE EXISTE INT;
DECLARE MENOREXIST INT;
DECLARE TUTOREXIST INT;
DECLARE XMSJ NVARCHAR(50);
    SET TUTOREXIST = (SELECT COUNT(*) FROM USUARIO WHERE USUARIO.CORREO=CORREO2);
    SET MENOREXIST = (SELECT COUNT(*) FROM USUARIO WHERE USUARIO.CORREO=CORREO OR USUARIO.NOMUSUARIO = USUARIO);
			IF(TUTOREXIST>0 AND MENOREXIST=0)THEN
			INSERT INTO USUARIO( NOMBRE, APELLIDOP, APELLIDOM, CORREO, CONTRASENA, NOMUSUARIO, FECHA, VER)
			VALUES (NOM, PAT, MAT, CORREO, SHA(CONTRASENA), USUARIO, FECHA, FALSE);
			SET XIDPERSONA=( SELECT IDUSUARIO FROM USUARIO WHERE NOMUSUARIO = USUARIO AND USUARIO.CORREO = CORREO);
			SET XIDPERSONA2=( SELECT IDUSUARIO FROM USUARIO WHERE USUARIO.CORREO = CORREO2);
			SET XIDTIPO= TIPO;
			INSERT INTO RELTIPOUSUARIO( IDUSUARIO, IDTIPO) VALUES (XIDPERSONA,XIDTIPO);
			INSERT INTO RELTUTORUCSA ( IDUSUARIO1, IDUSUARIO2) VALUES( XIDPERSONA,XIDPERSONA2);
			SELECT RELTIPOUSUARIO.IDRELTIPOUSUARIO, RELTIPOUSUARIO.IDUSUARIO, RELTIPOUSUARIO.IDTIPO, USUARIO.NOMBRE,USUARIO.APELLIDOP, USUARIO.APELLIDOM, USUARIO.CORREO, USUARIO.NOMUSUARIO FROM RELTIPOUSUARIO INNER JOIN USUARIO  ON RELTIPOUSUARIO.IDUSUARIO = USUARIO.IDUSUARIO INNER JOIN TIPOUSUARIO ON RELTIPOUSUARIO.IDTIPO = TIPOUSUARIO.IDTIPO WHERE RELTIPOUSUARIO.IDUSUARIO = XIDPERSONA;
			ELSE
				IF(TUTOREXIST=0)THEN
					SET XMSJ= "EL TUTOR NO EXISTE";
					SELECT XMSJ;
                    END IF;
				IF(MENOREXIST=1)THEN
					SET XMSJ= "EL USUARIO YA EXISTE";
					SELECT XMSJ;
END IF;
END IF;  
END; //


CREATE PROCEDURE sp_ACTUALIZARUSUARIO(IN NOM NVARCHAR(50), PAT NVARCHAR(50),
MAT NVARCHAR(50), USUARIO NVARCHAR(50), IDPERSONA VARCHAR(50))
BEGIN
DECLARE XIDPERSONA INT;
DECLARE XCONTRASHA NVARCHAR(200);
	SET XIDPERSONA= IDPERSONA;	
	UPDATE USUARIO SET NOMBRE=NOM , APELLIDOP = PAT, APELLIDOM = MAT , NOMUSUARIO= USUARIO WHERE IDUSUARIO=XIDPERSONA;
        SELECT RELTIPOUSUARIO.IDRELTIPOUSUARIO, RELTIPOUSUARIO.IDUSUARIO, RELTIPOUSUARIO.IDTIPO, USUARIO.NOMBRE,USUARIO.APELLIDOP, USUARIO.APELLIDOM, USUARIO.CORREO, USUARIO.NOMUSUARIO FROM RELTIPOUSUARIO INNER JOIN USUARIO  ON RELTIPOUSUARIO.IDUSUARIO = USUARIO.IDUSUARIO INNER JOIN TIPOUSUARIO ON RELTIPOUSUARIO.IDTIPO = TIPOUSUARIO.IDTIPO WHERE RELTIPOUSUARIO.IDUSUARIO = XIDPERSONA;
END;//

CREATE PROCEDURE sp_ACTUALIZARCONTRASENA(IN CORREO NVARCHAR(200), CONTRASENA NVARCHAR (50))
BEGIN
DECLARE XIDUSUARIO NVARCHAR(200);
DECLARE XCONTRASHA NVARCHAR(200);
	SET XIDUSUARIO = (SELECT IDUSUARIO FROM USUARIO WHERE USUARIO.CORREO = CORREO);
	SET XCONTRASHA =(SELECT SHA(CONTRASENA));
	UPDATE USUARIO SET CONTRASENA = XCONTRASHA WHERE USUARIO.IDUSUARIO = XIDUSUARIO;
END;//

CREATE PROCEDURE sp_ASIGNARTOKEN(IN CORREO NVARCHAR(200), TOKEN NVARCHAR(43), CREACION TIMESTAMP)
BEGIN
DECLARE XIDUSUARIO INT;
DECLARE XIDTOKEN INT;
DECLARE XEXP TIMESTAMP;
 SET XIDUSUARIO = (SELECT IDUSUARIO FROM USUARIO WHERE USUARIO.CORREO = CORREO);
 SET XIDTOKEN = (SELECT IFNULL(MAX(IDTOKEN), 0)+1 FROM RESPASS);
 SET XEXP = (SELECT TIMESTAMP(CREACION, '24:00:00'));
 INSERT INTO RESPASS VALUES(XIDTOKEN, TOKEN, XEXP);
 INSERT INTO RELUSUARIORESPASS(IDUSUARIO, IDRESPASS) VALUES(XIDUSUARIO, XIDTOKEN);
END;//

CREATE PROCEDURE sp_RECDATOSTOKEN(TOKEN NVARCHAR(43))
BEGIN
DECLARE XIDTOKEN INT;
SET XIDTOKEN = (SELECT IDTOKEN FROM RESPASS WHERE RESPASS.TOKEN = TOKEN);
SELECT USUARIO.CORREO, RESPASS.TOKEN, RESPASS.EXP FROM RELUSUARIORESPASS INNER JOIN USUARIO ON RELUSUARIORESPASS.IDUSUARIO = USUARIO.IDUSUARIO INNER JOIN RESPASS ON RELUSUARIORESPASS.IDRESPASS = RESPASS.IDTOKEN WHERE RELUSUARIORESPASS.IDRESPASS = XIDTOKEN;
END;//

CREATE PROCEDURE sp_MSJFORO(IN MSJ NVARCHAR(300), IDAUTOR INT, FECHA DATETIME)
BEGIN
DECLARE XIDMENSAJE INT;
SET XIDMENSAJE = (SELECT IFNULL(MAX(IDMENSAJE), 0)+1 FROM MSJFORO);
INSERT INTO MSJFORO VALUES(XIDMENSAJE, IDAUTOR, MSJ, FECHA);
END;//

CREATE PROCEDURE sp_GETMSJF()
BEGIN
SELECT USUARIO.NOMUSUARIO, MSJFORO.IDMENSAJE, MSJFORO.MENSAJE, MSJFORO.HORA FROM MSJFORO INNER JOIN USUARIO ON MSJFORO.IDAUTOR = USUARIO.IDUSUARIO ORDER BY MSJFORO.IDMENSAJE;
END;//

CREATE PROCEDURE sp_DELMSJ(IN XIDMENSAJE INT)
BEGIN
DELETE FROM MSJFORO WHERE IDMENSAJE = XIDMENSAJE;
END;//

CREATE PROCEDURE sp_VERCUENTA(IN CORREOU NVARCHAR(200))
BEGIN
DECLARE XIDUSUARIO INT;
SET XIDUSUARIO = (SELECT IDUSUARIO FROM USUARIO WHERE CORREO = CORREOU);
UPDATE USUARIO SET VER = TRUE WHERE IDUSUARIO = XIDUSUARIO;
SELECT RELTIPOUSUARIO.IDRELTIPOUSUARIO, RELTIPOUSUARIO.IDUSUARIO, RELTIPOUSUARIO.IDTIPO, USUARIO.NOMBRE,USUARIO.APELLIDOP, USUARIO.APELLIDOM, USUARIO.CORREO, USUARIO.NOMUSUARIO FROM RELTIPOUSUARIO INNER JOIN USUARIO ON RELTIPOUSUARIO.IDUSUARIO = USUARIO.IDUSUARIO INNER JOIN TIPOUSUARIO ON RELTIPOUSUARIO.IDTIPO = TIPOUSUARIO.IDTIPO WHERE RELTIPOUSUARIO.IDUSUARIO = XIDUSUARIO;
END;//

CREATE PROCEDURE sp_GETUSUARIOS()
BEGIN
SELECT RELTIPOUSUARIO.IDRELTIPOUSUARIO, RELTIPOUSUARIO.IDUSUARIO, RELTIPOUSUARIO.IDTIPO, USUARIO.NOMBRE,USUARIO.APELLIDOP, USUARIO.APELLIDOM, USUARIO.CORREO, USUARIO.NOMUSUARIO, USUARIO.VER FROM RELTIPOUSUARIO INNER JOIN USUARIO ON RELTIPOUSUARIO.IDUSUARIO = USUARIO.IDUSUARIO INNER JOIN TIPOUSUARIO ON RELTIPOUSUARIO.IDTIPO = TIPOUSUARIO.IDTIPO;
END;

CREATE PROCEDURE sp_GERENTESOPING(IN PROBLEMA NVARCHAR(1024), ESTATUS NVARCHAR(40), NOMENCARGADO NVARCHAR(40))
BEGIN
DECLARE XDIDENCARGADO INT;
DECLARE XDIDREPORTE INT;
SET XDIDENCARGADO=(SELECT IDUSUARIO FROM USUARIO WHERE USUARIO.NOMUSUARIO = NOMENCARGADO);
SET XDIDREPORTE=(SELECT IDREPORTE FROM REPORTE WHERE REPORTE.PROBLEMA = PROBLEMA);
INSERT INTO RELREPORTEENCARGADO(IDENCARGADO, IDREPORTE) VALUES (XDIDENCARGADO, XDIDREPORTE);
INSERT INTO REPORTECAMBIOS(IDUSUARIO, IDREPORTE, FECHACAMBIO, ESTATUSI, ESTATUSF) VALUES (2, XDIDREPORTE, NOW(), 'ABIERTO', ESTATUS);
UPDATE REPORTE SET REPORTE.ESTATUS = ESTATUS WHERE IDREPORTE = XDIDREPORTE; 
END;//   

CREATE PROCEDURE sp_GERENTESOPMAN(IN PROBLEMA NVARCHAR(1024), ESTATUS NVARCHAR(40), SOLUCION NVARCHAR(1024), NOMENCARGADO NVARCHAR(40))
BEGIN
DECLARE XDIDENCARGADO INT;
DECLARE XDIDREPORTE INT;
SET XDIDENCARGADO=(SELECT IDUSUARIO FROM USUARIO WHERE USUARIO.NOMUSUARIO=NOMENCARGADO);
SET XDIDREPORTE=(SELECT IDREPORTE FROM REPORTE WHERE REPORTE.PROBLEMA=PROBLEMA);
INSERT INTO RELREPORTEENCARGADO(IDENCARGADO, IDREPORTE) VALUES (XDIDENCARGADO,XDIDREPORTE);
INSERT INTO REPORTECAMBIOS(IDUSUARIO, IDREPORTE, FECHACAMBIO, ESTATUSI, ESTATUSF) VALUES (2, XDIDREPORTE, NOW(), 'ABIERTO', ESTATUS);
UPDATE REPORTE SET REPORTE.ESTATUS=ESTATUS WHERE REPORTE.IDREPORTE = XDIDREPORTE; 
END;//   


CREATE PROCEDURE sp_SOPORTE(IN IDR INT, IDING INT, ESTATI NVARCHAR(20), ESTAT NVARCHAR(20), SOL NVARCHAR(1024), FFINAL DATETIME, FCAMBIO DATETIME)
BEGIN
DECLARE XIDREPCAM INT;
SET XIDREPCAM = (SELECT IFNULL(MAX(IDREPORTECAMBIOS), 0)+1 FROM REPORTECAMBIOS);
UPDATE REPORTE SET ESTATUS = ESTAT, SOLUCION = SOL, FECHAF = FFINAL WHERE IDREPORTE = IDR;
INSERT INTO REPORTECAMBIOS VALUES(XIDREPCAM, IDING, IDR, FCAMBIO, ESTATI, ESTAT);
END;//

CREATE PROCEDURE sp_MANTENIMIENTO(IN IDR INT, IDING INT, ESTATI NVARCHAR(40), ESTAT NVARCHAR(40), SOL NVARCHAR(1024), FCAMBIO DATETIME)
BEGIN
DECLARE XIDREPCAM INT;
SET XIDREPCAM = (SELECT IFNULL(MAX(IDREPORTECAMBIOS), 0)+1 FROM REPORTECAMBIOS);
UPDATE REPORTE SET ESTATUS = ESTAT, SOLUCION = SOL WHERE IDREPORTE = IDR;
INSERT INTO REPORTECAMBIOS VALUES(XIDREPCAM, IDING, IDR, FCAMBIO, ESTATI, ESTAT);
END;//

CREATE PROCEDURE sp_GERENTEMANING(IN PROBLEMA NVARCHAR(1024), ESTATUS NVARCHAR(40), NOMENCARGADO NVARCHAR(40))
BEGIN
DECLARE XDIDENCARGADO INT;
DECLARE XDIDREPORTE INT;
SET XDIDENCARGADO=(SELECT IDUSUARIO FROM USUARIO WHERE USUARIO.NOMUSUARIO=NOMENCARGADO);
SET XDIDREPORTE=(SELECT IDREPORTE FROM REPORTE WHERE REPORTE.PROBLEMA=PROBLEMA);
INSERT INTO RELREPORTEENCARGADO(IDENCARGADO, IDREPORTE) VALUES (XDIDENCARGADO, XDIDREPORTE);
INSERT INTO REPORTECAMBIOS(IDUSUARIO, IDREPORTE, FECHACAMBIO, ESTATUSI, ESTATUSF) VALUES (4, XDIDREPORTE, NOW(), 'A MANTENIMIENTO', ESTATUS);
UPDATE REPORTE SET REPORTE.ESTATUS=ESTATUS WHERE REPORTE.IDREPORTE=XDIDREPORTE; 
END;//   

CREATE PROCEDURE sp_GERENTEMANSOP(IN PROBLEMA NVARCHAR(1024), ESTATUS NVARCHAR(40), SOLUCION NVARCHAR(1024), NOMENCARGADO NVARCHAR(40))
BEGIN
DECLARE XDIDENCARGADO INT;
DECLARE XDIDREPORTE INT;
SET XDIDENCARGADO=(SELECT IDUSUARIO FROM USUARIO WHERE USUARIO.NOMUSUARIO=NOMENCARGADO);
SET XDIDREPORTE=(SELECT IDREPORTE FROM REPORTE WHERE REPORTE.PROBLEMA=PROBLEMA);
INSERT INTO RELREPORTEENCARGADO(IDENCARGADO, IDREPORTE) VALUES (XDIDENCARGADO,XDIDREPORTE);
INSERT INTO REPORTECAMBIOS(IDUSUARIO, IDREPORTE, FECHACAMBIO, ESTATUSI, ESTATUSF) VALUES (4, XDIDREPORTE, NOW(), 'EN MANTENIMIENTO', ESTATUS);
UPDATE REPORTE SET REPORTE.ESTATUS=ESTATUS WHERE REPORTE.IDREPORTE=XDIDREPORTE; 
END;//

CREATE PROCEDURE sp_ASIS(IN NOMUSER VARCHAR(40), CORREOUSER VARCHAR(40), PROBLEMA VARCHAR(1024), ESTATUS VARCHAR(40))
BEGIN
DECLARE XIDPERSONA INT; 
DECLARE XIDUSUARIO INT;
DECLARE XIDENCARGADO INT;
INSERT INTO REPORTE (PROBLEMA, ESTATUS, SOLUCION, FECHAI, FECHAF) VALUES (PROBLEMA, ESTATUS, ' ', NOW(), ' ');
END;//

CREATE PROCEDURE sp_ADDREPORTE(IN PROB NVARCHAR(200), EST NVARCHAR(40), FI DATE, USUC NVARCHAR(200))
BEGIN
DECLARE XIDUSUARIO INT;
DECLARE XIDREO INT;
SET XIDUSUARIO = (SELECT IDUSUARIO FROM USUARIO WHERE CORREO = USUC);
SET XIDREO = (SELECT IFNULL(MAX(IDREPORTE), 0)+1 FROM REPORTE);
INSERT INTO REPORTE(IDREPORTE,PROBLEMA,ESTATUS,FECHAI) VALUES(XIDREO ,PROB, EST, FI);
INSERT INTO RELREPORTEUSUARIO(IDUSUARIO, IDREPORTE) VALUES(XIDUSUARIO, XIDREO);
END;//

delimiter ;

CALL sp_REGISTRO('AKAR', 'Super','Usuario', '2004-05-24','superusuario@akar.com','main.akar.admin','Super Usuario', 10);
CALL sp_VERCUENTA('superusuario@akar.com');
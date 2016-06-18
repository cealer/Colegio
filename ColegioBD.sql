CREATE DATABASE Colegio
use
Colegio

Create table TipoAmbiente(
Id char(8) primary key not null,
Descripcion nvarchar(50) not null,
Estado char(1) not null
)
CREATE TABLE Ambiente(
Id char(8) primary key not null,
IdTipoAmbiente char(8) foreign key references TipoAmbiente not null,
Descripcion nvarchar(50) not null,
Ubicacion nvarchar(50) not null,
Capacidad int not null,
Area decimal not null,
Condicion nvarchar(20) not null,
Estado char(1) not null
)

CREATE TABLE TipoPersona(
Id char(8) primary key not null,
Descripcion nvarchar(50) not null,
Estado char(1) not null
)

CREATE TABLE Persona(
Id char(8) primary key not null,
DNI char(8) unique not null, 
TipoPersona char(8) foreign key references TipoPersona not null,
Nombres nvarchar(30) not null,
ApellidoP nvarchar(30) not null,
ApellidoM nvarchar(30) not null,
FecNac Datetime not null,
EstadoCivil char(1) null,
Direccion nvarchar(50) not null,
Telefono nvarchar(9) null,
Celular nvarchar(9) null,
Estado  char(1) not null
)

CREATE TABLE Secciones(
Id char(8) primary key not null,
Descripcion nvarchar(20) not null,
Estado char(8) not null
)

CREATE TABLE Grado(
Id char(8) primary key not null,
Descripcion nvarchar(20) not null,
Estado char(8) not null
)

CREATE TABLE DetalleGrado(
Id char(8) primary key not null,
IdGrado char(8) foreign key references Grado not null,
IdSecciones char(8) foreign key references Secciones not null,
Estado char(8) not null
)

CREATE TABLE Situacion(
Id char(8) primary key not null,
Descripcion nvarchar(20) not null,
Estado char(8) not null
)

CREATE TABLE Matricula(
Id char(8) primary key not null,
IdEstudiante char(8) foreign key references Persona not null,
IdApoderado char(8) foreign key references Persona not null,
IdSituacion char(8) NOT Null,
IdGrado char(8) foreign key references Grado not null,
)

CREATE TABLE Curso (
Id char(8) primary key not null,
IdDocente char(8) foreign key references Persona not null,
Descripcion nvarchar(20) not null,
Estado char(8))

CREATE TABLE Evaluacion(
Id char(8) primary key not null,
Descripcion nvarchar(20) not null,
Fecha datetime not null,
Estado char(8)
)

CREATE TABLE Notas(
Id char(8) primary key not null,
IdEstudiante char(8) foreign key references Persona not null,
IdCurso char(8) foreign key references Persona not null,
IdEvaluacion char(8) foreign key references Evaluacion not null,
Nota decimal(3,1) not null,
Fecha datetime default getDate() not null
)
--TIPO AMBIENTE

--INSERT
CREATE PROCEDURE SPU_INSERTAR_TipoAmbiente
@Descripcion nvarchar(50)
AS
BEGIN
	BEGIN TRANSACTION TR_TipoAmbiente
	Declare @Mensaje nvarchar(30)
		BEGIN
			IF LEN(@Descripcion)=0
                    BEGIN
					SET @Mensaje='El descripcion no puede estar en blanco'
				END
				Declare @Id char(8)
				SET @Id = 'TA'+(SELECT RIGHT('000000'+LTRIM(STR(COUNT(*)+1)),6) FROM TipoAmbiente)
				INSERT INTO TipoAmbiente(Id,Descripcion,Estado) VALUES (@Id,@Descripcion,'1')
					IF @@ERROR<>0
						BEGIN
						SET @Mensaje='Error al registrar al TipoAmbiente'
						GOTO ERROR
					END
			OK:
			COMMIT TRANSACTION TR_TipoAmbiente
			SET @Mensaje='TipoAmbiente Registrado'
			PRINT(@Mensaje)
			GOTO FIN
		ERROR:
			ROLLBACK TRANSACTION TR_TipoAmbiente
			RAISERROR(@Mensaje,15,1)
			GOTO FIN
		FIN:
			END
END
GO
--UPDATE
CREATE PROCEDURE SPU_MODIFICAR_TipoAmbiente
@Id char(8), 
@Descripcion nvarchar(50), 
@Estado char(1) 
AS
UPDATE TipoAmbiente SET Id=@Id,Descripcion=@Descripcion,Estado=@Estado WHERE Id =@Id
GO



insert into TipoAmbiente values('TA000001','AULA DE CLASES','1')
select * from TipoAmbiente

CREATE TABLE Ambiente(
Id char(8) primary key not null,
IdTipoAmbiente char(8) foreign key references TipoAmbiente not null,
Descripcion nvarchar(50) not null,
Ubicacion nvarchar(50) not null,
Capacidad int not null,
Area decimal not null,
Condicion nvarchar(20) not null,
Estado char(1) not null
)
select * from Ambiente

CREATE PROCEDURE SPU_BUSCAR_TipoAmbiente
@TipoAmbienteDescripcion nvarchar (50) 
AS
Select TipoAmbiente.Id, TipoAmbiente.Descripcion, TipoAmbiente.Estado 
From TipoAmbiente 
WHERE TipoAmbiente.Descripcion like @TipoAmbienteDescripcion + '%' 
 AND TipoAmbiente.Estado='1' 
 GO

CREATE PROCEDURE SPU_TOP10_TipoAmbiente
AS
Select TOP 10 TipoAmbiente.Id, TipoAmbiente.Descripcion, TipoAmbiente.Estado 
From TipoAmbiente 
WHERE TipoAmbiente.Estado='1'
order by Id desc
GO

--AMBIENTE
CREATE PROCEDURE SPU_INSERTAR_Ambiente
@IdTipoAmbiente char(8), 
@Descripcion nvarchar(50), 
@Ubicacion nvarchar(50), 
@Capacidad int, 
@Area decimal, 
@Condicion nvarchar(20) 
AS
BEGIN
	BEGIN TRANSACTION TR_Ambiente
	Declare @Mensaje nvarchar(30)
		BEGIN
			IF LEN(@Descripcion)=0
                    BEGIN
					SET @Mensaje='El descripcion no puede estar en blanco'
				END
			IF LEN(@Ubicacion)=0
                    BEGIN
					SET @Mensaje='El ubicacion no puede estar en blanco'
				END
			IF @Area>0
                    BEGIN
					SET @Mensaje='El area no puede ser menor o igual que 0'
				END
			IF LEN(@Condicion)=0
                    BEGIN
					SET @Mensaje='El condicion no puede estar en blanco'
				END
				Declare @Id char(8)
				SET @Id = 'A'+(SELECT RIGHT('0000000'+LTRIM(STR(COUNT(*)+1)),7) FROM Ambiente)
				INSERT INTO Ambiente(Id,IdTipoAmbiente,Descripcion,Ubicacion,Capacidad,Area,Condicion,Estado) VALUES (@Id,@IdTipoAmbiente,@Descripcion,@Ubicacion,@Capacidad,@Area,@Condicion,'1')
					IF @@ERROR<>0
						BEGIN
						SET @Mensaje='Error al registrar al Ambiente'
						GOTO ERROR
					END
			OK:
			COMMIT TRANSACTION TR_Ambiente
			SET @Mensaje='Ambiente Registrado'
			PRINT(@Mensaje)
			GOTO FIN
		ERROR:
			ROLLBACK TRANSACTION TR_Ambiente
			RAISERROR(@Mensaje,15,1)
			GOTO FIN
		FIN:
			END
END
GO

CREATE PROCEDURE SPU_MODIFICAR_Ambiente
@Id char(8), 
@IdTipoAmbiente char(8), 
@Descripcion nvarchar(50), 
@Ubicacion nvarchar(50), 
@Capacidad int, 
@Area decimal, 
@Condicion nvarchar(20) 
AS
UPDATE Ambiente SET IdTipoAmbiente=@IdTipoAmbiente,Descripcion=@Descripcion,Ubicacion=@Ubicacion,Capacidad=@Capacidad,Area=@Area,Condicion=@Condicion WHERE Id =@Id
GO

CREATE PROCEDURE SPU_TOP10_Ambiente
AS
Select TOP 10 TipoAmbiente.Id, TipoAmbiente.Descripcion, TipoAmbiente.Estado 
From TipoAmbiente 
WHERE TipoAmbiente.Estado='1'
order by Id desc
GO

CREATE PROCEDURE SPU_TOP10_TipoAmbiente
AS
Select TOP 10 TipoAmbiente.Id, TipoAmbiente.Descripcion, TipoAmbiente.Estado 
From TipoAmbiente 
WHERE TipoAmbiente.Estado='1'
order by Id desc
GO


CREATE PROCEDURE SPU_BUSCAR_Ambiente
@AmbienteDescripcion nvarchar (50) 
AS
Select Ambiente.Id, Ambiente.IdTipoAmbiente, Ambiente.Descripcion, Ambiente.Ubicacion, Ambiente.Capacidad, Ambiente.Area, Ambiente.Condicion, Ambiente.Estado, TipoAmbiente.Descripcion 
From Ambiente INNER JOIN TipoAmbiente ON TipoAmbiente.Id = Ambiente.IdTipoAmbiente
WHERE Ambiente.Descripcion like @AmbienteDescripcion + '%'  AND Ambiente.Estado='1' 

--TIPO PERSONA
CREATE PROCEDURE SPU_INSERTAR_TipoPersona
@Descripcion nvarchar(50) 
AS
BEGIN
	BEGIN TRANSACTION TR_TipoPersona
	Declare @Mensaje nvarchar(30)
		BEGIN
			IF LEN(@Descripcion)=0
                    BEGIN
					SET @Mensaje='El descripcion no puede estar en blanco'
				END
				Declare @Id char(8)
				SET @Id = 'TP'+(SELECT RIGHT('000000'+LTRIM(STR(COUNT(*)+1)),6) FROM TipoPersona)
				INSERT INTO TipoPersona(Id,Descripcion,Estado) VALUES (@Id,@Descripcion,'1')
					IF @@ERROR<>0
						BEGIN
						SET @Mensaje='Error al registrar al TipoPersona'
						GOTO ERROR
					END
			OK:
			COMMIT TRANSACTION TR_TipoPersona
			SET @Mensaje='TipoPersona Registrado'
			PRINT(@Mensaje)
			GOTO FIN
		ERROR:
			ROLLBACK TRANSACTION TR_TipoPersona
			RAISERROR(@Mensaje,15,1)
			GOTO FIN
		FIN:
			END
END
GO

CREATE PROCEDURE SPU_MODIFICAR_TipoPersona
@Id char(8), 
@Descripcion nvarchar(50) 
AS
UPDATE TipoPersona SET Descripcion=@Descripcion WHERE Id =@Id
GO

--PERSONA
CREATE PROCEDURE SPU_INSERTAR_Persona
@DNI char(8), 
@TipoPersona char(8), 
@Nombres nvarchar(30), 
@ApellidoP nvarchar(30), 
@ApellidoM nvarchar(30), 
@FecNac datetime, 
@EstadoCivil char(1)= NULL,
@Direccion nvarchar(50), 
@Telefono nvarchar(9)= NULL,
@Celular nvarchar(9)= NULL
AS
BEGIN
	BEGIN TRANSACTION TR_Persona
	Declare @Mensaje nvarchar(30)
		BEGIN
			IF LEN(@Nombres)=0
                    BEGIN
					SET @Mensaje='El nombres no puede estar en blanco'
				END
			IF LEN(@ApellidoP)=0
                    BEGIN
					SET @Mensaje='El apellidop no puede estar en blanco'
				END
			IF LEN(@ApellidoM)=0
                    BEGIN
					SET @Mensaje='El apellidom no puede estar en blanco'
				END
			IF LEN(@Direccion)=0
                    BEGIN
					SET @Mensaje='El direccion no puede estar en blanco'
				END
			IF LEN(@Telefono)=0
                    BEGIN
					SET @Mensaje='El telefono no puede estar en blanco'
				END
			IF LEN(@Celular)=0
                    BEGIN
					SET @Mensaje='El celular no puede estar en blanco'
				END
				Declare @Id char(8)
				SET @Id = 'P'+(SELECT RIGHT('0000000'+LTRIM(STR(COUNT(*)+1)),7) FROM Persona)
				INSERT INTO Persona(Id,DNI,TipoPersona,Nombres,ApellidoP,ApellidoM,FecNac,EstadoCivil,Direccion,Telefono,Celular,Estado) VALUES (@Id,@DNI,@TipoPersona,@Nombres,@ApellidoP,@ApellidoM,@FecNac,@EstadoCivil,@Direccion,@Telefono,@Celular,'1')
					IF @@ERROR<>0
						BEGIN
						SET @Mensaje='Error al registrar al Persona'
						GOTO ERROR
					END
			OK:
			COMMIT TRANSACTION TR_Persona
			SET @Mensaje='Persona Registrado'
			PRINT(@Mensaje)
			GOTO FIN
		ERROR:
			ROLLBACK TRANSACTION TR_Persona
			RAISERROR(@Mensaje,15,1)
			GOTO FIN
		FIN:
			END
END
GO

CREATE PROCEDURE SPU_MODIFICAR_Persona
@Id char(8), 
@DNI char(8), 
@TipoPersona char(8), 
@Nombres nvarchar(30), 
@ApellidoP nvarchar(30), 
@ApellidoM nvarchar(30), 
@FecNac datetime, 
@EstadoCivil char(1)= NULL,
@Direccion nvarchar(50), 
@Telefono nvarchar(9)= NULL,
@Celular nvarchar(9)= NULL
AS
UPDATE Persona SET DNI=@DNI,TipoPersona=@TipoPersona,Nombres=@Nombres,ApellidoP=@ApellidoP,ApellidoM=@ApellidoM,FecNac=@FecNac,EstadoCivil=@EstadoCivil,Direccion=@Direccion,Telefono=@Telefono,Celular=@Celular WHERE Id =@Id
GO

CREATE PROCEDURE SPU_INSERTAR_Grado
@Descripcion nvarchar(20) 
AS
BEGIN
	BEGIN TRANSACTION TR_Grado
	Declare @Mensaje nvarchar(30)
		BEGIN
			IF LEN(@Descripcion)=0
                    BEGIN
					SET @Mensaje='El descripcion no puede estar en blanco'
				END
				Declare @Id char(8)
				SET @Id = 'G'+(SELECT RIGHT('0000000'+LTRIM(STR(COUNT(*)+1)),7) FROM Grado)
				INSERT INTO Grado(Id,Descripcion,Estado) VALUES (@Id,@Descripcion,'1')
					IF @@ERROR<>0
						BEGIN
						SET @Mensaje='Error al registrar al Grado'
						GOTO ERROR
					END
			OK:
			COMMIT TRANSACTION TR_Grado
			SET @Mensaje='Grado Registrado'
			PRINT(@Mensaje)
			GOTO FIN
		ERROR:
			ROLLBACK TRANSACTION TR_Grado
			RAISERROR(@Mensaje,15,1)
			GOTO FIN
		FIN:
			END
END
GO

CREATE PROCEDURE SPU_MODIFICAR_Grado
@Id char(8), 
@Descripcion nvarchar(20) 
AS
UPDATE Grado SET Descripcion=@Descripcion WHERE Id =@Id
GO

--SECCIONES
CREATE PROCEDURE SPU_INSERTAR_Secciones
@Descripcion nvarchar(20) 
AS
BEGIN
	BEGIN TRANSACTION TR_Secciones
	Declare @Mensaje nvarchar(30)
		BEGIN
			IF LEN(@Descripcion)=0
                    BEGIN
					SET @Mensaje='El descripcion no puede estar en blanco'
				END
				Declare @Id char(8)
				SET @Id = 'S'+(SELECT RIGHT('0000000'+LTRIM(STR(COUNT(*)+1)),7) FROM Secciones)
				INSERT INTO Secciones(Id,Descripcion,Estado) VALUES (@Id,@Descripcion,'1')
					IF @@ERROR<>0
						BEGIN
						SET @Mensaje='Error al registrar al Secciones'
						GOTO ERROR
					END
			OK:
			COMMIT TRANSACTION TR_Secciones
			SET @Mensaje='Secciones Registrado'
			PRINT(@Mensaje)
			GOTO FIN
		ERROR:
			ROLLBACK TRANSACTION TR_Secciones
			RAISERROR(@Mensaje,15,1)
			GOTO FIN
		FIN:
			END
END
GO

CREATE PROCEDURE SPU_MODIFICAR_Secciones
@Id char(8), 
@Descripcion nvarchar(20) 
AS
UPDATE Secciones SET Descripcion=@Descripcion WHERE Id =@Id
GO
--SITUCACION
CREATE PROCEDURE SPU_INSERTAR_Situacion
@Descripcion nvarchar(20) 
AS
BEGIN
	BEGIN TRANSACTION TR_Situacion
	Declare @Mensaje nvarchar(30)
		BEGIN
			IF LEN(@Descripcion)=0
                    BEGIN
					SET @Mensaje='El descripcion no puede estar en blanco'
				END
				Declare @Id char(8)
				SET @Id = 'S'+(SELECT RIGHT('0000000'+LTRIM(STR(COUNT(*)+1)),7) FROM Situacion)
				INSERT INTO Situacion(Id,Descripcion,Estado) VALUES (@Id,@Descripcion,'1')
					IF @@ERROR<>0
						BEGIN
						SET @Mensaje='Error al registrar al Situacion'
						GOTO ERROR
					END
			OK:
			COMMIT TRANSACTION TR_Situacion
			SET @Mensaje='Situacion Registrado'
			PRINT(@Mensaje)
			GOTO FIN
		ERROR:
			ROLLBACK TRANSACTION TR_Situacion
			RAISERROR(@Mensaje,15,1)
			GOTO FIN
		FIN:
			END
END
GO

CREATE PROCEDURE SPU_MODIFICAR_Situacion
@Id char(8), 
@Descripcion nvarchar(20) 
AS
UPDATE Situacion SET Descripcion=@Descripcion WHERE Id =@Id
GO
CREATE DATABASE Colegio
use
Colegio

Create table TipoAmbiente(
Id char(8) primary key not null,
Descripcion nvarchar(50) not null,
Estado char(1) not null
)
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
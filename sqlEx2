CREATE DATABASE SISTEMACURSOS
ON PRIMARY (
name =  'software_pri',
filename = 'C:\DATA\CORPORACION\SISTEMA\SISTEMA_CURSOS\sistema.mdf', 
size = 10MB, 
maxsize = 30MB, 
filegrowth= 10%
), 
 (
name = 'software_sec',
filename = 'C:\DATA\CORPORACION\SISTEMA\SISTEMA_CURSOS\sistema.ndf', 
size = 10MB, 
maxsize = 30MB, 
filegrowth= 10%
)
log on(
name = 'software_log',
filename= 'C:\DATA\CORPORACION\SISTEMA\SISTEMA_CURSOS\sistema.ldf', 
size = 7MB, 
maxsize = 20MB, 
filegrowth= 10%
)
GO



--USE SISTEMACURSOS
---------------------CREACIÓN DE  TABLAS

USE SISTEMACURSOS
CREATE TABLE ASIGNATURA (
---definir campos 
codasignatura varchar(6) not null,
asignatura varchar(40) not null,
CONSTRAINT PKasignatura PRIMARY KEY(codasignatura),
CONSTRAINT CKasig CHECK ( codasignatura LIKE 'ASG[0-9][0-9][0-9]')
)
go

USE SISTEMACURSOS
CREATE TABLE PROFESOR(
---definir campos 
codprofesor varchar(8) UNIQUE not null,
dni int not null,
nomProfe varchar(20) not null,
apelProfe varchar(50) not null,
dirProfe varchar(40) not null,
telProfe int not null,
codasignatura varchar(6) not null,
CONSTRAINT PKprofesor PRIMARY KEY (codprofesor),
CONSTRAINT FKasignatura FOREIGN KEY (codasignatura)
references ASIGNATURA 
ON DELETE CASCADE,
CONSTRAINT CKprofesor CHECK ( codprofesor LIKE 'PR[0-9][0-9][0-9][0-9][0-9][0-9]')
)
go

USE SISTEMACURSOS
CREATE TABLE CURSO(
codcurso int not null IDENTITY (100,1),
curso varchar(20) not null,
clase varchar(8) not null,
codprofesor varchar(8) UNIQUE not null,
CONSTRAINT PKcurso PRIMARY KEY (codcurso),
CONSTRAINT FKprofesor FOREIGN KEY (codprofesor)
references PROFESOR
ON DELETE CASCADE,
)
go


USE SISTEMACURSOS
CREATE TABLE ALUMNO (
codalumno varchar(5) UNIQUE not null,
nomAlum varchar(20) not null,
apelAlum varchar(40) not null,
dirAlum varchar(50) not null,
nombrePadre varchar(50) not null,
nombreMadre varchar(50)not null,
telAlum int  not null,
codcurso int not null,
fechanacimiento date not null,
CONSTRAINT PKalumno PRIMARY KEY (codalumno),
CONSTRAINT FKcurso FOREIGN KEY (codcurso) 
references CURSO,
CONSTRAINT CKalumno CHECK ( codalumno LIKE 'A[0-9][0-9][0-9][0-9]')
)
go

USE SISTEMACURSOS 
CREATE TABLE EXAMEN (
codexamen varchar (5) not null,
codalumno varchar(5) UNIQUE not null,
fecha date not null DEFAULT GETDATE(),
codasignatura varchar(6) not null,
codprofesor varchar(8) UNIQUE not null,
nota int not null, 
CONSTRAINT PKexamen PRIMARY KEY (codexamen),
CONSTRAINT FKalumno FOREIGN KEY (codalumno)
references ALUMNO,
CONSTRAINT FKasignaturas FOREIGN KEY (codasignatura)
references ASIGNATURA 
ON DELETE CASCADE,
CONSTRAINT FKprofesores FOREIGN KEY (codprofesor)
references PROFESOR, 
CONSTRAINT CKexamen CHECK (codexamen LIKE 'EX[0-9][0-9][0-9]')
)
go


-------EXPLICACION RESTRICCIONES 
--EN LA TABLA ASIGNATURA SE CONSIDERA EL CHECK PORQUE EL CODIGO DEBIA EMPEZAR CON
--ASG. EN LA TABLA PROFESOR SE CONSIDERA EL USO DE CHECK PARA QUE EL CODGIO
--DE LOS PROFESORES INICIEN CON PR. EN LA TABLA CURSO SE CONSIDERA
--EL USO DE ON DELETE PORQUE SI SE ELIMINA UNA TABLA, SE NECESITA QUE SE ELIMINEN LAS DEPENDIENTES 
--DE ELLA. ASIMISMO, TANTO ALUMNO COMO EXAMEN POSEEN UN CHECK PARA EL NOMBRE. TODO ELLO SE 
--REALIZA PARA QUE HAYA UNIFORMIDAD EN LOS CODIGOS.
--SE EMPLEÓ LA RESTRICCION UNIQUE PARA EL CODIGO DE ALUMNOS Y DOCENTES CON EL OBJETIVO DE QUE NO SE 
--REPITAN Y PUEDAN IDENTIFICARSE SIN PROBLEMA DE SUSTITUCION.







------------ÍNDICES 
---1
Create Index Idx_NomAlum
On ALUMNO (nomAlum)
go
--2
/*Crear un índice compuesto y único por codigo y nombre de las asignaturas*/
Create Unique Index Idx_codNomAsig
On ASIGNATURA (codasignatura, asignatura)
go
--3
/*Crear un índice compuesto y único por codigo y nombre de los cursos*/
Create Unique Index Idx_codNomCursos
On CURSO (codcurso, curso)
go

--4
/*Crear un índice compuesto y único por codigo y nombre de los cursos*/
Create Unique Index Idx_codNomAlum
On ALUMNO (codalumno, nomAlum)
go
--5
/*Crear un índice simple en la tabla Productos por nomProfe, incluyendo
los campo codcurso y codasignatura)*/
Create Index Idx_Profesor
On PROFESOR (nomProfe)
Include (dni, codasignatura)
go
--6
/*Crear un índice compuesto y único por */
Create Unique Index Idx_examAsig
On EXAMEN (codexamen, codasignatura)
go


---CONSULTA ESPECÍFICA 

SELECT NAME FROM SYSINDEXES
Where NAME like 'Idx_%'

---CONSULTA GENERAL 
SELECT NAME FROM SYSINDEXES


SELECT* FROM ASIGNATURA
SELECT* FROM PROFESOR 
SELECT * FROM CURSO 
SELECT * FROM ALUMNO
SELECT * FROM EXAMEN 


INSERT INTO [dbo].[ASIGNATURA] 
VALUES 
('ASG001', 'Lenguaje'),
('ASG002', 'Geografía'),
('ASG003','Algebra'),
('ASG004','Biología')

INSERT INTO [dbo].[PROFESOR]
VALUES 
('PR000100', 45772321, 'Luisa Maria', 'Soto Marin', 'Av. Girasoles 890 Los Olivos', 6754234,'ASG003'),
('PR000101', 23456732, 'Pedro', 'Luca Lara', 'Av. Textiles 120 Comas', 2354234,'ASG002'),
('PR000102', 34567281, 'Irma', 'Paredes Mendoza', 'Av. Jazmines 110 Los Olivos', 5454234,'ASG001'),
('PR000103', 23456732, 'Sonia', 'Zapato Lara', 'Av. Constructores 20 Los Olivos', 7654234,'ASG004')

INSERT INTO [dbo].[CURSO]
VALUES 
('Matematica', 'Clase1', 'PR000100'),
('Sociales', 'Clase1', 'PR000101'),
('Comunicacion', 'Clase1', 'PR000102'),
('Ciencias', 'Clase1', 'PR000103')


INSERT INTO [dbo].[ALUMNO]
VALUES 
('A0001', 'Merlina', 'Perez',  'Av. Las Palmas', 'Juan Perez', 'Luisa Alegria', 2345632, 100, '2002-04-04'),
('A0002', 'Esperanza', 'Otero', 'Av. Paz', 'José Otero', 'Renata Alegria', 7865743, 101, '2002-05-05'),
('A0003', 'Diego', 'Salvador',  'Av. Las Lomas', 'Kevin Salvador', 'Juana Lara', 7865432, 102, '2002-10-05'),
('A0004', 'Piero', 'Romero',  'Av. Las Orquideas', 'Elmer Romero', 'Luisa Mayra',4345632, 103,  '2002-11-06')

INSERT INTO [dbo].[EXAMEN]
VALUES 
('EX001', 'A0001', getdate(),  'ASG003', 'PR000100', 19 ),
('EX101', 'A0002', getdate(),  'ASG002', 'PR000101', 18 ),
('EX201', 'A0003', getdate(),  'ASG001', 'PR000102', 20 ),
('EX301', 'A0004', getdate(),  'ASG004', 'PR000103', 20 )


--------------------------Uso DML (insert, delete, update, select) 

---DELETE 

USE SISTEMACURSOS 
GO 

--Eliminar el examen cuyo código es EX001
Delete From EXAMEN
Where codexamen='EX001'
go


--UPDATE

--Actualizar los datos del alumno Dieguito
USE SISTEMACURSOS 
Update ALUMNO
Set			telAlum		= 987654321,
			dirAlum		= 'Calle Los Sauces 234, El Agustino'
Where codalumno = 'A0003'
go

----SELECT 
SELECT *
FROM CURSO
ORDER BY codcurso DESC
GO

----INSERT

--Insertar datos a la tabla examen
Insert EXAMEN
(codexamen, codalumno, fecha, codasignatura, codprofesor, nota)
Values
('EX002', 'A0001', getdate(), 'ASG003', 'PR000100', 20)
go

-----------Consulta de tablas creadas
select * from INFORMATION_SCHEMA.COLUMNS 

------Use cláusula where en las consultas para los casos donde lo determine y explique por qué razón lo usa.


-- RAZON: Se necesita conocer todos los datos de los estudiantes, así como datos sobre los atributos

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'ALUMNO'



-- RAZON: Se desea saber cuántos y cuáles son los alumnos
--que han obtenido la máxima calificación

SELECT codexamen, codalumno
FROM EXAMEN
WHERE nota = 20; 

--RAZON: Se necesita saber los nombres y telefonos de los docentes de Lenguaje
--para llamarlos por cualquier eventualidad como entrega de materiales
SELECT nomProfe, telProfe
FROM PROFESOR
WHERE codasignatura = 'ASG001'

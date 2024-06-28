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
--CREATE TABLE ASIGNATURA

USE SISTEMACURSOS
CREATE TABLE ASIGNATURA (
---definir campos 
codasignatura int not null,
asignatura varchar(30) not null,
CONSTRAINT PKasignatura PRIMARY KEY(codasignatura)
)
go

USE SISTEMACURSOS
CREATE TABLE PROFESOR(
---definir campos 
codprofesor varchar(10) not null,
dni int not null,
nombre varchar(20) not null,
apellidos varchar(50) not null,
direccion varchar(40) not null,
telefono int not null,
codasignatura int not null,
CONSTRAINT PKprofesor PRIMARY KEY (codprofesor),
CONSTRAINT FKasignatura FOREIGN KEY (codasignatura)
references ASIGNATURA
)
go

USE SISTEMACURSOS
CREATE TABLE CURSO(
codcurso varchar(5) not null,
curso varchar(20) not null,
clase varchar(30) not null,
codprofesor varchar(10) not null,
CONSTRAINT PKcurso PRIMARY KEY (codcurso),
CONSTRAINT FKprofesor FOREIGN KEY (codprofesor)
references PROFESOR
)
go


USE SISTEMACURSOS
CREATE TABLE ALUMNO (
codalumno varchar(8) not null,
nombre varchar(20) not null,
apellidos varchar(40) not null,
direccion varchar(50) not null,
nombrePadre varchar(50) not null,
nombreMadre varchar(50)not null,
telefono int  not null,
codcurso varchar(5) not null,
fechanacimiento varchar(30) not null,
CONSTRAINT PKalumno PRIMARY KEY (codalumno),
CONSTRAINT FKcurso FOREIGN KEY (codcurso) 
references CURSO
)

USE SISTEMACURSOS 
CREATE TABLE EXAMEN (
codexamen varchar(10) not null,
codalumno varchar(8) not null,
fecha date not null,
codasignatura int not null,
codprofesor varchar(10) not null,
nota int not null, 
CONSTRAINT PKexamen PRIMARY KEY (codexamen),
CONSTRAINT FKalumno FOREIGN KEY (codalumno)
references ALUMNO,
CONSTRAINT FKasignaturas FOREIGN KEY (codasignatura)
references ASIGNATURA,
CONSTRAINT FKprofesor FOREIGN KEY (codprofesor)
references PROFESOR
)


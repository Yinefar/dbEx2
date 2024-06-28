DROP DATABASE IF EXISTS Zeus_express;
-- CREACION DE LA DATABASE
CREATE DATABASE COMPUTERSAC
ON PRIMARY (-
name =  'software_pri',
filename = 'C:\HARDWARE\PC\computersac.mdf', 
size = 10MB, 
maxsize = 30MB, 
filegrowth= 10%
), 
 (
name = 'software_sec',
filename = 'C:\HARDWARE\PC\computersac.ndf', 
size = 10MB, 
maxsize = 30MB, 
filegrowth= 10%
)
log on(
name = 'software_log',
filename= 'C:\HARDWARE\PC\computersac.ldf', 
size = 7MB, 
maxsize = 20MB, 
filegrowth= 10%
)

log on(
name = 'software_log_2',
filename= 'C:\HARDWARE\PC\computersac_2.ldf', 
size = 7MB, 
maxsize = 20MB, 
filegrowth= 10%
)
GO
---------------------------------------------

USE COMPUTERSAC
CREATE TABLE MAINBOARD 
(IdPlaca int, 
descripcion varchar(40),
cantidad  int)

CREATE TABLE FUENTE 
(IdFuente int,
descripcionF varchar(40),
cantidadF int)

CREATE TABLE CASES
(IdCase int, 
descripcionC varchar(50),
cantidad int)

CREATE TABLE TECLADO
(IdTec int, 
descripcion varchar(70),
cantidad int)

CREATE TABLE TVVIDEO 
(IdVideo int, 
descripcion varchar(80), 
cantidad int)

CREATE TABLE ENSAMBLADO
(IdPlaca int, 
IdDisco int, 
idCore int, 
idFuente int, 
idCase int, 
idLed int,
idVideo int, 
idProveedor int, 
idTec int,
descripcion varchar(40),
fecha date)

CREATE TABLE HARDDISK
(IdDisco int, 
descripcion varchar(50),
cantidad int)

CREATE TABLE PROCESADOR
(IdCore int,
descripcion varchar(50),
cantidad int)

CREATE TABLE MONITORES
(IdLed int, 
descripcion varchar(50),
cantidad int)

CREATE TABLE MOUSE
(IdMouse int, 
descripcion varchar(40),
cantidad int)


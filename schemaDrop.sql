/*
	Universidad Simón Bolívar
	Laboratorio de Bases de Datos (CI3391)
	Trimestre: Enero - Marzo 2016

	Profesores:			- Darwin Rocha
						- José Tomás Cadenas
	
	Segundo proyecto:	Traducción del Modelo ER-ERE a Relacional
						e implementaciones de la relaciones en SQL.

	Integrantes:		- Guillermo Betancourt, carnet 11-10103
						- Gabriel Giménez, carnet 12-11006
	
	Descripción:

		En el presente script schemaDrop.sql se eliminan todas las
		tablas creadas por al correr el script schemaCreate.sql y
		las restricciones creadas en cada tabla al correr el script
		schemaConstraints.sql. 
 */

DROP TABLE ASIGNATURA CASCADE;
DROP TABLE PLAN_ESTUDIO CASCADE;
DROP TABLE TRIMESTRE CASCADE;
DROP TABLE OFERTA CASCADE;
DROP TABLE teoria CASCADE;
DROP TABLE laboratorio CASCADE;
DROP TABLE practica CASCADE;
DROP TABLE PREOFERTA CASCADE;
DROP TABLE PD CASCADE;
DROP TABLE nombres CASCADE;
DROP TABLE apellidos CASCADE;
DROP TABLE telefonos CASCADE;
DROP TABLE emails CASCADE;
DROP TABLE ESTUDIANTE CASCADE;
DROP TABLE EXTERNO CASCADE;
DROP TABLE AD CASCADE;
DROP TABLE credenciales CASCADE;
DROP TABLE PROFESOR CASCADE;
DROP TABLE TITULO CASCADE;
DROP TABLE DEPARTAMENTO CASCADE;
DROP TABLE CONTRATO CASCADE;
DROP TABLE PREPARADOR CASCADE;
DROP TABLE AYUDANTE CASCADE;
DROP TABLE supervision CASCADE;
DROP TABLE CPROFESOR CASCADE;
DROP TABLE PE CASCADE;
DROP TABLE PC CASCADE;
DROP TABLE SP CASCADE;
DROP TABLE SECCION CASCADE;
DROP TABLE teoriaSECCION CASCADE;
DROP TABLE laboratorioSECCION CASCADE;
DROP TABLE practicaSECCION CASCADE;
DROP TABLE JUSTIFICACION CASCADE;
DROP TABLE Requisito CASCADE;
DROP TABLE Correquisito CASCADE;
DROP TABLE Ha_cursado CASCADE;
DROP TABLE Coordina CASCADE;
DROP TABLE Posee CASCADE;
DROP TABLE Prefiere CASCADE;
DROP TABLE Dicta CASCADE;
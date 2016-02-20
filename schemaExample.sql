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

		En el presente script schemaExample.sql es un conjunto de
		valores cargados a las tablas creadas al correr el script
		schemaCreate.sql con las restricciones impuestas al correr
		el script schemaConstraints.sql. Estas inserciones no son
		una prueba exhaustiva de cada una de las tablas, sólo se
		utilizan para verificar si algunas restricciones impuestas
		se están respetando. Se añade este script como un pequeño
		ejemplo para probar las tablas.
 */

insert into preoferta values (default, 100);

insert into departamento values (default);
insert into departamento values (default);
insert into departamento values (default);
insert into departamento values (default);
insert into departamento values (default);

insert into asignatura values ('ci2511', false, NULL, 'Pregrado', 'Obligatoria', 4, 6, 2, 0, 1, 1);
insert into asignatura values ('ci2525', false, NULL, 'Pregrado', 'Electiva', 4, 6, 2, 0, 1, 1); /* Falla inserción, se debe especificar alguna categoría cuando obligatoriedad = 'Electiva' */
insert into asignatura values ('ci3911', false, 'Area', 'Pregrado', 'Electiva', 4, 6, 2, 0, 1, 1);

select * from asignatura;

insert into preoferta values (default, 200);

insert into oferta values (default, default, 'Tentativa', 256, 'A', false);

insert into pd values (29442658);
insert into pd values (12345);
insert into pd values (-12); /* Falla, clave primaria inválida */

insert into contrato values (29442658, default, 'Preparador', 'Trimestral', '2016-02-18');
insert into contrato values (12345, default, 'Preparador', 'Trimestral', '2016-02-18');
insert into contrato values (-7, default, 'Preparador', 'Trimestral', '2016-02-18'); /* Falla, clave primaria inválida y clave foránea no existe en la tabla a la que hace referencia */
insert into contrato values (12, default, 'Servicios profesionales', 'Trimestral', '2016-02-18'); /* Falla, clave foránea no existe en la tabla a la que hace referencia */

insert into preparador values (29442658, default, 'Actividad de apoyo');
insert into preparador values (12345, default, 'Actividad docente');

insert into trimestre values ('Enero-Marzo', '2015');
insert into trimestre values ('Enero-Marzo', '2016');
insert into trimestre values ('Enero-Marzo', '2017');
insert into trimestre values ('Enero-Marzo', '2018');

insert into nombres values (29442658, 'Guillermo');
insert into nombres values (12345, 'Gabriel');

insert into estudiante values (29442658, 1013143, NULL, NULL, NULL, 'Pregrado', false);
insert into estudiante values (12345, 1013143, NULL, NULL, NULL, 'Pregrado', false);
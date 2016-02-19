insert into preoferta values (default, 100);
insert into departamento values (default);
insert into departamento values (default);
insert into departamento values (default);
insert into departamento values (default);
insert into departamento values (default);
insert into asignatura values ('ci2511', false, NULL, 'Pregrado', 'Obligatoria', 4, 6, 2, 0, 1, 1);
insert into asignatura values ('ci2525', false, NULL, 'Pregrado', 'Electiva', 4, 6, 2, 0, 1, 1); /* FAILS, NO MEET CONSTRAINT */
insert into asignatura values ('ci3911', false, 'Area', 'Pregrado', 'Electiva', 4, 6, 2, 0, 1, 1);
select * from asignatura;
insert into preoferta values (default, 200);
insert into oferta values (default, default, 'Tentativa', 256, 'A', false);

insert into pd values (24492586);
insert into pd values (12345);
insert into pd values (-12); /* FAILS, INVALID PK */
insert into contrato values (24492586, default, 'Preparador', 'Trimestral', '2016-02-18');
insert into contrato values (12345, default, 'Preparador', 'Trimestral', '2016-02-18');
insert into contrato values (-7, default, 'Preparador', 'Trimestral', '2016-02-18'); /* FAILS, INVALID PK AND NO FK IN PD */
insert into contrato values (12, default, 'Servicios profesionales', 'Trimestral', '2016-02-18'); /* FAILS, NO FK IN PD */

insert into preparador values (24492586, default, 'Actividad de apoyo');
insert into preparador values (12345, default, 'Actividad docente');
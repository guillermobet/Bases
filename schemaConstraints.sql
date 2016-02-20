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

		En el presente script schemaConstraints.sql se agregan las
		restricciones de dominio, de clave foránea y de validez de
		los atributos de las tablas creadas al correr el script
		schemaCreate.sql. 
 */

ALTER TABLE ASIGNATURA
ADD CONSTRAINT FK_ASIGNATURA_PREOFERTA FOREIGN KEY(id_preoferta) REFERENCES PREOFERTA(id_preoferta),
ADD CONSTRAINT FK_ASIGNATURA_DEPARTAMENTO FOREIGN KEY(id_dep) REFERENCES DEPARTAMENTO(id_dep),
ADD CONSTRAINT DOM_OBLIGATORIEDAD CHECK (obligatoriedad IN ('Obligatoria', 'Electiva')),
ADD CONSTRAINT DOM_CATEGORIA CHECK (categoria IN ('Libre', 'Area', NULL)),
ADD CONSTRAINT DOM_OBLIGATORIEDAD_CATEGORIA CHECK ((obligatoriedad = 'Obligatoria' AND categoria IS NULL)
													OR (obligatoriedad = 'Electiva' AND categoria IS NOT NULL)),
ADD CONSTRAINT DOM_GRADO CHECK (grado IN ('Pregrado', 'Postgrado')),
ADD CONSTRAINT DOM_H_TEORIA	CHECK (h_teoria >= 0),
ADD CONSTRAINT DOM_H_PRACTICA CHECK (h_practica >= 0),
ADD CONSTRAINT DOM_H_LABORATORIO CHECK (h_lab >= 0),
ADD CONSTRAINT DOM_ID_PREOFERTA	CHECK (id_preoferta > 0),
ADD CONSTRAINT DOM_ID_DEP CHECK (id_dep > 0);

ALTER TABLE PLAN_ESTUDIO
ADD CONSTRAINT D0M_ID_PLAN CHECK (id_plan > 0);

ALTER TABLE TRIMESTRE
ADD CONSTRAINT DOM_MESES CHECK (meses IN ('Septiembre-Diciembre', 'Enero-Marzo', 'Abril-Julio', 'Intensivo')),
ADD CONSTRAINT DOM_ANIO CHECK (anio > 0);

ALTER TABLE OFERTA
ADD CONSTRAINT FK_OFERTA FOREIGN KEY(id_preoferta) REFERENCES PREOFERTA(id_preoferta),
ADD CONSTRAINT DOM_OFERTA CHECK (id_oferta > 0),
ADD CONSTRAINT DOM_MAX_EST CHECK (max_est > 0),
ADD CONSTRAINT DOM_ESTATUS CHECK (estatus IN ('Definitiva', 'Tentativa'));

	ALTER TABLE teoria
	ADD CONSTRAINT FK_teoria FOREIGN KEY(id_oferta) REFERENCES OFERTA(id_oferta);

	ALTER TABLE laboratorio
	ADD CONSTRAINT FK_laboratorio FOREIGN KEY(id_oferta) REFERENCES OFERTA(id_oferta);

	ALTER TABLE practica
	ADD CONSTRAINT FK_practica FOREIGN KEY(id_oferta) REFERENCES OFERTA(id_oferta);

ALTER TABLE PREOFERTA
ADD CONSTRAINT DOM_ID_PREOFERTA CHECK (id_preoferta > 0),
ADD CONSTRAINT DOM_DEM_EST CHECK (dem_est > 0);

ALTER TABLE PD
ADD CONSTRAINT DOM_CEDULA CHECK (cedula > 0);

	ALTER TABLE nombres
	ADD CONSTRAINT FK_nombres FOREIGN KEY(cedula) REFERENCES PD(cedula);

	ALTER TABLE apellidos 
	ADD	CONSTRAINT FK_apellidos FOREIGN KEY(cedula) REFERENCES PD(cedula);

	ALTER TABLE telefonos 
	ADD	CONSTRAINT FK_telefonos FOREIGN KEY(cedula) REFERENCES PD(cedula);

	ALTER TABLE emails 
	ADD	CONSTRAINT FK_emails FOREIGN KEY(cedula) REFERENCES PD(cedula);

ALTER TABLE ESTUDIANTE 
ADD CONSTRAINT FK_ESTUDIANTE FOREIGN KEY(cedula) REFERENCES PD(cedula),
ADD CONSTRAINT DOM_CEDULA CHECK (cedula > 0),
ADD CONSTRAINT DOM_ULT_TRIM_INSC_MESES CHECK (ult_trim_insc_meses IN ('Septiembre-Diciembre', 'Enero-Marzo', 'Abril-Julio', 'Intensivo', NULL)),
ADD CONSTRAINT DOM_GRADO CHECK (grado IN ('Pregrado', 'Postgrado')),
ADD CONSTRAINT DOM_ULT_TRIM_INSC_MESES_ANIO CHECK ((ult_trim_insc_meses IS NULL AND ult_trim_insc_anio IS NULL AND indice IS NULL)
													OR (ult_trim_insc_meses IS NOT NULL AND ult_trim_insc_anio > 0 AND (indice >= 1.0 and indice <= 5.0))),
ADD CONSTRAINT UNIQUE_CARNET UNIQUE(carnet);

ALTER TABLE EXTERNO 
ADD CONSTRAINT FK_EXTERNO FOREIGN KEY(cedula) REFERENCES PD(cedula);

ALTER TABLE AD 
ADD CONSTRAINT FK_AD FOREIGN KEY(cedula) REFERENCES PD(cedula);

	ALTER TABLE credenciales
	ADD CONSTRAINT FK_credenciales FOREIGN KEY(cedula) REFERENCES AD(cedula);

ALTER TABLE PROFESOR
ADD CONSTRAINT FK_PROFESOR_PD FOREIGN KEY(cedula) REFERENCES PD(cedula),
ADD CONSTRAINT FK_PROFESOR_DEPARTAMENTO FOREIGN KEY(id_dep) REFERENCES DEPARTAMENTO(id_dep);

ALTER TABLE TITULO
ADD CONSTRAINT DOM_ID_TITULO CHECK (id_titulo > 0),
ADD CONSTRAINT DOM_NIVEL CHECK (nivel IN ('Ingenieria', 'Licenciatura', 'Especializacion', 'Mestria', 'Doctorado'));

ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT DOM_ID_DEP CHECK (id_dep > 0);

ALTER TABLE CONTRATO
ADD CONSTRAINT FK_CONTRATO FOREIGN KEY(cedula) REFERENCES PD(cedula),
ADD CONSTRAINT DOM_ID_CONTRATO CHECK (id_contrato > 0),
ADD CONSTRAINT DOM_DURACION CHECK (duracion IN ('Trimestral', 'Anual', 'De por vida')),
ADD CONSTRAINT DOM_TITULO CHECK (titulo IN ('Preparador', 'Ayudante academico', 'Profesor contratado', 'Profesor de escalafon', 'Servicios profesionales')),
ADD CONSTRAINT DOM_TITULO_DURACION CHECK ((titulo = 'Preparador' AND duracion = 'Trimestral')
											OR (titulo = 'Ayudante academico' AND duracion = 'Anual')
											OR (titulo = 'Profesor contratado' AND duracion = 'Anual')
											OR (titulo = 'Profesor de escalafon' AND duracion = 'De por vida')
											OR (titulo = 'Servicios profesionales' AND duracion = 'Trimestral'));

ALTER TABLE PREPARADOR
ADD CONSTRAINT FK_PREPARADOR FOREIGN KEY(cedula, id_contrato) REFERENCES CONTRATO(cedula, id_contrato),
ADD CONSTRAINT DOM_TIPO CHECK (tipo IN ('Actividad de apoyo', 'Actividad docente'));

ALTER TABLE AYUDANTE
ADD CONSTRAINT FK_AYUDANTE FOREIGN KEY(cedula, id_contrato) REFERENCES CONTRATO(cedula, id_contrato);

	ALTER TABLE supervision
	ADD CONSTRAINT FK_supervision FOREIGN KEY(cedula, id_contrato) REFERENCES AYUDANTE(cedula, id_contrato);

ALTER TABLE CPROFESOR 
ADD CONSTRAINT FK_CPROFESOR FOREIGN KEY(cedula, id_contrato) REFERENCES CONTRATO(cedula, id_contrato),
ADD CONSTRAINT DOM_TIPO CHECK (tipo IN ('Dedicacióo integral', 'Dedicacion exclusiva', 'Dedicacion convencional')),
ADD CONSTRAINT DOM_TIPO_HORAS CHECK ((tipo = 'Dedicacion convencional' AND (horas = 4 OR horas = 6 OR horas = 8 OR horas = 12))
										OR ((tipo = 'Dedicacion exclusiva' OR tipo = 'Dedicacion integral') AND horas > 0 AND horas < 11));

ALTER TABLE PE 
ADD CONSTRAINT FK_PE FOREIGN KEY(cedula, id_contrato) REFERENCES CPROFESOR(cedula, id_contrato),
ADD CONSTRAINT DOM_CATEGORIA CHECK (categoria IN ('Asistente', 'Agregado', 'Asociado', 'Titular'));

ALTER TABLE PC 
ADD CONSTRAINT FK_PC FOREIGN KEY(cedula, id_contrato) REFERENCES CPROFESOR(cedula, id_contrato),
ADD CONSTRAINT DOM_NIVEL CHECK (nivel IN ('I', 'II', 'III', 'IV', 'V'));

ALTER TABLE SP 
ADD CONSTRAINT FK_SP FOREIGN KEY(cedula, id_contrato) REFERENCES CONTRATO(cedula, id_contrato),
ADD CONSTRAINT DOM_NIVEL CHECK (nivel IN ('I', 'II', 'III', 'IV', 'V', NULL)),
ADD CONSTRAINT DOM_HORAS CHECK (horas > 0),
ADD CONSTRAINT DOM_AUXILIAR_NIVEL CHECK ((auxiliar = false AND nivel IS NOT NULL) OR (auxiliar = true AND nivel IS NULL));

ALTER TABLE SECCION 
ADD CONSTRAINT FK_SECCION_ASIGNATURA FOREIGN KEY(codigo) REFERENCES ASIGNATURA(codigo),
ADD CONSTRAINT FK_SECCION_TRIMESTRE FOREIGN KEY(meses, anio) REFERENCES TRIMESTRE(meses, anio),
ADD CONSTRAINT DOM_NUMERO_NRO_EST_EST_APROB CHECK (numero > 0 AND nro_estudiantes > 0 AND (est_aprobados IS NULL OR est_aprobados >= 0));

	ALTER TABLE teoriaSECCION 
	ADD CONSTRAINT FK_teoriaSECCION FOREIGN KEY(codigo, meses, anio, numero) REFERENCES SECCION(codigo, meses, anio, numero);

	ALTER TABLE laboratorioSECCION 
	ADD CONSTRAINT FK_laboratorioSECCION FOREIGN KEY(codigo, meses, anio, numero) REFERENCES SECCION(codigo, meses, anio, numero);

	ALTER TABLE practicaSECCION
	ADD CONSTRAINT FK_practicaSECCION_SECCION FOREIGN KEY(codigo, meses, anio, numero) REFERENCES SECCION(codigo, meses, anio, numero);

ALTER TABLE JUSTIFICACION 
ADD CONSTRAINT FK_JUSTIFICACION FOREIGN KEY(cedula) REFERENCES PD(cedula),
ADD CONSTRAINT DOM_ID_JUSTIFICACION CHECK (id_justificacion > 0),
ADD CONSTRAINT DOM_TIPO CHECK (tipo IN ('Permiso', 'Apoyo para estudios de postgrado', 'Ejercicio de cargo directivo')),
ADD CONSTRAINT DOM_TIPO_FECHAS_RENOVACION CHECK ((tipo = 'Permiso' AND fecha <= fecha_inicio AND fecha_inicio < fecha_fin AND nro_renovacion > 0)
										OR ((tipo = 'Apoyo para estudios de postgrado' OR tipo = 'Ejercicio de cargo directivo')
											AND fecha_inicio IS NULL AND fecha_fin IS NULL and nro_renovacion IS NULL));

ALTER TABLE Requisito
ADD CONSTRAINT FK_ASIGNATURA_ACT FOREIGN KEY(codigo) REFERENCES ASIGNATURA(codigo),
ADD CONSTRAINT FK_ASIGNATURA_REQ FOREIGN KEY(codigo) REFERENCES ASIGNATURA(codigo),
ADD CONSTRAINT FK_PLAN_ESTUDIOS FOREIGN KEY(id_plan) REFERENCES PLAN_ESTUDIO(id_plan);

ALTER TABLE Correquisito
ADD CONSTRAINT FK_ASIGNATURA_ACT FOREIGN KEY(codigo) REFERENCES ASIGNATURA(codigo),
ADD CONSTRAINT FK_ASIGNATURA_REQ FOREIGN KEY(codigo) REFERENCES ASIGNATURA(codigo),
ADD CONSTRAINT FK_PLAN_ESTUDIOS FOREIGN KEY(id_plan) REFERENCES PLAN_ESTUDIO(id_plan);

ALTER TABLE Ha_cursado
ADD CONSTRAINT FK_ASIGNATURA FOREIGN KEY(codigo) REFERENCES ASIGNATURA(codigo),
ADD CONSTRAINT FK_ESTUDIANTE FOREIGN KEY(cedula, carnet) REFERENCES ESTUDIANTE(cedula,carnet);

ALTER TABLE Coordina
ADD CONSTRAINT FK_PD FOREIGN KEY(cedula) REFERENCES PD(cedula),
ADD CONSTRAINT FK_TRIMESTRE FOREIGN KEY(meses,anio) REFERENCES TRIMESTRE(meses, anio),
ADD CONSTRAINT FK_ASIGNATURA FOREIGN KEY(codigo) REFERENCES ASIGNATURA(codigo);

ALTER TABLE Posee
ADD CONSTRAINT FK_PROFESOR FOREIGN KEY(cedula, id_dep) REFERENCES PROFESOR(cedula, id_dep),
ADD CONSTRAINT FK_TITULO FOREIGN KEY(id_titulo) REFERENCES TITULO(id_titulo);

ALTER TABLE Prefiere
ADD CONSTRAINT FK_PD FOREIGN KEY(cedula) REFERENCES PD(cedula),
ADD CONSTRAINT FK_OFERTA FOREIGN KEY(id_oferta) REFERENCES OFERTA(id_oferta);

ALTER TABLE Dicta
ADD CONSTRAINT FK_PD FOREIGN KEY(cedula) REFERENCES PD(cedula),
ADD CONSTRAINT FK_SECCION FOREIGN KEY(codigo, meses, anio, numero) REFERENCES SECCION(codigo, meses, anio, numero);
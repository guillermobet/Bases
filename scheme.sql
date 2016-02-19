/* Entidades a Relacional */

CREATE TABLE ASIGNATURA (
	codigo				VARCHAR(6)		NOT NULL,
	es_cadena			BOOLEAN			NOT NULL,
	categoria			VARCHAR(5)			NULL,
	grado				VARCHAR(10)		NOT NULL,
	obligatoriedad		VARCHAR(11)		NOT NULL,
	unidad_creditos		NUMERIC(1)		NOT NULL,
	h_teoria			NUMERIC(2)  	NOT NULL,
	h_practica			NUMERIC(2)  	NOT NULL,
	h_lab				NUMERIC(2)  	NOT NULL,
	id_preoferta		SERIAL			NOT NULL,
	id_dep				SERIAL			NOT NULL,
	CONSTRAINT PK_ASIGNATURA PRIMARY KEY(codigo)
);
	
CREATE TABLE PLAN_ESTUDIO (
	id_plan				SERIAL			NOT NULL,
	CONSTRAINT PK_PLAN_ESTUDIO PRIMARY KEY(id_plan)
);

CREATE TABLE TRIMESTRE (
	meses				VARCHAR(20)		NOT NULL,
	anio				NUMERIC(4)		NOT NULL,
	CONSTRAINT PK_TRIMESTRE PRIMARY KEY(meses, anio)
 
);

CREATE TABLE OFERTA (
	id_oferta			SERIAL			NOT NULL,
	id_preoferta		SERIAL			NOT NULL,
	estatus				VARCHAR(10)		NOT NULL,
	max_est				INT				NOT NULL,
	literal				CHAR(1)			NOT NULL,
	req_reserva			BOOLEAN			NOT NULL,
	CONSTRAINT PK_OFERTA PRIMARY KEY(id_oferta)
);

	CREATE TABLE teoria (
		id_oferta		SERIAL			NOT NULL,
		horario			VARCHAR(5)		NOT NULL,
		CONSTRAINT PK_teoria PRIMARY KEY(id_oferta, horario)
	);

	CREATE TABLE laboratorio (
		id_oferta		SERIAL			NOT NULL,
		horario			VARCHAR(5)		NOT NULL,
		CONSTRAINT PK_laboratorio PRIMARY KEY(id_oferta, horario)
	);
	
	CREATE TABLE practica (
		id_oferta		SERIAL			NOT NULL,
		horario			VARCHAR(5)		NOT NULL,
		CONSTRAINT PK_practica PRIMARY KEY(id_oferta, horario)
	);

CREATE TABLE PREOFERTA (
	id_preoferta		SERIAL			NOT NULL,
	dem_est				INT				NOT NULL,
	CONSTRAINT PK_PREOFERTA PRIMARY KEY(id_preoferta)
);

CREATE TABLE PD (
	cedula 				NUMERIC(8)		NOT NULL,
	CONSTRAINT PK_PD PRIMARY KEY(cedula)
);

	CREATE TABLE nombres (
		cedula			NUMERIC(8)		NOT NULL,
		nombres			VARCHAR(20)		NOT NULL,
		CONSTRAINT PK_nombres PRIMARY KEY(cedula,nombres)
	);

	CREATE TABLE apellidos (
		cedula			NUMERIC(8)		NOT NULL,
		apellidos		VARCHAR(20)		NOT NULL,
		CONSTRAINT PK_apellidos PRIMARY KEY(cedula,apellidos)
	);

	CREATE TABLE telefonos (
		cedula			NUMERIC(8)		NOT NULL,
		telefonos		VARCHAR(20)		NOT NULL,
		CONSTRAINT PK_telefonos PRIMARY KEY(cedula,telefonos)
	);

	CREATE TABLE emails (
		cedula			NUMERIC(8)		NOT NULL,
		emails			VARCHAR(50)		NOT NULL,
		CONSTRAINT PK_emails PRIMARY KEY(cedula, emails)
	);

CREATE TABLE ESTUDIANTE (
	cedula				NUMERIC(8)		NOT NULL,
	carnet				VARCHAR(7)		NOT NULL,
	ult_trim_insc_meses	VARCHAR(20)			NULL,
	ult_trim_insc_anio	NUMERIC(4)			NULL,
	indice				NUMERIC(5,4)		NULL,
	grado				VARCHAR(10)		NOT NULL,
	otro_trabajo		BOOLEAN			NOT NULL,
	CONSTRAINT PK_ESTUDIANTE PRIMARY KEY(cedula, carnet),
	CONSTRAINT INDICE_TRES_PUNTO_CINCO CHECK (indice >= 3.5)
);

CREATE TABLE EXTERNO (
	cedula				NUMERIC(8)		NOT NULL,
	CONSTRAINT PK_EXTERNO PRIMARY KEY(cedula)
);

CREATE TABLE AD (
	cedula				NUMERIC(8)		NOT NULL,
	CONSTRAINT PK_AD PRIMARY KEY(cedula)
);

	CREATE TABLE credenciales (
		cedula			NUMERIC(8)		NOT NULL,
		credenciales	VARCHAR(30)		NOT NULL,
		CONSTRAINT PK_credenciales PRIMARY KEY(cedula,credenciales)
	);

CREATE TABLE PROFESOR (
	cedula				NUMERIC(8)		NOT NULL,
	jubilado			BOOLEAN			NOT NULL,
	id_dep				SERIAL			NOT NULL,
	CONSTRAINT PK_PROFESOR PRIMARY KEY(cedula)
);

CREATE TABLE TITULO (
	id_titulo			SERIAL			NOT NULL,
	nivel				VARCHAR(5)		NOT NULL,
	especialidad		VARCHAR(100)	NOT NULL,
	CONSTRAINT PK_TITULO PRIMARY KEY(id_titulo)
);

CREATE TABLE DEPARTAMENTO (
	id_dep				SERIAL			NOT NULL,
	CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY(id_dep)
);

CREATE TABLE CONTRATO (
	cedula				NUMERIC(8)		NOT NULL,
	id_contrato			SERIAL			NOT NULL,
	titulo				VARCHAR(30)		NOT NULL,
	duracion			VARCHAR(10)		NOT NULL,
	inicio				DATE			NOT NULL,
	CONSTRAINT PK_CONTRATO PRIMARY KEY(cedula, id_contrato)
);

CREATE TABLE PREPARADOR (
	cedula				NUMERIC(8)		NOT NULL,
	id_contrato			SERIAL			NOT NULL,
	tipo				VARCHAR(20)		NOT NULL,
	CONSTRAINT PK_PREPARADOR PRIMARY KEY(cedula)
);

CREATE TABLE AYUDANTE (
	cedula				NUMERIC(8)		NOT NULL,
	id_contrato			SERIAL			NOT NULL,
	CONSTRAINT PK_AYUDANTE PRIMARY KEY(cedula, id_contrato)
);

	CREATE TABLE supervision (
		cedula			NUMERIC(8)		NOT NULL,
		id_contrato		SERIAL			NOT NULL,
		supervision		VARCHAR(50)		NOT NULL,
		CONSTRAINT PK_supervision PRIMARY KEY(cedula, id_contrato, supervision)
	);

CREATE TABLE CPROFESOR (
	cedula				NUMERIC(8)		NOT NULL,
	id_contrato			SERIAL			NOT NULL,
	tipo				VARCHAR(30)		NOT NULL,
	horas				NUMERIC(2)		NOT NULL,
	CONSTRAINT PK_CPROFESOR PRIMARY KEY(cedula, id_contrato)
);

CREATE TABLE PE (
	cedula				NUMERIC(8)		NOT NULL,
	id_contrato			SERIAL			NOT NULL,
	categoria			VARCHAR(10)		NOT NULL,
	CONSTRAINT PK_PE PRIMARY KEY(cedula, id_contrato)
);

CREATE TABLE PC (
	cedula				NUMERIC(8)		NOT NULL,
	id_contrato			SERIAL			NOT NULL,
	nivel				VARCHAR(5)		NOT NULL,
	CONSTRAINT PK_PC PRIMARY KEY(cedula, id_contrato)
);

CREATE TABLE SP (
	cedula				NUMERIC(8)		NOT NULL,
	id_contrato			SERIAL			NOT NULL,
	nivel				VARCHAR(5)		NOT NULL,
	ad_honorem			BOOLEAN			NOT NULL,
	horas				NUMERIC(2)		NOT NULL,
	auxiliar			BOOLEAN			NOT NULL,
	CONSTRAINT PK_SP PRIMARY KEY(cedula, id_contrato)
);

CREATE TABLE SECCION (
	codigo				VARCHAR(6)		NOT NULL,
	meses				VARCHAR(20)		NOT NULL,
	anio				NUMERIC(4)		NOT NULL,
	numero				INT				NOT NULL,
	nro_estudiantes		INT				NOT NULL,
	est_aprobados		INT					NULL,
	CONSTRAINT PK_SECCION PRIMARY KEY(codigo,meses,anio,numero)	
);

	CREATE TABLE teoriaSECCION (
		codigo			VARCHAR(6)		NOT NULL,
		meses			VARCHAR(20)		NOT NULL,
		anio			NUMERIC(4)		NOT NULL,
		numero			INT				NOT NULL,
		horario			VARCHAR(5)		NOT NULL,
		CONSTRAINT PK_teoriaSECCION PRIMARY KEY(codigo, meses, anio, numero, horario)
	);

	CREATE TABLE laboratorioSECCION (
		codigo			VARCHAR(6)		NOT NULL,
		meses			VARCHAR(20)		NOT NULL,
		anio			NUMERIC(4)		NOT NULL,
		numero			INT				NOT NULL,
		horario			VARCHAR(5)		NOT NULL,
		CONSTRAINT PK_laboratorioSECCION PRIMARY KEY(codigo, meses, anio, numero, horario)
	);
	
	CREATE TABLE practicaSECCION (
		codigo			VARCHAR(6)		NOT NULL,
		meses			VARCHAR(20)		NOT NULL,
		anio			NUMERIC(4)		NOT NULL,
		numero			INT				NOT NULL,
		horario			VARCHAR(5)		NOT NULL,
		CONSTRAINT PK_practicaSECCION PRIMARY KEY(codigo, meses, anio, numero, horario)
	);

CREATE TABLE JUSTIFICACION (
	cedula				NUMERIC(8)		NOT NULL,
	id_justificacion	INT				NOT NULL,
	fecha				DATE			NOT NULL,
	tipo				VARCHAR(40)		NOT NULL,
	fecha_inicio		DATE				NULL,
	fecha_fin			DATE				NULL,
	nro_renovacion		INT					NULL,
	CONSTRAINT PK_JUSTIFICACION PRIMARY KEY(cedula,id_justificacion)
);

/* Relaciones a Relacional */

CREATE TABLE Requisito (
	codigo				VARCHAR(6)		NOT NULL,
	codigo_req			VARCHAR(6)		NOT NULL,
	id_plan				SERIAL			NOT NULL,
	CONSTRAINT PK_Requisito PRIMARY KEY(codigo, codigo_req, id_plan)
);

CREATE TABLE Correquisito (
	codigo				VARCHAR(6)		NOT NULL,
	codigo_req			VARCHAR(6)		NOT NULL,
	id_plan				SERIAL			NOT NULL,
	CONSTRAINT PK_Correquisito PRIMARY KEY(codigo, codigo_req, id_plan)
);

CREATE TABLE Ha_cursado (
	codigo				VARCHAR(6)		NOT NULL,
	cedula				NUMERIC(8)		NOT NULL,
	carnet				VARCHAR(7)		NOT NULL,
	CONSTRAINT PK_Ha_cursado PRIMARY KEY(codigo, cedula, carnet)
);

CREATE TABLE Coordina (
	cedula				NUMERIC(8)		NOT NULL,
	meses				VARCHAR(20)		NOT NULL,
	anio				NUMERIC(4)		NOT NULL,
	codigo				VARCHAR(6)		NOT NULL,
	CONSTRAINT PK_Coordina PRIMARY KEY(cedula, meses, anio, codigo)
);

CREATE TABLE Posee (
	cedula				NUMERIC(8)		NOT NULL,
	id_titulo			SERIAL			NOT NULL,
	CONSTRAINT PK_Posee PRIMARY KEY(cedula, id_titulo)
);

CREATE TABLE Prefiere (
	cedula				NUMERIC(8)		NOT NULL,
	id_oferta			SERIAL			NOT NULL,
	CONSTRAINT PK_Prefiere PRIMARY KEY(cedula, id_oferta)
);

CREATE TABLE Dicta (
	cedula				NUMERIC(8)		NOT NULL,
	meses				VARCHAR(20)		NOT NULL,
	anio				NUMERIC(4)		NOT NULL,
	codigo				VARCHAR(6)		NOT NULL,
	numero				INT				NOT NULL,
	CONSTRAINT PK_Dicta PRIMARY KEY(cedula, meses, anio, codigo, numero)
);

/* Claves foráneas */

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
													OR (ult_trim_insc_meses IS NOT NULL AND ult_trim_insc_anio > 0 AND (indice >= 1.0 and indice <= 5.0)));

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
ADD CONSTRAINT DOM_NIVEL CHECK (nivel IN ('I', 'II', 'III', 'IV', 'V')),
ADD CONSTRAINT DOM_HORAS CHECK (horas > 0);

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
ADD CONSTRAINT FK_TRIMESTRE FOREIGN KEY(meses,anio) REFERENCES TRIMESTRE(meses, anio);

ALTER TABLE Posee
ADD CONSTRAINT FK_PROFESOR FOREIGN KEY(cedula) REFERENCES PROFESOR(cedula),
ADD CONSTRAINT FK_TITULO FOREIGN KEY(id_titulo) REFERENCES TITULO(id_titulo);

ALTER TABLE Prefiere
ADD CONSTRAINT FK_PD FOREIGN KEY(cedula) REFERENCES PD(cedula),
ADD CONSTRAINT FK_OFERTA FOREIGN KEY(id_oferta) REFERENCES OFERTA(id_oferta);

ALTER TABLE Dicta
ADD CONSTRAINT FK_PD FOREIGN KEY(cedula) REFERENCES PD(cedula),
ADD CONSTRAINT FK_SECCION FOREIGN KEY(codigo, meses, anio, numero) REFERENCES SECCION(codigo, meses, anio, numero);
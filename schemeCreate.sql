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

		En el presente script schemaCreate.sql se crean las tablas
		de las relaciones obtenidas de la traducción del Modelo ER-ERE
		de la primera fase del proyecto al Modelo Relacional.
 */

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
		supervision		DATE			NOT NULL,
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
	nivel				VARCHAR(5)			NULL,
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
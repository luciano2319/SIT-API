IF DB_ID ('BD_PF_SIT') IS NOT NULL
BEGIN
	USE MASTER
	DROP DATABASE BD_PF_SIT
END
GO

CREATE DATABASE BD_PF_SIT
GO
USE BD_PF_SIT
GO

IF OBJECT_ID ('TB_SERVICIO') IS NOT NULL
BEGIN
	DROP TABLE TB_SERVICIO
END
GO

CREATE TABLE TB_SERVICIO(
COD_SERV INT NOT NULL PRIMARY KEY,
DESC_SERV VARCHAR(30) NOT NULL,
TIPO_SERV VARCHAR(20) CHECK (TIPO_SERV IN ('TERRESTRE', 'MARINO', 'AÉREO', 'FERROVARIO')),
ESTADO_SERV INT
)
GO

INSERT INTO TB_SERVICIO VALUES
(1, 'LÍNEA 1 METRO DE LIMA','FERROVARIO',1),
(2, 'METROPOLITANO','TERRESTRE',1),
(3, 'CORREDOR','TERRESTRE',1)
GO

IF OBJECT_ID ('TB_TIPO_ESTACION') IS NOT NULL
BEGIN
	DROP TABLE TB_TIPO_ESTACION
END
GO

CREATE TABLE TB_TIPO_ESTACION(
COD_TIPO_ESTACION CHAR(1) CHECK(COD_TIPO_ESTACION IN('E','D')),
DESC_TIPO_ESTACIÓN VARCHAR(20),
PRIMARY KEY (COD_TIPO_ESTACION)
)
GO

INSERT INTO TB_TIPO_ESTACION values('E', 'ESTÁTICA')
INSERT INTO TB_TIPO_ESTACION values('D', 'DINÁMICA')
GO

IF OBJECT_ID ('TB_ESTACION') IS NOT NULL
BEGIN
	DROP TABLE TB_ESTACION
END
GO

CREATE TABLE TB_ESTACION(
COD_ESTACION CHAR(5) NOT NULL PRIMARY KEY,
NOM_ESTACION VARCHAR(30) NOT NULL,
COD_SERV INT REFERENCES TB_SERVICIO(COD_SERV) NOT NULL,
COD_TIPO_ESTACION CHAR(1) CHECK(COD_TIPO_ESTACION IN('E','D')) REFERENCES TB_TIPO_ESTACION(COD_TIPO_ESTACION) --ESTÁTICA O DINÁMICA
)
GO

INSERT INTO TB_ESTACION VALUES
('0', 'EST. DINÁMICA', 3, 'D'),
('L1-01','Villa el Salvador',1,'E'),
('L1-02','Parque Industrial',1,'E'),
('L1-03','Pumacahua',1,'E'),
('L1-04','Villa María',1,'E'),
('L1-05','María Auxiliadora',1,'E'),
('L1-06','San Juan',1,'E'),
('L1-07','Atocongo',1,'E'),
('L1-08','Jorge Chávez',1,'E'),
('L1-09','Ayacucho',1,'E'),
('L1-10','Cabitos',1,'E'),
('L1-11','Angamos',1,'E'),
('L1-12','San Borja Sur',1,'E'),
('L1-13','La Cultura',1,'E'),
('L1-14','Nicolás Arriola',1,'E'),
('L1-15','Gamarra',1,'E'),
('L1-16','Miguel Grau',1,'E'),
('L1-17','El Ángel',1,'E'),
('L1-18','Presbítero Maestro',1,'E'),
('L1-19','Caja de Agua',1,'E'),
('L1-20','Pirámides del Sol',1,'E'),
('L1-21','Los Jardines',1,'E'),
('L1-22','Los Postes',1,'E'),
('L1-23','San Carlos',1,'E'),
('L1-24','San Martin',1,'E'),
('L1-25','Santa Rosa',1,'E'),
('L1-26','Bayóvar',1,'E')
GO

SELECT * FROM TB_ESTACION
GO

IF OBJECT_ID ('TB_EQUIPO') IS NOT NULL
BEGIN
	DROP TABLE TB_EQUIPO
END
GO

CREATE TABLE TB_EQUIPO(
COD_EQUIPO CHAR(10) PRIMARY KEY,
DESC_EQUIPO VARCHAR(20) check (DESC_EQUIPO IN ('Charom', 'Torniquete', 'TVM', 'MET','WEB','Validador')) NOT NULL,
COD_ESTACION CHAR(5) REFERENCES TB_ESTACION(COD_ESTACION) NOT NULL,
EST_EQUIPO INT NOT NULL
)
GO

--CONCEPTOS:
/*
CHAROM: PUERTA DE ACCESO PARA PERSONAS DISCAPACITADAS
TORNIQUETE: BRAZO MOVIBLE PARA EL INGRESO DE PERSONAS
TVM (TICKET VENDING MACHINE): MÁQUINA DE RECARGA Y VENTA DE TARJETAS
MET (MÁQUINA EXPENDEDORA DE TARJETAS): EQUIPO (PC) UBICADA EN LAS BOLETERÍAS PARA RECARGAR Y VENDER TARJETAS

CUANDO LOS ÚLTIMOS 4 DÍGITOS DE LA SERIE EMPIEZAN EN 10 SE TRATA DE CHAROM O TORNIQUETES. EJEMPLO: L1-0101001
CUANDO LOS ÚLTIMOS 4 DÍGITOS DE LA SERIE EMPIEZAN EN 20 SE TRATA DE MET. EJEMPLO: L1-0102001
CUANDO LOS ÚLTIMOS 4 DÍGITOS DE LA SERIE EMPIEZAN EN 30 SE TRATA DE TVM. EJEMPLO: L1-0103001
*/

INSERT INTO TB_EQUIPO VALUES
('L1-0101001', 'Charom','L1-01',1),
('L1-0101002', 'Torniquete','L1-01',1),
('L1-0101003', 'Torniquete','L1-01',1),
('L1-0101004', 'Torniquete','L1-01',1),
('L1-0101005', 'Torniquete','L1-01',1),
('L1-0101006', 'Torniquete','L1-01',1),
('L1-0101007', 'Torniquete','L1-01',1),
('L1-0101008', 'Torniquete','L1-01',1),
('L1-0101009', 'Torniquete','L1-01',1),
('L1-0101010', 'Torniquete','L1-01',1),
('L1-0101011', 'Torniquete','L1-01',1),
('L1-0102001', 'MET','L1-01',1),
('L1-0102002', 'MET','L1-01',1),
('L1-0103001', 'TVM','L1-01',1),
('L1-0103002', 'TVM','L1-01',1),
('L1-0103003', 'TVM','L1-01',1),
('L1-0201001', 'Charom','L1-02',1),
('L1-0201002', 'Torniquete','L1-02',1),
('L1-0201003', 'Torniquete','L1-02',1),
('L1-0201004', 'Torniquete','L1-02',1),
('L1-0201005', 'Torniquete','L1-02',1),
('L1-0201006', 'Torniquete','L1-02',1),
('L1-0201007', 'Torniquete','L1-02',1),
('L1-0202001', 'MET','L1-02',1),
('L1-0202002', 'MET','L1-02',1),
('L1-0203001', 'TVM','L1-02',1),
('L1-0301001', 'Charom','L1-03',1),
('L1-0301002', 'Torniquete','L1-03',1),
('L1-0301003', 'Torniquete','L1-03',1),
('L1-0301004', 'Torniquete','L1-03',1),
('L1-0302001', 'MET','L1-03',1),
('L1-0302002', 'MET','L1-03',1),
('L1-0303001', 'TVM','L1-03',1),
('L1-0401001', 'Charom','L1-04',1),
('L1-0401002', 'Torniquete','L1-04',1),
('L1-0401003', 'Torniquete','L1-04',1),
('L1-0401004', 'Torniquete','L1-04',1),
('L1-0401005', 'Torniquete','L1-04',1),
('L1-0401006', 'Torniquete','L1-04',1),
('L1-0401007', 'Torniquete','L1-04',1),
('L1-0402001', 'MET','L1-04',1),
('L1-0402002', 'MET','L1-04',1),
('L1-0403001', 'TVM','L1-04',1),
('L1-0501001', 'Charom','L1-05',1),
('L1-0501002', 'Torniquete','L1-05',1),
('L1-0501003', 'Torniquete','L1-05',1),
('L1-0501004', 'Torniquete','L1-05',1),
('L1-0501005', 'Torniquete','L1-05',1),
('L1-0501006', 'Torniquete','L1-05',1),
('L1-0501007', 'Torniquete','L1-05',1),
('L1-0502001', 'MET','L1-05',1),
('L1-0502002', 'MET','L1-05',1),
('L1-0503001', 'TVM','L1-05',1),
('L1-0601001', 'Charom','L1-06',1),
('L1-0601002', 'Torniquete','L1-06',1),
('L1-0601003', 'Torniquete','L1-06',1),
('L1-0601004', 'Torniquete','L1-06',1),
('L1-0601005', 'Torniquete','L1-06',1),
('L1-0601006', 'Torniquete','L1-06',1),
('L1-0601007', 'Torniquete','L1-06',1),
('L1-0601008', 'Torniquete','L1-06',1),
('L1-0601009', 'Torniquete','L1-06',1),
('L1-0602001', 'MET','L1-06',1),
('L1-0602002', 'MET','L1-06',1),
('L1-0603001', 'TVM','L1-06',1),
('L1-0701001', 'Charom','L1-07',1),
('L1-0701002', 'Torniquete','L1-07',1),
('L1-0701003', 'Torniquete','L1-07',1),
('L1-0701004', 'Torniquete','L1-07',1),
('L1-0701005', 'Torniquete','L1-07',1),
('L1-0701006', 'Torniquete','L1-07',1),
('L1-0701007', 'Torniquete','L1-07',1),
('L1-0702001', 'MET','L1-07',1),
('L1-0702002', 'MET','L1-07',1),
('L1-0703001', 'TVM','L1-07',1),
('L1-0801001', 'Charom','L1-08',1),
('L1-0801002', 'Torniquete','L1-08',1),
('L1-0801003', 'Torniquete','L1-08',1),
('L1-0801004', 'Torniquete','L1-08',1),
('L1-0801005', 'Torniquete','L1-08',1),
('L1-0801006', 'Torniquete','L1-08',1),
('L1-0802001', 'MET','L1-08',1),
('L1-0802002', 'MET','L1-08',1),
('L1-0803001', 'TVM','L1-08',1),
('L1-0901001', 'Charom','L1-09',1),
('L1-0901002', 'Torniquete','L1-09',1),
('L1-0901003', 'Torniquete','L1-09',1),
('L1-0901004', 'Torniquete','L1-09',1),
('L1-0901005', 'Torniquete','L1-09',1),
('L1-0901006', 'Torniquete','L1-09',1),
('L1-0902001', 'MET','L1-09',1),
('L1-0902002', 'MET','L1-09',1),
('L1-0903001', 'TVM','L1-09',1),
('L1-1001001', 'Charom','L1-10',1),
('L1-1001002', 'Torniquete','L1-10',1),
('L1-1001003', 'Torniquete','L1-10',1),
('L1-1001004', 'Torniquete','L1-10',1),
('L1-1001005', 'Torniquete','L1-10',1),
('L1-1001006', 'Torniquete','L1-10',1),
('L1-1001007', 'Torniquete','L1-10',1),
('L1-1001008', 'Torniquete','L1-10',1),
('L1-1001009', 'Torniquete','L1-10',1),
('L1-1001010', 'Torniquete','L1-10',1),
('L1-1002001', 'MET','L1-10',1),
('L1-1002002', 'MET','L1-10',1),
('L1-1003001', 'TVM','L1-10',1),
('L1-1101001', 'Charom','L1-11',1),
('L1-1101002', 'Torniquete','L1-11',1),
('L1-1101003', 'Torniquete','L1-11',1),
('L1-1101004', 'Torniquete','L1-11',1),
('L1-1101005', 'Torniquete','L1-11',1),
('L1-1101006', 'Torniquete','L1-11',1),
('L1-1101007', 'Torniquete','L1-11',1),
('L1-1102001', 'MET','L1-11',1),
('L1-1102002', 'MET','L1-11',1),
('L1-1103001', 'TVM','L1-11',1),
('L1-1103002', 'TVM','L1-11',1),
('L1-1201001', 'Charom','L1-12',1),
('L1-1201002', 'Torniquete','L1-12',1),
('L1-1201003', 'Torniquete','L1-12',1),
('L1-1201004', 'Torniquete','L1-12',1),
('L1-1201005', 'Torniquete','L1-12',1),
('L1-1201006', 'Torniquete','L1-12',1),
('L1-1201007', 'Torniquete','L1-12',1),
('L1-1201008', 'Torniquete','L1-12',1),
('L1-1201009', 'Torniquete','L1-12',1),
('L1-1202001', 'MET','L1-12',1),
('L1-1202002', 'MET','L1-12',1),
('L1-1202003', 'MET','L1-12',1),
('L1-1202004', 'MET','L1-12',1),
('L1-1203001', 'TVM','L1-12',1),
('L1-1301001', 'Charom','L1-13',1),
('L1-1301002', 'Torniquete','L1-13',1),
('L1-1301003', 'Torniquete','L1-13',1),
('L1-1301004', 'Torniquete','L1-13',1),
('L1-1301005', 'Torniquete','L1-13',1),
('L1-1301006', 'Torniquete','L1-13',1),
('L1-1301007', 'Torniquete','L1-13',1),
('L1-1301008', 'Torniquete','L1-13',1),
('L1-1301009', 'Torniquete','L1-13',1),
('L1-1301010', 'Torniquete','L1-13',1),
('L1-1301011', 'Torniquete','L1-13',1),
('L1-1302001', 'MET','L1-13',1),
('L1-1302002', 'MET','L1-13',1),
('L1-1303001', 'TVM','L1-13',1),
('L1-1401001', 'Charom','L1-14',1),
('L1-1401002', 'Torniquete','L1-14',1),
('L1-1401003', 'Torniquete','L1-14',1),
('L1-1401004', 'Torniquete','L1-14',1),
('L1-1401005', 'Torniquete','L1-14',1),
('L1-1401006', 'Torniquete','L1-14',1),
('L1-1401007', 'Torniquete','L1-14',1),
('L1-1401008', 'Torniquete','L1-14',1),
('L1-1401009', 'Torniquete','L1-14',1),
('L1-1401010', 'Torniquete','L1-14',1),
('L1-1402001', 'MET','L1-14',1),
('L1-1402002', 'MET','L1-14',1),
('L1-1403001', 'TVM','L1-14',1),
('L1-1501001', 'Charom','L1-15',1),
('L1-1501002', 'Torniquete','L1-15',1),
('L1-1501003', 'Torniquete','L1-15',1),
('L1-1501004', 'Torniquete','L1-15',1),
('L1-1501005', 'Torniquete','L1-15',1),
('L1-1501006', 'Torniquete','L1-15',1),
('L1-1501007', 'Torniquete','L1-15',1),
('L1-1501008', 'Torniquete','L1-15',1),
('L1-1501009', 'Torniquete','L1-15',1),
('L1-1502001', 'MET','L1-15',1),
('L1-1502002', 'MET','L1-15',1),
('L1-1503001', 'TVM','L1-15',1),
('L1-1503002', 'TVM','L1-15',1),
('L1-1503003', 'TVM','L1-15',1),
('L1-1601001', 'Charom','L1-16',1),
('L1-1601002', 'Torniquete','L1-16',1),
('L1-1601003', 'Torniquete','L1-16',1),
('L1-1601004', 'Torniquete','L1-16',1),
('L1-1601005', 'Torniquete','L1-16',1),
('L1-1601006', 'Torniquete','L1-16',1),
('L1-1601007', 'Torniquete','L1-16',1),
('L1-1601008', 'Torniquete','L1-16',1),
('L1-1601009', 'Torniquete','L1-16',1),
('L1-1601010', 'Torniquete','L1-16',1),
('L1-1601011', 'Torniquete','L1-16',1),
('L1-1601012', 'Torniquete','L1-16',1),
('L1-1601013', 'Torniquete','L1-16',1),
('L1-1602001', 'MET','L1-16',1),
('L1-1602002', 'MET','L1-16',1),
('L1-1602003', 'MET','L1-16',1),
('L1-1603001', 'TVM','L1-16',1),
('L1-1603002', 'TVM','L1-16',1),
('L1-1603003', 'TVM','L1-16',1),
('L1-1701001', 'Charom','L1-17',1),
('L1-1701002', 'Torniquete','L1-17',1),
('L1-1701003', 'Torniquete','L1-17',1),
('L1-1701004', 'Torniquete','L1-17',1),
('L1-1701005', 'Torniquete','L1-17',1),
('L1-1701006', 'Torniquete','L1-17',1),
('L1-1701007', 'Torniquete','L1-17',1),
('L1-1702001', 'MET','L1-17',1),
('L1-1702002', 'MET','L1-17',1),
('L1-1703001', 'TVM','L1-17',1),
('L1-1801001','Charom' ,'L1-18',1),
('L1-1801002','Torniquete','L1-18',1),
('L1-1801003','Torniquete','L1-18',1),
('L1-1801004','Torniquete','L1-18',1),
('L1-1801005','Torniquete','L1-18',1),
('L1-1802001','MET','L1-18',1),
('L1-1802002','MET','L1-18',1),
('L1-1803001','TVM','L1-18',1),
('L1-1901001','Charom' ,'L1-19',1),
('L1-1901002','Torniquete','L1-19',1),
('L1-1901003','Torniquete','L1-19',1),
('L1-1901004','Torniquete','L1-19',1),
('L1-1901005','Torniquete','L1-19',1),
('L1-1901006','Torniquete','L1-19',1),
('L1-1901007','Torniquete','L1-19',1),
('L1-1901008','Torniquete','L1-19',1),
('L1-1902001','MET','L1-19',1),
('L1-1902002','MET','L1-19',1),
('L1-1903001','TVM','L1-19',1),
('L1-1903002','TVM','L1-19',1),
('L1-2001001','Charom' ,'L1-20',1),
('L1-2001002','Torniquete','L1-20',1),
('L1-2001003','Torniquete','L1-20',1),
('L1-2001004','Torniquete','L1-20',1),
('L1-2001005','Torniquete','L1-20',1),
('L1-2002001','MET','L1-20',1),
('L1-2002002','MET','L1-20',1),
('L1-2003001','TVM','L1-20',1),
('L1-2003002','TVM','L1-20',1),
('L1-2101001','Charom' ,'L1-21',1),
('L1-2101002','Torniquete','L1-21',1),
('L1-2101003','Torniquete','L1-21',1),
('L1-2101004','Torniquete','L1-21',1),
('L1-2101005','Torniquete','L1-21',1),
('L1-2102001','MET','L1-21',1),
('L1-2102002','MET','L1-21',1),
('L1-2103001','TVM','L1-21',1),
('L1-2103002','TVM','L1-21',1),
('L1-2201001','Charom' ,'L1-22',1),
('L1-2201002','Torniquete','L1-22',1),
('L1-2201003','Torniquete','L1-22',1),
('L1-2201004','Torniquete','L1-22',1),
('L1-2201005','Torniquete','L1-22',1),
('L1-2201006','Torniquete','L1-22',1),
('L1-2201007','Torniquete','L1-22',1),
('L1-2202001','MET','L1-22',1),
('L1-2202002','MET','L1-22',1),
('L1-2203001','TVM','L1-22',1),
('L1-2203002','TVM','L1-22',1),
('L1-2301001','Charom' ,'L1-23',1),
('L1-2301002','Torniquete','L1-23',1),
('L1-2301003','Torniquete','L1-23',1),
('L1-2301004','Torniquete','L1-23',1),
('L1-2301005','Torniquete','L1-23',1),
('L1-2302001','MET','L1-23',1),
('L1-2302002','MET','L1-23',1),
('L1-2303001','TVM','L1-23',1),
('L1-2303002','TVM','L1-23',1),
('L1-2401001','Charom' ,'L1-24',1),
('L1-2401002','Torniquete','L1-24',1),
('L1-2401003','Torniquete','L1-24',1),
('L1-2401004','Torniquete','L1-24',1),
('L1-2401005','Torniquete','L1-24',1),
('L1-2402001','MET','L1-24',1),
('L1-2402002','MET','L1-24',1),
('L1-2403001','TVM','L1-24',1),
('L1-2403002','TVM','L1-24',1),
('L1-2501001','Charom' ,'L1-25',1),
('L1-2501002','Torniquete','L1-25',1),
('L1-2501003','Torniquete','L1-25',1),
('L1-2501004','Torniquete','L1-25',1),
('L1-2501005','Torniquete','L1-25',1),
('L1-2502001','MET','L1-25',1),
('L1-2502002','MET','L1-25',1),
('L1-2503001','TVM','L1-25',1),
('L1-2503002','TVM','L1-25',1),
('L1-2601001','Charom' ,'L1-26',1),
('L1-2601002','Torniquete','L1-26',1),
('L1-2601003','Torniquete','L1-26',1),
('L1-2601004','Torniquete','L1-26',1),
('L1-2601005','Torniquete','L1-26',1),
('L1-2601006','Torniquete','L1-26',1),
('L1-2601007','Torniquete','L1-26',1),
('L1-2602001','MET','L1-26',1),
('L1-2602002','MET','L1-26',1),
('L1-2603001','TVM','L1-26',1),
('L1-2603002','TVM','L1-26',1),
('L1-2603003','TVM','L1-26',1),
('L1-0104001','Validador','L1-01',1)
GO

IF OBJECT_ID ('TB_PARADERO') IS NOT NULL
BEGIN
	DROP TABLE TB_PARADERO
END
GO

CREATE TABLE TB_PARADERO(
COD_PARADERO CHAR(5) PRIMARY KEY,
NOMBRE_PARADERO VARCHAR(50) NOT NULL,
LATITUD DECIMAL(10,6) NOT NULL,
LONGITUD DECIMAL(10,6) NOT NULL
)
GO


IF OBJECT_ID ('TB_TARJETA') IS NOT NULL
BEGIN
	DROP TABLE TB_TARJETA
END
GO

CREATE TABLE TB_TARJETA(
COD_TARJETA CHAR(9) PRIMARY KEY,
PERFIL_TARJETA VARCHAR(15) CHECK(PERFIL_TARJETA IN('Adulto','Universitario','Instituto','Escolar')) NOT NULL,
FEC_EMISION DATETIME NOT NULL,
FEC_CADUCIDAD DATETIME NULL,
SALDO_TARJETA MONEY NOT NULL,
ESTADO_TARJETA VARCHAR(10) CHECK(ESTADO_TARJETA IN('Inactiva','Activa','Bloqueada')) NOT NULL
)
GO

INSERT INTO TB_TARJETA VALUES
('100000000','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000001','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000002','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000003','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000004','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000005','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000006','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000007','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000008','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000009','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000010','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000011','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000012','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000013','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000014','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000015','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000016','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000017','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000018','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000019','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000020','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000021','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000022','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000023','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000024','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000025','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000026','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000027','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000028','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000029','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000030','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000031','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000032','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000033','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000034','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000035','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000036','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000037','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000038','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000039','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000040','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000041','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000042','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000043','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000044','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000045','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000046','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000047','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000048','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000049','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000050','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000051','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000052','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000053','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000054','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000055','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000056','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000057','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000058','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000059','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000060','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000061','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000062','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000063','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000064','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000065','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000066','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000067','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000068','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000069','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000070','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000071','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000072','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000073','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000074','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000075','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000076','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000077','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000078','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000079','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000080','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000081','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000082','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000083','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000084','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000085','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000086','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000087','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000088','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000089','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000090','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000091','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000092','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000093','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000094','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000095','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000096','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000097','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000098','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000099','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000100','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000101','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000102','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000103','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000104','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000105','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000106','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000107','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000108','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000109','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000110','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000111','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000112','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000113','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000114','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000115','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000116','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000117','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000118','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000119','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000120','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000121','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000122','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000123','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000124','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000125','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000126','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000127','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000128','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000129','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000130','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000131','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000132','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000133','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000134','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000135','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000136','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000137','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000138','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000139','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000140','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000141','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000142','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000143','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000144','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000145','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000146','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000147','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000148','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000149','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000150','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000151','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000152','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000153','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000154','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000155','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000156','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000157','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000158','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000159','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000160','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000161','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000162','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000163','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000164','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000165','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000166','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000167','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000168','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000169','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000170','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000171','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000172','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000173','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000174','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000175','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000176','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000177','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000178','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000179','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000180','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000181','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000182','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000183','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000184','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000185','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000186','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000187','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000188','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000189','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000190','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000191','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000192','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000193','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000194','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000195','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000196','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000197','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000198','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000199','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000200','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000201','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000202','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000203','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000204','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000205','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000206','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000207','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000208','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000209','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000210','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000211','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000212','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000213','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000214','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000215','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000216','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000217','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000218','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000219','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000220','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000221','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000222','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000223','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000224','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000225','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000226','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000227','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000228','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000229','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000230','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000231','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000232','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000233','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000234','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000235','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000236','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000237','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000238','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000239','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000240','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000241','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000242','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000243','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000244','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000245','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000246','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000247','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000248','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000249','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000250','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000251','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000252','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000253','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000254','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000255','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000256','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000257','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000258','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000259','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000260','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000261','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000262','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000263','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000264','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000265','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000266','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000267','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000268','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000269','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000270','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000271','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000272','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000273','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000274','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000275','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000276','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000277','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000278','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000279','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000280','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000281','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000282','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000283','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000284','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000285','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000286','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000287','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000288','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000289','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000290','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000291','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000292','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000293','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000294','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000295','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000296','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000297','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000298','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000299','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000300','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000301','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000302','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000303','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000304','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000305','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000306','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000307','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000308','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000309','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000310','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000311','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000312','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000313','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000314','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000315','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000316','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000317','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000318','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000319','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000320','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000321','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000322','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000323','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000324','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000325','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000326','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000327','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000328','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000329','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000330','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000331','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000332','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000333','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000334','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000335','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000336','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000337','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000338','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000339','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000340','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000341','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000342','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000343','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000344','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000345','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000346','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000347','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000348','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000349','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000350','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000351','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000352','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000353','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000354','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000355','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000356','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000357','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000358','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000359','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000360','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000361','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000362','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000363','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000364','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000365','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000366','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000367','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000368','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000369','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000370','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000371','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000372','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000373','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000374','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000375','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000376','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000377','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000378','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000379','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000380','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000381','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000382','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000383','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000384','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000385','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000386','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000387','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000388','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000389','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000390','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000391','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000392','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000393','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000394','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000395','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000396','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000397','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000398','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000399','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000400','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000401','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000402','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000403','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000404','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000405','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000406','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000407','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000408','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000409','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000410','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000411','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000412','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000413','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000414','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000415','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000416','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000417','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000418','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000419','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000420','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000421','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000422','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000423','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000424','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000425','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000426','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000427','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000428','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000429','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000430','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000431','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000432','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000433','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000434','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000435','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000436','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000437','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000438','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000439','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000440','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000441','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000442','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000443','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000444','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000445','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000446','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000447','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000448','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000449','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000450','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000451','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000452','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000453','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000454','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000455','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000456','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000457','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000458','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000459','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000460','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000461','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000462','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000463','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000464','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000465','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000466','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000467','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000468','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000469','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000470','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000471','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000472','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000473','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000474','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000475','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000476','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000477','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000478','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000479','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000480','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000481','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000482','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000483','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000484','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000485','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000486','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000487','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000488','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000489','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000490','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000491','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000492','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000493','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000494','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000495','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000496','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000497','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000498','Adulto','2019/06/05',NULL,0,'Inactiva'),
('100000499','Adulto','2019/06/05',NULL,0,'Inactiva')
GO

SELECT * FROM TB_TARJETA
GO

IF OBJECT_ID ('TB_OPERACION') IS NOT NULL
BEGIN
	DROP TABLE TB_OPERACION
END
GO

/*
CONCEPTOS:
SÓLO LAS MET Y TVM GENERAN OPERACIONES DE SUMA CUANDO SE ACTUALIZA EL SALDO, YA QUE A TRAVÉS DE ELLAS SE GENERAN COMPRAS O RECARGAS DE TARJETA
SÓLO LOS TORNIQUETES GENERAR OPERACIONES DE RESTA, YA QUE A TRAVÉS DE ELLO SE EFECTÚAN LOS COBROS DE PASAJES DE LAS TARJETAS
*/

CREATE TABLE TB_OPERACION(
COD_OPERACION INT IDENTITY(1,1) PRIMARY KEY,
COD_TARJETA CHAR(9) REFERENCES TB_TARJETA (COD_TARJETA) NOT NULL,
FECHA_OPERACION date NOT NULL,
HORA_OPERACION time NOT NULL,
COD_EQUIPO CHAR(10) REFERENCES TB_EQUIPO (COD_EQUIPO) NULL, --NULL EN CASO SEA RECARGAR VIRTUAL HASTA QUE RECIBA UN UPDATE DE VALIDACIÓN
COD_PARADERO CHAR(5) REFERENCES TB_PARADERO (COD_PARADERO) NULL, --NULL EN CASO SEA UN EQUIPO ASOCIADO A UNA ESTACIÓN DINÁMICA
TIPO_OPERACION VARCHAR(20) CHECK (TIPO_OPERACION IN('Venta','Carga','Uso','Recarga virtual')),
FECHA_HORA_CONFIRMACION DATETIME NULL,
MEDIO_PAGO_OPERACION VARCHAR(7) NULL,
IMPORTE MONEY NOT NULL,
ESTADO INT DEFAULT 1
)
GO
insert into TB_OPERACION values('100000000',getdate(),'17:00:00', 'L1-0602002',  null, 'Venta', GETDATE(),null,0.0,1)
insert into TB_OPERACION values('100000001',getdate(),'17:01:00', 'L1-0602002',  null, 'Venta', GETDATE(),null,0.0,1)

insert into TB_OPERACION values('100000002',getdate(),'18:00:00', 'L1-0602002',  null, 'Venta', GETDATE(),null,0.0,1)
insert into TB_OPERACION values('100000003',getdate(),'18:01:00', 'L1-0602002',  null, 'Venta', GETDATE(),null,0.0,1)


IF OBJECT_ID ('TG_OPERACION') IS NOT NULL
BEGIN
	DROP TRIGGER TG_OPERACION
END
GO

/*CREATE TRIGGER TG_OPERACION
ON TB_OPERACION
FOR INSERT
AS
BEGIN
DECLARE @SALDO MONEY = (SELECT IMPORTE FROM inserted)
DECLARE @TIPO VARCHAR(20) = (SELECT TIPO_OPERACION FROM inserted)
DECLARE @TARJETA CHAR(9) = (SELECT COD_TARJETA FROM inserted)
DECLARE @EQUIPO CHAR(10) = (SELECT COD_EQUIPO FROM inserted)
	IF EXISTS (SELECT * FROM inserted)
		BEGIN
			IF((SELECT @EQUIPO FROM inserted) != 'WEB-PLTFRM')
			BEGIN
				UPDATE TB_OPERACION SET MEDIO_PAGO_OPERACION='Directo'
			END
			IF((SELECT ESTADO_TARJETA FROM TB_TARJETA WHERE COD_TARJETA=@TARJETA)='Activa' AND
				(SELECT @TIPO FROM inserted)='Venta')
			BEGIN
				RAISERROR ('Esta tarjeta ya fue emitida', 16, 1)
				ROLLBACK TRANSACTION
				RETURN
			END
			IF((SELECT ESTADO_TARJETA FROM TB_TARJETA WHERE COD_TARJETA=@TARJETA)='Inactiva' AND
				(SELECT @TIPO FROM inserted)='Venta')
			BEGIN
				UPDATE TB_TARJETA SET ESTADO_TARJETA='Activa' WHERE COD_TARJETA=@TARJETA
			END
			UPDATE TB_TARJETA SET SALDO_TARJETA=SALDO_TARJETA+@SALDO WHERE COD_TARJETA=@TARJETA
		END
END
GO

INSERT INTO TB_OPERACION VALUES ('100000000','2019/05/17','10:22','L1-0103001','Venta',null,0)
go
INSERT INTO TB_OPERACION VALUES ('100000000','2019/05/17','10:23','L1-0103001','Carga',null,+5)
go
INSERT INTO TB_OPERACION VALUES ('100000000','2019/05/17','10:25','L1-0101001','Uso',null,-1.5)
go
INSERT INTO TB_OPERACION VALUES ('100000000','2019/05/17','10:22','L1-0103001','Venta',null,0)
go

INSERT INTO TB_OPERACION VALUES ('100000001','2019/05/17','10:26','L1-0103001','Venta',null,0)
go
INSERT INTO TB_OPERACION VALUES ('100000001','2019/05/17','10:27','L1-0103001','Carga',null,+5)
go
INSERT INTO TB_OPERACION VALUES ('100000001','2019/05/17','10:28','L1-0101001','Uso',null,-1.5)
go
INSERT INTO TB_OPERACION VALUES ('100000002','2019/05/17','10:29','L1-0103001','Venta',null,0)
go
INSERT INTO TB_OPERACION VALUES ('100000002','2019/05/17','10:29','L1-0103001','Carga',null,+5)
go
INSERT INTO TB_OPERACION VALUES ('100000002','2019/05/17','10:30','L1-0101001','Uso',null,-1.5)
go
INSERT INTO TB_OPERACION VALUES ('100000448',GETDATE(),'10:34','L1-0101001','Venta',null,0)
go

select * from TB_TARJETA

select * from TB_OPERACION*/


/*ESTO ES PARA EL APLICATIVO WEB...*/

IF OBJECT_ID ('TB_CLIENTE') IS NOT NULL
BEGIN
	DROP TABLE TB_CLIENTE
END
GO

CREATE TABLE TB_CLIENTE(
USU_CLIENTE VARCHAR(12) PRIMARY KEY,
PASS_CLIENTE VARCHAR(12) NOT NULL,
MAIL_CLIENTE VARCHAR(50) NOT NULL,
FECH_REGISTRO_CLIENTE DATE NOT NULL,
ESTADO INT NOT NULL
)
GO

INSERT INTO TB_CLIENTE VALUES
('lucianocar','12346578','lfcc_1369@hotmail.com','2019/05/07',1),
('rubenbec','12346578','ruben_b@gmail.com','2019/05/07',1),
('fguccione','12346578','franchescoguccione@gmail.com','2019/05/07',1),
('milagros12','12346578','mili@gmail.com','2019/05/07',1)
GO


IF OBJECT_ID ('TB_CLIENTE_TARJETA') IS NOT NULL
BEGIN
	DROP TABLE TB_CLIENTE_TARJETA
END
GO

CREATE TABLE TB_CLIENTE_TARJETA(
USU_CLIENTE VARCHAR(12) REFERENCES TB_CLIENTE (USU_CLIENTE),
COD_TARJETA CHAR(9) REFERENCES TB_TARJETA (COD_TARJETA),
CONSTRAINT PK_CLIENTE_TARJETA PRIMARY KEY(USU_CLIENTE,COD_TARJETA)
)
GO

IF OBJECT_ID ('TG_CLIENTE_TARJETA') IS NOT NULL
BEGIN
	DROP TRIGGER TG_CLIENTE_TARJETA
END
GO

CREATE TRIGGER TG_CLIENTE_TARJETA
ON TB_CLIENTE_TARJETA
FOR INSERT
AS
BEGIN
DECLARE @TARJETA CHAR(9) = (SELECT COD_TARJETA FROM inserted)
	IF EXISTS (SELECT * FROM inserted)
		BEGIN
			IF((SELECT ESTADO_TARJETA FROM TB_TARJETA WHERE COD_TARJETA=@TARJETA)='Inactiva')
			BEGIN
				RAISERROR ('Esta tarjeta no ha sido emitida', 16, 1)
				ROLLBACK TRANSACTION
				RETURN
			END
		END
END
GO

INSERT INTO TB_CLIENTE_TARJETA VALUES ('lucianocar','100000000')
GO
INSERT INTO TB_CLIENTE_TARJETA VALUES ('lucianocar','100000001')
GO
INSERT INTO TB_CLIENTE_TARJETA VALUES ('rubenbec','100000002')
GO
INSERT INTO TB_CLIENTE_TARJETA VALUES ('rubenbec','100000003')
GO

SELECT c.USU_CLIENTE, c.COD_TARJETA, t.SALDO_TARJETA 
FROM TB_CLIENTE_TARJETA c 
join TB_TARJETA t on c.COD_TARJETA = t.COD_TARJETA
WHERE USU_CLIENTE='lucianocar'

/*---------------------------------------------------PROCEDIMIENTOS ALMACENADOS------------------------------------------------------*/

IF OBJECT_ID ('SP_LOGEAR') IS NOT NULL
BEGIN
	DROP PROC SP_LOGEAR
END
GO

CREATE PROC SP_LOGEAR (@USU AS VARCHAR(12), @PASS AS VARCHAR(12))
AS
BEGIN
SELECT * FROM TB_CLIENTE WHERE USU_CLIENTE=@USU AND PASS_CLIENTE=@PASS AND ESTADO=1
END
GO

EXEC SP_LOGEAR 'milagros12','12346578'
GO

delete from TB_CLIENTE where USU_CLIENTE='a'

select * from TB_OPERACION
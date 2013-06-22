/*
SQLyog Community v8.71 
MySQL - 5.1.40-community : Database - asistencia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`asistencia` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `asistencia`;

/*Table structure for table `cargadocente` */

DROP TABLE IF EXISTS `cargadocente`;

CREATE TABLE `cargadocente` (
  `cargadocenteid` varchar(20) NOT NULL,
  `cursoid` varchar(20) NOT NULL,
  `periodoid` varchar(20) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `fechaalta` varchar(20) NOT NULL,
  `grupoid` varchar(20) NOT NULL,
  `docenteid` varchar(20) NOT NULL,
  PRIMARY KEY (`cargadocenteid`),
  KEY `periodo_cargadocente_fk` (`periodoid`),
  KEY `curso_cargadocente_fk` (`cursoid`),
  KEY `ciclo_cargadocente_fk` (`grupoid`),
  KEY `docente_cargadocente_fk` (`docenteid`),
  CONSTRAINT `docente_cargadocente_fk` FOREIGN KEY (`docenteid`) REFERENCES `docente` (`docenteid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ciclo_cargadocente_fk` FOREIGN KEY (`grupoid`) REFERENCES `grupo` (`grupoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `curso_cargadocente_fk` FOREIGN KEY (`cursoid`) REFERENCES `curso` (`cursoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `periodo_cargadocente_fk` FOREIGN KEY (`periodoid`) REFERENCES `periodo` (`periodoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cargadocente` */

LOCK TABLES `cargadocente` WRITE;

insert  into `cargadocente`(`cargadocenteid`,`cursoid`,`periodoid`,`estado`,`fechaalta`,`grupoid`,`docenteid`) values ('20130304CAD001','CUR001','PER001','1','2013-02-28 18:08:46','GRU001','DOC002'),('20130304CAD002','CUR002','PER001','1','2013-02-28 18:39:46','GRU002','DOC003'),('20130304CAD003','CUR004','PER001','1','2013-03-03 00:00:00','GRU007','DOC006'),('20130304CAD004','CUR003','PER002','1','2013-03-03 00:05:28','GRU004','DOC001');

UNLOCK TABLES;

/*Table structure for table `cargahorario` */

DROP TABLE IF EXISTS `cargahorario`;

CREATE TABLE `cargahorario` (
  `cargahorarioid` varchar(20) NOT NULL,
  `cargasalonid` varchar(20) NOT NULL,
  `fechaid` varchar(20) NOT NULL,
  `horasid` varchar(20) NOT NULL,
  PRIMARY KEY (`cargahorarioid`),
  KEY `fecha_cargahorario_fk` (`fechaid`),
  KEY `horas_cargahorario_fk` (`horasid`),
  KEY `cargasalon_cargahorario_fk` (`cargasalonid`),
  CONSTRAINT `cargasalon_cargahorario_fk` FOREIGN KEY (`cargasalonid`) REFERENCES `cargasalon` (`cargasalonid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fecha_cargahorario_fk` FOREIGN KEY (`fechaid`) REFERENCES `fecha` (`fechaid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `horas_cargahorario_fk` FOREIGN KEY (`horasid`) REFERENCES `horas` (`horasid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cargahorario` */

LOCK TABLES `cargahorario` WRITE;

UNLOCK TABLES;

/*Table structure for table `cargasalon` */

DROP TABLE IF EXISTS `cargasalon`;

CREATE TABLE `cargasalon` (
  `cargasalonid` varchar(20) NOT NULL,
  `cargadocenteid` varchar(20) NOT NULL,
  `salonid` varchar(20) NOT NULL,
  PRIMARY KEY (`cargasalonid`),
  KEY `salon_cargasalon_fk` (`salonid`),
  KEY `cargadocente_cargasalon_fk` (`cargadocenteid`),
  CONSTRAINT `cargadocente_cargasalon_fk` FOREIGN KEY (`cargadocenteid`) REFERENCES `cargadocente` (`cargadocenteid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `salon_cargasalon_fk` FOREIGN KEY (`salonid`) REFERENCES `salon` (`salonid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cargasalon` */

LOCK TABLES `cargasalon` WRITE;

UNLOCK TABLES;

/*Table structure for table `carrera` */

DROP TABLE IF EXISTS `carrera`;

CREATE TABLE `carrera` (
  `carreraid` varchar(20) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `facultadid` varchar(20) NOT NULL,
  PRIMARY KEY (`carreraid`),
  KEY `facultad_carrera_fk` (`facultadid`),
  CONSTRAINT `facultad_carrera_fk` FOREIGN KEY (`facultadid`) REFERENCES `facultad` (`facultadid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `carrera` */

LOCK TABLES `carrera` WRITE;

insert  into `carrera`(`carreraid`,`nombre`,`facultadid`) values ('CAR001','Ingenieria de Sistemas','FAC001'),('CAR002','Ingeniria Civil','FAC001'),('CAR003','Ingenieria de Alimentos','FAC001'),('CAR004','Psicologia','FAC003'),('CAR005','Enfermeria','FAC003'),('CAR006','Contabiliad','FAC002'),('CAR007','Administracon y negocios Internacionales','FAC002'),('CAR008','Educacion Inicial y puericultura','FAC004'),('CAR009','Educacacion Secundaria','FAC004'),('CAR010','Educacion Primaria','FAC004'),('CAR011','Linguistica e Ingles','FAC004'),('CAR012','Ingenieria Ambiental','FAC004');

UNLOCK TABLES;

/*Table structure for table `controlasistencia` */

DROP TABLE IF EXISTS `controlasistencia`;

CREATE TABLE `controlasistencia` (
  `controlasistenciaid` varchar(20) NOT NULL,
  `horaingreso` varchar(20) NOT NULL,
  `cargahorarioid` varchar(20) NOT NULL,
  `encargadoid` varchar(20) NOT NULL,
  PRIMARY KEY (`controlasistenciaid`),
  KEY `encargado_controlasistencia_fk` (`encargadoid`),
  KEY `cargahorario_controlasistencia_fk` (`cargahorarioid`),
  CONSTRAINT `cargahorario_controlasistencia_fk` FOREIGN KEY (`cargahorarioid`) REFERENCES `cargahorario` (`cargahorarioid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `encargado_controlasistencia_fk` FOREIGN KEY (`encargadoid`) REFERENCES `encargado` (`encargadoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `controlasistencia` */

LOCK TABLES `controlasistencia` WRITE;

UNLOCK TABLES;

/*Table structure for table `curso` */

DROP TABLE IF EXISTS `curso`;

CREATE TABLE `curso` (
  `cursoid` varchar(20) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `numcredito` varchar(10) NOT NULL,
  `numhoras` varchar(10) NOT NULL,
  `categoria` varchar(30) DEFAULT NULL,
  `nombre` varchar(60) NOT NULL,
  `carreraid` varchar(20) NOT NULL,
  PRIMARY KEY (`cursoid`),
  KEY `carrera_curso_fk` (`carreraid`),
  CONSTRAINT `carrera_curso_fk` FOREIGN KEY (`carreraid`) REFERENCES `carrera` (`carreraid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `curso` */

LOCK TABLES `curso` WRITE;

insert  into `curso`(`cursoid`,`codigo`,`numcredito`,`numhoras`,`categoria`,`nombre`,`carreraid`) values ('CUR001','C001','4','4','Regular','Matematica Basica','CAR001'),('CUR002','C002','4','4','Regular','Calculo II','CAR001'),('CUR003','c003','3','3','Regular','Estudio de Suelos','CAR002'),('CUR004','c004','2','2','Regular','Estadistica General','CAR006');

UNLOCK TABLES;

/*Table structure for table `docente` */

DROP TABLE IF EXISTS `docente`;

CREATE TABLE `docente` (
  `docenteid` varchar(20) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `fechanac` varchar(20) DEFAULT NULL,
  `numcelular` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `sexo` varchar(15) NOT NULL,
  `gradoac` varchar(50) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`docenteid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `docente` */

LOCK TABLES `docente` WRITE;

insert  into `docente`(`docenteid`,`nombres`,`apellidos`,`fechanac`,`numcelular`,`email`,`sexo`,`gradoac`,`dni`,`estado`) values ('DOC001','Angel Abel','Sullon Macalapu','10-02-1980','93456874','angel@gmail.com','M','Ing','12345678','1'),('DOC002','Abel','Huanca Torres','10-02-1990','93####','abel@gmail.com','M','Ing','12345678','1'),('DOC003','Nancy esther','Casildo Obredon','10-02-1983','934####','Nancy_esther@gmail.com','F','Ing','12345678','1'),('DOC004','Carlos ','Tuco Coaquira','10-02-1979','934####','Caarlitos@gmail.com','M','Lic.','12345678','1'),('DOC005','Leonel','Chahuares','10-02-1989','934####','Leonel_C@gmail.com','M','Ing.','12345678','1'),('DOC006','Mariana','Taipe Ruelas','18-03-1990','945####','mary_cch@gmail.es','F','Doc.','12345678','1');

UNLOCK TABLES;

/*Table structure for table `encargado` */

DROP TABLE IF EXISTS `encargado`;

CREATE TABLE `encargado` (
  `encargadoid` varchar(20) NOT NULL,
  `numtel` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`encargadoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `encargado` */

LOCK TABLES `encargado` WRITE;

insert  into `encargado`(`encargadoid`,`numtel`,`email`,`apellidos`,`nombre`) values ('ENC001','95-------','Ronnie@gmail.com','Rodriguez','Ronnie'),('ENC002','91-------','David@upeu.edu','Mamani','Pari');

UNLOCK TABLES;

/*Table structure for table `facultad` */

DROP TABLE IF EXISTS `facultad`;

CREATE TABLE `facultad` (
  `facultadid` varchar(20) NOT NULL,
  `numtel` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`facultadid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `facultad` */

LOCK TABLES `facultad` WRITE;

insert  into `facultad`(`facultadid`,`numtel`,`nombre`) values ('FAC001','51####','Facultad de Ingeneria y aquitectura'),('FAC002','51###','Facultad de Ciencias Empresariales'),('FAC003','51####','Facultad de Ciencias de la Salud'),('FAC004','51####','Facultad De Ciencia de la Educacion');

UNLOCK TABLES;

/*Table structure for table `fecha` */

DROP TABLE IF EXISTS `fecha`;

CREATE TABLE `fecha` (
  `fechaid` varchar(20) NOT NULL,
  `dia` varchar(15) NOT NULL,
  `fecha` varchar(15) NOT NULL,
  PRIMARY KEY (`fechaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fecha` */

LOCK TABLES `fecha` WRITE;

UNLOCK TABLES;

/*Table structure for table `grupo` */

DROP TABLE IF EXISTS `grupo`;

CREATE TABLE `grupo` (
  `grupoid` varchar(20) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `ciclo` varchar(20) NOT NULL,
  `carreraid` varchar(20) NOT NULL,
  PRIMARY KEY (`grupoid`),
  KEY `carrera_ciclo_fk` (`carreraid`),
  CONSTRAINT `carrera_ciclo_fk` FOREIGN KEY (`carreraid`) REFERENCES `carrera` (`carreraid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grupo` */

LOCK TABLES `grupo` WRITE;

insert  into `grupo`(`grupoid`,`nombre`,`ciclo`,`carreraid`) values ('GRU001','A','I','CAR001'),('GRU002','B','I','CAR001'),('GRU003','A','I','CAR002'),('GRU004','B','I','CAR002'),('GRU005','C','I','CAR002'),('GRU006','A','I','CAR004'),('GRU007','A','III','CAR006');

UNLOCK TABLES;

/*Table structure for table `horas` */

DROP TABLE IF EXISTS `horas`;

CREATE TABLE `horas` (
  `horasid` varchar(20) NOT NULL,
  `horainicio` varchar(20) NOT NULL,
  `nomhora` varchar(20) NOT NULL,
  `turnoid` varchar(20) NOT NULL,
  `horafinal` varchar(10) NOT NULL,
  PRIMARY KEY (`horasid`),
  KEY `turno_horas_fk` (`turnoid`),
  CONSTRAINT `turno_horas_fk` FOREIGN KEY (`turnoid`) REFERENCES `turno` (`turnoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `horas` */

LOCK TABLES `horas` WRITE;

UNLOCK TABLES;

/*Table structure for table `observacion` */

DROP TABLE IF EXISTS `observacion`;

CREATE TABLE `observacion` (
  `observacionid` varchar(20) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `prioridadid` varchar(20) NOT NULL,
  `controlasistenciaid` varchar(20) NOT NULL,
  PRIMARY KEY (`observacionid`),
  KEY `prioridad_observacion_fk` (`prioridadid`),
  KEY `controlasistencia_observacion_fk` (`controlasistenciaid`),
  CONSTRAINT `controlasistencia_observacion_fk` FOREIGN KEY (`controlasistenciaid`) REFERENCES `controlasistencia` (`controlasistenciaid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prioridad_observacion_fk` FOREIGN KEY (`prioridadid`) REFERENCES `prioridad` (`prioridadid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `observacion` */

LOCK TABLES `observacion` WRITE;

UNLOCK TABLES;

/*Table structure for table `pabellon` */

DROP TABLE IF EXISTS `pabellon`;

CREATE TABLE `pabellon` (
  `pabellonid` varchar(20) NOT NULL,
  `nompabellon` varchar(30) NOT NULL,
  PRIMARY KEY (`pabellonid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pabellon` */

LOCK TABLES `pabellon` WRITE;

insert  into `pabellon`(`pabellonid`,`nompabellon`) values ('PAB001','F.I.A'),('PAB002','C.I.M.P.R.E'),('PAB003','F.A.C.I.H.E.D'),('PAB004','C.A.T'),('PAB005','Enfermeria');

UNLOCK TABLES;

/*Table structure for table `periodo` */

DROP TABLE IF EXISTS `periodo`;

CREATE TABLE `periodo` (
  `periodoid` varchar(20) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `fechafin` varchar(20) NOT NULL,
  `fechainicio` varchar(20) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`periodoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `periodo` */

LOCK TABLES `periodo` WRITE;

insert  into `periodo`(`periodoid`,`nombre`,`fechafin`,`fechainicio`,`estado`) values ('PER001','2013-1','28-06-2013','03-03-2013','1'),('PER002','2013-2','03-12-2013','02-08-2013','0');

UNLOCK TABLES;

/*Table structure for table `prioridad` */

DROP TABLE IF EXISTS `prioridad`;

CREATE TABLE `prioridad` (
  `prioridadid` varchar(20) NOT NULL,
  `nomprioridad` varchar(20) NOT NULL,
  PRIMARY KEY (`prioridadid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prioridad` */

LOCK TABLES `prioridad` WRITE;

insert  into `prioridad`(`prioridadid`,`nomprioridad`) values ('PRI001','Alta'),('PRI002','Media'),('PRI003','Baja');

UNLOCK TABLES;

/*Table structure for table `salon` */

DROP TABLE IF EXISTS `salon`;

CREATE TABLE `salon` (
  `salonid` varchar(20) NOT NULL,
  `nomsalon` varchar(10) NOT NULL,
  `pabellonid` varchar(20) NOT NULL,
  PRIMARY KEY (`salonid`),
  KEY `pabellon_salon_fk` (`pabellonid`),
  CONSTRAINT `pabellon_salon_fk` FOREIGN KEY (`pabellonid`) REFERENCES `pabellon` (`pabellonid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `salon` */

LOCK TABLES `salon` WRITE;

insert  into `salon`(`salonid`,`nomsalon`,`pabellonid`) values ('SAL001','I-201','PAB001'),('SAL002','C-104','PAB002'),('SAL003','I-202','PAB001'),('SAL004','I-203','PAB001');

UNLOCK TABLES;

/*Table structure for table `turno` */

DROP TABLE IF EXISTS `turno`;

CREATE TABLE `turno` (
  `turnoid` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`turnoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `turno` */

LOCK TABLES `turno` WRITE;

UNLOCK TABLES;

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `usuarioid` varchar(20) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `pagina` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `encargadoid` varchar(20) NOT NULL,
  PRIMARY KEY (`usuarioid`),
  KEY `encargado_usuario_fk` (`encargadoid`),
  CONSTRAINT `encargado_usuario_fk` FOREIGN KEY (`encargadoid`) REFERENCES `encargado` (`encargadoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

LOCK TABLES `usuario` WRITE;

insert  into `usuario`(`usuarioid`,`foto`,`clave`,`pagina`,`alias`,`encargadoid`) values ('USU001','https://secure.gravatar.com/avatar/62630bde2748f6ff1416f88652d420f5?s=420&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png','123','modulos/administrador/indexFrame.jsp','admin','ENC002'),('USU002','http://www.mastermagazine.info/termino/wp-content/uploads/Usuario-Icono.jpg','123','modulos/encargado/indexFrame.jsp','customer','ENC001');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

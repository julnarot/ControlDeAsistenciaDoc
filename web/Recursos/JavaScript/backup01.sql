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
  `cargadocenteid` varchar(10) NOT NULL,
  `cursoid` varchar(10) NOT NULL,
  `periodoid` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `fechaalta` varchar(20) NOT NULL,
  `cicloid` varchar(10) NOT NULL,
  `docenteid` varchar(10) NOT NULL,
  PRIMARY KEY (`cargadocenteid`),
  KEY `periodo_cargadocente_fk` (`periodoid`),
  KEY `curso_cargadocente_fk` (`cursoid`),
  KEY `ciclo_cargadocente_fk` (`cicloid`),
  KEY `docente_cargadocente_fk` (`docenteid`),
  CONSTRAINT `ciclo_cargadocente_fk` FOREIGN KEY (`cicloid`) REFERENCES `ciclo` (`cicloid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `curso_cargadocente_fk` FOREIGN KEY (`cursoid`) REFERENCES `curso` (`cursoid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `docente_cargadocente_fk` FOREIGN KEY (`docenteid`) REFERENCES `docente` (`docenteid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `periodo_cargadocente_fk` FOREIGN KEY (`periodoid`) REFERENCES `periodo` (`periodoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cargadocente` */

insert  into `cargadocente`(`cargadocenteid`,`cursoid`,`periodoid`,`estado`,`fechaalta`,`cicloid`,`docenteid`) values ('CARDOC001','CUR001','PER001','1','2013-02-21 10:13:49','CIC001','DOC004'),('CARDOC002','CUR002','PER001','1','2013-02-21 10:15:42','CIC003','DOC004'),('CARDOC003','CUR003','PER001','1','2013-02-21 10:17:43','CIC005','DOC005'),('CARDOC008','CUR001','PER001','1','2013-02-25 11:25:25','CIC001','DOC004');

/*Table structure for table `cargahorario` */

DROP TABLE IF EXISTS `cargahorario`;

CREATE TABLE `cargahorario` (
  `cargahorarioid` varchar(25) NOT NULL,
  `cargasalonid` varchar(10) NOT NULL,
  `fechaid` varchar(30) NOT NULL,
  `horasid` varchar(30) NOT NULL,
  PRIMARY KEY (`cargahorarioid`),
  KEY `fecha_cargahorario_fk` (`fechaid`),
  KEY `horas_cargahorario_fk` (`horasid`),
  KEY `cargasalon_cargahorario_fk` (`cargasalonid`),
  CONSTRAINT `cargasalon_cargahorario_fk` FOREIGN KEY (`cargasalonid`) REFERENCES `cargasalon` (`cargasalonid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fecha_cargahorario_fk` FOREIGN KEY (`fechaid`) REFERENCES `fecha` (`fechaid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `horas_cargahorario_fk` FOREIGN KEY (`horasid`) REFERENCES `horas` (`horasid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cargahorario` */

/*Table structure for table `cargasalon` */

DROP TABLE IF EXISTS `cargasalon`;

CREATE TABLE `cargasalon` (
  `cargasalonid` varchar(10) NOT NULL,
  `cargadocenteid` varchar(10) NOT NULL,
  `salonid` varchar(10) NOT NULL,
  PRIMARY KEY (`cargasalonid`),
  KEY `salon_cargasalon_fk` (`salonid`),
  KEY `cargadocente_cargasalon_fk` (`cargadocenteid`),
  CONSTRAINT `cargadocente_cargasalon_fk` FOREIGN KEY (`cargadocenteid`) REFERENCES `cargadocente` (`cargadocenteid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `salon_cargasalon_fk` FOREIGN KEY (`salonid`) REFERENCES `salon` (`salonid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cargasalon` */

/*Table structure for table `carrera` */

DROP TABLE IF EXISTS `carrera`;

CREATE TABLE `carrera` (
  `carreraid` varchar(10) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `facultadid` varchar(10) NOT NULL,
  PRIMARY KEY (`carreraid`),
  KEY `facultad_carrera_fk` (`facultadid`),
  CONSTRAINT `facultad_carrera_fk` FOREIGN KEY (`facultadid`) REFERENCES `facultad` (`facultadid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `carrera` */

insert  into `carrera`(`carreraid`,`nombre`,`facultadid`) values ('CAR001','Ingenieria de Sistemas','FAC001'),('CAR002','Ingeniria Civil','FAC001'),('CAR003','Ingenieria de Alimentos','FAC001'),('CAR004','Psicologia','FAC003');

/*Table structure for table `ciclo` */

DROP TABLE IF EXISTS `ciclo`;

CREATE TABLE `ciclo` (
  `cicloid` varchar(10) NOT NULL,
  `grupo` varchar(30) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `carreraid` varchar(10) NOT NULL,
  PRIMARY KEY (`cicloid`),
  KEY `carrera_ciclo_fk` (`carreraid`),
  CONSTRAINT `carrera_ciclo_fk` FOREIGN KEY (`carreraid`) REFERENCES `carrera` (`carreraid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ciclo` */

insert  into `ciclo`(`cicloid`,`grupo`,`nombre`,`carreraid`) values ('CIC001','A','I','CAR001'),('CIC002','B','I','CAR001'),('CIC003','C','I','CAR003'),('CIC004','A','III','CAR003'),('CIC005','A','V','CAR002'),('CIC006','A','IX','CAR004');

/*Table structure for table `controlasistencia` */

DROP TABLE IF EXISTS `controlasistencia`;

CREATE TABLE `controlasistencia` (
  `controlasistenciaid` varchar(10) NOT NULL,
  `horaingreso` varchar(20) NOT NULL,
  `cargahorarioid` varchar(25) NOT NULL,
  `encargadoid` varchar(10) NOT NULL,
  PRIMARY KEY (`controlasistenciaid`),
  KEY `encargado_controlasistencia_fk` (`encargadoid`),
  KEY `cargahorario_controlasistencia_fk` (`cargahorarioid`),
  CONSTRAINT `cargahorario_controlasistencia_fk` FOREIGN KEY (`cargahorarioid`) REFERENCES `cargahorario` (`cargahorarioid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `encargado_controlasistencia_fk` FOREIGN KEY (`encargadoid`) REFERENCES `encargado` (`encargadoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `controlasistencia` */

/*Table structure for table `curso` */

DROP TABLE IF EXISTS `curso`;

CREATE TABLE `curso` (
  `cursoid` varchar(10) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `numcredito` varchar(10) NOT NULL,
  `numhoras` varchar(10) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `carreraid` varchar(10) NOT NULL,
  PRIMARY KEY (`cursoid`),
  KEY `carrera_curso_fk` (`carreraid`),
  CONSTRAINT `carrera_curso_fk` FOREIGN KEY (`carreraid`) REFERENCES `carrera` (`carreraid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `curso` */

insert  into `curso`(`cursoid`,`codigo`,`numcredito`,`numhoras`,`nombre`,`categoria`,`carreraid`) values ('CUR001','C001','4','4','Matematica Basica','Regular','CAR001'),('CUR002','C002','4','4','Calculo II','Regular','CAR001'),('CUR003','c003','3','3','Estudio de Suelos','Regular','CAR002');

/*Table structure for table `docente` */

DROP TABLE IF EXISTS `docente`;

CREATE TABLE `docente` (
  `docenteid` varchar(10) NOT NULL,
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

insert  into `docente`(`docenteid`,`nombres`,`apellidos`,`fechanac`,`numcelular`,`email`,`sexo`,`gradoac`,`dni`,`estado`) values ('DOC0001','Angel Abel','Sullon Macalapu','10-02-1980','93456874','angel@gmail.com','','Ing','12345678','1'),('DOC0002','Abel','Huanca Torres','10-02-1990','93####','abel@gmail.com','','Ing','12345678','1'),('DOC0003','Nancy esther','Casildo Obredon','10-02-1983','934####','Nancy_esther@gmail.com','','Ing','12345678','1'),('DOC0004','Carlos ','Tuco Coaquira','10-02-1979','934####','Caarlitos@gmail.com','','Lic.','12345678','1'),('DOC004','Carlos ','Tuco Coaquira','10-02-1979','934####','Caarlitos@gmail.com','','Lic.','12345678','1'),('DOC005','Leonel','Chahuares','10-02-1989','934####','Leonel_C@gmail.com','','Ing.','12345678','1'),('DOC010','Leonel','Chahuares','10-02-1989','934####','Leonel_C@gmail.com','','Ing.','12345678','1');

/*Table structure for table `encargado` */

DROP TABLE IF EXISTS `encargado`;

CREATE TABLE `encargado` (
  `encargadoid` varchar(10) NOT NULL,
  PRIMARY KEY (`encargadoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `encargado` */

/*Table structure for table `facultad` */

DROP TABLE IF EXISTS `facultad`;

CREATE TABLE `facultad` (
  `facultadid` varchar(10) NOT NULL,
  `numtel` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`facultadid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `facultad` */

insert  into `facultad`(`facultadid`,`numtel`,`nombre`) values ('FAC001','51####','Facultad de Ingeneri'),('FAC002','51###','Facultad de Ciencias'),('FAC003','51####','Facultad de Ciencias'),('FAC004','51####','Facultad De Ciencia '),('FAC005','4545','ciencias'),('FAC007','45645','ciencias'),('FAC008','4577745','ciencias');

/*Table structure for table `fecha` */

DROP TABLE IF EXISTS `fecha`;

CREATE TABLE `fecha` (
  `fechaid` varchar(30) NOT NULL,
  `dia` varchar(15) NOT NULL,
  `fecha` varchar(15) NOT NULL,
  PRIMARY KEY (`fechaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fecha` */

/*Table structure for table `histor-host` */

DROP TABLE IF EXISTS `histor-host`;

CREATE TABLE `histor-host` (
  `historial_id` varchar(20) NOT NULL,
  `mensaje` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`historial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `histor-host` */

insert  into `histor-host`(`historial_id`,`mensaje`) values ('01','SELECT cd.cargadocenteid,dc.gradoac,dc.nombres,dc.apellidos,cu.nombre,cu.numhoras,ci.nombre,ci.grupo,cr.nombre FROM cargadocente cd,curso cu,periodo pe,ciclo ci,docente dc,carrera cr  WHERE cu.cursoid=cd.cursoid AND pe.periodoid=cd.periodoid AND ci.cicloid=cd.cicloid AND cr.carreraid=ci.carreraid AND dc.docenteid=cd.docenteid;');

/*Table structure for table `horas` */

DROP TABLE IF EXISTS `horas`;

CREATE TABLE `horas` (
  `horasid` varchar(30) NOT NULL,
  `horainicio` varchar(10) NOT NULL,
  `nomhora` varchar(20) NOT NULL,
  `turnoid` varchar(10) NOT NULL,
  `horafinal` varchar(10) NOT NULL,
  PRIMARY KEY (`horasid`),
  KEY `turno_horas_fk` (`turnoid`),
  CONSTRAINT `turno_horas_fk` FOREIGN KEY (`turnoid`) REFERENCES `turno` (`turnoid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `horas` */

/*Table structure for table `observacion` */

DROP TABLE IF EXISTS `observacion`;

CREATE TABLE `observacion` (
  `observacionid` varchar(10) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `prioridadid` varchar(30) NOT NULL,
  `controlasistenciaid` varchar(10) NOT NULL,
  PRIMARY KEY (`observacionid`),
  KEY `prioridad_observacion_fk` (`prioridadid`),
  KEY `controlasistencia_observacion_fk` (`controlasistenciaid`),
  CONSTRAINT `controlasistencia_observacion_fk` FOREIGN KEY (`controlasistenciaid`) REFERENCES `controlasistencia` (`controlasistenciaid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prioridad_observacion_fk` FOREIGN KEY (`prioridadid`) REFERENCES `prioridad` (`prioridadid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `observacion` */

/*Table structure for table `pabellon` */

DROP TABLE IF EXISTS `pabellon`;

CREATE TABLE `pabellon` (
  `pabellonid` varchar(25) NOT NULL,
  PRIMARY KEY (`pabellonid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pabellon` */

/*Table structure for table `periodo` */

DROP TABLE IF EXISTS `periodo`;

CREATE TABLE `periodo` (
  `periodoid` varchar(10) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `fechafin` varchar(20) NOT NULL,
  `fechainicio` varchar(20) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`periodoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `periodo` */

insert  into `periodo`(`periodoid`,`nombre`,`fechafin`,`fechainicio`,`estado`) values ('PER001','2013-1','28-06-2013','03-03-2013','1'),('PER002','2013-2','03-12-2013','02-08-2013','1');

/*Table structure for table `prioridad` */

DROP TABLE IF EXISTS `prioridad`;

CREATE TABLE `prioridad` (
  `prioridadid` varchar(30) NOT NULL,
  `nomprioridad` varchar(20) NOT NULL,
  PRIMARY KEY (`prioridadid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prioridad` */

/*Table structure for table `salon` */

DROP TABLE IF EXISTS `salon`;

CREATE TABLE `salon` (
  `salonid` varchar(10) NOT NULL,
  `nomsalon` varchar(10) NOT NULL,
  `pabellonid` varchar(25) NOT NULL,
  PRIMARY KEY (`salonid`),
  KEY `pabellon_salon_fk` (`pabellonid`),
  CONSTRAINT `pabellon_salon_fk` FOREIGN KEY (`pabellonid`) REFERENCES `pabellon` (`pabellonid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `salon` */

/*Table structure for table `turno` */

DROP TABLE IF EXISTS `turno`;

CREATE TABLE `turno` (
  `turnoid` varchar(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`turnoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `turno` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

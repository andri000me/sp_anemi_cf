/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.16 : Database - db_pakar_anemia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `tb_admin` */

DROP TABLE IF EXISTS `tb_admin`;

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nm_admin` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tb_admin` */

insert  into `tb_admin`(`id_admin`,`nm_admin`,`username`,`password`,`no_telp`,`jk`) values (2,'Nama Ubah','userubah','pass ubah','12312321','L'),(3,'1','1','1','1','L');

/*Table structure for table `tb_bobot` */

DROP TABLE IF EXISTS `tb_bobot`;

CREATE TABLE `tb_bobot` (
  `id_bobot` int(11) NOT NULL AUTO_INCREMENT,
  `id_gejala` char(3) DEFAULT NULL,
  `id_penyakit` char(3) DEFAULT NULL,
  `bobot` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_bobot`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tb_bobot` */

insert  into `tb_bobot`(`id_bobot`,`id_gejala`,`id_penyakit`,`bobot`) values (4,'G02','P01',0.00),(5,'G04','P01',0.60);

/*Table structure for table `tb_cf` */

DROP TABLE IF EXISTS `tb_cf`;

CREATE TABLE `tb_cf` (
  `id_cf` int(11) NOT NULL AUTO_INCREMENT,
  `nm_cf` varchar(30) DEFAULT NULL,
  `nilai_cf` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_cf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tb_cf` */

insert  into `tb_cf`(`id_cf`,`nm_cf`,`nilai_cf`) values (1,'Tidak yakin',0.00),(2,'Sedikit Yakin',0.40),(3,'Cukup Yakin',0.60),(4,'Yakin',0.80),(5,'Sangat Yakin',1.00);

/*Table structure for table `tb_diagnosa` */

DROP TABLE IF EXISTS `tb_diagnosa`;

CREATE TABLE `tb_diagnosa` (
  `id_diagnosa` char(6) NOT NULL,
  `id_pasien` char(6) DEFAULT NULL,
  `tgl_diag` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_diagnosa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_diagnosa` */

/*Table structure for table `tb_gejala` */

DROP TABLE IF EXISTS `tb_gejala`;

CREATE TABLE `tb_gejala` (
  `id_gejala` char(3) NOT NULL,
  `nm_gejala` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_gejala`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_gejala` */

insert  into `tb_gejala`(`id_gejala`,`nm_gejala`) values ('G02','Sakt kepala'),('G03','Nyeri pada dada'),('G04','Demam');

/*Table structure for table `tb_hasil` */

DROP TABLE IF EXISTS `tb_hasil`;

CREATE TABLE `tb_hasil` (
  `id_hasil` int(11) NOT NULL AUTO_INCREMENT,
  `id_penyakit` char(6) DEFAULT NULL,
  `id_diagnosa` char(6) DEFAULT NULL,
  `nilai_cf` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`id_hasil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_hasil` */

/*Table structure for table `tb_pasien` */

DROP TABLE IF EXISTS `tb_pasien`;

CREATE TABLE `tb_pasien` (
  `id_pasien` char(6) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `usia` int(11) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `alamat` text,
  `no_telp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_pasien` */

/*Table structure for table `tb_penyakit` */

DROP TABLE IF EXISTS `tb_penyakit`;

CREATE TABLE `tb_penyakit` (
  `id_penyakit` char(3) NOT NULL,
  `nama_penyakit` varchar(100) DEFAULT NULL,
  `definisi` text,
  `pengobatan` text,
  PRIMARY KEY (`id_penyakit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_penyakit` */

insert  into `tb_penyakit`(`id_penyakit`,`nama_penyakit`,`definisi`,`pengobatan`) values ('P01','Anemia Aplastik  1','',''),('P02','Anemia Defisiensi Zat Besi','Anemia Defisiensi Zat Besi','Anemia Defisiensi Zat Besi'),('P03','Anemia Kronis','Anemia Kronis','Anemia Kronis');

/*Table structure for table `tb_periksa` */

DROP TABLE IF EXISTS `tb_periksa`;

CREATE TABLE `tb_periksa` (
  `id_periksa` int(11) NOT NULL AUTO_INCREMENT,
  `id_gejala` char(6) DEFAULT NULL,
  `id_diagnosa` char(6) DEFAULT NULL,
  `nilai` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_periksa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_periksa` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

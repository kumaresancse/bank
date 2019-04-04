/*
SQLyog Community v8.4 RC2
MySQL - 5.0.15-nt : Database - transaction
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`transaction` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `transaction`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `accno` varchar(30) default NULL,
  `cardno` varchar(30) default NULL,
  `fingerid` varchar(30) default NULL,
  `otp` varchar(20) default NULL,
  `amount` varchar(100) NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `account` */

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `sender` varchar(50) default NULL,
  `receiver` varchar(50) default NULL,
  `amount` varchar(100) default NULL,
  `time` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaction` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `firstname` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `dob` varchar(20) default NULL,
  `gender` varchar(20) default NULL,
  `address` varchar(50) default NULL,
  `mobile` varchar(20) default NULL,
  `email` varchar(50) default NULL,
  `account` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

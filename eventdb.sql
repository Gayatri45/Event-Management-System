/*
SQLyog Community v13.1.8 (64 bit)
MySQL - 5.7.43-log : Database - event
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`event` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `event`;

/*Table structure for table `attendee` */

DROP TABLE IF EXISTS `attendee`;

CREATE TABLE `attendee` (
  `attendee_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `attendee_approval_status` int(11) NOT NULL,
  `attendee_login_access` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `payment` int(11) NOT NULL,
  `phone_no` bigint(20) NOT NULL,
  `review` int(11) NOT NULL,
  `category_category_id` int(11) DEFAULT NULL,
  `event_event_id` int(11) DEFAULT NULL,
  `venue_venue_id` int(11) DEFAULT NULL,
  `attendee_code` varchar(255) DEFAULT NULL,
  `qr_code_image_name` varchar(255) DEFAULT NULL,
  `qr_code_image_original_name` varchar(255) DEFAULT NULL,
  `update_attendee` int(11) NOT NULL,
  PRIMARY KEY (`attendee_id`),
  KEY `FK2fyff0x1rpom6v0h4r9e1n0b6` (`category_category_id`),
  KEY `FK4dhdm6bhekfcgqsd6x4t7s2h9` (`event_event_id`),
  KEY `FKnciejlt14ut4oqme0j53bijgt` (`venue_venue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `attendee` */

insert  into `attendee`(`attendee_id`,`address`,`attendee_approval_status`,`attendee_login_access`,`branch_id`,`branch_name`,`company_id`,`company_name`,`dob`,`email`,`first_name`,`gender`,`last_name`,`payment`,`phone_no`,`review`,`category_category_id`,`event_event_id`,`venue_venue_id`,`attendee_code`,`qr_code_image_name`,`qr_code_image_original_name`,`update_attendee`) values 
(320,'Delhi',2,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2004-02-11','gayatri251101@gmail.com','Mansi','Female','Kumari',0,7537538694,0,10,318,52,'apCxbX','xYF115AnnualFunction9.0apCxbXapCxbXqrcode.png','apCxbXqrcode.png',0),
(397,'',2,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-04-26','admin@gmail.com','Dhyneshwar','Male','Shrivasta',0,7539518524,0,10,318,52,'nOlmfG','WJ7115AnnualFunction9.0nOlmfGnOlmfGqrcode.png','nOlmfGqrcode.png',0),
(398,'Delhi',2,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-04-26','gk161897@gmail.com','Amit','Male','Shrivasta',0,7537538694,0,11,317,52,'HhZgc3','Ccv115CompanyInaugrationHhZgc3HhZgc3qrcode.png','HhZgc3qrcode.png',0),
(409,'',2,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-04-26','gayatri251101@gmail.com','Aniket','Male','Mishra',0,7250733333,0,16,299,49,'JTJFvw','uQd115DurgaPoojaKalyaniPandalMahotsavJTJFvwJTJFvwqrcode.png','JTJFvwqrcode.png',0),
(410,'',2,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-04-26','gk161897@gmail.com','Suman','Female','Shrivasta',0,7250733333,0,16,299,49,'rI9vsX','7WB115DurgaPoojaKalyaniPandalMahotsavrI9vsXrI9vsXqrcode.png','rI9vsXqrcode.png',0),
(411,'',2,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-04-26','gayatri.kumari@codeitsoft.com','Sanjeev','Male','Yadav',0,8888567567,0,16,299,49,'DBl2xa','3o2115DurgaPoojaKalyaniPandalMahotsavDBl2xaDBl2xaqrcode.png','DBl2xaqrcode.png',0),
(430,'',2,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-04-26','gayatri.kumari@codeitsoft.com','Saket','Male','Yadav',0,8888567567,0,16,316,51,'WI3wzE','4MK115HoliRangMela3.9WI3wzEWI3wzEqrcode.png','WI3wzEqrcode.png',0),
(452,'Gurugram',2,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-04-29','gayatri.kumari@codeitsoft.com','Sumit','Male','Kumar',0,8768788888,0,16,316,51,'cHabPk','PON115HoliRangMela3.9cHabPkcHabPkqrcode.png','cHabPkqrcode.png',0),
(453,'Gurugram',2,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-04-29','gayatri.kumari@codeitsoft.com','Aniket','Male','Kumar',0,8768788888,0,16,316,51,'YoZ8Ds','6CP115HoliRangMela3.9YoZ8DsYoZ8Dsqrcode.png','YoZ8Dsqrcode.png',0),
(479,'',1,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-05-01','G344@gmail.com','Jakir','Male','Mishra',0,7250733333,0,144,478,53,'viJuIP','fu1115Risikesh3viJuIPviJuIPqrcode.png','viJuIPqrcode.png',0),
(480,'',1,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-05-01','G344@gmail.com','Suman','Male','Mishra',0,7250733333,0,144,478,53,'3hSZ0E','soF115Risikesh33hSZ0E3hSZ0Eqrcode.png','3hSZ0Eqrcode.png',0),
(481,'',2,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-05-01','gayatri251101@gmail.com','Dhyneshwar','Male','Shrivasta',0,7537538694,0,144,478,53,'PJBh3O','OJD115Risikesh3PJBh3OPJBh3Oqrcode.png','PJBh3Oqrcode.png',0),
(489,'',1,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-05-03','gayatri.kumari@codeitsoft.com','Dhyneshwar','Male','Kumar',1,7539518524,0,247,473,50,'AJc99u','0tm115Exhibition-05/May/2024AJc99uAJc99uqrcode.png','AJc99uqrcode.png',0),
(490,'',-1,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-05-03','gayatri.kumari@codeitsoft.com','Sunidhi','Female','Kumari',1,7539518524,0,247,473,50,'VoLtmf','tOA115Exhibition-05/May/2024VoLtmfVoLtmfqrcode.png','VoLtmfqrcode.png',0),
(491,'',1,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-05-03','subham09@gmail.com','Sukesh','Male','Mishra',1,7250733333,0,247,473,50,'aIhfEt','vjl115Exhibition-05/May/2024aIhfEtaIhfEtqrcode.png','aIhfEtqrcode.png',0),
(492,'',1,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-05-03','subham09@gmail.com','Sukesh','Male','Mishra',1,7250733333,0,247,473,50,'Od26t0','MRd115Exhibition-05/May/2024Od26t0Od26t0qrcode.png','Od26t0qrcode.png',0),
(493,'',1,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-05-03','gayatri251101@gmail.com','Mansi','Female','Mishra',1,7539518524,0,247,473,50,'8JJ5gf','rtG115Exhibition-05/May/20248JJ5gf8JJ5gfqrcode.png','8JJ5gfqrcode.png',0),
(494,'',-1,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-05-03','G344@gmail.com','Aniket','Male','Mishra',1,7537538694,0,247,473,50,'FycL1b','fYO115Exhibition-05/May/2024FycL1bFycL1bqrcode.png','FycL1bqrcode.png',0),
(495,'',-1,1,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','2024-05-03','G344@gmail.com','Aniket','Male','Mishra',1,7537538694,0,247,473,50,'XXtxMc','ITE115Exhibition-05/May/2024XXtxMcXXtxMcqrcode.png','XXtxMcqrcode.png',0),
(526,'',2,1,1,'Main Branch',1,'Shree Systems','2024-05-06','gayatri.kumari@codeitsoft.com','Suman','Female','Mishra',0,7250733333,0,502,525,499,'Vg7iam','dXq11CodeitEventVg7iamVg7iamqrcode.png','Vg7iamqrcode.png',0),
(519,'',-1,1,1,'Main Branch',1,'Shree Systems','2024-05-06','subham889@gmail.com','Dhyneshwar','Male','Shrivasta',0,7250733333,0,496,500,499,'JMFIDd','pDl11Exhibition-05/May/2024JMFIDdJMFIDdqrcode.png','JMFIDdqrcode.png',0),
(522,'',2,1,1,'Main Branch',1,'Shree Systems','2024-05-06','admin@gmail.com','Mansi','Female','Shrivastav',0,7250733333,0,496,500,499,'hR9Pz8','PV311Exhibition-05/May/2024hR9Pz8hR9Pz8qrcode.png','hR9Pz8qrcode.png',0),
(545,'',1,1,1,'Main Branch',1,'Shree Systems','2024-05-07','G344@gmail.com','Aniket','Male','Kumar',0,7539518524,0,502,543,524,'aJL4l2','JdW11AnnualDayaJL4l2aJL4l2qrcode.png','aJL4l2qrcode.png',0);

/*Table structure for table `attendee_log` */

DROP TABLE IF EXISTS `attendee_log`;

CREATE TABLE `attendee_log` (
  `attendee_log_id` int(11) NOT NULL,
  `attendee_log_status` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `check_in_date` varchar(255) DEFAULT NULL,
  `check_in_out_status` int(11) NOT NULL,
  `check_intime` varchar(255) DEFAULT NULL,
  `check_out_date` varchar(255) DEFAULT NULL,
  `check_out_time` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `attendee_attendee_id` int(11) DEFAULT NULL,
  `event_event_id` int(11) DEFAULT NULL,
  `stall_log_stall_log_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`attendee_log_id`),
  KEY `FKhl17suokgse5os8yiwdhfixca` (`attendee_attendee_id`),
  KEY `FKtkdy76y3slkqyeejs7ewqm9ni` (`event_event_id`),
  KEY `FKg12blktytnhatf3wyv4qdugae` (`stall_log_stall_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `attendee_log` */

insert  into `attendee_log`(`attendee_log_id`,`attendee_log_status`,`branch_id`,`branch_name`,`check_in_date`,`check_in_out_status`,`check_intime`,`check_out_date`,`check_out_time`,`company_id`,`company_name`,`attendee_attendee_id`,`event_event_id`,`stall_log_stall_log_id`) values 
(417,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-26',0,'15:05:55','2024-04-26','15:38:33',1,'Codeit Soft',410,299,421),
(416,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-26',0,'15:05:55','2024-04-26','15:38:33',1,'Codeit Soft',411,299,422),
(423,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-26',0,'15:46:56','2024-04-26','15:51:59',1,'Codeit Soft',410,299,NULL),
(424,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-26',0,'15:52:43','2024-04-26','15:52:43',1,'Codeit Soft',398,317,NULL),
(425,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-26',0,'15:52:43','2024-04-26','16:20:59',1,'Codeit Soft',411,299,426),
(427,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-26',0,'16:20:59','2024-04-26','16:43:16',1,'Codeit Soft',320,318,429),
(445,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-26',0,'17:21:58','2024-04-26','17:21:58',1,'Codeit Soft',398,317,447),
(448,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-26',0,'17:21:58','2024-04-26','17:34:13',1,'Codeit Soft',410,299,449),
(459,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-29',0,'12:59:18','2024-04-29','17:06:19',1,'Codeit Soft',453,316,466),
(461,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-29',0,'12:59:18','2024-04-29','17:03:30',1,'Codeit Soft',452,316,464),
(467,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-29',0,'17:06:50','2024-04-29','17:11:03',1,'Codeit Soft',452,316,470),
(471,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-04-30',0,'11:23:57','2024-04-30','11:25:57',1,'Codeit Soft',453,316,472),
(482,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-05-01',0,'14:58:49','2024-05-01','14:59:18',1,'Codeit Soft',481,478,NULL),
(487,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-05-02',0,'17:28:42','2024-05-02','17:28:50',1,'Codeit Soft',481,478,NULL),
(488,111,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','2024-05-02',0,'17:45:35','2024-05-02','17:45:51',1,'Codeit Soft',481,478,NULL),
(527,111,1,'Main Branch','2024-05-06',0,'16:51:42','2024-05-06','17:16:14',1,'Shree Systems',526,525,531),
(532,111,1,'Main Branch','2024-05-06',0,'17:17:11','2024-05-06','17:17:53',1,'Shree Systems',526,525,533);

/*Table structure for table `audience` */

DROP TABLE IF EXISTS `audience`;

CREATE TABLE `audience` (
  `audience_id` int(11) NOT NULL,
  `audience_name` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`audience_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `audience` */

insert  into `audience`(`audience_id`,`audience_name`,`branch_id`,`branch_name`,`company_id`,`company_name`) values 
(9,'Family',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(25,'Adults',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(26,'Children',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(27,'Group',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(28,'Youth',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(146,'Influencers',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(248,'Relatives',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(513,'Youth',1,'Main Branch',1,'Shree Systems'),
(516,'Children',1,'Main Branch',1,'Shree Systems'),
(497,'Relatives',1,'Main Branch',1,'Shree Systems'),
(512,'Family',1,'Main Branch',1,'Shree Systems'),
(395,'A',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`,`branch_id`,`branch_name`,`company_id`,`company_name`) values 
(14,'Restuarant/ Gastronomy',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(13,'Exposition',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(12,'Museum',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(11,'Conference',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(10,'Concet/Music',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(15,'Other',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(16,'Festival/Spectacles',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(17,'Cinema',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(18,'Recreation Park /Attraction',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(19,'Sports / Fitness',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(20,'Workshop / Training',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(21,'Theater',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(22,'Select Categories',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(23,'Game / Competition',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(24,'Trip / Camp',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(144,'Weeding',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(205,'Restuarant/ Gastronomy34',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(247,'Science Exhibition',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(361,'Exposition',28,'Main Branch',2,'sgnco'),
(362,'Conference',28,'Main Branch',2,'sgnco'),
(394,'A',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft'),
(450,'A',28,'Main Branch',2,'sgnco'),
(496,'Conference',1,'Main Branch',1,'Shree Systems'),
(502,'Restuarant/ Gastronomy',1,'Main Branch',1,'Shree Systems'),
(503,'Trip',1,'Main Branch',1,'Shree Systems'),
(542,'Theater',1,'Main Branch',1,'Shree Systems');

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `isd_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `country` */

/*Table structure for table `event` */

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `approval_required` int(11) NOT NULL,
  `artists` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` varchar(255) DEFAULT NULL,
  `created_date` varchar(255) DEFAULT NULL,
  `created_time` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `event_last_date` varchar(255) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `event_start_date` varchar(255) DEFAULT NULL,
  `event_url` varchar(255) DEFAULT NULL,
  `image_gallery_name` varchar(255) DEFAULT NULL,
  `image_gallery_original_name` varchar(255) DEFAULT NULL,
  `payment_gateway_required` int(11) NOT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `remove_image_gallery` int(11) NOT NULL,
  `ticket_price` double NOT NULL,
  `category_category_id` int(11) DEFAULT NULL,
  `venue_venue_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `FKghhs02fowmdm33xlek9jqcw16` (`category_category_id`),
  KEY `FKag37p8l2i2h33g2cu0n96mui2` (`venue_venue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `event` */

insert  into `event`(`event_id`,`approval_required`,`artists`,`branch_id`,`branch_name`,`company_id`,`company_name`,`country`,`created_by_name`,`created_by_role`,`created_date`,`created_time`,`description`,`email`,`event_last_date`,`event_name`,`event_start_date`,`event_url`,`image_gallery_name`,`image_gallery_original_name`,`payment_gateway_required`,`phone_no`,`remove_image_gallery`,`ticket_price`,`category_category_id`,`venue_venue_id`) values 
(299,1,'Juhi Chawla, Sri Devi',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','India','Gayatri Kumari','organizer','2024-05-03','16:30:53','Durga Pooja Festival Celebrations                                                \r\n                                                    \r\n      ','subham09@gmail.com','2024-04-13','Durga Pooja Kalyani Pandal Mahotsav','2024-04-11','http://192.168.1.38:9693/attendee/attendeeRegistrationForm/1/15/299','imageGallery115DurgaPoojaKalyaniPandalMahotsaverror.png','error.png',0,'9023567890',0,0,16,49),
(316,1,'Daljit Singh, Arijit Singh',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Georgia','Gayatri Kumari','organizer','2024-05-01','16:40:15','                                                        Holi Festival                                                    \r\n                                                    ','subham09@gmail.com','2024-04-13','Holi Rang Mela 3.9','2024-04-11','http://192.168.1.38:9693/attendee/attendeeRegistrationForm/1/15/316','imageGallery115HoliRangMela3.9jobs.jpg','jobs.jpg',0,'7539518524',0,0,16,51),
(317,1,'Sunidhi Chauwan, Ankit Tiwari',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Brazil','Gayatri Kumari','organizer','2024-04-11','17:58:49','                                                                                                                                                                                                                                Compant Conferecnce            ','G344@gmail.com','2024-04-16','Company Inaugration','2024-04-13','http://192.168.1.38:9693/attendee/attendeeRegistrationForm/1/15/317','imageGallery115CompanyInaugrationholiday.png','holiday.png',0,'7539518524',0,0,11,52),
(318,1,'Kajol, Kareena Kapoor',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Ghana','Gayatri Kumari','organizer','2024-04-12','11:18:47','                                                        Annual Day Function                                                  \r\n                                                    \r\n                                                    ','gayatri251101@gmail.com','2024-04-19','Annual Function 9.0','2024-04-12','http://192.168.1.38:9693/attendee/attendeeRegistrationForm/1/15/318','imageGallery115AnnualFunction9.0icon-img-2.png','icon-img-2.png',0,'8768788888',0,0,10,52),
(473,1,'Pooja',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','India','Gayatri Kumari','organizer','2024-04-30','12:42:24','                                                        This is Two days exhibition With 500 chargable.\r\n\r\n                                                    ','subham889@gmail.com','2024-05-06','Exhibition -05/May/2024','2024-05-05','http://192.168.1.38:9693/attendee/attendeeRegistrationForm/1/15/473','imageGallery115Exhibition-05/May/2024aboutus.png','aboutus.png',1,'9023567890',0,500,247,50),
(474,1,'Kajol, Kareena Kapoor',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','India','Gayatri Kumari','organizer','2024-04-30','14:37:03','Risikesh Tour','subham09@gmail.com','2024-05-06','Risikesh Triplogy','2024-05-01','http://192.168.1.38:9693/attendee/attendeeRegistrationForm/1/15/474','imageGallery115RisikeshTriplogy72x72.png','72x72.png',0,'8768788888',0,0,24,458),
(478,1,'Juhi Chawla, Sri Devi',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Germany','Gayatri Kumari','organizer','2024-05-01','16:41:38','test','gayatri251101@gmail.com','2024-05-04','Risikesh Tour','2024-05-02','http://192.168.1.38:9693/attendee/attendeeRegistrationForm/1/15/478','imageGallery115RisikeshTourcity.jpg','city.jpg',1,'7250733333',0,5000,144,53),
(485,1,'Pooja',15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Bangladesh','Gayatri Kumari','organizer','2024-05-03','17:28:55','fghfg','gayatri251101@gmail.com','2024-05-11','Risikesh 3','2024-05-10','http://192.168.1.38:9693/attendee/attendeeRegistrationForm/1/15/485','imageGallery115Risikesh34.jpg','4.jpg',0,'7537538694',0,0,24,52),
(500,1,'Pooja',1,'Main Branch',1,'Shree Systems','India','Gayatri Kumari','organizer','2024-05-06','12:33:27','test','subham09@gmail.com','2024-05-10','Exhibition -05/May/2024','2024-05-08','http://192.168.1.21:9693/attendee/attendeeRegistrationForm/1/1/500','imageGallery11Exhibition-05/May/202472x72-Copy.png','72x72-Copy.png',0,'7537538694',0,0,496,499),
(525,1,'Pooja',1,'Main Branch',1,'Shree Systems','India','Gayatri Kumari','organizer','2024-05-06','16:49:04','Test','subham09@gmail.com','2024-05-08','Codeit Event','2024-05-06','http://192.168.1.21:9693/attendee/attendeeRegistrationForm/1/1/525',NULL,'',0,'7250733333',0,0,502,499),
(540,1,'Pooja',1,'Main Branch',1,'Shree Systems',NULL,'Gayatri Kumari','organizer','2024-05-07','11:19:18','Restaurant&nbsp;','G344@gmail.com','2024-05-11','Restaurant party','2024-05-07','http://192.168.1.19:9693/attendee/attendeeRegistrationForm/1/1/540',NULL,'',0,'7539518524',0,0,502,539),
(543,1,'Pooja',1,'Main Branch',1,'Shree Systems',NULL,'Gayatri Kumari','organizer','2024-05-07','15:50:43','Test','G344@gmail.com','2024-05-08','Annual Day','2024-05-07','http://localhost:9693/attendee/attendeeRegistrationForm/1/1/543',NULL,'',0,'7250733333',0,0,502,524),
(544,1,'Pooja',1,'Main Branch',1,'Shree Systems','India','Gayatri Kumari','organizer','2024-05-07','16:39:06','test','subham09@gmail.com','2024-05-08','Annual Day 2','2024-05-07','http://localhost:9693/attendee/attendeeRegistrationForm/1/1/544',NULL,'',0,'8768788888',0,0,502,524);

/*Table structure for table `event_audience` */

DROP TABLE IF EXISTS `event_audience`;

CREATE TABLE `event_audience` (
  `event_event_id` int(11) NOT NULL,
  `audience_audience_id` int(11) NOT NULL,
  KEY `UK_4wn3oc0rk2y85tad0b80ximry` (`audience_audience_id`),
  KEY `FKa5iobx9y1bqdji84f5lxgy5ll` (`event_event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `event_audience` */

insert  into `event_audience`(`event_event_id`,`audience_audience_id`) values 
(317,28),
(316,25),
(316,9),
(318,28),
(318,27),
(318,25),
(299,248),
(299,26),
(299,25),
(299,9),
(473,27),
(473,26),
(474,25),
(474,27),
(474,28),
(478,25),
(485,26),
(500,497),
(501,497),
(506,497),
(507,497),
(508,497),
(525,513),
(540,512),
(543,513),
(544,513);

/*Table structure for table `event_audience_id_list` */

DROP TABLE IF EXISTS `event_audience_id_list`;

CREATE TABLE `event_audience_id_list` (
  `event_event_id` int(11) NOT NULL,
  `audience_id_list` int(11) DEFAULT NULL,
  KEY `FK19x4m70ltqx65xpwebba7gxik` (`event_event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `event_audience_id_list` */

insert  into `event_audience_id_list`(`event_event_id`,`audience_id_list`) values 
(317,28),
(316,25),
(316,9),
(318,28),
(318,27),
(318,25),
(299,248),
(299,26),
(299,25),
(299,9),
(473,27),
(473,26),
(474,25),
(474,27),
(474,28),
(478,25),
(485,26),
(500,497),
(501,497),
(506,497),
(507,497),
(508,497),
(525,513),
(540,512),
(543,513),
(544,513);

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values 
(566);

/*Table structure for table `language` */

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `language_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `language_code` varchar(255) DEFAULT NULL,
  `language_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `language` */

/*Table structure for table `login_credentials` */

DROP TABLE IF EXISTS `login_credentials`;

CREATE TABLE `login_credentials` (
  `login_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `old_password` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user_type` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `login_credentials` */

insert  into `login_credentials`(`login_id`,`branch_id`,`company_id`,`email`,`old_password`,`password`,`status`,`user_type`,`token`) values 
(303,15,1,'gayatri251101@gmail.com',NULL,'123456',1,1,NULL),
(455,15,1,'suman@gmail.com',NULL,'YrHB2qoz',1,1,NULL),
(326,15,1,'gk161897@gmail.com',NULL,'iQ4eDw1O',1,1,NULL),
(345,15,1,'sourav@gmail.com',NULL,'V39Sl4oG',1,1,NULL),
(529,1,1,'nikhil@gmail.com',NULL,'kUwZ78Lz',1,1,NULL),
(521,1,1,'siddharth@gmail.com',NULL,'3Y7UWgJ1',1,1,NULL),
(511,1,1,'suman@gmail.com',NULL,'ish0MSWZ',1,1,NULL),
(483,15,1,'Saroj@gmail.com',NULL,'kETc4r2L',1,1,NULL),
(457,15,1,'Saroj@gmail.com',NULL,'3GDu2c49',1,1,NULL),
(359,15,1,'siddharth@gmail.com',NULL,'bfjRKq1Z',1,1,NULL);

/*Table structure for table `participant` */

DROP TABLE IF EXISTS `participant`;

CREATE TABLE `participant` (
  `participant_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `participant_address` varchar(255) DEFAULT NULL,
  `participant_email` varchar(255) DEFAULT NULL,
  `participant_login_access` int(11) NOT NULL,
  `participant_name` varchar(255) DEFAULT NULL,
  `participant_phone_no` varchar(255) DEFAULT NULL,
  `profile_pic_name` varchar(255) DEFAULT NULL,
  `profile_pic_original_name` varchar(255) DEFAULT NULL,
  `remove_profile_pic` int(11) NOT NULL,
  `stall_description` varchar(255) DEFAULT NULL,
  `stall_name` varchar(255) DEFAULT NULL,
  `event_event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`participant_id`),
  KEY `FKju4xi4bb05mlcf7wcloy2ry8l` (`event_event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `participant` */

insert  into `participant`(`participant_id`,`branch_id`,`branch_name`,`company_id`,`company_name`,`participant_address`,`participant_email`,`participant_login_access`,`participant_name`,`participant_phone_no`,`profile_pic_name`,`profile_pic_original_name`,`remove_profile_pic`,`stall_description`,`stall_name`,`event_event_id`) values 
(302,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Gurugram','gayatri251101@gmail.com',1,'Sakshi Shinde','9876666576','PROIMG8527030520241631302.jpg','2.jpg',0,'We provide all types of food and snacks','Food By Sakshi',299),
(325,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Banglore','gk161897@gmail.com',1,'Suraj Singh','8978678678','IMG6464160420241136471.jpg','1.jpg',0,'We provides services for boost startups','NIAS Service',317),
(344,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Uttarakhand','sourav@gmail.com',1,'Sourav Shukla','8978678678','IMG433160420241707269.jpg','9.jpg',0,'We have all types of drinks and cocktails.','Beer & Bar',318),
(358,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Chandigarh','siddharth@gmail.com',1,'Sidhharth Jain','8978678678','IMG83311604202417193216.jpg','16.jpg',0,'We provide many types of drinks and moketails','Beer & Bar',299),
(454,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Gurugram','suman@gmail.com',1,'Suman Singh','8978678678','IMG6548290420241638073.jpg','3.jpg',0,'Food Stall','Desi That',316),
(456,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Gurugram','Saroj@gmail.com',1,'Saroj Suman','8978678678','IMG413290420241640094.jpg','4.jpg',0,'Color Stall','Color Factory',316),
(510,1,'Main Branch',1,'Shree Systems','','suman@gmail.com',1,'Suman Singh','8978678678',NULL,NULL,0,'test','Beer & Bar',500),
(520,1,'Main Branch',1,'Shree Systems','','siddharth@gmail.com',1,'Sidhharth Jain','8978678678',NULL,NULL,0,'test','Desi That',500),
(528,1,'Main Branch',1,'Shree Systems','Delhi','nikhil@gmail.com',1,'Nikhil Sahu','8978678678',NULL,NULL,0,'test','Desi That',525);

/*Table structure for table `participant_attendee_log` */

DROP TABLE IF EXISTS `participant_attendee_log`;

CREATE TABLE `participant_attendee_log` (
  `participant_attendeelog_id` int(11) NOT NULL,
  `participant_check_in_out_status` int(11) NOT NULL,
  `participant_stall_check_in_date` varchar(255) DEFAULT NULL,
  `participant_stall_check_in_time` varchar(255) DEFAULT NULL,
  `participant_stall_check_out_date` varchar(255) DEFAULT NULL,
  `participant_stall_check_out_time` varchar(255) DEFAULT NULL,
  `participant_participant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`participant_attendeelog_id`),
  KEY `FKm6gydjgob0cda65mfbnq8ijlk` (`participant_participant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `participant_attendee_log` */

/*Table structure for table `stall_log` */

DROP TABLE IF EXISTS `stall_log`;

CREATE TABLE `stall_log` (
  `stall_log_id` int(11) NOT NULL,
  `participant_check_in_out_status` int(11) NOT NULL,
  `participant_stall_check_in_date` varchar(255) DEFAULT NULL,
  `participant_stall_check_in_time` varchar(255) DEFAULT NULL,
  `participant_stall_check_out_date` varchar(255) DEFAULT NULL,
  `participant_stall_check_out_time` varchar(255) DEFAULT NULL,
  `participant_participant_id` int(11) DEFAULT NULL,
  `participant_stall_log_status` int(11) NOT NULL,
  `attendee_log_attendee_log_id` int(11) DEFAULT NULL,
  `attendee_attendee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`stall_log_id`),
  KEY `FK8mkjvi9e1t17h9b4ghqj5y3xc` (`attendee_attendee_id`),
  KEY `FK845nij8cbwr7aok6kr5q5fbvd` (`attendee_log_attendee_log_id`),
  KEY `FKm88kexu591lidtllayu0q4tne` (`participant_participant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `stall_log` */

insert  into `stall_log`(`stall_log_id`,`participant_check_in_out_status`,`participant_stall_check_in_date`,`participant_stall_check_in_time`,`participant_stall_check_out_date`,`participant_stall_check_out_time`,`participant_participant_id`,`participant_stall_log_status`,`attendee_log_attendee_log_id`,`attendee_attendee_id`) values 
(419,0,'2024-04-26','15:05:55','2024-04-26','15:28:26',302,222,417,410),
(418,0,'2024-04-26','15:05:55','2024-04-26','15:22:20',302,222,416,411),
(420,0,'2024-04-26','15:29:40',NULL,NULL,358,222,416,411),
(421,0,'2024-04-26','15:29:40','2024-04-26','15:38:33',302,222,417,410),
(422,0,'2024-04-26','15:38:33','2024-04-26','15:38:33',358,222,416,411),
(426,0,'2024-04-26','15:52:43','2024-04-26','16:20:59',358,222,425,411),
(428,0,'2024-04-26','16:20:59','2024-04-26','16:20:59',344,222,427,320),
(429,0,'2024-04-26','16:20:59','2024-04-26','16:43:16',344,222,427,320),
(446,0,'2024-04-26','17:21:58','2024-04-26','17:21:58',325,222,445,398),
(447,0,'2024-04-26','17:21:58','2024-04-26','17:21:58',325,222,445,398),
(449,0,'2024-04-26','17:21:58','2024-04-26','17:34:13',302,222,448,410),
(460,0,'2024-04-29','12:59:18','2024-04-29','12:59:18',454,222,459,453),
(462,0,'2024-04-29','12:59:18','2024-04-29','12:59:18',454,222,461,452),
(463,0,'2024-04-29','12:59:18','2024-04-29','12:59:18',456,222,459,453),
(464,0,'2024-04-29','12:59:18','2024-04-29','12:59:18',454,222,461,452),
(465,0,'2024-04-29','17:04:10','2024-04-29','17:04:27',454,222,459,453),
(466,0,'2024-04-29','17:04:56','2024-04-29','17:05:20',454,222,459,453),
(468,0,'2024-04-29','17:07:10','2024-04-29','17:07:22',454,222,467,452),
(469,0,'2024-04-29','17:09:25','2024-04-29','17:09:38',456,222,467,452),
(470,0,'2024-04-29','17:10:02','2024-04-29','17:10:13',456,222,467,452),
(472,0,'2024-04-30','11:24:17','2024-04-30','11:25:33',456,222,471,453),
(530,0,'2024-05-06','17:05:47','2024-05-06','17:06:00',528,222,527,526),
(531,0,'2024-05-06','17:13:32','2024-05-06','17:13:51',528,222,527,526),
(533,0,'2024-05-06','17:17:21','2024-05-06','17:17:43',528,222,532,526);

/*Table structure for table `venue` */

DROP TABLE IF EXISTS `venue`;

CREATE TABLE `venue` (
  `venue_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `food_and_beverage_details` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `seated_guest_no` int(11) NOT NULL,
  `standing_guest_no` int(11) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `street_address2` varchar(255) DEFAULT NULL,
  `venue_type` varchar(255) DEFAULT NULL,
  `venue_name` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `isd_code` varchar(255) DEFAULT NULL,
  `venue_type_venue_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`venue_id`),
  KEY `FK1qo1jj2mr4ly628gktfjpb3mj` (`venue_type_venue_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `venue` */

insert  into `venue`(`venue_id`,`branch_id`,`branch_name`,`city`,`company_id`,`company_name`,`contact_email`,`country`,`description`,`food_and_beverage_details`,`postal_code`,`seated_guest_no`,`standing_guest_no`,`state`,`street_address`,`street_address2`,`venue_type`,`venue_name`,`country_code`,`country_id`,`country_name`,`isd_code`,`venue_type_venue_type_id`) values 
(48,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Bhagalpur',1,'Codeit Soft','gayatri@gmail.com',NULL,' Xposer Venue 7                                     \r\n                                                    \r\n                                                    \r\n                                          \r\n                                                 ','na','812006',435,435,'Bihar','M N Chowk Nathnagar','K B Lal road Nathnagar',NULL,'Xposer','BD',18,'Bangladesh','880',29),
(49,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Bhagalpur',1,'Codeit Soft','gayatri@gmail.com',NULL,'  NA                                                  ','na','812006',567,456,'Bihar','M N Chowk Nathnagar','K B Lal road Nathnagar',NULL,'Zoombie',NULL,0,NULL,NULL,30),
(50,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Bhagalpur',1,'Codeit Soft','o@gmail.com',NULL,'NA                                                  ','NA','435345',400,200,'Bihar','Bihar','UP',NULL,'Zacked','BD',18,'Bangladesh','880',31),
(51,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Delhi',1,'Codeit Soft','drumer@gmail.com',NULL,'NA','NA','40009',400,456,'Delhi','Delhi','Delhi',NULL,'Drumer','IN',99,'India','91',32),
(52,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','New York',1,'Codeit Soft','big@gmail.com',NULL,'NA                                                    ','Cold Drinks and Snacks','546734',400,200,'New York','New block section ','P- block jackson road',NULL,'The BIG NEW YORK THEATER','NZ',153,'New Zealand','64',33),
(53,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Delhi',1,'Codeit Soft','movie@gmail.com',NULL,'NA                                                    ','NA','40001',600,100,'Delhi','NH-10','R T Road',NULL,'The Movie Show','IN',99,'India','91',34),
(134,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Bhagalpur',1,'Codeit Soft','gayatri@gmail.com',NULL,'bureau                                                    ','unlimited foods','812006',500,300,'Bihar','M N Chowk Nathnagar','K B Lal road Nathnagar',NULL,'Weeding Marriage Bureau','IN',99,'India','91',35),
(160,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Gurugram',1,'Codeit Soft','drumer@gmail.com',NULL,'For parties and book table for breakfast, lunch and dinner.                                                    ','Many type of Items','40001',700,600,'Haryana','M N Chowk Nathnagar','K B Lal road Nathnagar',NULL,'Zudix Restuarant','IN',99,'India','91',44),
(458,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Gurugram',1,'Codeit Soft','pink@gmail.com',NULL,'                                        gfdg            ','546','812006',456,546,'Delhi','New block section ','P- block jackson road',NULL,'Sigham Marriage Bureau','BD',18,'Bangladesh','880',30),
(475,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Gurugram',1,'Codeit Soft','drumer@gmail.com',NULL,'Test','NA','40001',45,55,'Delhi','NH-10','K B Lal road Nathnagar',NULL,'A','IN',99,'India','91',30),
(476,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Gurugram',1,'Codeit Soft','pink@gmail.com',NULL,'Test\r\n                                                    ','NA','40001',56,44,'Haryana','New block section ','P- block jackson road',NULL,'B','IN',99,'India','91',30),
(477,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Delhi',1,'Codeit Soft','pink@gmail.com',NULL,'Test','NA','40001',56,34,'Delhi','New block section ','P- block jackson road',NULL,'C','IN',99,'India','91',40),
(486,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram','Gurugram',1,'Codeit Soft','pink@gmail.com',NULL,'Test\r\n                                                    ','NA','40001',0,0,'Delhi','New block section ','',NULL,'B','BH',17,'Bahrain','973',30),
(499,1,'Main Branch','Gurugram',1,'Shree Systems','gayatri@gmail.com',NULL,'Test\r\n                                                    \r\n                                                    ','NA','40009',67,55,'Haryana','M N Chowk Nathnagar','K B Lal road Nathnagar',NULL,'A','IN',99,'India','91',498),
(505,1,'Main Branch','Gurugram',1,'Shree Systems','drumer@gmail.com',NULL,'Test','NA','40009',0,0,'Haryana','NH-10','',NULL,'Rishikesh','IN',99,'India','91',504),
(524,1,'Main Branch','Gurugram',1,'Shree Systems','drumer@gmail.com',NULL,'Test','NA','40001',56,566,'Delhi','M N Chowk Nathnagar','K B Lal road Nathnagar',NULL,'Annual Function','IN',99,'India','91',498),
(538,1,'Main Branch','Gurugram',1,'Shree Systems','pink@gmail.com',NULL,'Restaurant&nbsp;','Na','40009',400,700,'Haryana','M N Chowk Nathnagar','P- block jackson road',NULL,'Cromas Restaurant ','IN',99,'India','91',535),
(539,1,'Main Branch','Gurugram',1,'Shree Systems','pink@gmail.com',NULL,'Restaurant&nbsp;','Multi types of cuisine','40001',500,700,'Haryana','M N Chowk Nathnagar','P- block jackson road',NULL,'Cromas Restaurant City','IN',99,'India','91',535),
(541,1,'Main Branch','Gurugram',1,'Shree Systems','pink@gmail.com',NULL,'Test','na','40009',34,34,'Haryana','M N Chowk Nathnagar','K B Lal road Nathnagar',NULL,'B','IN',99,'India','91',498);

/*Table structure for table `venue_type` */

DROP TABLE IF EXISTS `venue_type`;

CREATE TABLE `venue_type` (
  `venue_type_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`venue_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `venue_type` */

insert  into `venue_type`(`venue_type_id`,`branch_id`,`branch_name`,`company_id`,`company_name`,`name`) values 
(29,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Banquet Hall'),
(30,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Bar'),
(31,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Boat'),
(32,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Brewery'),
(33,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Cafe'),
(34,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Co-working Space'),
(35,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Conference Center'),
(36,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Country Club'),
(37,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Event Space'),
(38,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Gallery'),
(39,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Gym'),
(40,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Hotel'),
(41,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Loft'),
(42,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Meeting Space'),
(43,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Museum'),
(44,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Restuarant'),
(45,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Stadium'),
(46,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Theater'),
(47,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Other'),
(363,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Select Company','Cleanliness'),
(451,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Mahesh Tanwar'),
(396,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','A'),
(484,15,'Sub Branch,c-1, south city-1, c - block, near medham pre school, sector- 47, Gurugram',1,'Codeit Soft','Website'),
(498,1,'Main Branch',1,'Shree Systems','Banquet Hall'),
(504,1,'Main Branch',1,'Shree Systems','Rishikesh'),
(514,1,'Main Branch',1,'Shree Systems','Bar'),
(515,1,'Main Branch',1,'Shree Systems','Other'),
(534,1,'Main Branch',1,'Shree Systems','Museum'),
(535,1,'Main Branch',1,'Shree Systems','Restuarant'),
(536,1,'Main Branch',1,'Shree Systems','Stadium'),
(537,1,'Main Branch',1,'Shree Systems','Theater');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

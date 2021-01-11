-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: course_project
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `course_project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `course_project` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `course_project`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Administrator'),(1,'Moderator'),(3,'SimpleUser');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,25),(2,1,26),(3,1,27),(4,1,28),(18,1,29),(19,1,30),(20,1,31),(17,1,32),(5,1,33),(6,1,34),(7,1,35),(8,1,36),(9,1,37),(10,1,38),(11,1,39),(12,1,40),(13,1,41),(14,1,42),(15,1,43),(16,1,44),(21,2,1),(22,2,2),(23,2,3),(24,2,4),(25,2,5),(26,2,6),(27,2,7),(28,2,8),(29,2,9),(30,2,10),(31,2,11),(32,2,12),(33,2,13),(34,2,14),(35,2,15),(36,2,16),(37,2,17),(38,2,18),(39,2,19),(40,2,20),(41,2,21),(42,2,22),(43,2,23),(44,2,24),(45,2,25),(46,2,26),(47,2,27),(48,2,28),(49,2,29),(50,2,30),(51,2,31),(52,2,32),(53,2,33),(54,2,34),(55,2,35),(56,2,36),(57,2,37),(58,2,38),(59,2,39),(60,2,40),(61,2,41),(62,2,42),(63,2,43),(64,2,44),(68,3,25),(69,3,28),(70,3,29),(65,3,32),(66,3,33),(67,3,36);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add post',7,'add_post'),(26,'Can change post',7,'change_post'),(27,'Can delete post',7,'delete_post'),(28,'Can view post',7,'view_post'),(29,'Can add comment',8,'add_comment'),(30,'Can change comment',8,'change_comment'),(31,'Can delete comment',8,'delete_comment'),(32,'Can view comment',8,'view_comment'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile'),(37,'Can add grant',10,'add_grant'),(38,'Can change grant',10,'change_grant'),(39,'Can delete grant',10,'delete_grant'),(40,'Can view grant',10,'view_grant'),(41,'Can add organization',11,'add_organization'),(42,'Can change organization',11,'change_organization'),(43,'Can delete organization',11,'delete_organization'),(44,'Can view organization',11,'view_organization');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (15,'pbkdf2_sha256$120000$ZCwWltsPGWft$r9+HZTvaFoNZnHKhLWDVsOEPLF8H4dlfI4HRUFPmRds=','2021-01-08 14:24:54.055789',1,'admin','АДМИН','Админ А','',1,1,'2020-12-21 09:46:05.000000'),(16,'pbkdf2_sha256$120000$ZCwWltsPGWft$r9+HZTvaFoNZnHKhLWDVsOEPLF8H4dlfI4HRUFPmRds=','2021-01-08 14:16:55.999805',0,'sushchenko.aa','Сущенко','Андрей Андреевич','sushchenko.aa@dvfu.ru',0,1,'2020-12-21 09:51:30.000000'),(18,'pbkdf2_sha256$120000$TIwSUDHvglnx$9iJjJiWJA1ZUilplVP/lzsfoX1SEC09oojxLatkhKks=','2021-01-08 14:25:17.571411',0,'moder','МОДЕР','Модер М','',1,1,'2021-01-06 09:21:47.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,15,2),(1,18,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_author_id_4f11e2e0_fk_auth_user_id` (`author_id`),
  KEY `blog_comment_post_id_580e96ef_fk_blog_post_id` (`post_id`),
  CONSTRAINT `blog_comment_author_id_4f11e2e0_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_comment_post_id_580e96ef_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `journal` varchar(150) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `file` varchar(1000) DEFAULT NULL,
  `has_moderated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id`),
  CONSTRAINT `blog_post_author_id_dd7a8485_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (82,'О корректности задачи Коши для уравнения переноса излучения с френелевскими условиями сопряжения','Полный текст статьи можно найти по ссылке: <a href=\"http://www.mathnet.ru/rus/smj2687\">http://www.mathnet.ru/rus/smj2687</a>',NULL,NULL,NULL,2015,16,'',0),(83,'Об одной задаче определения рельефа дна флуктуирующего океана','Полный текст статьи можно найти по ссылке: <a href=\"http://www.mathnet.ru/rus/sjim886\">http://www.mathnet.ru/rus/sjim886</a>',NULL,NULL,NULL,2015,16,'',0),(84,'Начально-краевая задача для уравнения переноса излучения с диффузными условиями сопряжения','Полный текст статьи можно найти по ссылке: <a href=\"http://www.mathnet.ru/rus/sjim950\">http://www.mathnet.ru/rus/sjim950</a>',NULL,NULL,NULL,2017,16,'',0),(85,'Задача Коши для уравнения переноса излучения в неограниченной среде','Полный текст статьи можно найти по ссылке: <a href=\"http://www.mathnet.ru/rus/dvmg371\">http://www.mathnet.ru/rus/dvmg371</a>',NULL,NULL,NULL,2018,16,'',1),(86,'Анализ влияния поверхностного и объемного рассеяния в задаче гидролокации морского дна','Полный текст статьи можно найти по ссылке: <a href=\"http://www.mathnet.ru/rus/semr1029\">http://www.mathnet.ru/rus/semr1029</a>',NULL,NULL,NULL,2018,16,'',1),(87,'Моделирование профиля морского дна в приближении двукратного рассеяния','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=41533093\">https://elibrary.ru/item.asp?id=41533093</a>',NULL,NULL,NULL,2019,16,'',1),(88,'Детектирование многократно рассеянного излучения','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=41534007\">https://elibrary.ru/item.asp?id=41534007</a>',NULL,NULL,NULL,2019,16,'',1),(90,'Расчет интенсивности излучения в приближении двукратного рассеяния для задачи картографирования','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39290139\">https://elibrary.ru/item.asp?id=39290139</a>',NULL,NULL,NULL,2018,16,'',0),(91,'Итерационный метод фокусировки изображений','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39307294\">https://elibrary.ru/item.asp?id=39307294</a>',NULL,NULL,NULL,2018,16,'',0),(92,'Построение гидроакустических изображений','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39306495\">https://elibrary.ru/item.asp?id=39306495</a>',NULL,NULL,NULL,2018,16,'',0),(93,'Моделирование процесса эхолокации для задачи батиметрии','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39290158\">https://elibrary.ru/item.asp?id=39290158</a>',NULL,NULL,NULL,2018,16,'',0),(94,'Моделирование процесса дистанционного зондирования с учетом многократного рассеяния в среде','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=32874099\">https://elibrary.ru/item.asp?id=32874099</a>',NULL,NULL,NULL,2018,16,'',0),(95,'Определение коэффициента донного рассеяния на основе сигнала с гидролокатора бокового обзора с использованием технологии MPI','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39360587\">https://elibrary.ru/item.asp?id=39360587</a>',NULL,NULL,NULL,2017,16,'',0),(96,'Определение затененных участков морского дна в двумерном и трехмерном случаях','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39361634\">https://elibrary.ru/item.asp?id=39361634</a>',NULL,NULL,NULL,2017,16,'',0),(97,'Восстановление донной поверхности морского дна на основе данных гидролокационного зондирования','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39361423\">https://elibrary.ru/item.asp?id=39361423</a>',NULL,NULL,NULL,2017,16,'',0),(98,'Восстановление рельефа морского дна по имитационным данным гидролокационного зондирования','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39341669\">https://elibrary.ru/item.asp?id=39341669</a>',NULL,NULL,NULL,2016,16,'',0),(99,'СОСТАВ МИКРОФЛОРЫ ПОЛОСТИ РТА У КУРЯЩИХ ЛИЦ МОЛОДОГО ВОЗРАСТА','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=21336786\">https://elibrary.ru/item.asp?id=21336786</a>',NULL,NULL,NULL,2014,16,'',0),(100,'Численное моделирование процесса акустического зондирования морского дна гидролокатором бокового обзора с различной шириной диаграммы …','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39341775\">https://elibrary.ru/item.asp?id=39341775</a>',NULL,NULL,NULL,2016,16,'',0),(101,'Граничное управление температурой в приближении Роселанда','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39343699\">https://elibrary.ru/item.asp?id=39343699</a>',NULL,NULL,NULL,2016,16,'',0),(102,'Обработка гидроакустических изображений методом двойной фильтрации с использованием технологии NVIDIA CUDA','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39336202\">https://elibrary.ru/item.asp?id=39336202</a>',NULL,NULL,NULL,2015,16,'',0),(103,'Построение гидролокационных изображений на основе сигнала с ГБО EdgeTech Sonar','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39324678\">https://elibrary.ru/item.asp?id=39324678</a>',NULL,NULL,NULL,2014,16,'',0),(104,'Моделирование сигнала во флуктуирующей среде с учетом рельефного дна с использованием технологии OpenCL','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39341673\">https://elibrary.ru/item.asp?id=39341673</a>',NULL,NULL,NULL,2016,16,'',0),(105,'Определение коэффициента донного отражения на основе вертикальных выборок гидролокатора бокового обзора в канале','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39358026\">https://elibrary.ru/item.asp?id=39358026</a>',NULL,NULL,NULL,2016,16,'',0),(106,'Программа создания и управления облачным сервисом для обработки гидроакустических изображений','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39326684\">https://elibrary.ru/item.asp?id=39326684</a>',NULL,NULL,NULL,2015,16,'',0),(107,'Оптимальное управление сложным теплообменом в SP-1 приближении','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=39343698\">https://elibrary.ru/item.asp?id=39343698</a>',NULL,NULL,NULL,2016,16,'',0),(108,'ОБ ОДНОЙ ЗАДАЧЕ ОПРЕДЕЛЕНИЯ ДОННОЙ ПОВЕРХНОСТИ ПО ДАННЫМ ГИДРОЛОКАТОРА БОКОВОГО ОБЗОРА','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=25578026\">https://elibrary.ru/item.asp?id=25578026</a>',NULL,NULL,NULL,2015,16,'',0),(109,'ПОСТРОЕНИЕ ГИДРОАКУСТИЧЕСКИХ ИЗОБРАЖЕНИЙ НА ОСНОВЕ СИГНАЛА, ПОЛУЧЕННОГО С ГИДРОЛОКАТОРА БОКОВОГО ОБЗОРА','Полный текст статьи можно найти по ссылке: <a href=\"https://www.dvfu.ru/schools/school_of_natural_sciences/documents/2014.pdf#page=132\">https://www.dvfu.ru/schools/school_of_natural_sciences/documents/2014.pdf#page=132</a>',NULL,NULL,NULL,NULL,16,'',0),(110,'Задача нахождения рельефа дна флуктуирующего океана','Полный текст статьи можно найти по ссылке: <a href=\"https://elibrary.ru/item.asp?id=29899039\">https://elibrary.ru/item.asp?id=29899039</a>',NULL,NULL,NULL,2016,16,'',0),(111,'СОЗДАНИЕ ВЕБ-СЕРВИСА ОБМЕНА ФАЙЛАМИ МЕЖДУ УДАЛЁННЫМИ ПОЛЬЗОВАТЕЛ МИ В ШЕН ДВФУ','Полный текст статьи можно найти по ссылке: <a href=\"https://www.dvfu.ru/schools/school_of_natural_sciences/documents/2013.pdf#page=119\">https://www.dvfu.ru/schools/school_of_natural_sciences/documents/2013.pdf#page=119</a>',NULL,NULL,NULL,NULL,16,'',0);
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-01-06 07:19:41.451921','8','Влияние двукратного донного рассеяния на точность решения задачи батиметрии',2,'[{\"changed\": {\"fields\": [\"content\", \"has_moderated\"]}}]',7,15),(2,'2021-01-06 07:19:46.065845','6','Моделирование профиля морского дна в приближении двукратного рассеяния',2,'[{\"changed\": {\"fields\": [\"content\", \"has_moderated\"]}}]',7,15),(3,'2021-01-06 07:19:50.269756','18','СОСТАВ МИКРОФЛОРЫ ПОЛОСТИ РТА У КУРЯЩИХ ЛИЦ МОЛОДОГО ВОЗРАСТА',2,'[{\"changed\": {\"fields\": [\"content\", \"has_moderated\"]}}]',7,15),(4,'2021-01-06 09:00:49.214532','16','sushchenko.aa',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,15),(5,'2021-01-06 09:03:01.456848','16','sushchenko.aa',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,15),(6,'2021-01-06 09:21:47.124654','18','moder',1,'[{\"added\": {}}]',4,15),(7,'2021-01-06 09:21:58.515746','18','moder',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',4,15),(8,'2021-01-06 09:22:29.777275','15','moder profile',1,'[{\"added\": {}}]',9,15),(9,'2021-01-06 09:25:08.710728','15','moder profile',2,'[]',9,15),(10,'2021-01-06 09:26:22.307130','1','Moderator',1,'[{\"added\": {}}]',3,15),(11,'2021-01-06 09:26:37.249391','18','moder',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,15),(12,'2021-01-06 09:27:08.286819','1','Moderator',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',3,15),(13,'2021-01-06 12:39:45.164530','15','admin',2,'[{\"changed\": {\"fields\": [\"username\", \"first_name\", \"last_name\", \"email\"]}}]',4,15),(14,'2021-01-06 12:40:18.010146','18','moder',2,'[]',4,15),(15,'2021-01-06 12:40:27.407514','15','admin',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',4,15),(16,'2021-01-06 12:40:35.500308','16','sushchenko.aa',2,'[]',4,15),(17,'2021-01-06 12:41:27.479807','12','sushchenko.aa profile',2,'[{\"changed\": {\"fields\": [\"biography\"]}}]',9,15),(18,'2021-01-06 12:41:39.616820','13','admin profile',2,'[{\"changed\": {\"fields\": [\"position\"]}}]',9,15),(19,'2021-01-06 12:41:43.861123','15','moder profile',2,'[]',9,15),(20,'2021-01-06 12:43:56.809798','1','Moderator',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',3,15),(21,'2021-01-06 12:46:18.837199','2','Administrator',1,'[{\"added\": {}}]',3,15),(22,'2021-01-06 12:46:36.713975','15','admin',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,15),(23,'2021-01-06 12:47:37.768211','3','SimpleUser',1,'[{\"added\": {}}]',3,15),(24,'2021-01-06 13:54:21.488238','1','ДВФУ',2,'[{\"changed\": {\"fields\": [\"constitutors\", \"address\", \"description\"]}}]',11,18);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'blog','comment'),(7,'blog','post'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'users','grant'),(11,'users','organization'),(9,'users','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-01-06 06:54:42.874835'),(2,'auth','0001_initial','2021-01-06 06:54:43.325286'),(3,'admin','0001_initial','2021-01-06 06:54:43.429920'),(4,'admin','0002_logentry_remove_auto_add','2021-01-06 06:54:43.438131'),(5,'admin','0003_logentry_add_action_flag_choices','2021-01-06 06:54:43.446118'),(6,'contenttypes','0002_remove_content_type_name','2021-01-06 06:54:43.491539'),(7,'auth','0002_alter_permission_name_max_length','2021-01-06 06:54:43.535203'),(8,'auth','0003_alter_user_email_max_length','2021-01-06 06:54:43.579451'),(9,'auth','0004_alter_user_username_opts','2021-01-06 06:54:43.587451'),(10,'auth','0005_alter_user_last_login_null','2021-01-06 06:54:43.619862'),(11,'auth','0006_require_contenttypes_0002','2021-01-06 06:54:43.623677'),(12,'auth','0007_alter_validators_add_error_messages','2021-01-06 06:54:43.631252'),(13,'auth','0008_alter_user_username_max_length','2021-01-06 06:54:43.643254'),(14,'auth','0009_alter_user_last_name_max_length','2021-01-06 06:54:43.656249'),(15,'blog','0001_initial','2021-01-06 06:54:43.819972'),(16,'blog','0002_auto_20190802_0826','2021-01-06 06:54:43.875271'),(17,'blog','0003_auto_20200721_0747','2021-01-06 06:54:43.897233'),(18,'blog','0004_auto_20210105_0615','2021-01-06 06:54:43.995757'),(19,'blog','0005_auto_20210106_1506','2021-01-06 06:54:44.004128'),(20,'blog','0006_auto_20210106_1509','2021-01-06 06:54:44.039984'),(21,'sessions','0001_initial','2021-01-06 06:54:44.064980'),(22,'users','0001_initial','2021-01-06 06:54:44.199241'),(23,'users','0002_auto_20190802_0936','2021-01-06 06:54:44.347435'),(24,'blog','0007_auto_20210106_1714','2021-01-06 07:15:01.739237'),(25,'users','0003_auto_20210107_1352','2021-01-07 03:52:34.682169');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_grant`
--

DROP TABLE IF EXISTS `users_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_grant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `year_from` int(11) NOT NULL,
  `year_to` int(11) NOT NULL,
  `fund` varchar(200) NOT NULL,
  `amount` int(11) NOT NULL,
  `link` varchar(200) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_grant_profile_id_dfbaf8c5_fk_users_profile_id` (`profile_id`),
  CONSTRAINT `users_grant_profile_id_dfbaf8c5_fk_users_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `users_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_grant`
--

LOCK TABLES `users_grant` WRITE;
/*!40000 ALTER TABLE `users_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_organization`
--

DROP TABLE IF EXISTS `users_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `constitutors` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `link` varchar(200) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_organization`
--

LOCK TABLES `users_organization` WRITE;
/*!40000 ALTER TABLE `users_organization` DISABLE KEYS */;
INSERT INTO `users_organization` VALUES (1,'ДВФУ','2019-08-01 23:38:30.000000','','','http://dvfu.ru',''),(2,'НИУ ВШЭ','2020-07-27 14:29:59.000000','','','https://www.hse.ru/','');
/*!40000 ALTER TABLE `users_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `biography` longtext NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `position` varchar(100) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `ORCID` varchar(100) NOT NULL,
  `access` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `users_profile_organization_id_56be53ed` (`organization_id`),
  CONSTRAINT `users_profile_organization_id_56be53ed_fk_users_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `users_organization` (`id`),
  CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES (12,'default.png','Читаемые курсы:\r\n\r\n1.    Языки и методы программирования\r\n2.    Алгоритмы и структуры данных\r\n3.    Облачные вычисления\r\n4.    Введение в программирование\r\n5.    Численные методы\r\n6.    Параллельное программирование\r\n7.    Математическое моделирование в социологии',1,'Старший преподаватель','Высшее (магистр Прикладной математики и информатики) ДВФУ 2013','','','Пользователь',16),(13,'default.png','',1,'','','','','Администратор',15),(15,'default.png','',1,'','','','','Модератор',18);
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-11 14:50:52

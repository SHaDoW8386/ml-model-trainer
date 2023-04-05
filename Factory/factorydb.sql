-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: factorydb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add base_class',7,'add_base_class'),(26,'Can change base_class',7,'change_base_class'),(27,'Can delete base_class',7,'delete_base_class'),(28,'Can view base_class',7,'view_base_class'),(29,'Can add projects',8,'add_projects'),(30,'Can change projects',8,'change_projects'),(31,'Can delete projects',8,'delete_projects'),(32,'Can view projects',8,'view_projects'),(33,'Can add info',9,'add_info'),(34,'Can change info',9,'change_info'),(35,'Can delete info',9,'delete_info'),(36,'Can view info',9,'view_info'),(37,'Can add projects model',10,'add_projectsmodel'),(38,'Can change projects model',10,'change_projectsmodel'),(39,'Can delete projects model',10,'delete_projectsmodel'),(40,'Can view projects model',10,'view_projectsmodel'),(41,'Can add genre model',11,'add_genremodel'),(42,'Can change genre model',11,'change_genremodel'),(43,'Can delete genre model',11,'delete_genremodel'),(44,'Can view genre model',11,'view_genremodel'),(45,'Can add information model',12,'add_informationmodel'),(46,'Can change information model',12,'change_informationmodel'),(47,'Can delete information model',12,'delete_informationmodel'),(48,'Can view information model',12,'view_informationmodel'),(49,'Can add student',13,'add_student'),(50,'Can change student',13,'change_student'),(51,'Can delete student',13,'delete_student'),(52,'Can view student',13,'view_student'),(53,'Can add build ml model',15,'add_buildmlmodel'),(54,'Can change build ml model',15,'change_buildmlmodel'),(55,'Can delete build ml model',15,'delete_buildmlmodel'),(56,'Can view build ml model',15,'view_buildmlmodel'),(57,'Can add user',14,'add_user'),(58,'Can change user',14,'change_user'),(59,'Can delete user',14,'delete_user'),(60,'Can view user',14,'view_user'),(61,'Can add models params',16,'add_modelsparams'),(62,'Can change models params',16,'change_modelsparams'),(63,'Can delete models params',16,'delete_modelsparams'),(64,'Can view models params',16,'view_modelsparams'),(65,'Can add params',17,'add_params'),(66,'Can change params',17,'change_params'),(67,'Can delete params',17,'delete_params'),(68,'Can view params',17,'view_params'),(69,'Can add machine learning model',16,'add_machinelearningmodel'),(70,'Can change machine learning model',16,'change_machinelearningmodel'),(71,'Can delete machine learning model',16,'delete_machinelearningmodel'),(72,'Can view machine learning model',16,'view_machinelearningmodel'),(73,'Can add parameter model',17,'add_parametermodel'),(74,'Can change parameter model',17,'change_parametermodel'),(75,'Can delete parameter model',17,'delete_parametermodel'),(76,'Can view parameter model',17,'view_parametermodel'),(77,'Can add demo model',18,'add_demomodel'),(78,'Can change demo model',18,'change_demomodel'),(79,'Can delete demo model',18,'delete_demomodel'),(80,'Can view demo model',18,'view_demomodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$6A0NlDjIMloQOt24ZR7jDk$MDmsRxUWXGyMruttcgNEofy7LICPCFNwIHCUAobYFgE=','2022-11-07 17:25:37.147517',1,'admin','','','',1,1,'2022-11-03 11:13:35.913282');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_user`
--

DROP TABLE IF EXISTS `authentication_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_user` (
  `UID` varchar(50) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `MOBILE` varchar(128) NOT NULL,
  `EMAIL` varchar(254) NOT NULL,
  `PASSWORD` varchar(30) NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_user`
--

LOCK TABLES `authentication_user` WRITE;
/*!40000 ALTER TABLE `authentication_user` DISABLE KEYS */;
INSERT INTO `authentication_user` VALUES ('U101','Shobha Dhande','+916232626660','shobhadhande11@gmail.com','12345678'),('U102','varun','+917049280770','varunmodi2712@gmail.com','Varun@123');
/*!40000 ALTER TABLE `authentication_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-11-03 11:16:51.259535','P01','ProjectsModel object (P01)',1,'[{\"added\": {}}]',10,1),(2,'2022-11-03 11:33:16.989764','P01','ProjectsModel object (P01)',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(3,'2022-11-03 11:54:05.236618','P02','ProjectsModel object (P02)',1,'[{\"added\": {}}]',10,1),(4,'2022-11-03 11:55:01.355025','P03','ProjectsModel object (P03)',1,'[{\"added\": {}}]',10,1),(5,'2022-11-03 11:56:13.624118','P04','ProjectsModel object (P04)',1,'[{\"added\": {}}]',10,1),(6,'2022-11-03 11:56:38.404599','P03','ProjectsModel object (P03)',2,'[{\"changed\": {\"fields\": [\"NAME\"]}}]',10,1),(7,'2022-11-03 11:58:40.322533','P11','ProjectsModel object (P11)',1,'[{\"added\": {}}]',10,1),(8,'2022-11-03 11:59:05.688644','P12','ProjectsModel object (P12)',1,'[{\"added\": {}}]',10,1),(9,'2022-11-03 12:00:23.976100','P13','ProjectsModel object (P13)',1,'[{\"added\": {}}]',10,1),(10,'2022-11-03 12:01:09.158646','P14','ProjectsModel object (P14)',1,'[{\"added\": {}}]',10,1),(11,'2022-11-03 12:02:20.341403','P14','ProjectsModel object (P14)',2,'[{\"changed\": {\"fields\": [\"NAME\", \"IMAGE\"]}}]',10,1),(12,'2022-11-03 12:04:13.766023','P21','ProjectsModel object (P21)',1,'[{\"added\": {}}]',10,1),(13,'2022-11-03 12:04:45.368677','P22','ProjectsModel object (P22)',1,'[{\"added\": {}}]',10,1),(14,'2022-11-03 12:05:11.244808','P23','ProjectsModel object (P23)',1,'[{\"added\": {}}]',10,1),(15,'2022-11-03 12:05:34.161844','P24','ProjectsModel object (P24)',1,'[{\"added\": {}}]',10,1),(16,'2022-11-03 12:06:06.643968','P31','ProjectsModel object (P31)',1,'[{\"added\": {}}]',10,1),(17,'2022-11-03 12:06:27.292157','P32','ProjectsModel object (P32)',1,'[{\"added\": {}}]',10,1),(18,'2022-11-03 12:06:48.449176','P33','ProjectsModel object (P33)',1,'[{\"added\": {}}]',10,1),(19,'2022-11-03 12:07:08.857878','P34','ProjectsModel object (P34)',1,'[{\"added\": {}}]',10,1),(20,'2022-11-05 06:37:46.599208','U101','User object (U101)',1,'[{\"added\": {}}]',14,1),(21,'2022-11-05 12:53:15.162906','PARAM101','Params object (PARAM101)',1,'[{\"added\": {}}]',17,1),(22,'2022-11-05 12:54:13.394586','PARAM102','Params object (PARAM102)',1,'[{\"added\": {}}]',17,1),(23,'2022-11-05 12:56:34.457602','M101','ModelsParams object (M101)',1,'[{\"added\": {}}]',16,1),(24,'2022-11-06 04:28:21.508772','3','Winning Team Prediction',1,'[{\"added\": {}}]',12,1),(25,'2022-11-06 05:08:27.693192','PARAM101','fit_intercept',2,'[{\"changed\": {\"fields\": [\"PARAMNAME\", \"DISCRIPTION\", \"DEFAULT VALUE\"]}}]',17,1),(26,'2022-11-06 05:09:13.798834','PARAM102','normalize',2,'[{\"changed\": {\"fields\": [\"PARAMNAME\", \"DISCRIPTION\", \"DEFAULT VALUE\"]}}]',17,1),(27,'2022-11-06 05:09:54.160508','PARAM103','copy_X',1,'[{\"added\": {}}]',17,1),(28,'2022-11-06 05:10:27.639951','PARAM104','n_jobs',1,'[{\"added\": {}}]',17,1),(29,'2022-11-06 05:11:03.188901','PARAM105','positive',1,'[{\"added\": {}}]',17,1),(30,'2022-11-06 05:13:30.949572','PARAM106','penalty',1,'[{\"added\": {}}]',17,1),(31,'2022-11-06 05:14:19.902447','PARAM106','penalty',2,'[]',17,1),(32,'2022-11-06 05:14:51.317634','PARAM107','dual',1,'[{\"added\": {}}]',17,1),(33,'2022-11-06 05:15:27.776972','PARAM108','tol',1,'[{\"added\": {}}]',17,1),(34,'2022-11-06 05:16:03.435945','PARAM109','C',1,'[{\"added\": {}}]',17,1),(35,'2022-11-06 05:20:45.900613','PARAM110','intercept_scaling',1,'[{\"added\": {}}]',17,1),(36,'2022-11-06 05:21:32.688454','PARAM111','class_weight',1,'[{\"added\": {}}]',17,1),(37,'2022-11-06 05:22:04.542054','PARAM112','random_state',1,'[{\"added\": {}}]',17,1),(38,'2022-11-06 05:22:42.514360','PARAM113','solver',1,'[{\"added\": {}}]',17,1),(39,'2022-11-06 05:23:22.377482','PARAM114','mat_iter',1,'[{\"added\": {}}]',17,1),(40,'2022-11-06 05:23:49.992616','PARAM115','multi_class',1,'[{\"added\": {}}]',17,1),(41,'2022-11-06 05:24:29.069234','PARAM116','verbose',1,'[{\"added\": {}}]',17,1),(42,'2022-11-06 05:25:00.949225','PARAM117','warm_start',1,'[{\"added\": {}}]',17,1),(43,'2022-11-06 05:25:36.803488','PARAM118','l1_ratio',1,'[{\"added\": {}}]',17,1),(44,'2022-11-06 05:26:36.083329','PARAM119','alpha',1,'[{\"added\": {}}]',17,1),(45,'2022-11-06 05:27:17.700529','PARAM120','precompute',1,'[{\"added\": {}}]',17,1),(46,'2022-11-06 05:28:11.423241','PARAM121','selection',1,'[{\"added\": {}}]',17,1),(47,'2022-11-06 05:40:51.518261','PARAM122','n_iter',1,'[{\"added\": {}}]',17,1),(48,'2022-11-06 05:41:58.784746','PARAM123','alp',1,'[{\"added\": {}}]',17,1),(49,'2022-11-06 05:42:21.825774','PARAM123','alpha_init',2,'[{\"changed\": {\"fields\": [\"PARAMNAME\", \"DISCRIPTION\", \"DEFAULT VALUE\"]}}]',17,1),(50,'2022-11-06 05:42:44.191369','PARAM124','lambda_init',1,'[{\"added\": {}}]',17,1),(51,'2022-11-06 05:43:10.176461','PARAM125','compute_score',1,'[{\"added\": {}}]',17,1),(52,'2022-11-06 05:45:08.422131','PARAM126','loss',1,'[{\"added\": {}}]',17,1),(53,'2022-11-06 05:45:56.607380','PARAM127','shuffle',1,'[{\"added\": {}}]',17,1),(54,'2022-11-06 05:46:23.603987','PARAM128','epsilon',1,'[{\"added\": {}}]',17,1),(55,'2022-11-06 05:47:01.715822','PARAM129','learning_rate',1,'[{\"added\": {}}]',17,1),(56,'2022-11-06 05:47:47.312187','PARAM130','eta0',1,'[{\"added\": {}}]',17,1),(57,'2022-11-06 05:48:17.170911','PARAM131','power_t',1,'[{\"added\": {}}]',17,1),(58,'2022-11-06 05:48:45.442633','PARAM132','early_stopping',1,'[{\"added\": {}}]',17,1),(59,'2022-11-06 05:49:15.774108','PARAM133','validation_fraction',1,'[{\"added\": {}}]',17,1),(60,'2022-11-06 05:49:50.960373','PARAM134','n_iter_no_change',1,'[{\"added\": {}}]',17,1),(61,'2022-11-06 05:50:18.491968','PARAM135','average',1,'[{\"added\": {}}]',17,1),(62,'2022-11-06 05:52:58.693234','PARAM136','kernel',1,'[{\"added\": {}}]',17,1),(63,'2022-11-06 05:53:19.385692','PARAM137','degree',1,'[{\"added\": {}}]',17,1),(64,'2022-11-06 05:53:41.958386','PARAM138','gamma',1,'[{\"added\": {}}]',17,1),(65,'2022-11-06 05:54:56.802866','PARAM139','coef0',1,'[{\"added\": {}}]',17,1),(66,'2022-11-06 05:56:11.084432','PARAM140','shrinking',1,'[{\"added\": {}}]',17,1),(67,'2022-11-06 05:56:39.833521','PARAM141','cache_size',1,'[{\"added\": {}}]',17,1),(68,'2022-11-06 05:57:36.201110','PARAM142','probability',1,'[{\"added\": {}}]',17,1),(69,'2022-11-06 05:57:44.643724','PARAM142','probability',2,'[{\"changed\": {\"fields\": [\"DEFAULT VALUE\"]}}]',17,1),(70,'2022-11-06 06:05:14.247002','PARAM143','n_neighbors',1,'[{\"added\": {}}]',17,1),(71,'2022-11-06 06:05:40.845159','PARAM144','weights',1,'[{\"added\": {}}]',17,1),(72,'2022-11-06 06:06:13.762711','PARAM145','algorithm',1,'[{\"added\": {}}]',17,1),(73,'2022-11-06 06:06:33.544457','PARAM146','leaf_size',1,'[{\"added\": {}}]',17,1),(74,'2022-11-06 06:06:48.569801','PARAM147','p',1,'[{\"added\": {}}]',17,1),(75,'2022-11-06 06:10:07.023916','PARAM148','priors',1,'[{\"added\": {}}]',17,1),(76,'2022-11-06 06:10:41.763230','PARAM149','var_smoothing',1,'[{\"added\": {}}]',17,1),(77,'2022-11-06 06:11:15.755970','PARAM150','fit_prior',1,'[{\"added\": {}}]',17,1),(78,'2022-11-06 06:11:44.219272','PARAM151','class_prior',1,'[{\"added\": {}}]',17,1),(79,'2022-11-06 06:12:14.633349','PARAM152','norm',1,'[{\"added\": {}}]',17,1),(80,'2022-11-06 06:12:46.864139','PARAM153','binarize',1,'[{\"added\": {}}]',17,1),(81,'2022-11-06 06:13:47.464542','PARAM154','min_categories',1,'[{\"added\": {}}]',17,1),(82,'2022-11-06 06:23:11.181244','PARAM155','criteron',1,'[{\"added\": {}}]',17,1),(83,'2022-11-06 06:30:49.302549','PARAM156','criterion',1,'[{\"added\": {}}]',17,1),(84,'2022-11-06 06:31:38.009426','PARAM157','splitter',1,'[{\"added\": {}}]',17,1),(85,'2022-11-06 06:32:00.932308','PARAM158','max_depth',1,'[{\"added\": {}}]',17,1),(86,'2022-11-06 06:32:29.766317','PARAM159','min_samples',1,'[{\"added\": {}}]',17,1),(87,'2022-11-06 06:33:18.662470','PARAM160','min_samples_leaf',1,'[{\"added\": {}}]',17,1),(88,'2022-11-06 06:33:33.250089','PARAM159','min_samples_split',2,'[{\"changed\": {\"fields\": [\"PARAMNAME\"]}}]',17,1),(89,'2022-11-06 06:33:39.907964','PARAM160','min_samples_leaf',2,'[]',17,1),(90,'2022-11-06 06:34:13.888299','PARAM161','max_features',1,'[{\"added\": {}}]',17,1),(91,'2022-11-06 06:34:43.713128','PARAM162','max_leaf_nodes',1,'[{\"added\": {}}]',17,1),(92,'2022-11-06 06:36:33.936475','PARAM163','n_estimators',1,'[{\"added\": {}}]',17,1),(93,'2022-11-06 06:38:14.650627','PARAM164','n_clusters',1,'[{\"added\": {}}]',17,1),(94,'2022-11-06 06:38:47.240898','PARAM165','init',1,'[{\"added\": {}}]',17,1),(95,'2022-11-06 06:42:14.797981','M101','Linear Regression',2,'[{\"changed\": {\"fields\": [\"MODELNAME\", \"TYPE\", \"PARAMS\"]}}]',16,1),(96,'2022-11-06 06:42:21.433655','M101','Linear Regression',2,'[]',16,1),(97,'2022-11-06 06:44:53.230413','M101','Linear Regression',2,'[]',16,1),(98,'2022-11-06 06:46:12.749012','M102','Logistic Regression',1,'[{\"added\": {}}]',16,1),(99,'2022-11-06 06:48:59.564162','M103','Lasso',1,'[{\"added\": {}}]',16,1),(100,'2022-11-06 06:49:40.548839','PARAM114','max_iter',2,'[{\"changed\": {\"fields\": [\"PARAMNAME\"]}}]',17,1),(101,'2022-11-06 06:49:52.478172','M103','Lasso',2,'[]',16,1),(102,'2022-11-06 06:51:51.943884','M104','Ridge',1,'[{\"added\": {}}]',16,1),(103,'2022-11-06 06:55:21.452567','M105','Support Vector Classifier',1,'[{\"added\": {}}]',16,1),(104,'2022-11-06 06:57:16.991632','M106','Support Vector Regressor',1,'[{\"added\": {}}]',16,1),(105,'2022-11-06 07:10:44.560933','M107','K-Nearest Neighbors',1,'[{\"added\": {}}]',16,1),(106,'2022-11-06 07:14:39.392500','M108','Random Forest Regressor',1,'[{\"added\": {}}]',16,1),(107,'2022-11-06 07:17:07.080255','M109','Random Forest Classifier',1,'[{\"added\": {}}]',16,1),(108,'2022-11-06 07:20:36.519869','M110','SGD Regressor',1,'[{\"added\": {}}]',16,1),(109,'2022-11-06 07:24:57.160194','M111','SGD Classifier',1,'[{\"added\": {}}]',16,1),(110,'2022-11-06 07:26:42.159958','M112','Bayesian Ridge Regression',1,'[{\"added\": {}}]',16,1),(111,'2022-11-06 07:28:50.735958','M113','Ridge Classifier',1,'[{\"added\": {}}]',16,1),(112,'2022-11-06 07:30:03.281660','M113','Bayesian Ridge Classifier',2,'[{\"changed\": {\"fields\": [\"MODELNAME\"]}}]',16,1),(113,'2022-11-06 07:56:37.321966','M114','Gaussian Naive Bayes',1,'[{\"added\": {}}]',16,1),(114,'2022-11-06 07:57:23.941836','M115','Multinomial Naive Bayes',1,'[{\"added\": {}}]',16,1),(115,'2022-11-06 07:58:16.796117','M116','Complement Naive Bayes',1,'[{\"added\": {}}]',16,1),(116,'2022-11-06 07:58:59.047318','M117','Bernoulli Naive Byaes',1,'[{\"added\": {}}]',16,1),(117,'2022-11-06 07:59:42.790208','M118','Categorical Naive Bayes',1,'[{\"added\": {}}]',16,1),(118,'2022-11-06 08:01:20.994864','PARAM165','init',2,'[]',17,1),(119,'2022-11-06 08:01:59.053200','PARAM166','estimators',1,'[{\"added\": {}}]',17,1),(120,'2022-11-06 08:02:29.972234','PARAM167','voting',1,'[{\"added\": {}}]',17,1),(121,'2022-11-06 08:03:12.232796','PARAM168','flatten_transform',1,'[{\"added\": {}}]',17,1),(122,'2022-11-06 08:04:30.232896','PARAM169','base',1,'[{\"added\": {}}]',17,1),(123,'2022-11-06 08:14:14.866734','PARAM170','base_estimator',1,'[{\"added\": {}}]',17,1),(124,'2022-11-06 08:15:19.240206','M118','Categorical Naive Bayes',2,'[]',16,1),(125,'2022-11-06 08:16:30.614217','M119','AdaBoost Classifier',1,'[{\"added\": {}}]',16,1),(126,'2022-11-06 08:18:09.176686','M120','AdaBoostRegressor',1,'[{\"added\": {}}]',16,1),(127,'2022-11-06 08:19:37.985977','M120','AdaBoostRegressor',2,'[]',16,1),(128,'2022-11-06 08:20:46.205231','M121','Voting Classifier',1,'[{\"added\": {}}]',16,1),(129,'2022-11-06 08:21:57.193550','M122','Voting Regressor',1,'[{\"added\": {}}]',16,1),(130,'2022-11-07 15:22:26.351320','2','Winning Team Prediction',1,'[{\"added\": {}}]',18,1),(131,'2022-11-07 15:23:48.085496','P34','SNAKE AND LADDER GAME',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(132,'2022-11-07 15:24:00.057484','P33','TIK TAK TOE',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(133,'2022-11-07 15:24:09.248635','P32','SNAKE GAME',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(134,'2022-11-07 15:24:22.784218','P31','ROCK PAPER SCISSOR',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(135,'2022-11-07 15:24:31.044969','P24','BASIC CALCULATOR',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(136,'2022-11-07 15:24:58.336446','P23','WEATHER APPLICATION',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(137,'2022-11-07 15:25:08.085936','P22','BANK APPLICATION',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(138,'2022-11-07 15:25:46.241749','P21','LIBRARY MANAGEMENT SYSTEM',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(139,'2022-11-07 15:26:05.204136','P14','DOGS BREED PREDICTION',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(140,'2022-11-07 15:26:17.453703','P13','DIGIT RECOGNITION',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(141,'2022-11-07 15:26:53.649928','P12','ATTENDENCE MONITORING SYSTEM',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(142,'2022-11-07 15:27:05.803859','P11','FACE MASK DETECTION',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(143,'2022-11-07 15:27:22.822129','P04','FLOWER SPECIES CLASSIFICATION',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(144,'2022-11-07 15:27:37.644682','P03','HOUSE PRICE PREDICTION',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(145,'2022-11-07 15:27:52.836324','P02','UBER DATA ANALYSIS',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(146,'2022-11-07 15:28:08.657452','P01','Winning Team Prediction',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(147,'2022-11-07 15:29:13.343487','3','Winning Team Prediction',2,'[{\"changed\": {\"fields\": [\"INTRODUCTION\"]}}]',12,1),(148,'2022-11-07 15:29:46.645883','3','WINNING TEAM PREDICTION',2,'[{\"changed\": {\"fields\": [\"NAME\"]}}]',12,1),(149,'2022-11-07 18:24:19.086719','P01','WINNING TEAM PREDICTION',2,'[{\"changed\": {\"fields\": [\"NAME\"]}}]',10,1),(150,'2022-11-07 18:37:34.502813','P13','FACE MASK DETECTION',2,'[{\"changed\": {\"fields\": [\"NAME\"]}}]',10,1),(151,'2022-11-07 18:38:00.069258','P11','CHATBOT',2,'[{\"changed\": {\"fields\": [\"NAME\"]}}]',10,1),(152,'2022-11-07 18:38:28.031545','P24','LIBRARY MANAGEMENT SYSTEM',2,'[{\"changed\": {\"fields\": [\"NAME\"]}}]',10,1),(153,'2022-11-07 18:38:47.131377','P21','MUSIC PLAYER',2,'[{\"changed\": {\"fields\": [\"NAME\"]}}]',10,1),(154,'2022-11-07 18:43:14.780173','P24','LIBRARY MANAGEMENT SYSTEM',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(155,'2022-11-07 18:43:28.584380','P21','MUSIC PLAYER',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(156,'2022-11-07 18:43:50.417076','P13','FACE MASK DETECTION',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(157,'2022-11-07 18:44:01.464941','P11','CHATBOT',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',10,1),(158,'2022-11-07 18:47:38.283524','3','Winning Team Prediction',2,'[{\"changed\": {\"fields\": [\"IMAGE\", \"NAME\"]}}]',12,1),(159,'2022-11-07 18:58:46.922858','2','Winning Team Prediction',2,'[{\"changed\": {\"fields\": [\"FEATURESMODEL\"]}}]',18,1),(160,'2022-11-08 04:16:44.473621','2','Winning Team Predict',2,'[{\"changed\": {\"fields\": [\"NAME\"]}}]',18,1),(161,'2022-11-08 04:24:12.438702','2','Winning Team Prediction',2,'[{\"changed\": {\"fields\": [\"NAME\"]}}]',18,1),(162,'2022-11-08 05:17:03.588984','2','Winning Team Prediction',2,'[{\"changed\": {\"fields\": [\"FEATURESMODEL\"]}}]',18,1),(163,'2022-11-08 13:40:31.612002','2','Winning Team Prediction',2,'[{\"changed\": {\"fields\": [\"FEATURESMODEL\"]}}]',18,1),(164,'2022-11-08 16:12:43.523521','3','Winning Team Prediction',2,'[{\"changed\": {\"fields\": [\"INTRODUCTION\", \"MODELS\", \"FEATURES\", \"APPLICATION\"]}}]',12,1),(165,'2022-11-08 16:18:49.582616','4','Uber Data Analysis',1,'[{\"added\": {}}]',12,1),(166,'2022-11-08 16:31:15.339153','5','House Price Prediction',1,'[{\"added\": {}}]',12,1),(167,'2022-11-08 16:32:40.595949','4','Uber Data Analysis',2,'[]',12,1),(168,'2022-11-08 16:44:01.025728','6','Flower Species Prediction',1,'[{\"added\": {}}]',12,1),(169,'2022-11-08 17:20:19.726401','7','Chatbot',1,'[{\"added\": {}}]',12,1),(170,'2022-11-08 17:26:46.326374','8','Attendance Monitoring System',1,'[{\"added\": {}}]',12,1),(171,'2022-11-08 17:29:19.729073','9','Face Mask Detection',1,'[{\"added\": {}}]',12,1),(172,'2022-11-08 17:34:54.239277','10','Dogs Breed Prediction',1,'[{\"added\": {}}]',12,1),(173,'2022-11-08 17:40:39.635792','11','Music Player',1,'[{\"added\": {}}]',12,1),(174,'2022-11-08 17:48:48.627839','12','Bank Application',1,'[{\"added\": {}}]',12,1),(175,'2022-11-08 17:58:03.256677','13','Weather Application',1,'[{\"added\": {}}]',12,1),(176,'2022-11-08 18:06:34.523597','14','Library Management System',1,'[{\"added\": {}}]',12,1),(177,'2022-11-08 18:12:09.591729','15','Rock Paper Scissor',1,'[{\"added\": {}}]',12,1),(178,'2022-11-08 18:13:49.111481','16','Snake Game',1,'[{\"added\": {}}]',12,1),(179,'2022-11-08 18:16:11.990185','17','Tik Tak Toe',1,'[{\"added\": {}}]',12,1),(180,'2022-11-08 18:18:32.361715','18','Snake and Ladder Game',1,'[{\"added\": {}}]',12,1),(181,'2022-11-08 18:18:45.502806','3','Winning Team Prediction',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',12,1),(182,'2022-11-08 18:18:59.326221','4','Uber Data Analysis',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',12,1),(183,'2022-11-08 18:19:20.560315','5','House Price Prediction',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',12,1),(184,'2022-11-08 18:19:39.050169','6','Flower Species Prediction',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',12,1),(185,'2022-11-08 18:20:57.302161','7','Chatbot',2,'[{\"changed\": {\"fields\": [\"IMAGE\", \"MODELS\"]}}]',12,1),(186,'2022-11-08 18:21:08.041607','8','Attendance Monitoring System',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',12,1),(187,'2022-11-08 18:21:20.199577','9','Face Mask Detection',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',12,1),(188,'2022-11-08 18:21:33.287441','10','Dogs Breed Prediction',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',12,1),(189,'2022-11-08 18:21:48.707720','11','Music Player',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',12,1),(190,'2022-11-08 18:21:57.693189','12','Bank Application',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',12,1),(191,'2022-11-08 18:22:14.455093','13','Weather Application',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',12,1),(192,'2022-11-08 20:16:35.217085','B104','margayimerito',3,'',15,1),(193,'2022-11-08 20:16:35.323229','B103','margayimerito',3,'',15,1),(194,'2022-11-08 20:16:35.328228','B102','margayimerito',3,'',15,1),(195,'2022-11-08 20:16:35.331312','B101','iris',3,'',15,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'Authentication','student'),(14,'Authentication','user'),(5,'contenttypes','contenttype'),(7,'Home','base_class'),(15,'Home','buildmlmodel'),(18,'Home','demomodel'),(11,'Home','genremodel'),(9,'Home','info'),(12,'Home','informationmodel'),(16,'Home','machinelearningmodel'),(17,'Home','parametermodel'),(8,'Home','projects'),(10,'Home','projectsmodel'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-10-25 07:03:30.999593'),(2,'auth','0001_initial','2022-10-25 07:03:31.236433'),(3,'admin','0001_initial','2022-10-25 07:03:31.299763'),(4,'admin','0002_logentry_remove_auto_add','2022-10-25 07:03:31.299763'),(5,'admin','0003_logentry_add_action_flag_choices','2022-10-25 07:03:31.315858'),(6,'contenttypes','0002_remove_content_type_name','2022-10-25 07:03:31.363055'),(7,'auth','0002_alter_permission_name_max_length','2022-10-25 07:03:31.397400'),(8,'auth','0003_alter_user_email_max_length','2022-10-25 07:03:31.410427'),(9,'auth','0004_alter_user_username_opts','2022-10-25 07:03:31.410427'),(10,'auth','0005_alter_user_last_login_null','2022-10-25 07:03:31.441790'),(11,'auth','0006_require_contenttypes_0002','2022-10-25 07:03:31.441790'),(12,'auth','0007_alter_validators_add_error_messages','2022-10-25 07:03:31.457526'),(13,'auth','0008_alter_user_username_max_length','2022-10-25 07:03:31.488967'),(14,'auth','0009_alter_user_last_name_max_length','2022-10-25 07:03:31.520698'),(15,'auth','0010_alter_group_name_max_length','2022-10-25 07:03:31.536527'),(16,'auth','0011_update_proxy_permissions','2022-10-25 07:03:31.552241'),(17,'auth','0012_alter_user_first_name_max_length','2022-10-25 07:03:31.583705'),(18,'sessions','0001_initial','2022-10-25 07:03:31.599753'),(19,'Home','0001_initial','2022-10-25 14:29:00.741722'),(20,'Home','0002_info_remove_projects_g_id','2022-10-25 17:15:32.500846'),(21,'Home','0003_alter_projects_project_name','2022-10-27 06:19:46.110877'),(22,'Authentication','0001_initial','2022-11-03 06:13:03.392010'),(23,'Home','0004_genremodel_informationmodel_projectsmodel_and_more','2022-11-03 06:13:03.582336'),(24,'Authentication','0002_alter_user_mobile','2022-11-05 06:36:34.816199'),(25,'Home','0002_params_buildmlmodel_uid_modelsparams','2022-11-05 12:43:53.040087'),(26,'Home','0003_rename_parameters_informationmodel_features','2022-11-06 04:08:53.122026'),(27,'Home','0004_rename_modelsparams_machinelearningmodel_and_more','2022-11-06 04:11:57.121304'),(28,'Home','0005_alter_informationmodel_application_and_more','2022-11-06 04:16:13.293176'),(29,'Home','0006_informationmodel_name','2022-11-06 04:25:56.243695'),(30,'Home','0002_delete_buildmlmodel','2022-11-07 17:28:54.201561'),(31,'Home','0003_buildmlmodel','2022-11-07 17:30:50.754668'),(32,'Home','0004_informationmodel_image_alter_buildmlmodel_dataset_and_more','2022-11-07 18:30:22.673052'),(33,'Home','0005_alter_demomodel_name','2022-11-08 04:15:27.758405'),(34,'Home','0006_alter_demomodel_name','2022-11-08 04:23:19.673899'),(35,'Home','0005_buildmlmodel_f_encoder','2022-11-08 05:13:43.107466'),(36,'Home','0007_merge_20221108_1018','2022-11-08 05:13:43.112548'),(37,'Home','0008_informationmodel_dataset_informationmodel_technology','2022-11-08 19:53:21.426072');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1nyl90gxwq42d4qrjkhwnxahtvgkpegu','.eJxVjDsOwjAQBe_iGln-O6Gk5wzW7nqNA8iR4qRC3B0ipYD2zcx7iQTbWtPWeUlTFmehxel3Q6AHtx3kO7TbLGlu6zKh3BV50C6vc-bn5XD_Dir0-q2NJx-jZjCIZfAFrdXgHAdWzhBmF7XORQUbIqvgRjYDQKYSjKU4Moj3B-XDOCg:1oqYRJ:eJPze_azQRT-C0erQ8G_fM4e5UfP4duAgbHHibu3C7g','2022-11-17 11:31:17.363251'),('eo84lev702n6td8b034h986qc0k0n1cp','.eJxVjDsOwjAQBe_iGln-O6Gk5wzW7nqNA8iR4qRC3B0ipYD2zcx7iQTbWtPWeUlTFmehxel3Q6AHtx3kO7TbLGlu6zKh3BV50C6vc-bn5XD_Dir0-q2NJx-jZjCIZfAFrdXgHAdWzhBmF7XORQUbIqvgRjYDQKYSjKU4Moj3B-XDOCg:1orCbg:Ld7aMEgMHYObNAfUWaVpQQdYXyrr7WAQ6Y71KiNOFmw','2022-11-19 06:24:40.417243'),('i4ggbann5tvl4vhppyn0siv6m0fz86ho','.eJxVjDsOwjAQBe_iGln-O6Gk5wzW7nqNA8iR4qRC3B0ipYD2zcx7iQTbWtPWeUlTFmehxel3Q6AHtx3kO7TbLGlu6zKh3BV50C6vc-bn5XD_Dir0-q2NJx-jZjCIZfAFrdXgHAdWzhBmF7XORQUbIqvgRjYDQKYSjKU4Moj3B-XDOCg:1orIVT:pJrJYRUS-SUqp4GEdzWe7IHRAN5zVZwA7L-inCINwRY','2022-11-19 12:42:39.689913'),('mbee60u24n376n5fynetbvkiz6qxl3ex','.eJxVjDsOwjAQBe_iGln-O6Gk5wzW7nqNA8iR4qRC3B0ipYD2zcx7iQTbWtPWeUlTFmehxel3Q6AHtx3kO7TbLGlu6zKh3BV50C6vc-bn5XD_Dir0-q2NJx-jZjCIZfAFrdXgHAdWzhBmF7XORQUbIqvgRjYDQKYSjKU4Moj3B-XDOCg:1os5sP:d4lo04t91MurhboAcjmHJDFx4tLMlHJPl7NNuXdyY3Y','2022-11-21 17:25:37.147517'),('x1cf6w8wwbgqq2lllph8y663ct8vwvim','.eJxVjDsOwjAQBe_iGln-O6Gk5wzW7nqNA8iR4qRC3B0ipYD2zcx7iQTbWtPWeUlTFmehxel3Q6AHtx3kO7TbLGlu6zKh3BV50C6vc-bn5XD_Dir0-q2NJx-jZjCIZfAFrdXgHAdWzhBmF7XORQUbIqvgRjYDQKYSjKU4Moj3B-XDOCg:1os3wM:6TBqsciKV6JbteKB75Qy53A3BVyAtY0_skI5IFgkeQ4','2022-11-21 15:21:34.691736'),('y8u97ttrhanckge8l7o7np74if6ghtgu','.eJxVjDsOwjAQBe_iGln-O6Gk5wzW7nqNA8iR4qRC3B0ipYD2zcx7iQTbWtPWeUlTFmehxel3Q6AHtx3kO7TbLGlu6zKh3BV50C6vc-bn5XD_Dir0-q2NJx-jZjCIZfAFrdXgHAdWzhBmF7XORQUbIqvgRjYDQKYSjKU4Moj3B-XDOCg:1oqYAu:Gnk3MsLZUeyuioRaidfUuE2tefW8lMhR-jPTgWQfB0I','2022-11-17 11:14:20.927702');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_buildmlmodel`
--

DROP TABLE IF EXISTS `home_buildmlmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_buildmlmodel` (
  `BID` varchar(10) NOT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `DATASET` varchar(100) DEFAULT NULL,
  `TRAIN_X` varchar(100) DEFAULT NULL,
  `TEST_X` varchar(100) DEFAULT NULL,
  `TRAIN_Y` varchar(100) DEFAULT NULL,
  `TEST_Y` varchar(100) DEFAULT NULL,
  `T_ENCODER` varchar(100) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `MODELID` varchar(10) DEFAULT NULL,
  `MODEL` varchar(100) DEFAULT NULL,
  `UID_id` varchar(50) DEFAULT NULL,
  `F_ENCODER` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BID`),
  KEY `Home_buildmlmodel_UID_id_18e9ffda_fk_Authentication_user_UID` (`UID_id`),
  CONSTRAINT `Home_buildmlmodel_UID_id_18e9ffda_fk_Authentication_user_UID` FOREIGN KEY (`UID_id`) REFERENCES `authentication_user` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_buildmlmodel`
--

LOCK TABLES `home_buildmlmodel` WRITE;
/*!40000 ALTER TABLE `home_buildmlmodel` DISABLE KEYS */;
INSERT INTO `home_buildmlmodel` VALUES ('B101','samosa','Dataset/titanic.csv','Dataset/Training/B101_x_train_AH7g7fm.csv','Dataset/Testing/B101_x_test_RtlJXiH.csv','Dataset/Training/B101_y_train_AfYfdnq.csv','Dataset/Testing/B101_y_test_5bWUY2t.csv','Dataset/Encoder/B101_T_encoder.pkl','Classification','M121','Models/B101_M121_model_tYTpVF7.pkl','U102','Dataset/Encoder/B101_F_encoder.pkl');
/*!40000 ALTER TABLE `home_buildmlmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_demomodel`
--

DROP TABLE IF EXISTS `home_demomodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_demomodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `FEATURESMODEL` json DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_demomodel`
--

LOCK TABLES `home_demomodel` WRITE;
/*!40000 ALTER TABLE `home_demomodel` DISABLE KEYS */;
INSERT INTO `home_demomodel` VALUES (2,'{\"Petal_width\": \"6\", \"Sepal_width\": \"4\", \"Petal_length\": \"5\", \"Sepal_length\": \"5\"}','Winning Team Prediction');
/*!40000 ALTER TABLE `home_demomodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_genremodel`
--

DROP TABLE IF EXISTS `home_genremodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_genremodel` (
  `GID` varchar(10) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_genremodel`
--

LOCK TABLES `home_genremodel` WRITE;
/*!40000 ALTER TABLE `home_genremodel` DISABLE KEYS */;
INSERT INTO `home_genremodel` VALUES ('G10','MACHINE LEARNING'),('G11','DEEP LEARNING'),('G12','BASICS'),('G13','GAMES');
/*!40000 ALTER TABLE `home_genremodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_informationmodel`
--

DROP TABLE IF EXISTS `home_informationmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_informationmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `INTRODUCTION` longtext,
  `MODELS` longtext,
  `FEATURES` longtext,
  `APPLICATION` longtext,
  `PID_id` varchar(10) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `IMAGE` varchar(100) DEFAULT NULL,
  `DATASET` json DEFAULT NULL,
  `TECHNOLOGY` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Home_informationmodel_PID_id_c691ae30_fk_Home_projectsmodel_PID` (`PID_id`),
  CONSTRAINT `Home_informationmodel_PID_id_c691ae30_fk_Home_projectsmodel_PID` FOREIGN KEY (`PID_id`) REFERENCES `home_projectsmodel` (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_informationmodel`
--

LOCK TABLES `home_informationmodel` WRITE;
/*!40000 ALTER TABLE `home_informationmodel` DISABLE KEYS */;
INSERT INTO `home_informationmodel` VALUES (3,'This project aims to predict the outcome of a cricket match given the team configurations and the previous performances of the team.\r\n It will allow user to Predict the winning team in cricket against a certain opposition team and at a venue based on his previous records and stats of a certain period.','A random forest regressor :-\r\n\r\nA random forest is a meta estimator that fits a number of classifying decision trees on various sub-samples of the dataset and uses averaging to improve the predictive accuracy and control over-fitting. The sub-sample size is controlled with the max_samples parameter if bootstrap=True (default), otherwise the whole dataset is used to build each tree.','1) It predicts the winning team name in accordance with the previous dataset.\r\n\r\n2)Dataset also consist of venue as a feature.','1) Teams can prepare themself for future matches in accordance with the prediction\r\n\r\n2) It can be used for Bidding','P01','Winning Team Prediction','Images/India-vs-pakistan-770x433_wajp09T.webp',NULL,NULL),(4,'We will perform data analysis on riders data from Uber. On the Basis of data present we will look different Senerios at which the travellers is travelling from source to destination and at which rime duration .','Gradient Bosting Regressor :\r\n\r\nThis estimator builds an additive model in a forward stage-wise fashion; it allows for the optimization of arbitrary differentiable loss functions. In each stage a regression tree is fit on the negative gradient of the given loss function.','1) People can search for cabs as per the traffic conditions earlier or at the time leaving of home .\r\n\r\n2) Proper management of cabs by the company can be done','1) It will help you to know the trip date, source, destination, distance travelled and purpose of the trip. \r\n\r\n2) By knowing or getting idea of these information, company can make changes in its features to improve business model.','P02','Uber Data Analysis','Images/uber_data_analysis_oL2khRI.jpeg',NULL,NULL),(5,'I thought I’d try my hand at Kaggle’s advanced regression techniques competition taking you along on the journey with me. If you’re getting into machine learning and want to see a project end to end, please stick around. I will walk you through the steps I’ve taken and attempt to deliver a crash course in machine learning at the same time.','Random Forest Regressor :\r\n\r\nA random forest is a meta estimator that fits a number of classifying decision trees on various sub-samples of the dataset and uses averaging to improve the predictive accuracy and control over-fitting. The sub-sample size is controlled with the max_samples parameter if bootstrap=True (default), otherwise the whole dataset is used to build each tree.','1) Home owner can sell their house my remembering the value of prediction in their mind .\r\n\r\n2) Home buyer can lookover the predicted value range.','1) Bidding of Homes','P03','House Price Prediction','Images/house_price_prediction_O7QEQ5L.jpg',NULL,NULL),(6,'This Project is for predicting the species of flowers on the basis of their features which consist of petal length , petal width , sepal length and sepal width. Basically there are 3 major species of flowers which consists setosa , versicolor and veginica.','Support Vector Classifier :\r\n\r\nhe implementation is based on libsvm. The fit time scales at least quadratically with the number of samples and may be impractical beyond tens of thousands of samples. For large datasets consider using LinearSVC or SGDClassifier instead, possibly after a Nystroem transformer.\r\n\r\nThe multiclass support is handled according to a one-vs-one scheme.','1) Rectifying flowers and their fetures is easy','1) Rectification of Flowers through digit machines.','P04','Flower Species Prediction','Images/flowe_prediction_qGO8bKg.png',NULL,NULL),(7,'At the most basic level, a chatbot is a computer program that simulates and processes human conversation (either written or spoken), allowing humans to interact with digital devices as if they were communicating with a real person. Chatbots can be as simple as rudimentary programs that answer a simple query with a single-line response, or as sophisticated as digital assistants that learn and evolve to deliver increasing levels of personalization as they gather and process information.','Gaussian Naive Bayes (GaussianNB). :\r\n\r\nan perform online updates to model parameters via partial_fit. For details on algorithm used to update feature means and variance online, see Stanford CS tech report STAN-CS-79-773 by Chan, Golub, and LeVeque:','1) Deliver contextual responses\r\n\r\n2) Live chat handover','1) Chatbot can we used for content delivery to customers of different website.\r\n\r\n2) It can be Used in college website for enquiry of college.','P11','Chatbot','Images/chatbot_XegkxWk.jpg',NULL,NULL),(8,'Student attendance management system deal with the maintenance of the student’s attendance details. It generates the attendance of the student on basis of presence in class.\r\nThe student attendance report based on monthly and consolidate will be generated. The staffs handling the particular subjects can mark the attendance of all the students. The student’s attendance reports based on weekly and consolidate will be generated.','Convolutional Neural Network :\r\n\r\nA Convolutional Neural Network (ConvNet/CNN) is a Deep Learning algorithm which can take in an input image, assign importance (learnable weights and biases) to various aspects/objects in the image and be able to differentiate one from the other. The pre-processing required in a ConvNet is much lower as compared to other classification algorithms. While in primitive methods filters are hand-engineered, with enough training, ConvNets have the ability to learn these filters/characteristics.','1) It is used for digital attendance at any industry and hence reduces the need for manual attendance.','1) This system developed will reduce the manual work and avoid redundant data. By maintaining the attendance manually, then efficient reports cannot be generated.  \r\n\r\n2) The system can generate efficient weekly, consolidate report based on the attendance.\r\n\r\n3) As the attendances are maintained in registers it has been a tough task for admin and staff to maintain for long time. Instead, the software can keep long and retrieve the information when needed.','P12','Attendance Monitoring System','Images/attendance_system_7lWLw63.jpg',NULL,NULL),(9,'To prevent the spread of Coronavirus, this project has made to develop a real-time face mask detection through webcam. \r\nThis system using Machine Learning and Artificial Intelligence with image processing. This project can detect face mask into three classes. First, without a mask class is people wearing a face mask correctly. Second, an incorrect mask class is people wearing a mask, but the mask does not cover a mouth or a nose. Another one is a correct mask is people wearing a face mask properly.','Convolutional Neural Network :\r\n\r\nA Convolutional Neural Network (ConvNet/CNN) is a Deep Learning algorithm which can take in an input image, assign importance (learnable weights and biases) to various aspects/objects in the image and be able to differentiate one from the other. The pre-processing required in a ConvNet is much lower as compared to other classification algorithms. While in primitive methods filters are hand-engineered, with enough training, ConvNets have the ability to learn these filters/characteristics.','1) This project consist on cnn model which is trained on huge amount of mask and without mask images dataset.','1)  Using this model, we can easily detect person who are wearing mask and who are not wearing mask.\r\n\r\n2)  In crowded place it is difficult to determine person with mask and without mask so, this system can easily detect them.','P13','Face Mask Detection','Images/face-mask_detection_zFfj62r.png',NULL,NULL),(10,'This model can be used to predict different types of dogs breed on the basis of sample image or a real dog standing in front of camera.','A Convolutional Neural Network (ConvNet/CNN) is a Deep Learning algorithm which can take in an input image, assign importance (learnable weights and biases) to various aspects/objects in the image and be able to differentiate one from the other. The pre-processing required in a ConvNet is much lower as compared to other classification algorithms. While in primitive methods filters are hand-engineered, with enough training, ConvNets have the ability to learn these filters/characteristics.','1) Predicts Dogs Breed on the basis of sample train data .\r\n\r\n2) Predicts Several Breeds of Dog.','1) Can be used to classify different Dogs for providing them food of their features for good growth.','P14','Dogs Breed Prediction','Images/dog_breed_prediction_Dlywkfr.jpeg',NULL,NULL),(11,'The music player allows a user to play various media file formats. It can be used to play audio as well as video files. The music player is a software project supporting all known\r\nmedia files and has the ability to play them with ease.','It Requires no model but a High level of Web development and also good database requirement.','1) Clearly arranged all-in-one-view application.\r\n\r\n2) Browse your music by albums, artists, genres, playlists and tracks.\r\n\r\n3) Unique waveform display that visualizes your music.','1) Artificial Intellegance can be added with Music Player to make it more Productive.','P21','Music Player','Images/music_player_UGifuq8.jpg',NULL,NULL),(12,'The Bank Account Management System is an application for maintaining a person\'s account in a bank. In this project I tried to show the working of a banking account system and cover the basic functionality of a Bank Account Management System. To develop a project for solving financial applications of a customer in banking environment in order to nurture the needs of an end banking user by providing various ways to perform banking tasks. Also to enable the user’s work space to have additional functionalities which are not provided under a conventional banking project.','No model is Required','1) Bank Account Management of each an every user digitally.\r\n\r\n2) Advanced Security & Fraud Alerts\r\n\r\n3) Peer-to-Peer Payments','1) Direct Account opening of user can be done from home only.','P22','Bank Application','Images/bank_application_system_bvQ3Bkz.webp',NULL,NULL),(13,'These can be simply termed as the compact weather devices, as they do not only tell about the temperature of that specific region instead they can describe the accurate time of the sunrise and sunset, the time of the rainfall, humidity levels, etc.','No model used','1) The changes in the weather conditions across the globe are simply displayed by using images and pictures. This feature explains the previous climatic conditions, at the present moment and how it will be in the next consequences.\r\n\r\n2) Time of sunrise and sunset','1) Can be modifies in future by adding alarming system in weather applications.','P23','Weather Application','Images/weather_application_system_qMjZ8gA.jpg',NULL,NULL),(14,'A college library management is a project that manages and stores books information electronically according to student’s needs. The system helps both students and library manager to keep a constant track of all the books available in the library. It allows both the admin and the student to search for the desired book. It becomes necessary for colleges to keep a continuous check on the books issued and returned and even calculate fine. This task if carried out manually will be tedious and includes chances of mistakes. These errors are avoided by allowing the system to keep track of information such as issue date, last date to return the book and even fine information and thus there is no need to keep manual track of this information which thereby avoids chances of mistakes.\r\nThus this system reduces manual work to a great extent allows smooth flow of library activities by removing chances of errors in the details.','No model apllied','1) Catalog management: to digitally keep track of what is available in the library. \r\n\r\n2) Circulation management: to track the movement of books\r\n\r\n3) Bar-coding: to give specific identification to each book','1) In future More advancement like payement can be done in library management system.','P24','Library Management System','Images/library_management_system_3c01VBr.png',NULL,NULL),(15,'Rock paper scissors (also known by other orderings of the three items, with \"rock\" sometimes being called \"stone,\" or as Rochambeau, roshambo, or ro-sham-bo) is a hand game originating from China, usually played between two people, in which each player simultaneously forms one of three shapes with an outstretched hand.','No model used','`1) It is Game with hand signs \r\n\r\n2) It is Game played between two users','No applications','P31','Rock Paper Scissor','Images/rock_paper_scissor_IVhgjIv.webp',NULL,NULL),(16,'The player controls a long, thin creature, resembling a snake, which roams around on a bordered plane, picking up food (or some other item), trying to avoid hitting its own tail or the edges of the playing area. Each time the snake eats a piece of food, its tail grows longer, making the game increasingly difficult.','No model used','1) It is Game where snake room around the board and eats candies and mush more eatable item.','No applications','P32','Snake Game','Images/snake_game_sANH7JI.jpg',NULL,NULL),(17,'Tic-tac-toe is a game in which two players take turns in drawing either an ` O\' or an ` X\' in one square of a grid consisting of nine squares. The winner is the first player to get three of the same symbols in a row.','No model used','1) It is a Game played between two players.\r\n\r\n2) They have to mark croos or zero on the board.','No application','P33','Tik Tak Toe','Images/tik_tak_toe_1_Yr2kOKC.webp',NULL,NULL),(18,'Snakes and ladders is a board game for two or more players regarded today as a worldwide classic.[1] The game originated in ancient India as Moksha Patam, and was brought to the UK in the 1890s. It is played on a game board with numbered, gridded squares. A number of \"ladders\" and \"snakes\" are pictured on the board, each connecting two specific board squares. The object of the game is to navigate one\'s game piece, according to die rolls, from the start (bottom square) to the finish (top square), helped by climbing ladders but hindered by falling down snakes.','No Model used','1) It is a Game of snakes and ladder and player have to reach at the add which at 100 position on the board.','No application','P34','Snake and Ladder Game','Images/snake_yppB7fh.webp',NULL,NULL);
/*!40000 ALTER TABLE `home_informationmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_machinelearningmodel`
--

DROP TABLE IF EXISTS `home_machinelearningmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_machinelearningmodel` (
  `MODELID` varchar(50) NOT NULL,
  `MODELNAME` varchar(225) DEFAULT NULL,
  `TYPE` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`MODELID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_machinelearningmodel`
--

LOCK TABLES `home_machinelearningmodel` WRITE;
/*!40000 ALTER TABLE `home_machinelearningmodel` DISABLE KEYS */;
INSERT INTO `home_machinelearningmodel` VALUES ('M101','Linear Regression','Regression'),('M102','Logistic Regression','Regression'),('M103','Lasso','Regression'),('M104','Ridge','Regression'),('M105','Support Vector Classifier','Classification'),('M106','Support Vector Regressor','Regression'),('M107','K-Nearest Neighbors','Classification'),('M108','Random Forest Regressor','Regression'),('M109','Random Forest Classifier','Classification'),('M110','SGD Regressor','Regression'),('M111','SGD Classifier','Classification'),('M112','Bayesian Ridge Regression','Regression'),('M113','Bayesian Ridge Classifier','Classification'),('M114','Gaussian Naive Bayes','Classification'),('M115','Multinomial Naive Bayes','Classification'),('M116','Complement Naive Bayes','Classification'),('M117','Bernoulli Naive Byaes','Classification'),('M118','Categorical Naive Bayes','Classification'),('M119','AdaBoost Classifier','Classification'),('M120','AdaBoostRegressor','Regression'),('M121','Voting Classifier','Classification'),('M122','Voting Regressor','Regression');
/*!40000 ALTER TABLE `home_machinelearningmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_machinelearningmodel_params`
--

DROP TABLE IF EXISTS `home_machinelearningmodel_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_machinelearningmodel_params` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `machinelearningmodel_id` varchar(50) NOT NULL,
  `parametermodel_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Home_modelsparams_PARAMS_modelsparams_id_params_id_db777ed5_uniq` (`machinelearningmodel_id`,`parametermodel_id`),
  KEY `Home_modelsparams_PA_params_id_1e32ce2b_fk_Home_para` (`parametermodel_id`),
  CONSTRAINT `Home_machinelearning_machinelearningmodel_b9d40732_fk_Home_mach` FOREIGN KEY (`machinelearningmodel_id`) REFERENCES `home_machinelearningmodel` (`MODELID`),
  CONSTRAINT `Home_machinelearning_parametermodel_id_ef22c22f_fk_Home_para` FOREIGN KEY (`parametermodel_id`) REFERENCES `home_parametermodel` (`PARAMID`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_machinelearningmodel_params`
--

LOCK TABLES `home_machinelearningmodel_params` WRITE;
/*!40000 ALTER TABLE `home_machinelearningmodel_params` DISABLE KEYS */;
INSERT INTO `home_machinelearningmodel_params` VALUES (2,'M101','PARAM101'),(1,'M101','PARAM102'),(4,'M101','PARAM103'),(5,'M101','PARAM104'),(3,'M101','PARAM105'),(12,'M102','PARAM104'),(10,'M102','PARAM106'),(6,'M102','PARAM107'),(7,'M102','PARAM108'),(13,'M102','PARAM109'),(19,'M102','PARAM110'),(18,'M102','PARAM111'),(16,'M102','PARAM112'),(11,'M102','PARAM113'),(9,'M102','PARAM114'),(15,'M102','PARAM115'),(14,'M102','PARAM116'),(17,'M102','PARAM117'),(8,'M102','PARAM118'),(25,'M103','PARAM101'),(24,'M103','PARAM102'),(20,'M103','PARAM103'),(28,'M103','PARAM105'),(21,'M103','PARAM108'),(27,'M103','PARAM112'),(22,'M103','PARAM114'),(26,'M103','PARAM117'),(23,'M103','PARAM119'),(29,'M103','PARAM121'),(36,'M104','PARAM101'),(35,'M104','PARAM102'),(30,'M104','PARAM103'),(38,'M104','PARAM105'),(31,'M104','PARAM108'),(37,'M104','PARAM112'),(34,'M104','PARAM113'),(32,'M104','PARAM114'),(33,'M104','PARAM119'),(39,'M105','PARAM108'),(43,'M105','PARAM109'),(48,'M105','PARAM111'),(46,'M105','PARAM112'),(40,'M105','PARAM114'),(44,'M105','PARAM116'),(41,'M105','PARAM136'),(45,'M105','PARAM137'),(47,'M105','PARAM138'),(50,'M105','PARAM139'),(42,'M105','PARAM140'),(51,'M105','PARAM141'),(49,'M105','PARAM142'),(52,'M106','PARAM108'),(57,'M106','PARAM109'),(54,'M106','PARAM114'),(58,'M106','PARAM116'),(53,'M106','PARAM128'),(55,'M106','PARAM136'),(59,'M106','PARAM137'),(60,'M106','PARAM138'),(61,'M106','PARAM139'),(56,'M106','PARAM140'),(62,'M106','PARAM141'),(65,'M107','PARAM104'),(66,'M107','PARAM143'),(64,'M107','PARAM144'),(67,'M107','PARAM145'),(63,'M107','PARAM146'),(71,'M108','PARAM104'),(75,'M108','PARAM112'),(73,'M108','PARAM116'),(74,'M108','PARAM117'),(77,'M108','PARAM155'),(78,'M108','PARAM158'),(69,'M108','PARAM159'),(70,'M108','PARAM160'),(68,'M108','PARAM161'),(76,'M108','PARAM162'),(72,'M108','PARAM163'),(82,'M109','PARAM104'),(86,'M109','PARAM112'),(84,'M109','PARAM116'),(85,'M109','PARAM117'),(80,'M109','PARAM156'),(88,'M109','PARAM158'),(89,'M109','PARAM159'),(81,'M109','PARAM160'),(79,'M109','PARAM161'),(87,'M109','PARAM162'),(83,'M109','PARAM163'),(96,'M110','PARAM101'),(95,'M110','PARAM106'),(91,'M110','PARAM108'),(99,'M110','PARAM112'),(92,'M110','PARAM114'),(98,'M110','PARAM116'),(93,'M110','PARAM119'),(101,'M110','PARAM126'),(90,'M110','PARAM127'),(94,'M110','PARAM128'),(97,'M110','PARAM129'),(100,'M110','PARAM135'),(103,'M111','PARAM101'),(118,'M111','PARAM104'),(114,'M111','PARAM106'),(102,'M111','PARAM108'),(106,'M111','PARAM111'),(105,'M111','PARAM112'),(113,'M111','PARAM114'),(115,'M111','PARAM116'),(120,'M111','PARAM117'),(112,'M111','PARAM118'),(108,'M111','PARAM119'),(107,'M111','PARAM126'),(110,'M111','PARAM127'),(117,'M111','PARAM128'),(119,'M111','PARAM129'),(109,'M111','PARAM130'),(116,'M111','PARAM131'),(122,'M111','PARAM132'),(111,'M111','PARAM133'),(104,'M111','PARAM134'),(121,'M111','PARAM135'),(126,'M112','PARAM101'),(125,'M112','PARAM102'),(123,'M112','PARAM103'),(124,'M112','PARAM108'),(127,'M112','PARAM116'),(128,'M112','PARAM122'),(130,'M112','PARAM123'),(131,'M112','PARAM124'),(129,'M112','PARAM125'),(138,'M113','PARAM101'),(137,'M113','PARAM102'),(132,'M113','PARAM103'),(140,'M113','PARAM105'),(133,'M113','PARAM108'),(141,'M113','PARAM111'),(139,'M113','PARAM112'),(136,'M113','PARAM113'),(134,'M113','PARAM114'),(135,'M113','PARAM119'),(142,'M114','PARAM148'),(143,'M114','PARAM149'),(144,'M115','PARAM119'),(145,'M115','PARAM150'),(146,'M115','PARAM151'),(147,'M116','PARAM119'),(149,'M116','PARAM150'),(150,'M116','PARAM151'),(148,'M116','PARAM152'),(151,'M117','PARAM119'),(152,'M117','PARAM150'),(153,'M117','PARAM151'),(154,'M117','PARAM153'),(155,'M118','PARAM119'),(157,'M118','PARAM150'),(158,'M118','PARAM151'),(156,'M118','PARAM154'),(161,'M119','PARAM112'),(160,'M119','PARAM129'),(163,'M119','PARAM145'),(159,'M119','PARAM163'),(162,'M119','PARAM170'),(166,'M120','PARAM112'),(168,'M120','PARAM126'),(165,'M120','PARAM129'),(164,'M120','PARAM163'),(167,'M120','PARAM170'),(171,'M121','PARAM104'),(173,'M121','PARAM116'),(170,'M121','PARAM144'),(169,'M121','PARAM166'),(172,'M121','PARAM167'),(174,'M121','PARAM168'),(178,'M122','PARAM104'),(175,'M122','PARAM116'),(176,'M122','PARAM144'),(177,'M122','PARAM166');
/*!40000 ALTER TABLE `home_machinelearningmodel_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_parametermodel`
--

DROP TABLE IF EXISTS `home_parametermodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_parametermodel` (
  `PARAMID` varchar(50) NOT NULL,
  `PARAMNAME` varchar(225) NOT NULL,
  `DISCRIPTION` longtext,
  `DEFAULT_VALUE` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`PARAMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_parametermodel`
--

LOCK TABLES `home_parametermodel` WRITE;
/*!40000 ALTER TABLE `home_parametermodel` DISABLE KEYS */;
INSERT INTO `home_parametermodel` VALUES ('PARAM101','fit_intercept','Whether to calculate the intercept for this model. If set to False, no intercept will be used in calculations (i.e. data is expected to be centered).','True'),('PARAM102','normalize','This parameter is ignored when fit_intercept is set to False. If True, the regressors X will be normalized before regression by subtracting the mean and dividing by the l2-norm. If you wish to standardize, please use StandardScaler before calling fit on an estimator with normalize=False.','False'),('PARAM103','copy_X','If True, X will be copied; else, it may be overwritten.','True'),('PARAM104','n_jobs','The number of jobs to use for the computation. This will only provide speedup in case of sufficiently large problems, that is if firstly n_targets > 1 and secondly X is sparse or if positive is set to True. None means 1 unless in a joblib.parallel_backend context. -1 means using all processors. See Glossary for more details.','None'),('PARAM105','positive','When set to True, forces the coefficients to be positive. This option is only supported for dense arrays.','False'),('PARAM106','penalty','Specify the norm of the penalty:\r\n\r\n\'none\': no penalty is added;\r\n\r\n\'l2\': add a L2 penalty term and it is the default choice;\r\n\r\n\'l1\': add a L1 penalty term;\r\n\r\n\'elasticnet\': both L1 and L2 penalty terms are added.','l2'),('PARAM107','dual','Dual or primal formulation. Dual formulation is only implemented for l2 penalty with liblinear solver. Prefer dual=False when n_samples > n_features.','False'),('PARAM108','tol','Tolerance for stopping criteria.','1e-4'),('PARAM109','C','Inverse of regularization strength; must be a positive float. Like in support vector machines, smaller values specify stronger regularization.','1.0'),('PARAM110','intercept_scaling','Useful only when the solver ‘liblinear’ is used and self.fit_intercept is set to True. In this case, x becomes [x, self.intercept_scaling], i.e. a “synthetic” feature with constant value equal to intercept_scaling is appended to the instance vector. The intercept becomes intercept_scaling * synthetic_feature_weight.\r\n\r\nNote! the synthetic feature weight is subject to l1/l2 regularization as all other features. To lessen the effect of regularization on synthetic feature weight (and therefore on the intercept) intercept_scaling has to be increased.','1'),('PARAM111','class_weight','Weights associated with classes in the form {class_label: weight}. If not given, all classes are supposed to have weight one.\r\n\r\nThe “balanced” mode uses the values of y to automatically adjust weights inversely proportional to class frequencies in the input data as n_samples / (n_classes * np.bincount(y)).\r\n\r\nNote that these weights will be multiplied with sample_weight (passed through the fit method) if sample_weight is specified.','None'),('PARAM112','random_state','Used when solver == ‘sag’, ‘saga’ or ‘liblinear’ to shuffle the data. See Glossary for details.','None'),('PARAM113','solver','Algorithm to use in the optimization problem. Default is ‘lbfgs’. To choose a solver, you might want to consider the following aspects:\r\n\r\nFor small datasets, ‘liblinear’ is a good choice, whereas ‘sag’ and ‘saga’ are faster for large ones;\r\n\r\nFor multiclass problems, only ‘newton-cg’, ‘sag’, ‘saga’ and ‘lbfgs’ handle multinomial loss;\r\n\r\n‘liblinear’ is limited to one-versus-rest schemes.','lbfgs'),('PARAM114','max_iter','Maximum number of iterations taken for the solvers to converge.','100'),('PARAM115','multi_class','If the option chosen is ‘ovr’, then a binary problem is fit for each label. For ‘multinomial’ the loss minimised is the multinomial loss fit across the entire probability distribution, even when the data is binary. ‘multinomial’ is unavailable when solver=’liblinear’. ‘auto’ selects ‘ovr’ if the data is binary, or if solver=’liblinear’, and otherwise selects ‘multinomial’.','auto'),('PARAM116','verbose','For the liblinear and lbfgs solvers set verbose to any positive number for verbosity.','0'),('PARAM117','warm_start','When set to True, reuse the solution of the previous call to fit as initialization, otherwise, just erase the previous solution. Useless for liblinear solver. See the Glossary.','False'),('PARAM118','l1_ratio','The Elastic-Net mixing parameter, with 0 <= l1_ratio <= 1. Only used if penalty=\'elasticnet\'. Setting l1_ratio=0 is equivalent to using penalty=\'l2\', while setting l1_ratio=1 is equivalent to using penalty=\'l1\'. For 0 < l1_ratio <1, the penalty is a combination of L1 and L2.','None'),('PARAM119','alpha','Constant that multiplies the L1 term, controlling regularization strength. alpha must be a non-negative float i.e. in [0, inf).\r\n\r\nWhen alpha = 0, the objective is equivalent to ordinary least squares, solved by the LinearRegression object. For numerical reasons, using alpha = 0 with the Lasso object is not advised. Instead, you should use the LinearRegression object.','1.0'),('PARAM120','precompute','Whether to use a precomputed Gram matrix to speed up calculations. The Gram matrix can also be passed as argument. For sparse input this option is always False to preserve sparsity.','False'),('PARAM121','selection','If set to ‘random’, a random coefficient is updated every iteration rather than looping over features sequentially by default. This (setting to ‘random’) often leads to significantly faster convergence especially when tol is higher than 1e-4.','cyclic'),('PARAM122','n_iter','Maximum number of iterations. Should be greater than or equal to 1.','300'),('PARAM123','alpha_init','Initial value for alpha (precision of the noise). If not set, alpha_init is 1/Var(y).','None'),('PARAM124','lambda_init','Initial value for lambda (precision of the weights). If not set, lambda_init is 1.','None'),('PARAM125','compute_score','If True, compute the log marginal likelihood at each iteration of the optimization.','False'),('PARAM126','loss','The loss function to be used. The possible values are ‘squared_error’, ‘huber’, ‘epsilon_insensitive’, or ‘squared_epsilon_insensitive’\r\n\r\nThe ‘squared_error’ refers to the ordinary least squares fit. ‘huber’ modifies ‘squared_error’ to focus less on getting outliers correct by switching from squared to linear loss past a distance of epsilon. ‘epsilon_insensitive’ ignores errors less than epsilon and is linear past that; this is the loss function used in SVR. ‘squared_epsilon_insensitive’ is the same but becomes squared loss past a tolerance of epsilon.','squared_error'),('PARAM127','shuffle','Whether or not the training data should be shuffled after each epoch.','True'),('PARAM128','epsilon','Epsilon in the epsilon-insensitive loss functions; only if loss is ‘huber’, ‘epsilon_insensitive’, or ‘squared_epsilon_insensitive’. For ‘huber’, determines the threshold at which it becomes less important to get the prediction exactly right. For epsilon-insensitive, any differences between the current prediction and the correct label are ignored if they are less than this threshold.','0.1'),('PARAM129','learning_rate','The learning rate schedule:\r\n\r\n‘constant’: eta = eta0\r\n\r\n‘optimal’: eta = 1.0 / (alpha * (t + t0)) where t0 is chosen by a heuristic proposed by Leon Bottou.\r\n\r\n‘invscaling’: eta = eta0 / pow(t, power_t)\r\n\r\n‘adaptive’: eta = eta0, as long as the training keeps decreasing. Each time n_iter_no_change consecutive epochs fail to decrease the training loss by tol or fail to increase validation score by tol if early_stopping is True, the current learning rate is divided by 5.','invscaling'),('PARAM130','eta0','The initial learning rate for the ‘constant’, ‘invscaling’ or ‘adaptive’ schedules. The default value is 0.01.','0.01'),('PARAM131','power_t','The exponent for inverse scaling learning rate.','0.25'),('PARAM132','early_stopping','Whether to use early stopping to terminate training when validation score is not improving. If set to True, it will automatically set aside a fraction of training data as validation and terminate training when validation score returned by the score method is not improving by at least tol for n_iter_no_change consecutive epochs.','False'),('PARAM133','validation_fraction','The proportion of training data to set aside as validation set for early stopping. Must be between 0 and 1. Only used if early_stopping is True.','0.1'),('PARAM134','n_iter_no_change','Number of iterations with no improvement to wait before stopping fitting. Convergence is checked against the training loss or the validation loss depending on the early_stopping parameter.','5'),('PARAM135','average','When set to True, computes the averaged SGD weights across all updates and stores the result in the coef_ attribute. If set to an int greater than 1, averaging will begin once the total number of samples seen reaches average. So average=10 will begin averaging after seeing 10 samples.','False'),('PARAM136','kernel','Specifies the kernel type to be used in the algorithm. If none is given, ‘rbf’ will be used. If a callable is given it is used to precompute the kernel matrix.','rbf'),('PARAM137','degree','Degree of the polynomial kernel function (‘poly’). Ignored by all other kernels.','3'),('PARAM138','gamma','Kernel coefficient for ‘rbf’, ‘poly’ and ‘sigmoid’.\r\n\r\nif gamma=\'scale\' (default) is passed then it uses 1 / (n_features * X.var()) as value of gamma,\r\n\r\nif ‘auto’, uses 1 / n_features.','scale'),('PARAM139','coef0','Independent term in kernel function. It is only significant in ‘poly’ and ‘sigmoid’.','0.0'),('PARAM140','shrinking','Whether to use the shrinking heuristic. See the User Guide.','True'),('PARAM141','cache_size','Specify the size of the kernel cache (in MB).','200'),('PARAM142','probability','Whether to enable probability estimates. This must be enabled prior to calling fit, will slow down that method as it internally uses 5-fold cross-validation, and predict_proba may be inconsistent with predict. Read more in the User Guide.','False'),('PARAM143','n_neighbors','Number of neighbors to use by default for kneighbors queries.','5'),('PARAM144','weights','Weight function used in prediction. Possible values:\r\n\r\n‘uniform’ : uniform weights. All points in each neighborhood are weighted equally.\r\n\r\n‘distance’ : weight points by the inverse of their distance. in this case, closer neighbors of a query point will have a greater influence than neighbors which are further away.\r\n\r\n[callable] : a user-defined function which accepts an array of distances, and returns an array of the same shape containing the weights.','uniform'),('PARAM145','algorithm','Algorithm used to compute the nearest neighbors:\r\n\r\n‘ball_tree’ will use BallTree\r\n\r\n‘kd_tree’ will use KDTree\r\n\r\n‘brute’ will use a brute-force search.\r\n\r\n‘auto’ will attempt to decide the most appropriate algorithm based on the values passed to fit method.','auto'),('PARAM146','leaf_size','Leaf size passed to BallTree or KDTree. This can affect the speed of the construction and query, as well as the memory required to store the tree. The optimal value depends on the nature of the problem.','30'),('PARAM147','p','Power parameter for the Minkowski metric. When p = 1, this is equivalent to using manhattan_distance (l1), and euclidean_distance (l2) for p = 2. For arbitrary p, minkowski_distance (l_p) is used.','2'),('PARAM148','priors','Prior probabilities of the classes. If specified, the priors are not adjusted according to the data.','None'),('PARAM149','var_smoothing','Portion of the largest variance of all features that is added to variances for calculation stability.','1e-9'),('PARAM150','fit_prior','Whether to learn class prior probabilities or not. If false, a uniform prior will be used.','True'),('PARAM151','class_prior','Prior probabilities of the classes. If specified, the priors are not adjusted according to the data.','None'),('PARAM152','norm','Whether or not a second normalization of the weights is performed. The default behavior mirrors the implementations found in Mahout and Weka, which do not follow the full algorithm described in Table 9 of the paper.','False'),('PARAM153','binarize','Threshold for binarizing (mapping to booleans) of sample features. If None, input is presumed to already consist of binary vectors.','0.0'),('PARAM154','min_categories','Minimum number of categories per feature.\r\n\r\ninteger: Sets the minimum number of categories per feature to n_categories for each features.\r\n\r\narray-like: shape (n_features,) where n_categories[i] holds the minimum number of categories for the ith column of the input.\r\n\r\nNone (default): Determines the number of categories automatically from the training data.','None'),('PARAM155','criteron','The function to measure the quality of a split. Supported criteria are “squared_error” for the mean squared error, which is equal to variance reduction as feature selection criterion and minimizes the L2 loss using the mean of each terminal node, “friedman_mse”, which uses mean squared error with Friedman’s improvement score for potential splits, “absolute_error” for the mean absolute error, which minimizes the L1 loss using the median of each terminal node, and “poisson” which uses reduction in Poisson deviance to find splits.','squared_error'),('PARAM156','criterion','The function to measure the quality of a split. Supported criteria are “squared_error” for the mean squared error, which is equal to variance reduction as feature selection criterion and minimizes the L2 loss using the mean of each terminal node, “friedman_mse”, which uses mean squared error with Friedman’s improvement score for potential splits, “absolute_error” for the mean absolute error, which minimizes the L1 loss using the median of each terminal node, and “poisson” which uses reduction in Poisson deviance to find splits.','squared_error'),('PARAM157','splitter','The strategy used to choose the split at each node. Supported strategies are “best” to choose the best split and “random” to choose the best random split.','best'),('PARAM158','max_depth','The maximum depth of the tree. If None, then nodes are expanded until all leaves are pure or until all leaves contain less than min_samples_split samples.','None'),('PARAM159','min_samples_split','The minimum number of samples required to split an internal node:\r\n\r\nIf int, then consider min_samples_split as the minimum number.\r\n\r\nIf float, then min_samples_split is a fraction and ceil(min_samples_split * n_samples) are the minimum number of samples for each split.','2'),('PARAM160','min_samples_leaf','The minimum number of samples required to be at a leaf node. A split point at any depth will only be considered if it leaves at least min_samples_leaf training samples in each of the left and right branches. This may have the effect of smoothing the model, especially in regression.\r\n\r\nIf int, then consider min_samples_leaf as the minimum number.\r\n\r\nIf float, then min_samples_leaf is a fraction and ceil(min_samples_leaf * n_samples) are the minimum number of samples for each node.','1'),('PARAM161','max_features','The number of features to consider when looking for the best split:\r\n\r\nIf int, then consider max_features features at each split.\r\n\r\nIf float, then max_features is a fraction and max(1, int(max_features * n_features_in_)) features are considered at each split.\r\n\r\nIf “auto”, then max_features=n_features.\r\n\r\nIf “sqrt”, then max_features=sqrt(n_features).\r\n\r\nIf “log2”, then max_features=log2(n_features).\r\n\r\nIf None, then max_features=n_features.','None'),('PARAM162','max_leaf_nodes','Grow a tree with max_leaf_nodes in best-first fashion. Best nodes are defined as relative reduction in impurity. If None then unlimited number of leaf nodes.','None'),('PARAM163','n_estimators','The number of trees in the forest.','100'),('PARAM164','n_clusters','The number of clusters to form as well as the number of centroids to generate.','8'),('PARAM165','init','Method for initialization:\r\n\r\n‘k-means++’ : selects initial cluster centroids using sampling based on an empirical probability distribution of the points’ contribution to the overall inertia. This technique speeds up convergence, and is theoretically proven to be -optimal. See the description of n_init for more details.\r\n\r\n‘random’: choose n_clusters observations (rows) at random from data for the initial centroids.\r\n\r\nIf an array is passed, it should be of shape (n_clusters, n_features) and gives the initial centers.\r\n\r\nIf a callable is passed, it should take arguments X, n_clusters and a random state and return an initialization.','k-means++'),('PARAM166','estimators','Invoking the fit method on the VotingClassifier will fit clones of those original estimators that will be stored in the class attribute self.estimators_. An estimator can be set to \'drop\' using set_params.','None'),('PARAM167','voting','If ‘hard’, uses predicted class labels for majority rule voting. Else if ‘soft’, predicts the class label based on the argmax of the sums of the predicted probabilities, which is recommended for an ensemble of well-calibrated classifiers.','hard'),('PARAM168','flatten_transform','Affects shape of transform output only when voting=’soft’ If voting=’soft’ and flatten_transform=True, transform method returns matrix with shape (n_samples, n_classifiers * n_classes). If flatten_transform=False, it returns (n_classifiers, n_samples, n_classes).','True'),('PARAM169','base','',NULL),('PARAM170','base_estimator','The base estimator from which the boosted ensemble is built. If None, then the base estimator is DecisionTreeRegressor initialized with max_depth=3.','None');
/*!40000 ALTER TABLE `home_parametermodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_projectsmodel`
--

DROP TABLE IF EXISTS `home_projectsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_projectsmodel` (
  `PID` varchar(10) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `IMAGE` varchar(100) NOT NULL,
  `GID_id` varchar(10) NOT NULL,
  PRIMARY KEY (`PID`),
  KEY `Home_projectsmodel_GID_id_f4850837_fk_Home_genremodel_GID` (`GID_id`),
  CONSTRAINT `Home_projectsmodel_GID_id_f4850837_fk_Home_genremodel_GID` FOREIGN KEY (`GID_id`) REFERENCES `home_genremodel` (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_projectsmodel`
--

LOCK TABLES `home_projectsmodel` WRITE;
/*!40000 ALTER TABLE `home_projectsmodel` DISABLE KEYS */;
INSERT INTO `home_projectsmodel` VALUES ('P01','WINNING TEAM PREDICTION','Images/India-vs-pakistan-770x433_zCie79n.webp','G10'),('P02','UBER DATA ANALYSIS','Images/uber_data_analysis_HY4lKBg.jpeg','G10'),('P03','HOUSE PRICE PREDICTION','Images/house_price_prediction_WXpjUVd.jpg','G10'),('P04','FLOWER SPECIES CLASSIFICATION','Images/flowe_prediction_h6sGpsM.png','G10'),('P11','CHATBOT','Images/chatbot.jpg','G11'),('P12','ATTENDENCE MONITORING SYSTEM','Images/attendance_system_PaCUvep.jpg','G11'),('P13','FACE MASK DETECTION','Images/face-mask_detection_nkuQsI6.png','G11'),('P14','DOGS BREED PREDICTION','Images/dog_breed_prediction_YScYbLu.jpeg','G11'),('P21','MUSIC PLAYER','Images/music_player.jpg','G12'),('P22','BANK APPLICATION','Images/bank_application_system_jdoTWL0.webp','G12'),('P23','WEATHER APPLICATION','Images/weather_application_system_al14juL.jpg','G12'),('P24','LIBRARY MANAGEMENT SYSTEM','Images/library_management_system_26ARNGI.png','G12'),('P31','ROCK PAPER SCISSOR','Images/rock_paper_scissor_d00Jy1n.webp','G13'),('P32','SNAKE GAME','Images/snake_game_d0Yhr2E.jpg','G13'),('P33','TIK TAK TOE','Images/tiktaktoe.png','G13'),('P34','SNAKE AND LADDER GAME','Images/snake_Ti6WDnm.webp','G13');
/*!40000 ALTER TABLE `home_projectsmodel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09  5:34:34

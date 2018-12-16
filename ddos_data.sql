-- MySQL dump 10.13  Distrib 8.0.11, for macos10.13 (x86_64)
--
-- Host: localhost    Database: ddos
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add tree node',7,'add_treenode'),(26,'Can change tree node',7,'change_treenode'),(27,'Can delete tree node',7,'delete_treenode'),(28,'Can view tree node',7,'view_treenode'),(29,'Can add chat',8,'add_chat'),(30,'Can change chat',8,'change_chat'),(31,'Can delete chat',8,'delete_chat'),(32,'Can view chat',8,'view_chat'),(33,'Can add chat line',9,'add_chatline'),(34,'Can change chat line',9,'change_chatline'),(35,'Can delete chat line',9,'delete_chatline'),(36,'Can view chat line',9,'view_chatline'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
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
-- Table structure for table `bot_chat`
--

DROP TABLE IF EXISTS `bot_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bot_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(1024) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bot_chat_user_id_9b523e2b_fk_bot_user_id` (`user_id`),
  CONSTRAINT `bot_chat_user_id_9b523e2b_fk_bot_user_id` FOREIGN KEY (`user_id`) REFERENCES `bot_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_chat`
--

LOCK TABLES `bot_chat` WRITE;
/*!40000 ALTER TABLE `bot_chat` DISABLE KEYS */;
INSERT INTO `bot_chat` VALUES (1,'',1),(2,'',4),(3,'',5);
/*!40000 ALTER TABLE `bot_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_chatline`
--

DROP TABLE IF EXISTS `bot_chatline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bot_chatline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `is_bot` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bot_chatline_chat_id_7076c07b_fk_bot_chat_id` (`chat_id`),
  CONSTRAINT `bot_chatline_chat_id_7076c07b_fk_bot_chat_id` FOREIGN KEY (`chat_id`) REFERENCES `bot_chat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_chatline`
--

LOCK TABLES `bot_chatline` WRITE;
/*!40000 ALTER TABLE `bot_chatline` DISABLE KEYS */;
INSERT INTO `bot_chatline` VALUES (1,'How are you?','2018-12-15 16:22:56.517127',1,0),(2,'Yes I agree','2018-12-15 16:27:54.336541',1,0),(3,'Hi','2018-12-15 16:28:58.672003',1,0),(4,'Hello bot','2018-12-15 18:19:36.423841',2,0),(5,'Hello bot','2018-12-15 18:20:29.974311',3,0),(6,'Hello bot','2018-12-15 18:20:40.812816',3,0),(7,'Hi','2018-12-15 23:39:11.905491',1,0),(8,'[{\'id\': 1, \'title\': \'appliance\', \'is_leaf\': False, \'is_root\': True, \'parent_node\': None, \'prompt_text\': \'select category\', \'action_template\': \'single_choice\', \'ack_text\': None, \'priority\': None}]','2018-12-15 23:39:11.910346',1,1),(9,'don\'t need it','2018-12-15 23:51:06.672599',1,0),(10,'[{\'id\': 1, \'title\': \'appliance\', \'is_leaf\': False, \'is_root\': True, \'parent_node\': None, \'prompt_text\': \'select category\', \'action_template\': \'single_choice\', \'ack_text\': None, \'priority\': None}]','2018-12-15 23:51:06.681538',1,1),(11,'','2018-12-15 23:59:05.301156',1,0),(12,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-15 23:59:05.353361',1,1),(13,'','2018-12-16 00:08:43.909076',1,0),(14,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 00:08:44.009034',1,1),(15,'selecting','2018-12-16 00:09:36.768310',1,0),(16,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 00:09:36.873804',1,1),(17,'selecting','2018-12-16 00:09:59.156281',1,0),(18,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 00:09:59.164464',1,1),(19,'selecting','2018-12-16 00:11:05.007722',1,0),(20,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 00:11:05.070889',1,1),(21,'selecting','2018-12-16 00:11:52.807604',1,0),(22,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 00:11:52.866007',1,1),(23,'selecting','2018-12-16 00:16:22.113317',1,0),(24,'[{\"id\": 11, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"sennheiser\", \"priority\": null}, {\"id\": 12, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"akg\", \"priority\": null}, {\"id\": 13, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"shure\", \"priority\": null}, {\"id\": 14, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"bose\", \"priority\": null}, {\"id\": 15, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"audio technica\", \"priority\": null}, {\"id\": 16, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"grado\", \"priority\": null}]','2018-12-16 00:16:22.208007',1,1),(25,'selecting','2018-12-16 00:20:43.471030',1,0),(26,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 00:20:43.509497',1,1),(27,'selecting','2018-12-16 00:21:30.936619',1,0),(28,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 00:21:31.033826',1,1),(29,'selecting','2018-12-16 00:23:54.497651',1,0),(30,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 00:23:54.539360',1,1),(31,'selecting','2018-12-16 00:24:50.304732',1,0),(32,'[{\"id\": 11, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"sennheiser\", \"priority\": null}, {\"id\": 12, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"akg\", \"priority\": null}, {\"id\": 13, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"shure\", \"priority\": null}, {\"id\": 14, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"bose\", \"priority\": null}, {\"id\": 15, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"audio technica\", \"priority\": null}, {\"id\": 16, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"grado\", \"priority\": null}]','2018-12-16 00:24:50.319028',1,1),(33,'selecting','2018-12-16 00:27:26.055160',1,0),(34,'[{\"id\": 3, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 1, \"prompt_text\": \"select brand\", \"action_template\": \"single_choice\", \"ack_text\": \"headphones\", \"priority\": null}]','2018-12-16 00:27:26.090522',1,1),(35,'selecting','2018-12-16 00:30:34.886006',1,0),(36,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 00:30:34.956582',1,1),(37,'selecting','2018-12-16 00:31:28.332117',1,0),(38,'[{\"id\": 3, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 1, \"prompt_text\": \"select brand\", \"action_template\": \"single_choice\", \"ack_text\": \"headphones\", \"priority\": null}]','2018-12-16 00:31:28.381183',1,1),(39,'selecting','2018-12-16 00:59:48.051613',1,0),(40,'[{\"id\": 3, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 1, \"prompt_text\": \"select brand\", \"action_template\": \"single_choice\", \"ack_text\": \"headphones\", \"priority\": null}]','2018-12-16 00:59:48.057208',1,1),(41,'selecting','2018-12-16 01:00:06.089676',1,0),(42,'[{\"id\": 3, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 1, \"prompt_text\": \"select brand\", \"action_template\": \"single_choice\", \"ack_text\": \"headphones\", \"priority\": null}]','2018-12-16 01:00:06.137087',1,1),(43,'selecting','2018-12-16 01:04:09.934887',1,0),(44,'[{\"id\": 11, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"sennheiser\", \"priority\": null}]','2018-12-16 01:04:09.940810',1,1),(45,'selecting','2018-12-16 01:09:46.329642',1,0),(46,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 01:09:46.337406',1,1),(47,'selecting','2018-12-16 01:10:01.767472',1,0),(48,'[{\"id\": 3, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 1, \"prompt_text\": \"select brand\", \"action_template\": \"single_choice\", \"ack_text\": \"headphones\", \"priority\": null}]','2018-12-16 01:10:01.776346',1,1),(49,'selecting','2018-12-16 01:22:01.816727',1,0),(50,'[{\"id\": 3, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 1, \"prompt_text\": \"select brand\", \"action_template\": \"single_choice\", \"ack_text\": \"headphones\", \"priority\": null}]','2018-12-16 01:22:01.889911',1,1),(51,'selecting','2018-12-16 01:22:09.553906',1,0),(52,'[{\"id\": 11, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"sennheiser\", \"priority\": null}]','2018-12-16 01:22:09.558244',1,1),(53,'selecting','2018-12-16 01:24:22.185339',1,0),(54,'[{\"id\": 18, \"title\": \"appliance\", \"is_leaf\": true, \"is_root\": false, \"parent_node\": 11, \"prompt_text\": null, \"action_template\": \"single_choice\", \"ack_text\": \"hd 800\", \"priority\": null}]','2018-12-16 01:24:22.190565',1,1),(55,'selecting','2018-12-16 01:25:02.804833',1,0),(56,'[{\"id\": 18, \"title\": \"appliance\", \"is_leaf\": true, \"is_root\": false, \"parent_node\": 11, \"prompt_text\": null, \"action_template\": \"single_choice\", \"ack_text\": \"hd 800\", \"priority\": null}]','2018-12-16 01:25:02.810157',1,1),(57,'selecting','2018-12-16 04:12:21.563015',1,0),(58,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 04:12:21.569155',1,1),(59,'selecting','2018-12-16 04:16:20.452714',1,0),(60,'[{\"id\": 3, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 1, \"prompt_text\": \"select brand\", \"action_template\": \"single_choice\", \"ack_text\": \"headphones\", \"priority\": null}]','2018-12-16 04:16:20.457885',1,1),(61,'selecting','2018-12-16 04:17:14.157825',1,0),(62,'[{\"id\": 11, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"sennheiser\", \"priority\": null}]','2018-12-16 04:17:14.164377',1,1),(63,'selecting','2018-12-16 04:34:46.837243',1,0),(64,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 04:34:46.841703',1,1),(65,'selecting','2018-12-16 04:35:19.658053',1,0),(66,'[{\"id\": 3, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 1, \"prompt_text\": \"select brand\", \"action_template\": \"single_choice\", \"ack_text\": \"headphones\", \"priority\": null}]','2018-12-16 04:35:19.663132',1,1),(67,'selecting','2018-12-16 04:35:50.048107',1,0),(68,'[{\"id\": 11, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"sennheiser\", \"priority\": null}]','2018-12-16 04:35:50.052643',1,1),(69,'selecting','2018-12-16 04:36:08.106006',1,0),(70,'[{\"id\": 18, \"title\": \"appliance\", \"is_leaf\": true, \"is_root\": false, \"parent_node\": 11, \"prompt_text\": null, \"action_template\": \"single_choice\", \"ack_text\": \"hd 800\", \"priority\": null}]','2018-12-16 04:36:08.111282',1,1),(71,'selecting','2018-12-16 07:02:51.096077',1,0),(72,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 07:02:51.100212',1,1),(73,'Hello','2018-12-16 07:03:38.174275',1,0),(74,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 07:03:38.259886',1,1),(75,'Hello','2018-12-16 07:04:57.539977',1,0),(76,'[{\"id\": 3, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 1, \"prompt_text\": \"select brand\", \"action_template\": \"single_choice\", \"ack_text\": \"headphones\", \"priority\": null}]','2018-12-16 07:04:57.545387',1,1),(77,'Hello','2018-12-16 07:05:30.125047',1,0),(78,'[{\"id\": 11, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"sennheiser\", \"priority\": null}]','2018-12-16 07:05:30.131962',1,1),(79,'Hello','2018-12-16 07:05:43.238528',1,0),(80,'[{\"id\": 18, \"title\": \"appliance\", \"is_leaf\": true, \"is_root\": false, \"parent_node\": 11, \"prompt_text\": null, \"action_template\": \"single_choice\", \"ack_text\": \"hd 800\", \"priority\": null}]','2018-12-16 07:05:43.243210',1,1),(81,'Hello','2018-12-16 07:27:33.907737',1,0),(82,'[{\"id\": 18, \"title\": \"appliance\", \"is_leaf\": true, \"is_root\": false, \"parent_node\": 11, \"prompt_text\": null, \"action_template\": \"single_choice\", \"ack_text\": \"hd 800\", \"priority\": null}]','2018-12-16 07:27:33.926015',1,1),(83,'Hello','2018-12-16 07:29:09.390794',1,0),(84,'[{\"id\": 18, \"title\": \"appliance\", \"is_leaf\": true, \"is_root\": false, \"parent_node\": 11, \"prompt_text\": null, \"action_template\": \"single_choice\", \"ack_text\": \"hd 800\", \"priority\": null}]','2018-12-16 07:29:09.423312',1,1),(85,'Hello','2018-12-16 07:29:27.566660',1,0),(86,'[{\"id\": 1, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": true, \"parent_node\": null, \"prompt_text\": \"select category\", \"action_template\": \"single_choice\", \"ack_text\": null, \"priority\": null}]','2018-12-16 07:29:27.571924',1,1),(87,'Hello','2018-12-16 07:30:00.999614',1,0),(88,'[{\"id\": 3, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 1, \"prompt_text\": \"select brand\", \"action_template\": \"single_choice\", \"ack_text\": \"headphones\", \"priority\": null}]','2018-12-16 07:30:01.007266',1,1),(89,'Hello','2018-12-16 07:30:22.511201',1,0),(90,'[{\"id\": 11, \"title\": \"appliance\", \"is_leaf\": false, \"is_root\": false, \"parent_node\": 3, \"prompt_text\": \"select model\", \"action_template\": \"single_choice\", \"ack_text\": \"sennheiser\", \"priority\": null}]','2018-12-16 07:30:22.516295',1,1),(91,'Hello','2018-12-16 07:30:34.908034',1,0),(92,'[{\"id\": 18, \"title\": \"appliance\", \"is_leaf\": true, \"is_root\": false, \"parent_node\": 11, \"prompt_text\": null, \"action_template\": \"single_choice\", \"ack_text\": \"hd 800\", \"priority\": null}]','2018-12-16 07:30:34.913509',1,1);
/*!40000 ALTER TABLE `bot_chatline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_treenode`
--

DROP TABLE IF EXISTS `bot_treenode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bot_treenode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `ack_text` varchar(1024) DEFAULT NULL,
  `action_template` varchar(1024) DEFAULT NULL,
  `is_leaf` tinyint(1) NOT NULL,
  `priority` bigint(20) DEFAULT NULL,
  `prompt_text` longtext,
  `parent_node` bigint(20) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `is_root` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_treenode`
--

LOCK TABLES `bot_treenode` WRITE;
/*!40000 ALTER TABLE `bot_treenode` DISABLE KEYS */;
INSERT INTO `bot_treenode` VALUES (1,'2018-12-15 22:04:38.737388',NULL,'single_choice',0,NULL,'select category',NULL,'appliance',1),(3,'2018-12-15 22:12:31.274559','headphones','single_choice',0,NULL,'select brand',1,'appliance',0),(5,'2018-12-15 22:14:52.896016','wearables','single_choice',0,NULL,'select brand',1,'appliance',0),(6,'2018-12-15 22:15:00.778115','tablets','single_choice',0,NULL,'select brand',1,'appliance',0),(7,'2018-12-15 22:15:06.928106','phones','single_choice',0,NULL,'select brand',1,'appliance',0),(8,'2018-12-15 22:15:20.959970','action cameras','single_choice',0,NULL,'select brand',1,'appliance',0),(9,'2018-12-15 22:15:27.502734','laptops','single_choice',0,NULL,'select brand',1,'appliance',0),(10,'2018-12-15 22:15:40.711504','photography gear','single_choice',0,NULL,'select brand',1,'appliance',0),(11,'2018-12-15 22:23:12.508494','sennheiser','single_choice',0,NULL,'select model',3,'appliance',0),(12,'2018-12-15 22:23:17.628184','akg','single_choice',0,NULL,'select model',3,'appliance',0),(13,'2018-12-15 22:23:21.444110','shure','single_choice',0,NULL,'select model',3,'appliance',0),(14,'2018-12-15 22:23:27.347870','bose','single_choice',0,NULL,'select model',3,'appliance',0),(15,'2018-12-15 22:23:40.643417','audio technica','single_choice',0,NULL,'select model',3,'appliance',0),(16,'2018-12-15 22:24:03.217501','grado','single_choice',0,NULL,'select model',3,'appliance',0),(17,'2018-12-15 22:25:49.334731','hd 310','single_choice',1,NULL,NULL,11,'appliance',0),(18,'2018-12-15 22:25:54.886342','hd 800','single_choice',1,NULL,NULL,11,'appliance',0),(19,'2018-12-15 22:26:09.725975','akg-1','single_choice',1,NULL,NULL,12,'appliance',0),(20,'2018-12-15 22:26:12.677808','akg-2','single_choice',1,NULL,NULL,12,'appliance',0),(21,'2018-12-15 22:26:30.453085','shure s130','single_choice',1,NULL,NULL,13,'appliance',0),(22,'2018-12-15 22:26:42.300653','qb210','single_choice',1,NULL,NULL,14,'appliance',0),(23,'2018-12-15 22:26:55.772033','at123','single_choice',1,NULL,NULL,15,'appliance',0),(24,'2018-12-15 22:27:03.971593','g123','single_choice',1,NULL,NULL,16,'appliance',0);
/*!40000 ALTER TABLE `bot_treenode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_user`
--

DROP TABLE IF EXISTS `bot_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bot_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `phone_number` varchar(17) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `permanent_addr` longtext,
  `current_addr` longtext,
  `aadhar_number` varchar(12) DEFAULT NULL,
  `dl_number` varchar(15) DEFAULT NULL,
  `birth_certificate_serial` varchar(1024) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `status` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_user`
--

LOCK TABLES `bot_user` WRITE;
/*!40000 ALTER TABLE `bot_user` DISABLE KEYS */;
INSERT INTO `bot_user` VALUES (1,'bot@gmail.com',NULL,'2018-12-15 09:37:45.493130',NULL,NULL,NULL,NULL,NULL,'1994-04-24','{\"funnel\": {\"title\": \"appliance\", \"node_id\": 18}, \"subscribed\": \"plan_hd_800\"}'),(2,'bot@bot.io',NULL,'2018-12-15 09:44:59.028523',NULL,NULL,NULL,NULL,NULL,'1993-03-24','1993-03-24'),(4,'canary@acko@ackp.com',NULL,'2018-12-15 16:28:39.945190',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'nana@bot.io',NULL,'2018-12-15 18:20:14.202926',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'bot@bot.io',NULL,'2018-12-15 22:48:26.666672',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bot_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'bot','chat'),(9,'bot','chatline'),(7,'bot','treenode'),(10,'bot','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-15 07:24:00.619936'),(2,'auth','0001_initial','2018-12-15 07:24:00.810449'),(3,'admin','0001_initial','2018-12-15 07:24:00.868753'),(4,'admin','0002_logentry_remove_auto_add','2018-12-15 07:24:00.877359'),(5,'admin','0003_logentry_add_action_flag_choices','2018-12-15 07:24:00.887021'),(6,'contenttypes','0002_remove_content_type_name','2018-12-15 07:24:00.939057'),(7,'auth','0002_alter_permission_name_max_length','2018-12-15 07:24:00.973732'),(8,'auth','0003_alter_user_email_max_length','2018-12-15 07:24:00.996466'),(9,'auth','0004_alter_user_username_opts','2018-12-15 07:24:01.005330'),(10,'auth','0005_alter_user_last_login_null','2018-12-15 07:24:01.031692'),(11,'auth','0006_require_contenttypes_0002','2018-12-15 07:24:01.034183'),(12,'auth','0007_alter_validators_add_error_messages','2018-12-15 07:24:01.042989'),(13,'auth','0008_alter_user_username_max_length','2018-12-15 07:24:01.075605'),(14,'auth','0009_alter_user_last_name_max_length','2018-12-15 07:24:01.104315'),(15,'sessions','0001_initial','2018-12-15 07:24:01.117696'),(16,'bot','0001_initial','2018-12-15 08:55:33.995454'),(17,'bot','0002_auto_20181215_0921','2018-12-15 09:21:38.498652'),(18,'bot','0003_auto_20181215_0937','2018-12-15 09:37:34.638106'),(19,'bot','0004_auto_20181215_1120','2018-12-15 11:20:28.518192'),(20,'bot','0005_chatline_is_bot','2018-12-15 18:37:21.084744'),(21,'bot','0006_auto_20181215_1945','2018-12-15 19:45:47.810370'),(22,'bot','0007_auto_20181215_1952','2018-12-15 19:52:43.259996'),(23,'bot','0008_auto_20181215_2031','2018-12-15 20:31:11.545305'),(24,'bot','0009_treenode_is_root','2018-12-15 21:14:14.267307'),(25,'bot','0010_auto_20181215_2211','2018-12-15 22:11:52.376992'),(26,'bot','0011_auto_20181215_2214','2018-12-15 22:14:21.173396');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-16 22:52:45

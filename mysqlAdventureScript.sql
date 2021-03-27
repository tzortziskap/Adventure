CREATE DATABASE  IF NOT EXISTS `adventure` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `adventure`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: adventure
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Πεζοπορία'),(2,'Τοξοβολία'),(3,'Ιππασία'),(4,'Τρέξιμο'),(5,'Εργαστήριο Φωτογραφίας'),(19,'Μαθήματα Μαγειρικής'),(20,'Κατάδυση'),(21,'Κανό Καγιάκ'),(22,'Bungee Jumping'),(23,'Mountain Bike'),(24,'Αναρρίχηση'),(25,'Ski');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `county_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_city` (`name`,`county_id`),
  KEY `fk_city_country` (`county_id`),
  CONSTRAINT `fk_city_country` FOREIGN KEY (`county_id`) REFERENCES `county` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (272,'Αβδήρων',39),(113,'Αγαθονησίου',11),(239,'Αγιάς',31),(39,'Αγίας Βαρβάρας',6),(55,'Αγίας Παρασκευής',6),(289,'Αγίου Βασιλείου',43),(73,'Αγίου Δημητρίου',6),(242,'Αγίου Ευστρατίου',32),(253,'Αγίου Νικολάου',35),(45,'Αγίων Αναργύρων - Καματερού',6),(31,'Αγκιστρίου',6),(129,'Αγράφων',12),(14,'Αγρινίου',3),(48,'Αθηναίων',6),(41,'Αιγάλεω',6),(96,'Αιγιαλείας	',7),(32,'Αίγινας',6),(11,'Ακτίου-Βόνιτσας',3),(146,'Αλεξάνδρειας',16),(8,'Αλεξανδρούπολης',2),(102,'Αλιάρτου - Θεσπιέων',8),(74,'Αλίμου',6),(258,'Αλμυρού',37),(279,'Αλμωπίας',40),(264,'Αλοννήσου',37),(288,'Αμαρίου',43),(58,'Αμαρουσίου',6),(229,'Αμοργού',30),(164,'Αμπελοκήπων-Μενεμένης',19),(317,'Αμυνταίου	',49),(311,'Αμφίκλειας-Ελάτειας',48),(10,'Αμφιλοχίας',3),(300,'Αμφίπολης',46),(246,'Ανατολικής Μάνης (Γύθειο)',34),(295,'Ανατολικής Σάμου (Βαθύ)',45),(234,'Ανάφης',30),(139,'Ανδραβίδας - Κυλλήνης',15),(144,'Ανδρίτσαινας - Κρεστένων	',15),(216,'Άνδρου',30),(226,'Αντιπάρου	',30),(286,'Ανωγείων',43),(330,'Αποκορώνου',53),(194,'Αργιθέας',24),(202,'Αργοστολίου',26),(17,'Άργους - Μυκηνών',4),(325,'Αριστοτέλη',52),(291,'Αρριανών',44),(1,'Αρταίων',1),(143,'Αρχαίας Ολυμπίας',15),(151,'Αρχανών - Αστερουσίων',17),(91,'Ασπροπύργου',6),(118,'Αστυπάλαιας',11),(89,'Αχαρνών',6),(77,'Βάρης - Βούλας - Βουλιαγμένης',6),(209,'Βελβεντού',28),(212,'Βέλου-Βόχας',29),(147,'Βέροιας',16),(149,'Βιάννου',17),(301,'Βισαλτίας',46),(207,'Βοΐου',28),(173,'Βόλβης',19),(259,'Βόλου',37),(184,'Βόρειας Κέρκυρας',22),(22,'Βόρειας Κυνουρίας',5),(181,'Βορείων Τζουμέρκων',21),(57,'Βριλησσίων',6),(51,'Βύρωνος',6),(47,'Γαλατσίου	',6),(336,'Γαύδου',53),(3,'Γεωργίου Καραϊσκάκη',1),(76,'Γλυφάδας',6),(155,'Γόρτυνας',17),(24,'Γορτυνίας	',5),(107,'Γρεβενών',9),(49,'Δάφνης - Υμηττού',6),(161,'Δέλτα',19),(320,'Δελφών',50),(106,'Δεσκάτης',9),(6,'Διδυμοτείχου',2),(87,'Διονύσου',6),(280,'Δίου-Ολύμπου',41),(133,'Διρφύων-Μεσσαπίων',13),(105,'Διστόμου-Αράχοβας-Αντίκυρας',8),(316,'Δομοκού',48),(108,'Δοξάτου',10),(110,'Δράμας',10),(99,'Δυτικής Αχαΐας',7),(244,'Δυτικής Λέσβου',32),(271,'Δυτικής Μάνης (Καρδαμύλη)',38),(296,'Δυτικής Σάμου	(Καρλόβασι)',45),(182,'Δωδώνης',21),(321,'Δωρίδος',50),(278,'Έδεσσας',40),(235,'Ελασσόνας',31),(250,'Ελαφονήσου',34),(92,'Ελευσίνας',6),(75,'Ελληνικού-Αργυρούπολης',6),(302,'Εμμανουήλ Παππά',46),(205,'Εορδαίας',28),(19,'Επιδαύρου',4),(135,'Ερέτριας',13),(20,'Ερμιονίδας',4),(98,'Ερυμάνθου',7),(248,'Ευρώτα',34),(260,'Ζαγοράς-Μουρεσίου',37),(177,'Ζαγορίου',21),(138,'Ζακύνθου',14),(145,'Ζαχάρως',15),(285,'Ζηρού',42),(178,'Ζίτσας',21),(53,'Ζωγράφου	',6),(159,'Ηγουμενίτσας',18),(141,'Ήλιδας',15),(50,'Ηλιούπολης',6),(304,'Ηράκλειας	',46),(62,'Ηρακλείου',6),(153,'Ηρακλείου',17),(190,'Θάσου',23),(169,'Θερμαϊκού',19),(170,'Θέρμης',19),(15,'Θέρμου',3),(167,'Θεσσαλονίκης',19),(101,'Θηβαίων',8),(233,'Θήρας',30),(294,'Ιάσμου',44),(252,'Ιεράπετρας',35),(13,'Ιεράς Πόλεως Μεσολογγίου',3),(230,'Ιητών',30),(174,'Ιθάκης',20),(298,'Ικαρίας',45),(44,'Ιλίου',6),(131,'Ιστιαίας - Αιδηψού',13),(179,'Ιωαννιτών',21),(188,'Καβάλας',23),(52,'Καισαριανής',6),(97,'Καλαβρύτων',7),(168,'Καλαμαριάς',19),(270,'Καλαμάτας',38),(70,'Καλλιθέας',6),(117,'Καλυμνίων',11),(312,'Καμένων Βούρλων',48),(334,'Καντάνου - Σελίνου',53),(196,'Καρδίτσας	',24),(126,'Καρπάθου',11),(128,'Καρπενησίου',12),(137,'Καρύστου',13),(127,'Κάσου',11),(328,'Κασσάνδρας',52),(197,'Καστοριάς	',25),(281,'Κατερίνης',41),(112,'Κάτω Νευροκοπίου',10),(218,'Κέας',30),(185,'Κεντρικής Κέρκυρας',22),(4,'Κεντρικών Τζουμέρκων',1),(35,'Κερατσινίου - Δραπετσώνας',6),(67,'Κηφισιάς',6),(240,'Κιλελέρ',31),(203,'Κιλκίς',27),(224,'Κιμώλου',30),(333,'Κισσάμου',53),(206,'Κοζάνης',28),(293,'Κομοτηνής',44),(175,'Κόνιτσας',21),(165,'Κορδελιού-Ευόσμου',19),(211,'Κορινθίων',29),(38,'Κορυδαλλού',6),(78,'Κρωπίας',6),(26,'Κυθήρων',6),(219,'Κύθνου',30),(136,'Κύμης-Αλιβερίου',13),(119,'Κω',11),(172,'Λαγκαδά',19),(313,'Λαμιέων',48),(238,'Λάρισας',31),(80,'Λαυρεωτικής',6),(104,'Λεβαδέων',8),(115,'Λειψών',11),(116,'Λέρου',11),(255,'Λευκάδας',36),(245,'Λήμνου',33),(200,'Ληξουρίου',26),(195,'Λίμνης Πλαστήρα',24),(310,'Λοκρών',48),(210,'Λουτρακίου-Αγίων Θεοδώρων',29),(63,'Λυκόβρυσης-Πεύκης',6),(314,'Μακρακώμης',48),(154,'Μαλεβιζίου',17),(93,'Μάνδρας-Ειδυλλίας',6),(132,'Μαντουδίου-Λίμνης-Αγίας Άννας',13),(86,'Μαραθώνος',6),(81,'Μαρκόπουλου Μεσογαίας',6),(292,'Μαρωνείας-Σαπών',44),(25,'Μεγαλόπολης',5),(256,'Μεγανησίου	',36),(94,'Μεγαρέων',6),(125,'Μεγίστης',11),(269,'Μεσσήνης',38),(61,'Μεταμορφώσεως',6),(307,'Μετεώρων',47),(180,'Μετσόβου',21),(225,'Μήλου',30),(150,'Μινώα Πεδιάδας',17),(249,'Μονεμβασιάς',34),(69,'Μοσχάτου-Ταύρου',6),(192,'Μουζακίου',24),(273,'Μύκης',39),(221,'Μυκόνου',30),(287,'Μυλοποτάμου',43),(243,'Μυτιλήνης',32),(228,'Νάξου',30),(148,'Νάουσας',16),(16,'Ναυπακτίας',3),(18,'Ναυπλιέων',4),(166,'Νεάπολης-Συκεών',19),(299,'Νέας Ζίχνης',46),(60,'Νέας Ιωνίας',6),(329,'Νέας Προποντίδας',52),(71,'Νέας Σμύρνης',6),(46,'Νέας Φιλαδελφείας - Νέας Χαλκηδόνος',6),(215,'Νεμέας',29),(198,'Νεστορίου',25),(187,'Νέστου',23),(37,'Νίκαιας - Αγίου Ιωάννη Ρέντη',6),(2,'Νικόλαου Σκουφά',1),(120,'Νισύρου',11),(183,'Νότιας Κέρκυρας',22),(21,'Νότιας Κυνουρίας',5),(261,'Νοτίου Πηλίου',37),(274,'Ξάνθης',39),(12,'Ξηρομέρου',3),(214,'Ξυλοκάστρου-Ευρωστίνης',29),(323,'Οινουσσών',51),(265,'Οιχαλίας',38),(5,'Ορεστιάδας',2),(199,'Ορεστίδος',25),(254,'Οροπεδίου Λασιθίου',35),(103,'Ορχομενού',8),(189,'Παγγαίου',23),(82,'Παιανίας',6),(204,'Παιονίας',27),(72,'Παλαιού Φαλήρου',6),(191,'Παλαμά',24),(84,'Παλλήνης',6),(186,'Παξών',22),(54,'Παπάγου-Χολαργού',6),(109,'Παρανεστίου',10),(283,'Πάργας',42),(227,'Πάρου',30),(114,'Πάτμου',11),(95,'Πατρέων',7),(163,'Παύλου Μελά',19),(36,'Πειραιώς',6),(276,'Πέλλας',40),(68,'Πεντέλης',6),(34,'Περάματος',6),(42,'Περιστερίου',6),(43,'Πετρούπολης',6),(140,'Πηνειού',15),(332,'Πλατανιά',53),(327,'Πολυγύρου',52),(30,'Πόρου',6),(284,'Πρέβεζας',42),(319,'Πρεσπών',49),(111,'Προσοτσάνης',10),(282,'Πύδνας-Κολινδρού',41),(171,'Πυλαίας-Χορτιάτη',19),(306,'Πύλης',47),(268,'Πύλου - Νέστορος',38),(142,'Πύργου',15),(176,'Πωγωνίου',21),(85,'Ραφήνας-Πικερμίου',6),(290,'Ρεθύμνης',43),(257,'Ρήγα Φεραίου',37),(123,'Ρόδου',11),(33,'Σαλαμίνας	',6),(201,'Σάμης',26),(9,'Σαμοθράκης',2),(79,'Σαρωνικού',6),(208,'Σερβίων',28),(222,'Σερίφου',30),(303,'Σερρών',46),(251,'Σητείας',35),(326,'Σιθωνίας',52),(231,'Σικίνου',30),(213,'Σικυωνίων',29),(305,'Σιντικής',46),(223,'Σίφνου',30),(262,'Σκιάθου',37),(263,'Σκοπέλου',37),(277,'Σκύδρας',40),(130,'Σκύρου',13),(157,'Σουλίου',18),(7,'Σουφλίου',2),(193,'Σοφάδων',24),(247,'Σπάρτης',34),(83,'Σπάτων-Αρτέμιδος',6),(27,'Σπετσών',6),(315,'Στυλίδας',48),(122,'Σύμης',11),(220,'Σύρου - Ερμούπολης',30),(335,'Σφακίων',53),(100,'Τανάγρας',8),(237,'Τεμπών',31),(121,'Τήλου',11),(217,'Τήνου',30),(275,'Τοπείρου',39),(308,'Τρικκαίων',47),(23,'Τρίπολης',5),(267,'Τριφυλίας',38),(29,'Τροιζηνίας - Μεθάνων',6),(236,'Τυρνάβου',31),(28,'Ύδρας',6),(156,'Φαιστού',17),(309,'Φαρκαδόνος',47),(241,'Φαρσάλων	',31),(158,'Φιλιατών',18),(59,'Φιλοθέης-Ψυχικού',6),(318,'Φλώρινας',49),(232,'Φολεγάνδρου',30),(297,'Φούρνων Κορσεών',45),(90,'Φυλής',6),(40,'Χαϊδαρίου',6),(56,'Χαλανδρίου',6),(160,'Χαλκηδόνος',19),(124,'Χάλκης',11),(134,'Χαλκιδέων',13),(331,'Χανίων',53),(152,'Χερσονήσου',17),(324,'Χίου',51),(322,'Ψαρών',51),(162,'Ωραιοκάστρου',19),(88,'Ωρωπού',6);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `afm` varchar(20) NOT NULL,
  `city_id` int DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `credentials_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `credential_id_UNIQUE` (`credentials_id`),
  KEY `fk_company_city` (`city_id`),
  CONSTRAINT `fk_company_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_company_credentials` FOREIGN KEY (`credentials_id`) REFERENCES `credentials` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `county`
--

DROP TABLE IF EXISTS `county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `county` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `county`
--

LOCK TABLES `county` WRITE;
/*!40000 ALTER TABLE `county` DISABLE KEYS */;
INSERT INTO `county` VALUES (3,'Αιτωλοακαρνανίας'),(4,'Αργολίδας'),(5,'Αρκαδίας'),(1,'Άρτας'),(6,'Αττικής'),(7,'Αχαΐας'),(8,'Βοιωτίας'),(9,'Γρεβενών'),(10,'Δράμας'),(11,'Δωδεκανήσου'),(2,'Έβρου'),(13,'Εύβοιας'),(12,'Ευρυτανίας'),(14,'Ζακύνθου'),(15,'Ηλείας'),(16,'Ημαθίας'),(17,'Ηρακλείου'),(18,'Θεσπρωτίας'),(19,'Θεσσαλονίκης'),(20,'Ιθάκης'),(21,'Ιωαννίνων'),(23,'Καβάλας'),(24,'Καρδίτσας'),(25,'Καστοριάς'),(22,'Κέρκυρας'),(26,'Κεφαλληνίας'),(27,'Κιλκίς'),(28,'Κοζάνης'),(29,'Κορινθίας'),(30,'Κυκλάδων'),(34,'Λακωνίας'),(31,'Λάρισας'),(35,'Λασιθίου'),(32,'Λέσβου'),(36,'Λευκάδας'),(33,'Λήμνου'),(37,'Μαγνησίας'),(38,'Μεσσηνίας'),(39,'Ξάνθης'),(40,'Πέλλας'),(41,'Πιερίας'),(42,'Πρέβεζας'),(43,'Ρεθύμνης'),(44,'Ροδόπης'),(45,'Σάμου'),(46,'Σερρών'),(47,'Τρικάλων'),(48,'Φθιώτιδας'),(49,'Φλώρινας'),(50,'Φωκίδας'),(52,'Χαλκιδικής'),(53,'Χανίων'),(51,'Χίου');
/*!40000 ALTER TABLE `county` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credentials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(68) NOT NULL,
  `roles_id` int NOT NULL,
  `password_reset_token` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_credentials_role_idx` (`roles_id`),
  CONSTRAINT `fk_credentials_role` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
INSERT INTO `credentials` VALUES (32,'tzortziskap','$2a$10$WHPqkRRHozp7UXmj2Scgi.VXIV2G9TIIWUxFv7OJpD.pEmLlPTCYK',1,NULL),(34,'edu','$2a$10$72bWFkqSCdJtSmDDEn8XPejclsDA3RKGc88j9xfhjJqqiagJUXmPy',1,NULL);
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city_id` int NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `credentials_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `credentials_id_UNIQUE` (`credentials_id`),
  KEY `fk_customer_city` (`city_id`),
  CONSTRAINT `fk_customer_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_customer_credentials` FOREIGN KEY (`credentials_id`) REFERENCES `credentials` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (32,'TZORTZIS','KAPELLAS','2021-03-03','tzortziskap@hotmail.com','Neossoikon 77',36,'18537',32),(33,'EDA','XHIXHO','1991-09-26','edaxhixho@gmail.com','Neossoikon 77',36,'18537',34);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_books_event`
--

DROP TABLE IF EXISTS `customer_books_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_books_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `event_id` int NOT NULL,
  `amount_positions` int NOT NULL,
  `total_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_books_event_customer` (`customer_id`),
  KEY `fk_customer_books_event_event` (`event_id`),
  CONSTRAINT `fk_customer_books_event_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_customer_books_event_event` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_books_event`
--

LOCK TABLES `customer_books_event` WRITE;
/*!40000 ALTER TABLE `customer_books_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_books_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difficulty`
--

DROP TABLE IF EXISTS `difficulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `difficulty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulty`
--

LOCK TABLES `difficulty` WRITE;
/*!40000 ALTER TABLE `difficulty` DISABLE KEYS */;
INSERT INTO `difficulty` VALUES (1,'Πολύ Εύκολο'),(2,'Εύκολο'),(3,'Κανονικό'),(4,'Δύσκολο'),(5,'Πολύ Δύσκολο');
/*!40000 ALTER TABLE `difficulty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_has_event`
--

DROP TABLE IF EXISTS `equipment_has_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_has_event` (
  `equipment_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`equipment_id`,`event_id`),
  KEY `fk_equipment_has_event_event` (`event_id`),
  CONSTRAINT `fk_equipment_has_event_equipment` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`),
  CONSTRAINT `fk_equipment_has_event_event` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_has_event`
--

LOCK TABLES `equipment_has_event` WRITE;
/*!40000 ALTER TABLE `equipment_has_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment_has_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ending_date` datetime NOT NULL,
  `starting_date` datetime NOT NULL,
  `price` double NOT NULL,
  `description` mediumtext NOT NULL,
  `location_id` int DEFAULT NULL,
  `positions` int NOT NULL,
  `type_indoor_outdoor_id` int NOT NULL,
  `difficulty_id` int NOT NULL,
  `organiser_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_difficulty` (`difficulty_id`),
  KEY `fk_event_type_indoor_outdoor` (`type_indoor_outdoor_id`),
  KEY `fk_event_organiser_id` (`organiser_id`),
  KEY `fk_event_company` (`company_id`),
  KEY `fk_event_location` (`location_id`),
  KEY `fk_event_category_idx` (`category_id`),
  CONSTRAINT `fk_event_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_event_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_event_difficulty` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulty` (`id`),
  CONSTRAINT `fk_event_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `fk_event_organiser_id` FOREIGN KEY (`organiser_id`) REFERENCES `organiser` (`id`),
  CONSTRAINT `fk_event_type_indoor_outdoor` FOREIGN KEY (`type_indoor_outdoor_id`) REFERENCES `type_indoor_outdoor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(20) NOT NULL,
  `coordinateX` varchar(20) DEFAULT NULL,
  `coordinateY` varchar(20) DEFAULT NULL,
  `city_id` int NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_location_city` (`city_id`),
  CONSTRAINT `fk_location_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organiser`
--

DROP TABLE IF EXISTS `organiser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organiser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city_id` int NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `credentials_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `credentials_id_UNIQUE` (`credentials_id`),
  KEY `fk_organiser_city` (`city_id`),
  CONSTRAINT `fk_organiser_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_organiser_credentials` FOREIGN KEY (`credentials_id`) REFERENCES `credentials` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organiser`
--

LOCK TABLES `organiser` WRITE;
/*!40000 ALTER TABLE `organiser` DISABLE KEYS */;
/*!40000 ALTER TABLE `organiser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'CUSTOMER'),(2,'COMPANY'),(3,'ORGANIZER'),(4,'ADMINISTRATOR');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_indoor_outdoor`
--

DROP TABLE IF EXISTS `type_indoor_outdoor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_indoor_outdoor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_indoor_outdoor` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_indoor_outdoor`
--

LOCK TABLES `type_indoor_outdoor` WRITE;
/*!40000 ALTER TABLE `type_indoor_outdoor` DISABLE KEYS */;
INSERT INTO `type_indoor_outdoor` VALUES (1,'INDOOR'),(2,'OUTDOOR'),(3,'ONLINE');
/*!40000 ALTER TABLE `type_indoor_outdoor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-27 21:49:05

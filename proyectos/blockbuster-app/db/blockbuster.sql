-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: blockbuster
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
drop database if exists blockbuster;
create database blockbuster;
use blockbuster;
--
-- Table structure for table `blockbuster_log`
--

DROP TABLE IF EXISTS `blockbuster_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blockbuster_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(45) NOT NULL,
  `created_on` datetime NOT NULL,
  `entry_text` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blockbuster_log`
--

LOCK TABLES `blockbuster_log` WRITE;
/*!40000 ALTER TABLE `blockbuster_log` DISABLE KEYS */;
INSERT INTO `blockbuster_log` VALUES (1, 'Review', '2023-06-08 00:00:00', 'New Review for client id 1 and movie 1'),(2, 'Review', '2023-06-08 00:00:00', 'New Review for client id 2 and movie 2'),(3, 'Review', '2023-06-08 00:00:00', 'New Review for client id 3 and movie 3'),(4, 'Review', '2023-06-08 00:00:00', 'New Review for client id 4 and movie 4'),(5, 'Review', '2023-06-08 00:00:00', 'New Review for client id 5 and movie 5'),(6, 'Review', '2023-06-08 00:00:00', 'New Review for client id 6 and movie 6'),(7, 'Rental', '2023-06-08 00:00:00', 'New Rental for client id 1 and movie 1'),(8, 'Rental', '2023-06-08 00:00:00', 'New Rental for client id 2 and movie 2'),(9, 'Rental', '2023-06-08 00:00:00', 'New Rental for client id 3 and movie 3'),(10, 'Rental', '2023-06-08 00:00:00', 'New Rental for client id 4 and movie 4'),(11, 'Rental', '2023-06-08 00:00:00', 'New Rental for client id 5 and movie 5'),(12, 'Rental', '2023-06-08 00:00:00', 'New Rental for client id 6 and movie 6'),(13, 'Rental', '2023-06-08 00:00:00', 'New Rental for client id 6 and movie 6'),(14, 'Rental', '2023-06-09 00:00:00', 'Rental deleted for client id 6 and movie 6'),(15, 'Rental', '2023-06-09 00:00:00', 'Rental deleted for client id 6 and movie 6'),(16, 'Rental', '2023-06-09 00:00:00', 'New Rental for client id 6 and movie 6'),(17, 'Review', '2023-06-09 00:00:00', 'New Review for client id 7 and movie 7'),(18, 'Review', '2023-06-09 00:00:00', 'New Review for client id 8 and movie 8'),(19, 'Review', '2023-06-09 00:00:00', 'New Review for client id 9 and movie 9'),(20, 'Review', '2023-06-09 00:00:00', 'New Review for client id 10 and movie 10'),(21, 'Review', '2023-06-09 00:00:00', 'New Review for client id 11 and movie 11'),(22, 'Rental', '2023-06-09 00:00:00', 'New Rental for client id 7 and movie 7'),(23, 'Rental', '2023-06-09 00:00:00', 'New Rental for client id 8 and movie 8'),(24, 'Rental', '2023-06-09 00:00:00', 'New Rental for client id 9 and movie 9'),(25, 'Rental', '2023-06-09 00:00:00', 'New Rental for client id 10 and movie 10');
/*!40000 ALTER TABLE `blockbuster_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO category VALUES (1,'Action','High-octane, adrenaline-pumping films'),(2,'Adventure','Exciting journeys and unexplored territories'),(3,'Comedy','Hilarious and entertaining movies'),(4,'Crime','Intriguing stories of criminal activities'),(5,'Drama','Emotionally intense narratives'),(6,'Fantasy','Imaginary worlds with magical elements'),(7,'Horror','Terrifying and spine-chilling films'),(8,'Mystery','Puzzling narratives with unexpected twists'),(9,'Romance','Heartwarming tales of love and relationships'),(10,'Sci-Fi','Futuristic settings and advanced technology'),(11,'Thriller','Suspenseful plots that keep you on the edge'),(12,'Animation','Magical worlds brought to life through animation'),(13,'Family','Entertaining films suitable for all ages'),(14,'Historical','Insightful portrayals of past events'),(15,'Music','Movies with a strong focus on music'),(16,'Sports','Exciting stories centered around sports'),(17,'War','Gritty and realistic depictions of conflicts'),(18,'Western','Classic tales set in the American Old West'),(19,'Biography','Inspiring stories based on real people'),(20,'Documentary','Informative films exploring real-life subjects'),(21,'Sci-Fi Fantasy','Imaginative blend of science fiction and fantasy'),(22,'Superhero','Epic adventures of extraordinary individuals'),(23,'Spy','Intriguing espionage stories'),(24,'Thriller Mystery','Intense combination of suspense and mystery'),(25,'Romantic Comedy','Lighthearted and funny love stories');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `lastname_idx` (`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO client VALUES (1,'James','Wilson','jameswilson@gmail.com','1234567890'),(2,'Emma','Johnson','emmajohnson@gmail.com','0987654321'),(3,'Michael','Smith','michaelsmith@gmail.com','9876543210'),(4,'Sophia','Davis','sophiadavis@gmail.com','0123456789'),(5,'William','Anderson','williamanderson@gmail.com','8765432109'),(6,'Olivia','Brown','oliviabrown@gmail.com','1357924680'),(7,'Alexander','Miller','alexandermiller@gmail.com','2468013579'),(8,'Ava','Thompson','avathompson@gmail.com','9081726354'),(9,'Ethan','Garcia','ethangarcia@gmail.com','5463728190'),(10,'Isabella','Martinez','isabellamartinez@gmail.com','2837465190'),(11,'Mason','Taylor','masontaylor@gmail.com','6172839405'),(12,'Sophia','Clark','sophiaclark@gmail.com','3948506172'),(13,'Liam','Robinson','liamrobinson@gmail.com','8273649501'),(14,'Mia','Walker','miawalker@gmail.com','4950172638'),(15,'Lucas','Hall','lucashall@gmail.com','7263849501'),(16,'Emily','Young','emilyyoung@gmail.com','2638495071'),(17,'Jackson','Lewis','jacksonlewis@gmail.com','5071638492'),(18,'Amelia','Lewis','amelialewis@gmail.com','3849507162'),(19,'Benjamin','Wright','benjaminwright@gmail.com','7162940583'),(20,'Charlotte','Smith','charlottesmith@gmail.com','2940583716'),(21,'Carter','Johnson','carterjohnson@gmail.com','0583716294'),(22,'Harper','Mitchell','harpermitchell@gmail.com','3716294058'),(23,'Elijah','Baker','elijahbaker@gmail.com','6294058371'),(24,'Lily','Wright','lilywright@gmail.com','4058371629'),(25,'Henry','Hill','henryhill@gmail.com','8371629405');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `release_date` datetime DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `units_available` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `fk_movie_category_idx` (`category_id`),
  KEY `movie_title_idx` (`title`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */; 
INSERT INTO movie (id, title, release_date, category_id, units_available) VALUES (1, 'Avengers: Infinity War', '2018-04-27 00:00:00', 1, 12), (2, 'Black Panther', '2018-02-16 00:00:00', 2, 10), (3, 'Inception', '2010-07-16 00:00:00', 3, 8), (4, 'The Shawshank Redemption', '1994-09-23 00:00:00', 11, 20), (5, 'Pulp Fiction', '1994-10-14 00:00:00', 10, 18), (6, 'Fight Club', '1999-10-15 00:00:00', 17, 16), (7, 'Interstellar', '2014-11-07 00:00:00', 3, 10), (8, 'The Matrix', '1999-03-31 00:00:00', 8, 12), (9, 'The Social Network', '2010-10-01 00:00:00', 12, 8), (10, 'Blade Runner 2049', '2017-10-06 00:00:00', 13, 10), (11, 'Whiplash', '2014-10-10 00:00:00', 14, 10), (12, 'The Departed', '2006-10-06 00:00:00', 15, 12), (13, 'Avengers: Endgame', '2019-04-26 00:00:00', 1, 12), (14, 'Spider-Man: No Way Home', '2021-12-17 00:00:00', 5, 12), (15, 'The Avengers', '2012-05-04 00:00:00', 1, 12), (16, 'Mad Max: Fury Road', '2015-05-15 00:00:00', 6, 12), (17, 'La La Land', '2016-12-09 00:00:00', 9, 12), (18, 'Django Unchained', '2012-12-25 00:00:00', 10, 12), (19, 'Guardians of the Galaxy', '2014-08-01 00:00:00', 1, 12), (20, 'The Wolf of Wall Street', '2013-12-25 00:00:00', 10, 12);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentals`
--

DROP TABLE IF EXISTS `rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rental_date` datetime DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rentals_client_idx` (`client_id`),
  KEY `fk_rentals_movie_idx` (`movie_id`),
  CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentals`
--

LOCK TABLES `rentals` WRITE;
/*!40000 ALTER TABLE `rentals` DISABLE KEYS */;

INSERT INTO rentals VALUES (1,'2023-01-01 00:00:00',1,1),(2,'2023-01-01 00:00:00',2,3),(3,'2023-01-01 00:00:00',3,4),(4,'2023-01-01 00:00:00',4,5),(5,'2023-01-01 00:00:00',5,6),(6,'2023-01-01 00:00:00',6,7),(7,'2023-01-01 00:00:00',7,8),(8,'2023-01-01 00:00:00',8,9),(9,'2023-01-01 00:00:00',9,10),(10,'2023-01-01 00:00:00',10,11),(11,'2023-01-01 00:00:00',11,12),(12,'2023-01-01 00:00:00',12,13),(13,'2023-01-01 00:00:00',13,14),(14,'2023-01-01 00:00:00',14,15),(15,'2023-01-01 00:00:00',15,16),(16,'2023-01-01 00:00:00',16,17),(17,'2023-01-01 00:00:00',17,18),(18,'2023-01-01 00:00:00',18,19),(19,'2023-01-01 00:00:00',19,20),(20,'2023-01-01 00:00:00',20,21),(21,'2023-01-01 00:00:00',21,22),(22,'2023-01-01 00:00:00',22,23),(23,'2023-01-01 00:00:00',23,24),(24,'2023-01-01 00:00:00',24,25),(25,'2023-01-01 00:00:00',25,26);
/*!40000 ALTER TABLE `rentals` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rentals_AFTER_INSERT` AFTER INSERT ON `rentals` FOR EACH ROW BEGIN
insert into blockbuster_log (table_name,created_on,entry_text) values('rentals',current_date(),concat('	New rental for client ',NEW.client_id,' and movie ',NEW.movie_id)); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rentals_AFTER_UPDATE` AFTER UPDATE ON `rentals` FOR EACH ROW BEGIN
insert into blockbuster_log (table_name,created_on,entry_text) values('rentals',current_date(),concat('Rental ',NEW.id,' updated')); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rentals_AFTER_DELETE` AFTER DELETE ON `rentals` FOR EACH ROW BEGIN
insert into blockbuster_log (table_name,created_on,entry_text) values('rentals',current_date(),concat('Deleted rental for client ',OLD.client_id,' and movie ',OLD.movie_id)); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating` decimal(2,0) DEFAULT NULL,
  `review_text` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_client_idx` (`client_id`),
  KEY `f_review_movie_idx` (`movie_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,5,'Excellent movie!','2022-01-01 00:00:00',1,1),(2,0,'Terrible film!','2022-01-01 00:00:00',2,3),(3,3,'Average movie.','2022-01-01 00:00:00',3,4),(4,4,'Highly recommended!','2022-01-01 00:00:00',4,2),(5,2,'Not my cup of tea.','2022-01-01 00:00:00',5,1),(6,5,'Absolutely loved it!','2022-01-01 00:00:00',6,5),(7,1,'Disappointing storyline.','2022-01-01 00:00:00',7,6),(8,4,'Captivating performances.','2022-01-01 00:00:00',8,3),(9,3,'Good but could be better.','2022-01-01 00:00:00',9,4),(10,5,'A must-see film!','2022-01-01 00:00:00',10,7),(11,2,'Lacked originality.','2022-01-01 00:00:00',11,8),(12,4,'Engaging plot twists.','2022-01-01 00:00:00',12,9),(13,1,'Waste of time.','2022-01-01 00:00:00',13,10),(14,5,'Incredible visual effects!','2022-01-01 00:00:00',14,11),(15,3,'Decent entertainment.','2022-01-01 00:00:00',15,12),(16,2,'Unconvincing acting.','2022-01-01 00:00:00',16,5),(17,4,'Thought-provoking story.','2022-01-01 00:00:00',17,3),(18,5,'A masterpiece!','2022-01-01 00:00:00',18,2),(19,0,'Could not even finish it.','2022-01-01 00:00:00',19,1),(20,3,'Just average.','2022-01-01 00:00:00',20,6),(21,4,'Gripping from start to finish.','2022-01-01 00:00:00',21,7),(22,2,'Predictable plot.','2022-01-01 00:00:00',22,8),(23,5,'Emotionally moving.','2022-01-01 00:00:00',23,9),(24,1,'Disjointed narrative.','2022-01-01 00:00:00',24,10),(25,4,'Impressive cinematography.','2022-01-01 00:00:00',25,11);

/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `review_AFTER_INSERT` AFTER INSERT ON `review` FOR EACH ROW BEGIN
insert into blockbuster_log (table_name,created_on,entry_text) values('Review',current_date(),concat('	New review by client ',NEW.client_id,' for movie ',NEW.movie_id)); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reviews_AFTER_UPDATE` AFTER UPDATE ON `review` FOR EACH ROW BEGIN
insert into blockbuster_log (table_name,created_on,entry_text) values('Review',current_date(),concat('Review ',NEW.id,' updated')); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `review_AFTER_DELETE` AFTER DELETE ON `review` FOR EACH ROW BEGIN
insert into blockbuster_log (table_name,created_on,entry_text) values('Review',current_date(),concat('Deleted review of client ',OLD.client_id,' for movie ',OLD.movie_id)); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'blockbuster'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_category`(
    in p_name varchar(45),
    in p_description varchar(45),
    out p_new_category_id int
)
begin
	if not exists (select name from category where name = p_name) then
		insert into category (name,description) values (p_name,p_description);
        select last_insert_id() into p_new_category_id;
	else
		set p_new_category_id =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_client`(
    in p_name varchar(50),
    in p_lastname varchar(50),
    in p_email varchar(45),
    in p_phone_number varchar(20),
    out p_new_client_id int
)
begin
	
	insert into client (name, lastname, email, phone_number) values (p_name, p_lastname, p_email, p_phone_number);
	select last_insert_id() into p_new_client_id;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_movie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_movie`(
    in p_title varchar(100),
    in p_release_date datetime,
    in p_category_id int,
    in p_units_available int,
    out p_new_movie_id int
)
begin
	if exists (select id from category where id = p_category_id) then
		insert into movie (title, release_date, category_id, units_available) values (p_title,p_release_date, p_category_id,p_units_available);
        select last_insert_id() into p_new_movie_id;
	else
		set p_new_movie_id =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_rental` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_rental`(
    in p_client_id int,
    in p_movie_id int,
    in p_rental_date datetime,
    
    out p_new_rental int
)
begin
	if exists(select id from client where id = p_client_id) then
		if exists(select id from movie where id = p_movie_id) then
			insert into rentals (rental_date,client_id,movie_id) values (p_rental_date,p_client_id,p_movie_id);
            select last_insert_id() into p_new_rental;
        else
			set p_new_rental =-1;
        end if;
    
    else
		set p_new_rental =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_review`(
    in p_client_id int,
    in p_movie_id int,
    in p_created_on datetime,
    in p_rating decimal(2),
    in p_review_text varchar(100),
    out p_new_review int
)
begin
	if exists(select id from client where id = p_client_id) then
		if exists(select id from movie where id = p_movie_id) then
			insert into review (rating,review_text,created_on,client_id,movie_id) values (p_rating,p_review_text,p_created_on,p_client_id,p_movie_id);
            select last_insert_id() into p_new_review;
        else
			set p_new_review =-1;
        end if;
    
    else
		set p_new_review =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_category`(
    in p_id int,
    out procedure_completed int 
)
begin
	if not exists(select categcategoryory_id from movie where category_id = p_id) then
		
		delete from category where id = p_id;
			select 1 into procedure_completed;
		
	else
		set procedure_completed =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_client`(
    in p_id int,
    out procedure_completed int 
)
begin

	if exists(select id from client where id = p_id) then
		if not exists (select client_id from rentals where client_id = p_id) then
			if not exists(select client_id from review where client_id = p_id) then
				delete from client where id = p_id;
					select 1 into procedure_completed;
			else 
				set procedure_completed=1;
			end if;
		else
			set procedure_completed =-1;
		end if;
	else
		set procedure_completed =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_movie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_movie`(
    in p_id int,
    out procedure_completed int 
)
begin
	if not exists(select movie_id from rentals where movie_id = p_id) then
		if exists (select id from movie where id = p_id) then
			delete from movie where id = p_id;
				select 1 into procedure_completed;
		else
			set procedure_completed =-1;
		end if;
	else
		set procedure_completed =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_rental` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_rental`(
    in p_id int,
    out procedure_completed int 
)
begin
	if exists(select id from rentals where id = p_id) then
			delete from rentals where id = p_id;
			select 1 into procedure_completed;
			
	else
		set procedure_completed =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_review`(
    in p_id int,
    out procedure_completed int 
)
begin
	if exists(select id from review where id = p_id) then
			delete from review where id = p_id;
			select 1 into procedure_completed;
			
	else
		set procedure_completed =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_category`(
    in p_id int,
    out p_name varchar(45),
    out p_description varchar(45),
    
    out p_procedure_status int
)
begin
	if exists (select id from category where id = p_id) then
		select name, description 
        into p_name,p_description
        from category
        where id=p_id;
        select 1 into p_procedure_status;
	else
		set p_procedure_status =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_client`(
    in p_id int,
    out p_name varchar(50),
    out p_lastname varchar(50),
    out p_email varchar(45),
    out p_phone_number varchar(20),
    out p_procedure_status int
)
begin
	if exists (select id from client where id = p_id) then
		select name,lastname, email, phone_number
        into p_name,p_lastname,p_email,p_phone_number
        from client
        where id=p_id;
        select 1 into p_procedure_status;
	else
		set p_procedure_status =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_rental` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_rental`(
    in p_id int,
    out p_rental_date datetime,
    out p_client_id int,
    out p_movie_id int,
    
    out p_procedure_status int
)
begin
	if exists (select id from rentals where id = p_id) then
		select rental_date, client_id, movie_id
        into p_rental_date,p_client_id,p_movie_id
        from rentals
        where id=p_id;
        select 1 into p_procedure_status;
	else
		set p_procedure_status =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_review`(
    in p_id int,
    out p_rating decimal(2),
    out p_client_id int,
    out p_movie_id int,
    out p_review_text varchar(100),
    out p_created_on date,
    
    
    out p_procedure_status int
)
begin
	if exists (select id from review where id = p_id) then
		select rating,client_id,movie_id,review_text,created_on
        into p_rating,p_client_id,p_movie_id,p_review_text,p_created_on
        from review
        where id=p_id;
        select 1 into p_procedure_status;
	else
		set p_procedure_status =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_category`(
    in p_id int,
    in p_name varchar(45),
    in p_description varchar(45),
    out process_status int
)
begin
	if exists (select id from category where id = p_id) then
		update category
        set name = p_name, description = p_description
        where id = p_id;
        select 1 into process_status;
	else
		set process_status =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_client`(
    in p_id int,
    in p_name varchar(50),
    in p_lastname varchar(50),
    in p_email varchar(45),
    in p_phone_number varchar(20),
    out p_procedure_status int
)
begin
	if exists (select id from client where id = p_id) then
		update client
        set name = p_name, lastname = p_lastname, email = p_email,phone_number = p_phone_number
        where id = p_id;
        select 1 into p_procedure_status;
	else
		set p_procedure_status =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_movie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_movie`(
    in p_id int,
    in p_title varchar(100),
    in p_release_date datetime,
    in p_category_id int,
    in p_units_available int,
    out p_new_movie_id int
)
begin
	if exists (select id from movie where id = p_id) then
		update movie
        set title = p_title,release_date = p_release_date, category_id = p_category_id,units_available = p_units_available
        where id = p_id;
        select 1 into p_new_movie_id;
	else
		set p_new_movie_id =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_rental` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_rental`(
    in p_id int,
    in p_rental_date datetime,
    in p_client_id int,
    in p_movie_id int ,
    
    out p_procedure_status int
)
begin
	if exists (select id from rentals where id = p_id) then
		if exists (select id from movie where id=p_movie_id) then
			if exists(select id from client where id=p_client_id) then
				update rentals
				set rental_date = p_rental_date, client_id= p_client_id, movie_id = p_movie_id
				where id = p_id;
				select 1 into p_procedure_status;
            else
			set p_procedure_status =-1;
		end if;
        else
			set p_procedure_status =-1;
		end if;
	else
		set p_procedure_status =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_review`(
    in p_id int,
    in p_rating decimal(2),
    in p_client_id int,
    in p_movie_id int ,
    in p_review_text varchar(100),
    in p_created_on date,
    
    out p_procedure_status int
)
begin
	if exists (select id from review where id = p_id) then
		if exists (select id from movie where id=p_movie_id) then
			if exists(select id from client where id=p_client_id) then
				update review
				set rating = p_rating, client_id= p_client_id, movie_id = p_movie_id, created_on = p_created_on,review_text = p_review_text
				where id = p_id;
				select 1 into p_procedure_status;
            else
			set p_procedure_status =-1;
		end if;
        else
			set p_procedure_status =-1;
		end if;
	else
		set p_procedure_status =-1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-09  6:15:32
DROP USER IF EXISTS 'blockbusterappuser'@'localhost';
CREATE USER IF NOT EXISTS 'blockbusterappuser'@'localhost' IDENTIFIED BY 'blockbusterapppass';
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON blockbuster.* TO 'blockbusterappuser'@'localhost';

SET autocommit = OFF;
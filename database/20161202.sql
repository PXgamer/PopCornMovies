CREATE DATABASE  IF NOT EXISTS `popcorndb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `popcorndb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 10.14.202.74    Database: popcorndb
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'Eddie','Redmayne'),(2,'Katherine','Waterson'),(3,'Dan','Fogler');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (1,'CinemaxX',9.990500099999963,53.5595468),(2,'Passage Kino',53.550563,9.998244),(3,'Savoy',53.554187,10.014166),(4,'UCI KINOWELT Wandsbek',53.588431,10.096612);
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Fantasy'),(2,'Abenteuer'),(3,'Komödie'),(4,'Action'),(5,'Thriller'),(6,'Drama'),(7,'Animationsfilm'),(8,'Science-Fiction');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_actors`
--

DROP TABLE IF EXISTS `movie_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_actors` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`actor_id`),
  KEY `actor_id` (`actor_id`),
  CONSTRAINT `movie_actors_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_actors_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_actors`
--

LOCK TABLES `movie_actors` WRITE;
/*!40000 ALTER TABLE `movie_actors` DISABLE KEYS */;
INSERT INTO `movie_actors` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `movie_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_cinemas`
--

DROP TABLE IF EXISTS `movie_cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_cinemas` (
  `movie_id` int(11) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`cinema_id`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `movie_cinemas_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `movie_cinemas_ibfk_2` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_cinemas`
--

LOCK TABLES `movie_cinemas` WRITE;
/*!40000 ALTER TABLE `movie_cinemas` DISABLE KEYS */;
INSERT INTO `movie_cinemas` VALUES (1,1);
/*!40000 ALTER TABLE `movie_cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genres`
--

DROP TABLE IF EXISTS `movie_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_genres` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genres`
--

LOCK TABLES `movie_genres` WRITE;
/*!40000 ALTER TABLE `movie_genres` DISABLE KEYS */;
INSERT INTO `movie_genres` VALUES (1,1),(4,1),(1,2),(3,3),(11,3),(14,3),(16,4),(5,5),(16,5),(10,6),(12,6),(13,6),(15,6),(6,7),(2,8);
/*!40000 ALTER TABLE `movie_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_screenings`
--

DROP TABLE IF EXISTS `movie_screenings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_screenings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_ov` tinyint(1) NOT NULL,
  `is_3d` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `movie_screenings_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `movie_screenings_ibfk_2` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_screenings`
--

LOCK TABLES `movie_screenings` WRITE;
/*!40000 ALTER TABLE `movie_screenings` DISABLE KEYS */;
INSERT INTO `movie_screenings` VALUES (1,2,1,'2016-12-02 16:15:00','2016-12-02 16:15:00',0,0),(2,2,1,'2016-12-02 19:15:00','2016-12-02 19:15:00',0,0),(3,2,1,'2016-11-29 08:29:38','2016-12-02 22:15:00',0,0),(4,14,1,'2016-12-02 17:00:00','2016-12-02 17:00:00',0,0),(5,15,1,'2016-12-02 19:15:00','2016-12-02 19:15:00',0,0),(6,15,1,'2016-12-02 22:10:00','2016-12-02 22:10:00',0,0),(7,4,1,'2016-11-29 09:55:35','2016-12-02 16:30:00',0,1),(8,4,1,'2016-11-29 09:55:35','2016-12-02 18:40:00',0,1),(9,4,1,'2016-11-29 09:55:35','2016-12-02 21:50:00',0,1),(10,6,1,'2016-12-02 13:45:00','2016-12-02 13:45:00',0,0),(11,5,1,'2016-12-02 19:30:00','2016-12-02 19:30:00',0,0),(12,16,1,'2016-12-02 20:00:00','2016-12-02 20:00:00',0,0),(13,16,1,'2016-12-02 22:30:00','2016-12-02 22:30:00',0,0),(14,1,1,'2016-11-29 08:34:33','2016-12-02 12:00:00',0,1),(15,1,1,'2016-11-29 08:34:33','2016-12-02 14:15:00',0,1),(16,1,1,'2016-11-29 08:34:33','2016-12-02 16:00:00',0,1),(17,1,1,'2016-11-29 08:34:33','2016-12-02 19:30:00',0,1),(18,1,1,'2016-11-29 08:34:33','2016-12-02 21:20:00',0,1),(19,1,1,'2016-12-02 13:00:00','2016-12-02 13:00:00',0,0),(20,1,1,'2016-12-02 15:15:00','2016-12-02 15:15:00',0,0),(21,1,1,'2016-12-02 18:00:00','2016-12-02 18:00:00',0,0),(22,10,2,'2016-12-02 19:30:00','2016-12-02 19:30:00',0,0),(23,11,2,'2016-12-02 17:00:00','2016-12-02 17:00:00',0,0),(24,12,2,'2016-12-02 14:30:00','2016-12-02 14:30:00',0,0),(25,5,2,'2016-12-02 14:30:00','2016-12-02 14:30:00',0,0),(26,13,2,'2016-12-02 17:00:00','2016-12-02 17:00:00',0,0),(27,2,3,'2016-11-29 08:29:38','2016-12-02 19:45:00',1,0),(28,4,3,'2016-11-29 09:55:35','2016-12-02 13:30:00',1,0),(29,1,3,'2016-11-29 08:29:38','2016-12-02 16:30:00',1,0),(30,2,4,'2016-12-02 13:15:00','2016-12-02 13:15:00',0,0),(31,2,4,'2016-12-02 16:15:00','2016-12-02 16:15:00',0,0),(32,2,4,'2016-12-02 19:15:00','2016-12-02 19:15:00',0,0),(33,2,4,'2016-12-02 22:15:00','2016-12-02 22:15:00',0,0),(34,3,4,'2016-12-02 18:45:00','2016-12-02 18:45:00',0,0),(35,14,4,'2016-12-02 15:45:00','2016-12-02 15:45:00',0,0),(36,15,4,'2016-12-02 18:45:00','2016-12-02 18:45:00',0,0),(37,15,4,'2016-12-02 21:45:00','2016-12-02 21:45:00',0,0),(38,4,4,'2016-11-29 09:55:35','2016-12-02 16:00:00',0,0),(39,4,4,'2016-11-29 09:55:35','2016-12-02 19:00:00',0,1),(40,6,4,'2016-12-02 13:30:00','2016-12-02 13:30:00',0,0),(41,6,4,'2016-12-02 16:15:00','2016-12-02 16:15:00',0,0),(42,5,4,'2016-12-02 22:00:00','2016-12-02 22:00:00',0,0),(43,16,4,'2016-12-02 16:00:00','2016-12-02 16:00:00',0,0),(44,16,4,'2016-12-02 19:00:00','2016-12-02 19:00:00',0,0),(45,16,4,'2016-12-02 22:15:00','2016-12-02 22:15:00',0,0),(46,1,4,'2016-12-02 13:45:00','2016-12-02 13:45:00',0,1),(47,1,4,'2016-12-02 16:15:00','2016-12-02 16:15:00',0,1),(48,1,4,'2016-12-02 19:30:00','2016-12-02 19:30:00',0,1),(49,1,4,'2016-12-02 22:00:00','2016-12-02 22:00:00',0,1),(50,1,4,'2016-12-02 13:00:00','2016-12-02 13:00:00',0,0),(51,1,4,'2016-12-02 15:30:00','2016-12-02 15:30:00',0,0),(52,1,4,'2016-12-02 18:45:00','2016-12-02 18:45:00',0,0);
/*!40000 ALTER TABLE `movie_screenings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `image_path` varchar(255) DEFAULT NULL,
  `imdbID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Phantastische Tierwesen und wo sie zu finden sind','Phantastische Tierwesen und wo sie zu finden sind: Spinoff von \"Harry Potter\", mit dem die Autorin der Buchvorlagen ihr Debüt als Drehbuchautorin gibt.','http://localhost/PopCornMovies/assets/gfx/phantastische-tierwesen.jpg','tt3183660'),(2,'Arrival','Arrival: Science-Fiction-Film über die Begegnung zwischen Menschen und Aliens.','http://localhost/PopCornMovies/assets/gfx/arrival.jpg','tt2543164'),(3,'Bad Santa 2','Bad Santa 2: Fortsetzung der schwarzen Komödie mit Billy Bob Thornton.','http://localhost/PopCornMovies/assets/gfx/bad-santa-2.jpg','tt1798603'),(4,'Doctor Strange','Doctor Strange: Marvel-Leinwand-Abenteuer um einen ehemaligen Chirurgen mit magischen Fähigkeiten.','http://localhost/PopCornMovies/assets/gfx/doctor-strange.jpg','tt1211837'),(5,'Girl on the Train','Girl on the Train: Thriller nach dem gleichnamigen US-Bestseller um eine Frau, die in einen Mord verwickelt wird.','http://localhost/PopCornMovies/assets/gfx/girl-on-the-train.jpg','tt3631112'),(6,'Findet Dorie','Findet Dorie: Sequel zum Pixar-Blockbuster \"Findet Nemo\", in dem Dorie gesucht wird.','http://localhost/PopCornMovies/assets/gfx/findet-dorie.jpg','tt2277860'),(10,'Amerikanisches Idyll','Amerikanisches Idyll: Ewan McGregors Regiedebüt nach dem gleichnamigen Roman von Philip Roth.','http://localhost/PopCornMovies/assets/gfx/amerikanisches-idyll.jpg','tt0376479'),(11,'Café Society','Café Society: Bittersüße Liebes- und Aufsteigergeschichte im Hollywood der 1930er Jahre.','http://localhost/PopCornMovies/assets/gfx/cafe-society.jpg','tt4513674'),(12,'Eine Geschichte von Liebe und Finsternis','Eine Geschichte von Liebe und Finsternis: Natalie Portmans Regiedebüt, über die Kindheit des israelischen Schriftstellers Amos Oz.','http://localhost/PopCornMovies/assets/gfx/geschichte-von-liebe.jpg','tt1135989'),(13,'Jeder stirbt für sich allein - Alone in Berlin','Jeder stirbt für sich allein: Neuverfilmung des Romans von Hans Fallada um ein Arbeiterehepaar, das Widerstand gegen die Nazis leistet.','http://localhost/PopCornMovies/assets/gfx/jeder-stirbt.jpg','tt3026488'),(14,'Bridget Jones\' Baby','Bridget Jones\' Baby: Weiterer Teil der erfolgreichen \"Bridget Jones\"-Reihe mit Renée Zellweger, die dieses Mal ein Kind erwartet.','http://localhost/PopCornMovies/assets/gfx/bridget-jones.jpg','tt1473832'),(15,'Deepwater Horizon','Deepwater Horizon: Katastrophenthriller, der sich der Ereignisse aus dem Jahr 2010 auf der gleichnamigen Bohrinsel annimmt.','http://localhost/PopCornMovies/assets/gfx/deepwater.jpg','tt1860357'),(16,'Jack Reacher: Kein Weg zurück','Jack Reacher: Kein Weg zurück: Die Fortsetzung des Actionthrillers mit Tom Cruise als Lee Childs Kultermittler Jack Reacher.','http://localhost/PopCornMovies/assets/gfx/jack-reacher.jpg','tt3393786');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `movie_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `text` text,
  PRIMARY KEY (`movie_id`,`user_name`),
  KEY `movie_id_idx` (`movie_id`),
  KEY `user_id_idx` (`user_name`),
  CONSTRAINT `fk_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,'Alodon',10,'Nebel und dunkle Wolken verhüllen das Bild, doch werden sie langsam lichter. Das Warner Bros. Logo erscheint, die uns allzu bekannte Harry Potter Melodie erklingt (John Williams\' melodische Version selbstverständlich, nicht die melanchonische Variation der späteren Filme), und schon ist man wieder mitten drin, mitten in dieser fantastischen, phantasievoll-magischen Welt, die uns über so viele Jahre in seinen Bann gezogen hat. Gezweifelt, wenn man ehrlich ist, haben wir wohl alle ein bisschen. Wieder ein neuer Film? Hat man nicht schon genug Geld verdient, ist die Gier der Studiobosse denn gar nicht zu befriedigen? Es reichen diese paar Sekunden, um all die gemischten Gefühle hinwegzufegen. Das Kind in uns wird augenblicklich 15 Jahre zurück versetzt, zu dem Moment, als wir \"Harry Potter and the Philosopher\'s Stone\" zum ersten Mal im Kino sahen. Unsere Augen werden grösser und grösser vor Neugierde, können sich an den gebotenen Schauwerten kaum sattsehen. Dennoch, der Film beginnt mit einem brutalen und gnadenlos inszenierten Terroranschlag Gellard Grindelwalds (den Buchkennern natürlich schon lange ein Begriff, zum Glück werden auch die Nichtkenner abgeholt und der Charakter sachte aber würdig in die Geschichte eingeführt), und schnell wird uns bewusst, was der Meister der Tränke damals im 1. Harry Potter Film schon ankündigte: \"Albernes Zauberstabgefuchtel und kindische Hexereien wird es hier nicht geben!\"\n\nZur Handlung\nFantastische Tierwesen und wo sie zu finden sind entführt uns ins New York der 1926er Jahre. Auf Grund Grindelwalds grausames Treiben in Europa, das die ganze Magierwelt in Angst und Schrecken versetzt, kommt man auch in Amerika nicht umhin, sich um das Wohl der Magiergesellschaft und deren Geheimhaltung sorgen. Die Paranoia ist gerade wegen den historischen und brutalen Hexenverfolgungen umso grösser. Inmitten dieser beklemmenden Atmosphäre erreicht Newt Scamander (Eddie Redmayne) per Schiff die Stadt, ausgerüstet mit einem Koffer voller magischer Tierwesen. Durch ein Missgeschickt passiert das Unvermeidliche: Er vertauscht seinen Koffer ausgerechnet mit jenem von Jacob Kowalski (Dan Fogler), einem Nicht-Magier. Es kommt wie es kommen muss: Einige dieser exotischen Exemplare brechen aus, und es gilt, sie so schnell wie möglich wieder einzufangen, bevor die Existenz der Magierwelt preisgegeben wird. Dem ungleichen Duo gesellen sich das Geschwisterpaar Tina & Queenie Goldstein (Katherine Waterston & Alison Sudol) hinzu, während Percival Graves (Colin Farrell), ein einflussreicher Auror (einer Art Spezialeinheit) der MACUSA (das Staatsministeriums der Zaubererwelt) ihnen dicht auf den Fersen ist und ein weit grösseres Schrecken hinter den jüngsten Vorfällen in New York vermutet. Ein Schrecken, das er für eigene Zwecke nutzen könnte...\n\nZauberhaft, magisch, grandios!\nEines vorweg: Kann der Film die hohen Erwartungen erfüllen? Ja, er kann es. Und wie! Zählt man die Harry Potter Filme dazu, reden wir hier vom 9. (!) Film dieser Saga. Und im 9. Anlauf darf sich Fantastische Tierwesen immer noch auf den vorderen Rängen befinden, wenn es darum ginge, die Filme in einer Bewertungsskala darzustellen. Dies hat vielerlei Gründe. J.K. Rowling, welche sich als Autorin für die Harry Potter Buchreihe verantworltich zeichnet, hat dieses Mal das Schreiben des Drehbuches selber in die Hand genommen. Ihre schier grenzenlose Kreativität, gepaart mit ihrem Fähigkeit, uns bekannte Muster und Versatzstücke aus allen möglichen mythologien und Märchen in ihrer eigenen Mischung neu aufzutischen, kommt hier mehr denn je zur Geltung. Das sieht man gerade an den vielen magischen Tierwesen, die allesamt aus dem Computer stammen aber sich dennoch wie lebende und echte Wesen anfühlen. Rowling versteht es wie kein Zweiter, in ihrer Welt allem und jedem einen Sinn, einen Zweck und nicht zuletzt einen Charakter zu geben. So fantastisch und abgehoben die Tierwesen auch sind, ihr ganzes Dasein ist durchdacht und fusst in einer uns plausiblen Realität. Es fällt uns als Zuschauer nicht schwer, die Wesen als Lebewesen zu betrachten und nicht als schick computeranimierte Polygone, Einsen und Nullen.\n\nUnd auch abseits der titelgebenden fantastischen Tierwesen werden uns Schauwerte auf höchstem Niveau geboten: Sei es das verruchte New York der späten 20er Jahre inklusive ihrer (sau-)schicken Mode, die wie immer toll animierten Zauberanimationen oder zusammenkrachende und sich selbst wieder zusammenbauende Häuserfassaden - es gibt wahrlich nichts zu bemändeln.\n\nZu dieser magischen Atmosphäre trägt auch James Newton Howards Filmmusik bei, die sich nur Anfangs das eine oder andere Mal bei John Williams unvergesslicher Harry Potter Musik bedient - fast, um uns den Einstieg einfacher und reibungsloser zu machen - dann aber schnell seinen eigenen Stil findet und uns neue, wunderschöne Themen präsentiert, die ich auch noch auf dem nach Hause Weg vor mich hin gepfiffen habe.\n\nWas bleibt noch zu sagen? Handwerklich ist an Fantastische Tierwesen und wo sie zu finden sind nichts auszusetzen. Die Sets, die Computereffekte, die Kostüme, das Make-Up und die Filmmusik: Alles ist aus einem Guss. Zu keinem Zeitpunkt zweifle ich daran, dass viel Liebe und Mühe in jedem Detail gesteckt wurde. Und wer die Möglichkeit hat, den Film in 3D zu geniessen, sollte das unbedingt tun! Wo das 3D in Harry Potter 7.2 eine grosse Enttäuschung darstellte, ist Fantastische Tierwesen dank toller Tiefe und einigen Pop-Out Effekten ein Musterbeispiel für gelungenes 3D!\n\nFantastische Darsteller und wo sie zu finden sind...\nEbenfalls nicht ungelobt sollen die Darsteller bleiben, denn inmitten vieler Effekte und magischen Spielereien sind sie es, welche die Handlung tragen und die Brücke zum Zuschauer schlagen müssen. Das gelingt spielend leicht. Eddie Redmayne, das ist seit Die Entdeckung der Unendlichkeit oder The Danish Girl kein Geheiniss mehr, ist ein wahrer Sympathieträger. Allerdings, und dieses kleine Manko muss ich dem Film ankreiden, ist seine Figur vermutlich jene, welche die kleinste Entwicklung - wenn überhaupt - durchmacht. Er ist am Ende des Filmes eigentlich immer noch der gleiche von neugier getriebene, naive Sonderling, welcher er schon am Anfang war. Die wahre Überraschung aber dürfte Dan Fogler sein, den einige vielleicht aus Fanboys oder Balls of Fury kennen dürften - Filme, die nicht gerade als Gütesiegel für Schauspielerische Qualität gelten. Hier aber gibt er den nichtsahnenden Nicht-Magier, der in dieses ganze Schlamassel hereingezogen wird obwohl er von nichts anderem mehr träumt als von seiner eigenen Bäckerei (weil er von Dosenfutter genug hat). Wenn ihm Umstände und Zusammenhänge der Magierwelt erklärt werden, werden sie gleichzeitig auch uns, dem Publikum, erklärt. Er verkörpert quasi das Publikum, wirkt aber zu keinem Zeitpunkt wie ein reiner Lückenfüller. Seine Charaktermomente sind jene, die unser Herz am meisten erwärmen und für die eine oder andere vergossene Träne verantwortlich sein dürften: Grandios! Aber auch die anderen Darsteller geben sich keine Blösse, sämtliche Figuren sind, wie es sich für das Harry Potter Franchise mittlerweile gehört, bis in die kleinsten Nebenrollen hochkarätig besetzt - sei es nun mit einem Jon Voight oder Johnny Depp.\n\nFazit\nIch persönlichlich hatte eine wahrlich magische Zeit mit Fantastische Tierwesen und wo sie zu finden sind. Meine Bedenken, dass man es hier mit einer generischen Fortsetzung zwecks \"Melken der Geldkuh\" zu tun bekäme, haben sich rasch als unnötig herausgestellt. Hinzu kommt, dass der Film zu keinem Zeitpunkt versucht, sich als \"Harry Potter Film\" zu verkaufen. Die Verweise auf seine Herkunft halten sich (dankbarerweise) deutlich in Grenzen, die Geschichte ist frisch und steht auf komplett eigenen Beinen. Vorkenntnisse werden hier überhaupt nicht verlangt.\n\nDass das Drehbuch von J.K. Rowling stamt ist in diesem Fall als Glücksgriff zu sehen. Allerdings merkt man, dass Rowling ihre Wurzeln im Schreiben von Romanen hat. Dem Film fehlt der klassische Spannungsbogen, der auf drei Akte (1. Akt (Einführung), 2. Akt (Mittelteil), 3. Akt (Finale)) aufgeteilt wird. Gerade im Mittelteil hangelt man sich von Höhepunkt zu Höhepunkt, also von Kapitel zu Kapitel - wie in einem Buchroman eben. Der Film kommt dadurch etwas ins Straucheln, fängt sich aber zum 3. Akt rechtzeitig wieder auf.\n\nAlles in allem ist Fantastische Tierwesen der geglückte Auftakt in eine neue, 5-teilige Filmreihe, auf die man erwartungsvoll gehofft hat. Ich habe definitiv Lust auf mehr bekommen. In diesem Sinne: \"Missetat: begangen!\"'),(1,'Amazon Kunde',10,'Ich komme gerade aus dem Kino und bin MEHR als begeistert.\nIch bin Potterhead schon seit Kindheitstagen an. J.K Rowling hat mich noch nie im Stich gelassen. Diesmal auch nicht.\nDANKE JO!\nDer Film hat mich von der 1 Minute gepackt. Ich hab so viel gelacht, geweint und hab mich einfach nur wohlgefühlt.\nIch war wieder zu Hause. Zwar nicht in Hogwarts, aber in der Welt die Jo erschaffen hat. Ich kann ihr einfach nur dafür danken.\n5/5 Sternen. Ein gelungener Film. Ich werde ihn definitiv noch ein weiteres Mal anschauen.'),(1,'cbm',10,'Nach den Filmen der Harry Potter Reihe mussten die Fans dieser filmischen Magie lange auf neue Ereignisse aus der Zaubererwelt warten. Während mich bei den letzten Potterfilmen die der Geschichte geschuldete zunehmende Finsternis etwas störte, kam nun die Phantasie Joanne K. Rowlings, die auch das Drehbuch zu dem neuen Film schrieb, wieder gut sichtbar zur Geltung. Der junge Brite Newt Scamander, disziplinlos genug von der berühmtesten Zaubererschule Englands zu fliegen, bietet ganz einfach die Gewähr für reichlich Abenteuer. Scamander ist wie Potter ein positiver Held, der sich immer wieder mal nicht an die Regeln hält. Sein Einsatz für die phantastischen Tierwesen ist ein solches beispielhaftes Verhalten. Scamander flüchten einige dieser Geschöpfe bei seiner Ankunft in New York aus dem Koffer. Auf der Suche nach ihnen gerät Scamander in die turbulenten Auseinandersetzungen des Bösewichts Grindelwald, der sich einen mächtigen Obscurus, einen destruktiven Zauber verschaffen will mit Hexenverfolgern und dem Magischen Kongress der Vereinigten Staaten von Amerika. Näheres sei an der Stelle nicht erzählt, das würde zu viel vom Film verraten.\nRowling hat ein turbulentes Geschehen ins Drehbuch geschrieben, das filmisch durch tolle Effekte, phantasievolle Tiergeschöpfe mit obskuren Eigenschaften aufwartet und einen nicht mehr losläßt.\nDer Film macht wirklich Lust auf mehr und daher ist es schön zu wissen, dass dieses neue Projekt nach Harry Potter auf fünf Filme angelegt ist, so dass man sich auf einige Zeit immer wieder über zauberhafte Filme wird freuen können.'),(1,'Cornelius',4,'Weil die Fabelwesen yo, mir Angst eingejagt haben yo, gebe ich nun eine 4, wie deine Mo, yo'),(1,'Felix',8,'DER FILM WAR SCHEISSE ABER ICH GEBE TROTZDEM 8 PUNKTE!!!!!!!!!!!!!!!!!!!!!'),(1,'FelixJava4Ever',3,'Ich rede einfach gerne....'),(1,'Julzeit',10,'Ich liebe die Harry Potter-Filme und die magische Welt um Hogwarts. Daher war ich natürlich gegenüber diesem Film sehr skeptisch, wurde aber doch letztendlich zauberhaft unterhalten; ohne ständig an Harry, Ron und Hermine zu denken, die mich seit über zehn Jahren begleiten.\n\nFür mich hat sich der Kinobesuch gelohnt, ob der Film jedoch auch so gut bei meinen Kindern ankommt, ist fraglich. Denn dieser magische Harry Potter-Goodie ist sehr eigenständig ausgefallen, und lässt sich vielleicht nicht so leicht in die bereits bekannte und überaus geliebte Harry Potter-Welt einfügen?'),(1,'Kodghny',4,'Test'),(1,'Konny',9,'ZU COOL!'),(1,'Konnyy',8,'Das ist aber toll!'),(1,'Konstantin',2,'Der Film ist scheisse'),(1,'Korny',4,'Test'),(1,'Lady in Black',10,'Es folgt eine reine Filmkritik. Wer Informationen zur Ausstattung der DVD haben möchte, soll diese Rezension bitte überspringen.\n\nNew York, im Jahre 1926. Der junge Newt Scamander kommt aus Großbritannien an, er führt einen magischen Koffer mit sich und will einen Donnervogel, ein magisches Tierwesen, in Arizona in die Freiheit entlassen.. Durch Unachtsamkeit vertauscht er seinen Koffer mit dem eines No-Maj, also eines Muggels, und damit fangen die Probleme an. Die Tierwesen entwischen, und Newt macht sich mit zwei jungen Frauen und dem No-Maj auf die Jagd, die Tierwesen wieder einzufangen. Nebenbei muss er mit der strengen Überwachung des Ministeriums kämpfen. Und dann gibt es noch eine dunkle, böse, bedrohliche Macht, einen Obscurus, der droht, ganz New York in Schutt und Asche zu legen...\n\nDer Film ist absolut großartig. Es fängt schon mit dem Intro an: Bekannter, grau-düsterer Nebel, und dazu die bekannte Harry-Potter-Filmmusik. Da hats mir den ersten wohligen Gänsehautschauer über den Köper gejagt. Die Trickaufnahmen der Tiere sind genial - bei weitem nicht so ungeholfen wie z.B. in Eclipse aus der Twilight-Reihe. Die Tiere selbst sind schnuffelig - ich will auch einen Niffler haben. Und auch sonst, das New York der 20er Jahre, die Stimmung dort, die ist großartig wiedergegeben. Dazu passt dann auch die Instrumentalmusik, die bisher in den Potter-Filmen so nicht vorkam. Besonders schön: Die Szene im Nachtclub, in der eine Hauselfin das Lied \"Das Einhorn verlor sein Horn\" singt. Die Kleider, die Frisuren, alles ist stilgerecht den 20er Jahren angepasst.\n\nZu den Charakteren: Gut gewählt. Eddie Redmayne spielt hervorragend, Colin Farrell kommt als smarter Bösewicht hervorragend rüber. Dan Fogler als Kowalski ist ideal besetzt, und besonders gefreut habe ich mich über den Mini-Gastauftritt von Johnny Depp, den man wirklich nur anhand seines einseitigen Lächelns erkennt.\n\nKritik: Die Haupthandlung ist sehr dünn - Gut gegen Böse, Tierwesen müssen erhalten werden. Dafür gibt es sehr viele, ausufernde Nebenstränge, die meiner Meinung nach etwas hätten gekürzt werden können. Die Szenen mit den Hexenverfolgern ziehen sich in die Länge, für mich passt auch der Handlungsstrang mit dem Zeitungs-Verleger und seinem Sohn, dem Senator, nicht ganz ins Bild. Und auch die Nebenstory mitt Scamanders Ex-Freundin hätte man sich eigentlich sparen können.\n\nMan muss die Harry-Potter-Filme nicht kennen, um bei diesem Film durchzublicken. Er ist aber wesentlich schöner und hat einen hohen Wiedererkennungswert, wenn man Harry Potter kennt. Es kommen die Namen Dumbledore, Grindelwald und Lestrange vor. Da denkt sich jeder Potter-Kenner: \"uuuiiii, so hängt das also zusammen\". Auch Grindelwalds Amulett, das die Heiligtümer des Todes zeigt, ist zu sehen. Und, was für Nicht-Potter-Kenner vielleicht ein Problem ist, sind die Flüche. Wer Potter kennt, weiß, was Obliviieren ist und was ein Legilimantor kann. Jemand, der diese Begriffe noch nie gehört hat muss auf die Erklärung im Film warten.\n\nAuch etliche Special Effects kennen wir aus den Potter-Filmen: So z.B. der Schutzzauber, der in Teil 7 um Hogwarts gelegt wurde, der diese große, glänzende Kuppel ergab - der kommt wieder vor. Und auch das Apparieren wird genauso dargestellt, wie es schon bekannt ist.\n\nMir hat besonders gefallen, dass dieser Film keine Fortsetzung und kein aufgewärmter Guss von Harry Potter ist. Ja, es gibt ein paar Dinge - siehe oben - die in den Potter-Filmen und in den Tierwesen vorkommen. Aber die Phanastischen Tierwesen haben ein eigenständige, völlig andere Handlung als Harry Potter. Man hat nicht das Gefühl, alles sei ja schonmal dagewesen.\n\nFazit: Ansehen. Unbedingt ansehen. Sich verzaubern lassen von der Fantasie von J.K. Rowling. Mitbibbern beim magischen Duell. Mitlachen, wenn der Niffler in Action ist. Mitleiden, wenn ein Happy End nicht so stattfindet, wie man es sich erhofft. Und dazwischen einfach nur genießen.\n\n5 Sterne für die Fantasie von J.K.Rowling und für die erstklassige Umsetzung in dieses cineastische Werk!'),(1,'Lumumba',7,'Was schöneres habe ich nie gesehen <3'),(1,'Pablo',1,'doof'),(1,'Patrick',10,'Ich mag Tiere'),(1,'Peter',6,'This film is a great story of somebody doing something in a world I don\'t know.'),(1,'Tillmann, Eugen',10,'Ich war gestern mit ner Freundin im Kino. Der Film ist echt klasse. Alles sehr schön in Szene gesetzt. Besonders beeindruckend fand ich die Szene, als aus Colin Farrell Johnny Depp wurde. Ich freu mich schon auf den 2 Teil!'),(1,'Tobias',1,'Wann ist das auf kinox.to verfügbar?'),(1,'Tom69',8,'Der Film ist bestimmt gut hab ihn aber noch nicht gesehen'),(1,'Tom88',6,'Super film, jedoch zu lang!!'),(2,'DeadlySnake99',5,'Glaub ich nicht'),(2,'Johannes',4,'Fand ich nicht so gut'),(2,'Laurent',1,'Toblerone'),(2,'Pitbull',4,'Zweiter teil?'),(2,'Test10',4,'Test'),(2,'Thorsten',10,'ALIENS!!!!!'),(3,'\'/*',8,'*/ SELECT * FROM movies;-- HAHAHHA SQL INJECTION!!!'),(3,'Cyondeme',9,'!!?!?!?!!!!'),(3,'HartContent',9,'Wann, wenn nicht heute'),(4,'Delphinmann',9,'Der Film ist super!'),(4,'Myallower',0,'Meinetwegen'),(4,'Pferdefan',5,'War O.K.'),(4,'Tester',10,'War nur ein Test'),(5,'GriffonGlossy',6,'Film nicht so, Coole Seite!!'),(5,'Imedium',4,'Guck ich mir direkt nochmal an'),(6,'Broodesau',8,'Super Ende'),(6,'DigyMama',4,'Wann gibts die App?'),(6,'InsideSpider',6,'Schön'),(6,'Tom77',10,'Hat Spaß gemacht. Wo kann man hier eigentlich parken?'),(10,'BeastStand',7,'Welch ein Twist'),(10,'ChattySunset',4,'Will mich nicht zu äußern'),(10,'HondaSpoiled',4,'Trauriges Ende'),(10,'Konstantin',7,'Muss gleich nach hause. Internet kommt heute.'),(11,'Felix',4,'Ich kann sql'),(11,'Pforsten',4,'Tooooooor!!'),(11,'PhreekFeisty',4,'Joa'),(12,'Advanette',4,'Ging zum Glück nicht so lang'),(12,'Konny',10,'Das war so schön. Da dachte ich gleich an Tommy! <3'),(12,'Oliver',10,'Fein'),(13,'Konny',1,'@Tobias - Das ist aber ILLEGAL!'),(13,'Tobias',8,'Kann ich auch zuhause streamen'),(14,'Horst',5,'Popcorn zu teuer'),(14,'KonstantinSchmidt',9,'Schön romantisch'),(14,'ScorpionAnnouncer',6,'Hab zu tun, lasst mich in ruhe'),(14,'Startecuest',4,'Sorry, hab noch eine Präsentation vorzubereiten'),(15,'Keenpln',2,'Doof, macht doch kein sinn, aliens und so'),(15,'Olaf',6,'Tolle Seite, jungs. Definitiv eine 1 wert!!'),(16,'Breathcott',10,'Hallo,\n\nwir finden den Film klasse!\n\nEin sehr guter Actionstreifen, der top unterhält. Und mehr muss schließlich ein solcher Streifen nicht, Spannung war auch genug vorhanden. Das Ende ist natürlich relativ vorhersehbar aber das ist nun mal bei solchen Filmen meist der Fall.\n\nTop Leistung der Schauspieler, allen Voran Tom Cruise!'),(16,'Dittmer',1,'Subnetting?? '),(16,'GamePrince',8,'Nach dem sehr guten ersten Teil habe ich mich sehr auf \"Kein Weg zurück\" gefreut und wurde nicht enttäuscht.\n\nDer Film bietet genau das, was man erwartet hat:\nGute Action, spannende Ermittlung und eine Prise Humor.\nUnd genau das bekommt man hier auf einem durchgehend gutem Niveau geboten.\nFans sollten sich den Film also auf jeden Fall ansehen und allen anderen empfehle ich zumindest einen Blick zu riskieren.'),(16,'grasbüffel 134',10,'Tom wie immer gut. Action, Spannung gute Unterhaltung. Er liefert immer solide. So auch bei Reacher 2!!! Wenn auch der erste Teil einwenig besser war. Macht man hier nichts falsch und wird nicht enttäuscht sein..'),(16,'Logan',8,'Nein, nicht Jack Bauer, sondern Jack Reacher räumt wieder auf!\nWar ich ob der eher verhaltenen Kritiken - \"solider, aber nicht aufsehenerregender Krimi\" - kritisch ins Kino gegangen, so habe ich dieses zufrieden wieder verlassen. Tom Cruise lässt seine Fans nicht im Stich und liefert, ja, eine solide, aber durchwegs überzeugende Leistung als Ex-MP, der innerhalb der Army mit eisernem Besen fegt. Die Rahmenhandlung, schmutzige Geschäfte einer privaten Sicherheitsfirma, die wohl eine Anspielung auf die real existierende \"Blackwater\" sein soll und deretwegen Jack Reacher sich selbst reaktiviert, finde ich absolut gelungen. Ebenso die Nebenhandlung mit der angeblichen Tochter von Jack Reacher passt hervorragend in die Hauptstory. Der Bösewicht, ein Top-Profi der privaten Sicherheitsfirma, ist ein richtig fieser Mistkerl, der allen das Leben schwer macht und etliche ins Jenseits befördert. Und last but not least, Tom Cruises\' Partnerin Cobie Smulders, MP-Major, teilt auf gleicher Augenhöhe wie Jack Reacher aus und macht dabei eine verdammt gute Figur!\nWer den ersten Jack Reacher gemocht hat, wird auch diesen mögen - bei mir wenigstens war\'s so.\nEin Stern Abzug gebe ich für die hektischen Prügelszenen, die mir im ersten Jack Reacher besser gefallen haben. Vielleicht sind die schnellen Schnitte dem Alter von Tom Cruise geschuldet??\nTrotzdem: der Film ist empfehlenswert.'),(16,'moviwatch',4,'Anfang 2013 überraschte Tom Cruise mit \"Jack Reacher\": Basierend auf den Romanen von Lee Child, klärte der ehemalige Militär-Polizist mit brillantem Verstand und ebensolcher Beobachtungsgabe einen eigentlich längst abgehakten Mordfall auf. Überraschende Handlung, jede Menge Spannung und ein Spritzer Action – ein interessantes Paket. Dennoch dauerte es beinahe vier Jahre bis zur Fortsetzung \"Jack Reacher: Kein Weg zurück\". Regie führte diesmal Edward Zwick (\"Last Samurai\", \"Blood Diamond\"). Ob Teil 2 an den Erstling heranreichen oder ihn gar toppen kann, verrät die Video-Filmkritik von moviwatch, spontan aufgenommen unmittelbar nach der Vorführung: einfach auf das nebenstehende Video klicken!'),(16,'OneBrunou',6,'Nach vier Jahren der Abstinenz kehrt Jack Reacher endlich wieder zurück ins Kino ... Und wie! Es gibt mehr Prügeleien, mehr Schießereien, mehr Explosionen. Im zweiten Teil wirkt alles größer und - schlicht und ergreifend - spezifischer auf die breite Masse zugeschnitten. Was diesen Film für mich zum Sinnbild dafür macht, wieso das Action-Genre schon seit vielen Jahren stagniert und nur noch selten richtige Perlen - wie etwa \"John Wick\" - hervorbringt.\n\nUnbeirrt und unbekümmert zieht Jack Reacher durch die Staaten, ohne auch nur irgendjemandem gegenüber Rechenschaft abzulegen. Stillschweigend reist er von einem Ort zum nächsten, während er nebenbei das System von außen bereinigt, obwohl er längst nicht mehr fürs Militär arbeitet. Besonders hilfreich ist ihm dabei der Kontakt zu Susan Turner, die nunmehr seinen Posten beim Militär inne hat. Als er seine Quelle jedoch in Virginia besuchen möchte, wird ihm mitgeteilt, dass sich diese in Militärgewahrsam befindet. Reacher wittert sofort, dass irgendwas an dieser Sache nicht mit rechten Dingen zugeht, weshalb er sich dazu entschließt auf eigene Faust zu ermitteln und diejenigen, die wirklich verantwortlich sind, zur Strecke zu bringen.\n\nAuch dieses Mal sieht sich Tom Cruise in seiner nunmehr zweiten Paraderolle - neben der des Ethan Hunt - mit allerlei Komplotten, Intrigen und Verschwörungen konfrontiert. Der Stil jedoch ist nicht mehr der, den er noch vor vier Jahren verfolgt hatte. Denn dieses Mal gibt es - wie oben bereits erwähnt - wesentlich mehr Action, als noch im Vorgänger. Damit entfernt sich der Film zunehmend von den ermittlerischen Elementen des ersten Teils, die nur noch an wenigen Stellen durchschimmern dürfen, was den Film wesentlich schneller und rasanter macht. Das Problem dabei ist allerdings, dass die Action nichts wirklich Bahnbrechendes geboten hat. Nicht wie in der Mission Impossible Reihe, wo sich Cruise mit jedem Teil an mindestens einen neuen, völlig wahnwitzigen Stunt begibt. Der Film hebt sich in keinster Weise von der Konkurrenz ab, was ihn zwar nicht schlecht macht, aber auch nicht wirklich gut. Die Action ist grundsolide, bietet allerdings keine wirklichen Höhepunkten.\nDer narrative Weg der polizeilichen Ermittlung wurde dieses Mal auf ein starkes Minimum reduziert, was ich persönlich sehr schade finde, da mir gerade das an dem Vorgänger so sehr gefallen hat. Überhaupt merkt man an der ganzen Stilistik, dass es einen Wechsel auf dem Regiestuhl gegeben hat. Die Stilistik des Vorgängers wirkte zuweilen unverbrauchter und unkonventioneller, so etwa bei der Kameraführung oder auch dem Einbinden der epochalen Soundtracks, die im ersten Teil noch weit subtiler und weniger penetrant gestreut wurden, wie in den meisten anderen Filmen.\nDies alles gefiel mir an dem ersten Teil so sehr, weil es von der Stilistik einfach anders war, als das übliche Action-Feuerwerk, das wir nun aber mit der Fortsetzung wiederum erhalten haben. Dass die zu erzählende Geschichte selbst im Grunde komplett berechenbar ist, weil sie völlig linear verläuft und absolut keine Überraschungen bereithält, ist da letztlich nur die Spitze des Eisbergs.\n\nDer Grund für diesen Wandel dürfte wohl auf den finanziellen Erfolg zurückgehen. Der erste Teil spielte gerade mal etwas über 200 Millionen Dollar ein. In der heutigen Zeit, in der gefühlt jeder zweite Film die Milliarden Marke sprengt, schlicht und ergreifend zu wenig. Man merkt deutlich, wie Tom Cruise bemüht ist sich - neben der \"Mission Impossible\" Reihe - ein zweites, filmisches Standbein aufzubauen. Persönlich finde ich es jedoch schade, dass man sich dafür von so ziemlich allen Elementen verabschiedet hat, die den Vorgänger für mich noch so besonders gemacht haben.\n\nNichtsdestotrotz ist dies bei Leibe kein schlechter Film. Tom Cruise ist als knallharter Ex-Militärpolizist einfach eine verdammt coole Socke und Cobie Smulders macht in dem Film als ebenso abgebrühte Major nicht viel falsch, mir persönlich hat die Chemie zwischen Tom Cruise und Rosamund Pike allerdings deutlich besser gefallen.\nDass sich der Film in seiner Stilistik deutlich verändert hat, merkt man vor allem auch daran, dass er eine noch persönlichere Note bekommen hat, als der Vorgänger. Er ist stellenweise mehr auf Emotionen getrimmt, die uns ein wenig Einblick in die Psyche des knallharten Rächers gewähren. Auch der Soundtrack - so sehr mir der Stilwechsel auch missfällt - geht gut ins Ohr rein, wobei ich von Henry Jackman, der auch schon die Soundtracks zu den letzten beiden \"Captain America\" Filmen, oder auch zu \"Uncharted 4\", geliefert hat, auch nichts Anderes erwartet hatte.\n\nLetzten Endes lässt sich festhalten, dass \"Jack Reacher: Kein Weg zurück\" ein grundsolider Action Film ist, der sich aus der breiten Masse jedoch nicht so recht hervorheben kann, da er sich zu wenig traut und zu viele Kompromisse eingeht.'),(16,'Schreiber',9,'Eins muss man Tom Cruise lassen: Er gibt sich ganz offensichtlich wirklich Mühe seine Zuschauer zu unterhalten.\n\nWährend ich in Teil 1 schon darüber recht erstaunt war, wie es dem Schauspieler gelingen wird den Unterschied\nzwischen Ethan Hunt und Jack Reacher zu versindbildlichen, war ich mehr als erstaunt dass ihm dass tatsächlich\ngelungen ist. In Teil 2 erkennt man erneut Jack Reacher mit seinen besonderen Eigenschaften und einem Tom Cruise\ndem man die Rolle wirklich abnimmt.\n\nDer Film ist Actionsreich, spannend und absolut unterhaltsam und verdient 4,5 Sterne. Eine verstrickte Story mit vielen\nguten Szenen, angemessener Gefühlsduselei und Überraschungsmomenten.'),(16,'Thomas H.',10,'54 Jahre alt aber immer noch verdammt gutaussehend und vor allem unfassbar fit – Tom Cruise ist zurück. 3 Jahre nach seinem ersten Einsatz als Romanheld „Jack Reacher“, kommt Cruise nun in absoluter Bestform mit der ebenso gut gewordenen Fortsetzung in die Kinos.\n\nUnd der Kinoeintritt hat sich auf jeden Fall gelohnt, dass kann ich ganz sicher sagen.\n\nAb der ersten Minute gibt Tom Cruise wieder Vollgas und kämpft auch diesmal knallhart und gnadenlos gegen jede Art von Gangster. Auch wenn er nicht mehr jeden Stunt selber macht, ist es dennoch erstaunlich, was sich Cruise noch alles für irre Sachen zutraut. Respekt vor diesem Mann!\n\nVerfolgungsjagden, harte Mann-gegen-Mann-Fights, diverse Schießereien und ein absolut kaltblütiger Gegenspieler: Action und Spannung gibt es hier mehr als genug. In der Rolle des brutalen Jägers und Killers überzeugt Patrick Heusinger, ein mir bisher völlig unbekannter Schauspieler, der hier für ordentlich Opfer sorgen darf.\n\nDie Story ist durchgehend interessant und ohne Probleme verständlich, bietet neben der doch reichlich vorhandenen Action auch ruhige Momente. Für diese sorgt unter anderem Danika Yarosh in der Rolle der „Samantha Dayton“, bei der lange gerätselt wird, ob es sich um Reachers Tochter handelt. Obwohl erst 15 Jahre alt, überzeugt auch Yarosh und macht neben Tom Cruise und Co-Hauptdarstellerin Cobie Smulders eine gute Figur.\nApropos Cobie Smulders: ihre angeblich ach so harte und robuste Figur „Susan Turner“ ist zwar interessant, kann aber absolut nicht kämpfen und bekommt eigentlich den kompletten Film über pausenlos auf die Fresse!\n\nInsgesamt fand ich diese Fortsetzung sogar noch ein Stück gelungener als den ersten Teil, hat mir sehr gut gefallen.'),(16,'Tony Tornado',6,'Man muss Tom Cruise ob seiner irrlichternden Sekten-Zugehörigkeit nicht mögen ( gilt dann aber auch für Will Smith, John Travolta....), aber als Schauspieler bietet er eine beeindruckende Hochgeschwindigkeits-Existenz! Heftigen Beurteilungsturbulenzen wird sich dieser Mann wohl immer wieder unterwerfen müssen, aber er bringt äußerst solides Handwerk auf die Leinwand, teils sogar meisterhafte Vorstellungen, wenn ich nur an COLLATERAL denke!\n\nTeil 1 von JACK REACHER ist ein nüchterner, reduzierter und aufs Wesentliche geprägter Actioner, welcher knochentrocken der Old School huldigt! \"JACK REACHER- Kein Weg zurück\" mainstreamt da schon etwas mehr unter der Regie von E. Zwick. Reacher präsentiert seine süffisante Coolness, zudem agiert er gewohnt subtil und knochenbrechend, wenn es darum geht, Spionage aufzuklären, einem Major (Cobie Smulders) beim Militär zu helfen und herauszufinden, ob ein Teenager wirklich seine Tochter ist. Im Grunde ist JR eine Art Action orientierter Familienfilm: JR schwankt zwischen dem Militär (frühere Familie) und seiner potentiellen Tochter!\n\nPrägnante Momente stellen sich nicht im Übermaß ein, aber dieser Film liefert sehr solide Unterhaltung ab. T. Cruise ist der Anker des Films, zudem spielt er schnörkellos und verleiht seiner Figur präzises Charisma! Da diese Art von Action-Krimi wohl vermintes Gelände sein dürfte, sollte man bei der Originalität (die war im ersten Teil mehr präsent) leichte Abstriche machen dürfen, denn hier geht es irgendwann eh nur um Variationen von Altbekanntem!\n\nGute 3,4 Sterne für JACK REACHER, welcher ein wenig an J. Gibbs (Mark Harmon) aus NAVY CIS erinnert!');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Felix1337'),(2,'Konny007'),(3,'Tom04'),(4,'OliverG'),(5,'T0b1n4t0r');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-02 10:16:58

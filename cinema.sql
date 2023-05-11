-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.1

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

--
-- Table structure for table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrateur` (
  `IDadministrateur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `identifiant` varchar(50) NOT NULL,
  `mot_de_passe` varchar(250) NOT NULL,
  `super_utilisateur` tinyint(1) NOT NULL,
  PRIMARY KEY (`IDadministrateur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrateur`
--

LOCK TABLES `administrateur` WRITE;
/*!40000 ALTER TABLE `administrateur` DISABLE KEYS */;
INSERT INTO `administrateur` VALUES (1,'Dupond','jean','admin1','344ea4b932e6dea10efafcb3781ed078c88548fe2ec507fc2cc582805f03e419',1),(2,'Durand','Christophe','admin2','1e306a24cdd8b16d8faf8ec9b1d4b8668305168476a72b06a602cf1bd10f192c',1),(3,'Lombard','Madeleine','admin3','a4624e340ab198ae4073770a6e0aa8044eee72d18ece092bb3e3db59e6c57166',0),(4,'Thomas','Henry','admin4','8e43357d6ab0d37601c47679bb71b76313993a48abc1556570322f7f6ff7d69c',0),(5,'Pivert','Eric','admin5','63731cb2a2dcb55ff0370737423c774ff988d74df4544087f1c14efa6e51eab8',0);
/*!40000 ALTER TABLE `administrateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `IDcinema` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(250) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `IDmultiplexe` int NOT NULL,
  `IDadministrateur` int NOT NULL,
  PRIMARY KEY (`IDcinema`),
  KEY `IDmultiplexe` (`IDmultiplexe`),
  KEY `IDadministrateur` (`IDadministrateur`),
  CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`IDmultiplexe`) REFERENCES `multiplexe` (`IDmultiplexe`),
  CONSTRAINT `cinema_ibfk_2` FOREIGN KEY (`IDadministrateur`) REFERENCES `administrateur` (`IDadministrateur`),
  CONSTRAINT `cinema_ibfk_3` FOREIGN KEY (`IDmultiplexe`) REFERENCES `multiplexe` (`IDmultiplexe`),
  CONSTRAINT `cinema_ibfk_4` FOREIGN KEY (`IDadministrateur`) REFERENCES `administrateur` (`IDadministrateur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'141 rue colombier','01.02.03.04.05','pathe-tours@gmail.com','Tours','37000','Pathe-Tours',1,3),(2,'4 Place Francois Truffault','05.04.03.02.01','cgr-tours-centre@gmail.com','Tours','37000','CGR Tours Centre',1,4),(3,'42 Avenue Marcel Merieux','02.34.37.68.94','cgr-2-lions@gmail.com','Tours','37200','CGR 2 Lions',1,5);
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `IDclient` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  PRIMARY KEY (`IDclient`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Lemaire','Didier','lemaire.didier@free.fr','06.05.04.03.02'),(2,'Tosca','Angeline','tosca.angeline@orange.fr','07.03.24.51.26'),(3,'Hardouin','Thierry','hardouin.thierry@gmail.com','02.34.36.24.58'),(4,'Bailly','Cecile','cecile.bailly@outlook.fr','04.87.89.51.74'),(5,'Asselin','Alain','alain.asselin@laposte.net','01.02.03.04.05'),(6,'Duflot','Marguerite','duflot.marguerite@free.fr','05.65.12.36.14');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `IDfilm` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `duree` time NOT NULL,
  `IDrealisateur` int NOT NULL,
  `IDtype` int NOT NULL,
  PRIMARY KEY (`IDfilm`),
  KEY `IDrealisateur` (`IDrealisateur`),
  KEY `IDtype` (`IDtype`),
  CONSTRAINT `film_ibfk_1` FOREIGN KEY (`IDrealisateur`) REFERENCES `realisateur` (`IDrealisateur`),
  CONSTRAINT `film_ibfk_2` FOREIGN KEY (`IDtype`) REFERENCES `type` (`IDtype`),
  CONSTRAINT `film_ibfk_3` FOREIGN KEY (`IDrealisateur`) REFERENCES `realisateur` (`IDrealisateur`),
  CONSTRAINT `film_ibfk_4` FOREIGN KEY (`IDtype`) REFERENCES `type` (`IDtype`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Titane','02:50:00',1,1),(2,'Dune','02:45:00',2,4),(3,'Sans Issue','02:20:00',5,2),(4,'Spencer','01:50:00',4,2),(5,'Avatar','02:10:00',5,1);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligneDeReservation`
--

DROP TABLE IF EXISTS `ligneDeReservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ligneDeReservation` (
  `IDligneDeReservation` int NOT NULL AUTO_INCREMENT,
  `calcul_TVA` decimal(10,2) NOT NULL,
  `calcul_HT` decimal(10,2) NOT NULL,
  `calcul_TTC` decimal(10,2) NOT NULL,
  `IDreservation` int NOT NULL,
  PRIMARY KEY (`IDligneDeReservation`),
  KEY `IDreservation` (`IDreservation`),
  CONSTRAINT `ligneDeReservation_ibfk_1` FOREIGN KEY (`IDreservation`) REFERENCES `reservation` (`IDreservation`),
  CONSTRAINT `ligneDeReservation_ibfk_2` FOREIGN KEY (`IDreservation`) REFERENCES `reservation` (`IDreservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligneDeReservation`
--

LOCK TABLES `ligneDeReservation` WRITE;
/*!40000 ALTER TABLE `ligneDeReservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ligneDeReservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiplexe`
--

DROP TABLE IF EXISTS `multiplexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiplexe` (
  `IDmultiplexe` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDmultiplexe`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiplexe`
--

LOCK TABLES `multiplexe` WRITE;
/*!40000 ALTER TABLE `multiplexe` DISABLE KEYS */;
INSERT INTO `multiplexe` VALUES (1,'Pathe_Cinema');
/*!40000 ALTER TABLE `multiplexe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paiement` (
  `IDpaiement` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IDpaiement`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiement`
--

LOCK TABLES `paiement` WRITE;
/*!40000 ALTER TABLE `paiement` DISABLE KEYS */;
INSERT INTO `paiement` VALUES (1,'CB'),(2,'Cheque'),(3,'Espece'),(4,'Paylib'),(5,'Smartphone');
/*!40000 ALTER TABLE `paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realisateur`
--

DROP TABLE IF EXISTS `realisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realisateur` (
  `IDrealisateur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `en_vie` tinyint(1) NOT NULL,
  PRIMARY KEY (`IDrealisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realisateur`
--

LOCK TABLES `realisateur` WRITE;
/*!40000 ALTER TABLE `realisateur` DISABLE KEYS */;
INSERT INTO `realisateur` VALUES (1,'Ducourneau','Julia','1965-01-12',0),(2,'Villeneuve','Denis','1965-01-12',0),(3,'Power','Damien','1965-01-12',0),(4,'Larrain','Pablo','1965-01-12',0),(5,'Cameron','James','1965-01-12',0);
/*!40000 ALTER TABLE `realisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `IDreservation` int NOT NULL AUTO_INCREMENT,
  `nb_place` smallint NOT NULL,
  `reservationEnLigne` tinyint(1) DEFAULT NULL,
  `IDclient` int NOT NULL,
  `IDpaiement` int NOT NULL,
  `IDtarif` int NOT NULL,
  `IDseance` int NOT NULL,
  PRIMARY KEY (`IDreservation`),
  KEY `IDclient` (`IDclient`),
  KEY `IDpaiement` (`IDpaiement`),
  KEY `IDtarif` (`IDtarif`),
  KEY `IDseance` (`IDseance`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`IDclient`) REFERENCES `client` (`IDclient`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`IDpaiement`) REFERENCES `paiement` (`IDpaiement`),
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`IDtarif`) REFERENCES `tarif` (`IDtarif`),
  CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`IDseance`) REFERENCES `seance` (`IDseance`),
  CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`IDclient`) REFERENCES `client` (`IDclient`),
  CONSTRAINT `reservation_ibfk_6` FOREIGN KEY (`IDpaiement`) REFERENCES `paiement` (`IDpaiement`),
  CONSTRAINT `reservation_ibfk_7` FOREIGN KEY (`IDtarif`) REFERENCES `tarif` (`IDtarif`),
  CONSTRAINT `reservation_ibfk_8` FOREIGN KEY (`IDseance`) REFERENCES `seance` (`IDseance`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,0,5,1,2,1),(2,1,0,3,2,2,4),(3,1,1,4,3,2,5),(4,1,1,2,2,3,6),(5,1,0,1,3,3,1),(6,1,0,6,1,1,3);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salleDeProjection`
--

DROP TABLE IF EXISTS `salleDeProjection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salleDeProjection` (
  `IDsalleDeProjection` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(3) NOT NULL,
  `nb_place` int DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `IDcinema` int NOT NULL,
  PRIMARY KEY (`IDsalleDeProjection`),
  KEY `IDcinema` (`IDcinema`),
  CONSTRAINT `salleDeProjection_ibfk_1` FOREIGN KEY (`IDcinema`) REFERENCES `cinema` (`IDcinema`),
  CONSTRAINT `salleDeProjection_ibfk_2` FOREIGN KEY (`IDcinema`) REFERENCES `cinema` (`IDcinema`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salleDeProjection`
--

LOCK TABLES `salleDeProjection` WRITE;
/*!40000 ALTER TABLE `salleDeProjection` DISABLE KEYS */;
INSERT INTO `salleDeProjection` VALUES (1,'1',280,'PT1',1),(2,'2',350,'PT2',1),(3,'3',200,'PT3',1),(4,'1',300,'TC1',2),(5,'2',250,'TC2',2),(6,'3',180,'TC3',2),(7,'4',200,'TC4',2),(8,'5',310,'TC5',2),(9,'6',280,'TC6',2),(10,'1',320,'TL1',3),(11,'2',250,'TL2',3),(12,'3',180,'TL3',3);
/*!40000 ALTER TABLE `salleDeProjection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seance`
--

DROP TABLE IF EXISTS `seance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seance` (
  `IDseance` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  `IDsalleDeProjection` int NOT NULL,
  `IDadministrateur` int NOT NULL,
  `IDfilm` int NOT NULL,
  PRIMARY KEY (`IDseance`),
  KEY `IDsalleDeProjection` (`IDsalleDeProjection`),
  KEY `IDadministrateur` (`IDadministrateur`),
  KEY `IDfilm` (`IDfilm`),
  CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`IDsalleDeProjection`) REFERENCES `salleDeProjection` (`IDsalleDeProjection`),
  CONSTRAINT `seance_ibfk_2` FOREIGN KEY (`IDadministrateur`) REFERENCES `administrateur` (`IDadministrateur`),
  CONSTRAINT `seance_ibfk_3` FOREIGN KEY (`IDfilm`) REFERENCES `film` (`IDfilm`),
  CONSTRAINT `seance_ibfk_4` FOREIGN KEY (`IDsalleDeProjection`) REFERENCES `salleDeProjection` (`IDsalleDeProjection`),
  CONSTRAINT `seance_ibfk_5` FOREIGN KEY (`IDadministrateur`) REFERENCES `administrateur` (`IDadministrateur`),
  CONSTRAINT `seance_ibfk_6` FOREIGN KEY (`IDfilm`) REFERENCES `film` (`IDfilm`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seance`
--

LOCK TABLES `seance` WRITE;
/*!40000 ALTER TABLE `seance` DISABLE KEYS */;
INSERT INTO `seance` VALUES (1,'2023-06-24 00:00:00','10:15:00','12:15:00',2,2,5),(2,'2023-06-24 00:00:00','14:45:00','17:30:00',3,1,2),(3,'2023-06-23 00:00:00','18:00:00','20:30:00',12,2,2),(4,'2023-06-24 00:00:00','18:15:00','20:30:00',11,1,3),(5,'2023-06-24 00:00:00','16:30:00','19:00:00',7,2,4),(6,'2023-06-24 00:00:00','15:25:00','18:00:00',5,2,1),(7,'2023-06-25 00:00:00','14:45:00','17:30:00',6,1,5),(8,'2023-06-25 00:00:00','14:45:00','17:30:00',7,3,5),(9,'2023-06-26 00:00:00','10:00:00','12:30:00',9,3,4);
/*!40000 ALTER TABLE `seance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarif` (
  `IDtarif` int NOT NULL AUTO_INCREMENT,
  `tarification` varchar(50) NOT NULL,
  `prix` decimal(5,2) NOT NULL,
  PRIMARY KEY (`IDtarif`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarif`
--

LOCK TABLES `tarif` WRITE;
/*!40000 ALTER TABLE `tarif` DISABLE KEYS */;
INSERT INTO `tarif` VALUES (1,'plein_tarif',9.20),(2,'Etudiant',7.60),(3,'Moins_de_14ans',5.90);
/*!40000 ALTER TABLE `tarif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `IDtype` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`IDtype`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Action'),(2,'Comedie'),(3,'Thriller'),(4,'Aventure'),(5,'Horreur'),(6,'Science-fiction');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-11 12:06:05

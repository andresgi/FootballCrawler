CREATE DATABASE  IF NOT EXISTS `footballcrawler` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `footballcrawler`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: footballcrawler
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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `idCountry` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCountry`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Alemania'),(2,'Argentina'),(3,'Australia'),(4,'Austria'),(5,'Belarus'),(6,'Bolivia'),(7,'Brasil'),(8,'Bulgaria'),(9,'Bélgica'),(10,'Catar'),(11,'Chile'),(12,'Colombia'),(13,'Costa Rica'),(14,'Croacia'),(15,'Dinamarca'),(16,'Ecuador'),(17,'El Salvador'),(18,'Emiratos Árabes Unidos'),(19,'Escocia'),(20,'Eslovaquia'),(21,'Eslovenia'),(22,'España'),(23,'Estados Unidos'),(24,'Finlandia'),(25,'Francia'),(26,'Gales'),(27,'Georgia'),(28,'Grecia'),(29,'Guatemala'),(30,'Honduras'),(31,'Hungría'),(32,'India'),(33,'Inglaterra'),(34,'Irlanda del Norte'),(35,'Irán'),(36,'Italia'),(37,'Jamaica'),(38,'Japón'),(39,'Luxemburgo'),(40,'Malasia'),(41,'Malta'),(42,'Montenegro'),(43,'México'),(44,'Nicaragua'),(45,'Noruega'),(46,'Nueva Zelanda'),(47,'Panamá'),(48,'Paraguay'),(49,'Países Bajos'),(50,'Perú'),(51,'Polonia'),(52,'Portugal'),(53,'China'),(54,'República Checa'),(55,'República de Corea'),(56,'Rumania'),(57,'Rusia'),(58,'Singapur'),(59,'Sudáfrica'),(60,'Suecia'),(61,'Suiza'),(62,'Tailandia'),(63,'Turquía'),(64,'Ucrania'),(65,'Uruguay'),(66,'Venezuela');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goalevent`
--

DROP TABLE IF EXISTS `goalevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goalevent` (
  `idGoalEvent` int(11) NOT NULL AUTO_INCREMENT,
  `minute` int(11) DEFAULT NULL,
  `player` varchar(255) DEFAULT NULL,
  `condition` varchar(10) DEFAULT NULL,
  `team` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ownGoalFlag` int(1) DEFAULT NULL,
  `penaltyGoalFlag` varchar(255) DEFAULT NULL,
  `playerAssist` varchar(255) DEFAULT NULL,
  `idMatch` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGoalEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goalevent`
--

LOCK TABLES `goalevent` WRITE;
/*!40000 ALTER TABLE `goalevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `goalevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `league` (
  `idLeague` int(11) NOT NULL,
  `idCountry` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `linkStats` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idLeague`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES (1,49,'EREDIVISIE','http://el.soccerway.com/national/netherlands/eredivisie/20142015/regular-season/r25289/'),(5,49,'EERSTE DIVISIE','http://el.soccerway.com/national/netherlands/eerste-divisie/20142015/regular-season/r25485/'),(7,22,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/spain/primera-division/20142015/regular-season/r25985/'),(8,33,'PREMIER LEAGUE','http://el.soccerway.com/national/england/premier-league/20142015/regular-season/r25191/'),(9,1,'Bundesliga','http://el.soccerway.com/national/germany/bundesliga/20142015/regular-season/r25093/'),(11,1,'2. Bundesliga','http://el.soccerway.com/national/germany/2-bundesliga/20142015/regular-season/r25285/'),(12,22,'SEGUNDA DIVISIÓN','http://el.soccerway.com/national/spain/segunda-division/20142015/regular-season/r27291/'),(13,36,'SERIE A','http://el.soccerway.com/national/italy/serie-a/20142015/regular-season/r27139/'),(14,36,'SERIE B','http://el.soccerway.com/national/italy/serie-b/20142015/regular-season/r26405/'),(15,33,'LIGA UNO','http://el.soccerway.com/national/england/league-one/20142015/regular-season/r25263/'),(16,25,'LIGA 1','http://el.soccerway.com/national/france/ligue-1/20142015/regular-season/r25141/'),(17,25,'LIGA 2','http://el.soccerway.com/national/france/ligue-2/20142015/regular-season/r25309/'),(19,63,'SÜPER LIG','http://el.soccerway.com/national/turkey/super-lig/20142015/regular-season/r25151/'),(22,24,'VEIKKAUSLIIGA','http://el.soccerway.com/national/finland/veikkausliiga/2014/regular-season/r23927/'),(24,9,'PRO LEAGUE','http://el.soccerway.com/national/belgium/pro-league/20142015/regular-season/r25415/'),(26,7,'SERIE A','http://el.soccerway.com/national/brazil/serie-a/2014/regular-season/r24110/'),(27,61,'SUPER LIGA','http://el.soccerway.com/national/switzerland/super-league/20142015/regular-season/r25183/'),(28,60,'ALLSVENSKAN','http://el.soccerway.com/national/sweden/allsvenskan/2014/regular-season/r23311/'),(29,45,'ELITESERIEN','http://el.soccerway.com/national/norway/eliteserien/2014/regular-season/r23260/'),(30,15,'SUPERLIGA','http://el.soccerway.com/national/denmark/superliga/20142015/regular-season/r25425/'),(32,33,'LIGA DOS','http://el.soccerway.com/national/england/league-two/20142015/regular-season/r25245/'),(33,23,'MLS','http://el.soccerway.com/national/united-states/mls/2014/regular-season/r23603/'),(37,60,'SUPERETTAN','http://el.soccerway.com/national/sweden/superettan/2014/regular-season/r23312/'),(39,15,'1RA DIVISIÓN','http://el.soccerway.com/national/denmark/1st-division/20142015/regular-season/r25783/'),(43,19,'PREMIER LEAGUE','http://el.soccerway.com/national/scotland/premier-league/20142015/1st-phase/r25295/'),(45,19,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/scotland/first-division/20142015/regular-season/r25299/'),(46,19,'SEGUNDA DIVISIÓN','http://el.soccerway.com/national/scotland/second-division/20142015/regular-season/r25301/'),(47,19,'TERCERA DIVISIÓN','http://el.soccerway.com/national/scotland/third-division/20142015/regular-season/r25303/'),(49,4,'BUNDESLIGA','http://el.soccerway.com/national/austria/bundesliga/20142015/regular-season/r25271/'),(50,4,'1. LIGA','http://el.soccerway.com/national/austria/1-liga/20142015/regular-season/r25763/'),(51,53,'CSL','http://el.soccerway.com/national/china-pr/csl/2014/regular-season/r23926/'),(52,9,'SEGUNDA DIVISIÓN','http://el.soccerway.com/national/belgium/second-division/20142015/regular-season/r26159/'),(55,1,'REGIONALLIGA','http://el.soccerway.com/national/germany/regionalliga/20142015/bayern/r25741/'),(57,25,'NACIONAL','http://el.soccerway.com/national/france/national/20142015/regular-season/r26157/'),(59,8,'A PFG','http://el.soccerway.com/national/bulgaria/a-pfg/20142015/regular-season/r25721/'),(60,8,'B PFG','http://el.soccerway.com/national/bulgaria/b-pfg/20142015/regular-season/r26361/'),(61,14,'1. HNL','http://el.soccerway.com/national/croatia/1-hnl/20142015/regular-season/r25603/'),(62,14,'2. HNL','http://el.soccerway.com/national/croatia/2-hnl/20142015/regular-season/r26327/'),(63,52,'PRIMEIRA LIGA','http://el.soccerway.com/national/portugal/portuguese-liga-/20142015/regular-season/r25727/'),(66,5,'PREMIER LEAGUE','http://el.soccerway.com/national/belarus/premier-league/2014/regular-season/r24142/'),(67,31,'NB I','http://el.soccerway.com/national/hungary/nb-i/20142015/regular-season/r25735/'),(68,31,'NB II','http://el.soccerway.com/national/hungary/nb-ii/20142015/regular-season/r26411/'),(69,6,'LFPB','http://el.soccerway.com/national/bolivia/lfpb/20142015/apertura/r27613/'),(70,33,'CAMPEONATO','http://el.soccerway.com/national/england/championship/20142015/regular-season/r25197/?ICID=TN_02_01_09'),(71,33,'CONFERENCE NATIONAL','http://el.soccerway.com/national/england/conference-national/20142015/regular-season/r25255/'),(73,46,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/new-zealand/premiership/20142015/regular-season/r29223/'),(74,26,'PREMIER LEAGUE','http://el.soccerway.com/national/wales/premier-league/20142015/1st-phase/r26025/'),(76,35,'COPA DEL GOLFO PERSICO','http://el.soccerway.com/national/iran/premier-league/20142015/regular-season/r27163/'),(78,34,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/northern-ireland/ifa-premiership/20142015/regular-season/r25595/'),(82,54,'LIGA CHECA','http://el.soccerway.com/national/czech-republic/czech-liga/20142015/regular-season/r25601/'),(83,54,'2. LIGA','http://el.soccerway.com/national/czech-republic/2-liga/20142015/regular-season/r26053/'),(85,56,'LIGA I','http://el.soccerway.com/national/romania/liga-i/20142015/regular-season/r25729/'),(86,21,'1. SNL','http://el.soccerway.com/national/slovenia/1-snl/20142015/regular-season/r25937/'),(87,2,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/argentina/primera-division/20142015/regular-season/r25715/'),(88,2,'PRIM B NACIONAL','http://el.soccerway.com/national/argentina/prim-b-nacional/20142015/regular-season/r26623/'),(89,7,'SERIE B','http://el.soccerway.com/national/brazil/serie-b/2014/regular-season/r24111/'),(90,11,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/chile/primera-division/20142015/apertura/r25467/'),(91,12,'PRIMERA A','http://el.soccerway.com/national/colombia/primera-a/2014/apertura/r23570/'),(97,63,'1. LIG','http://el.soccerway.com/national/turkey/1-lig/20142015/regular-season/r25153/'),(98,22,'SEGUNDA B','http://el.soccerway.com/national/spain/segunda-b/20142015/group-4/r27391/'),(99,61,'CHALLENGE LEAGUE','http://el.soccerway.com/national/switzerland/challenge-league/20142015/regular-season/r25691/'),(100,52,'LIGA DE HONRA','http://el.soccerway.com/national/portugal/liga-de-honra/20142015/regular-season/r25951/'),(101,52,'II DIVISAO','http://el.soccerway.com/national/portugal/ii-divisao/20142015/group-c/r26561/'),(107,28,'SUPER LIGA','http://el.soccerway.com/national/greece/super-league/20142015/regular-season/r25911/'),(108,28,'LIGA DE FÚTBOL','http://el.soccerway.com/national/greece/football-league/20142015/notios/r28841/'),(109,38,'LIGA J1','http://el.soccerway.com/national/japan/j1-league/2014/regular-season/r23771/'),(110,38,'LIGA J2','http://el.soccerway.com/national/japan/j2-league/2014/regular-season/r23772/'),(119,51,'EKSTRAKLASA','http://el.soccerway.com/national/poland/ekstraklasa/20142015/regular-season/r25643/'),(120,51,'I LIGA','http://el.soccerway.com/national/poland/i-liga/20142015/regular-season/r26145/'),(121,57,'PREMIER LEAGUE','http://el.soccerway.com/national/russia/premier-league/20142015/regular-season/r25305/'),(122,57,'1. DIVISIÓN','http://el.soccerway.com/national/russia/1-division/20142015/regular-season/r25639/'),(123,20,'SUPER LIGA','http://el.soccerway.com/national/slovakia/super-liga/20142015/regular-season/r25955/'),(124,20,'LIGA I','http://el.soccerway.com/national/slovakia/i-liga/20142015/west/r26657/'),(125,64,'PREMIER LEAGUE','http://el.soccerway.com/national/ukraine/premier-league/20142015/regular-season/r26855/'),(133,9,'TERCERA DIVISIÓN','http://el.soccerway.com/national/belgium/third-division/20142015/group-b/r26487/'),(134,39,'DIVISIÓN NACIONAL','http://el.soccerway.com/national/luxembourg/national-division/20142015/regular-season/r26359/'),(136,55,'LIGA K','http://el.soccerway.com/national/korea-republic/k-league-classic/2014/regular-season/r24076/'),(137,58,'LIGA S','http://el.soccerway.com/national/singapore/sleague/2014/regular-season/r23906/'),(145,23,'USSF DIVISIÓN 2','http://el.soccerway.com/national/united-states/ussf-division-2/2010/regular-season/r11160/'),(150,32,'LIGA I','http://el.soccerway.com/national/india/i-league/20132014/regular-season/r22699/'),(152,41,'PREMIER LEAGUE','http://el.soccerway.com/national/malta/premier-league/20142015/regular-season/r26473/'),(153,40,'SUPER LIGA','http://el.soccerway.com/national/malaysia/super-league/2014/regular-season/r23006/'),(155,43,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/mexico/primera-division/20142015/apertura/r25381/'),(156,43,'LIGA DE ASCENSO','http://el.soccerway.com/national/mexico/liga-de-ascenso/20142015/apertura/r25397/'),(157,48,'DIVISIÓN PROFESIONAL','http://el.soccerway.com/national/paraguay/division-profesional/2014/clausura/r23713/'),(158,50,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/peru/primera-division/2014/clausura/r24202/'),(162,65,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/uruguay/primera-division/20142015/apertura/r26829/'),(163,66,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/venezuela/primera-division/20142015/apertura/r26723/'),(165,16,'PRIMERA A','http://el.soccerway.com/national/ecuador/primera-a/2014/1st-phase/r23808/'),(166,27,'UMAGLESI LIGA','http://el.soccerway.com/national/georgia/umaglesi-liga/20142015/regular-season/r27345/'),(214,59,'PSL','http://el.soccerway.com/national/south-africa/psl/20142015/regular-season/r25629/'),(215,10,'LIGA DE ESTRELLAS','http://el.soccerway.com/national/qatar/stars-league/20142015/regular-season/r27715/'),(233,64,'PERSHA LIGA','http://el.soccerway.com/national/ukraine/persha-liga/20142015/regular-season/r26641/'),(283,3,'LIGA A','http://el.soccerway.com/national/australia/a-league/20142015/regular-season/r25553/'),(299,21,'2. SNL','http://el.soccerway.com/national/slovenia/2-snl/20142015/regular-season/r26407/'),(315,13,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/costa-rica/primera-division/20142015/torneo-de-invierno/r27105/'),(320,29,'LIGA NACIONAL','http://el.soccerway.com/national/guatemala/liga-nacional/20142015/apertura/r25921/'),(321,7,'SERIE C','http://el.soccerway.com/national/brazil/serie-c/2014/regular-season/r24208/'),(344,18,'UFL','http://el.soccerway.com/national/united-arab-emirates/premier-league/20142015/regular-season/r26021/'),(351,44,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/nicaragua/primera-division/20142015/apertura/r27193/'),(354,25,'CFA','http://el.soccerway.com/national/france/cfa/20142015/group-a/r26961/'),(378,17,'PRIMERA DIVISIÓN','http://el.soccerway.com/national/el-salvador/primera-division/20142015/apertura/r27099/'),(427,60,'DIVISIÓN 1','http://el.soccerway.com/national/sweden/division-1/2014/sodra/r23839/'),(438,11,'PRIMERA B','http://el.soccerway.com/national/chile/primera-b/20142015/apertura---2nd-phase/r26703/'),(439,50,'SEGUNDA DIVISIÓN','http://el.soccerway.com/national/peru/segunda-division/2014/regular-season/r24581/'),(445,42,'PRIMERA LIGA','http://el.soccerway.com/national/montenegro/first-league/20142015/regular-season/r26325/'),(447,16,'PRIMERA B','http://el.soccerway.com/national/ecuador/primera-b/2014/league/r23836/'),(448,12,'PRIMERA B','http://el.soccerway.com/national/colombia/primera-b/2014/clausura---semi-finals/group-a/g6750/'),(463,30,'LIGA NACIONAL','http://el.soccerway.com/national/honduras/liga-nacional/20142015/apertura/r27427/'),(471,2,'PRIM B METRO','http://el.soccerway.com/national/argentina/prim-b-metro/20142015/regular-season/r26741/'),(477,37,'PREMIER LEAGUE','http://el.soccerway.com/national/jamaica/premier-league/20142015/regular-season/r28653/'),(519,62,'PREMIER LEAGUE DE TAILANDIA','http://el.soccerway.com/national/thailand/thai-premier-league/2014/regular-season/r23787/'),(521,23,'USL 2','http://el.soccerway.com/national/united-states/usl-2/2010/regular-season/r11161/'),(525,47,'LPF','http://el.soccerway.com/national/panama/lpf/20142015/apertura/r26625/'),(532,65,'SEGUNDA DIVISIÓN','http://el.soccerway.com/national/uruguay/segunda-division/20142015/regular-season/r28547/'),(549,49,'VROUWEN EREDIVISIE','http://el.soccerway.com/national/netherlands/vrouwen-eredivisie/2011-2012/regular-season/r15396/'),(557,25,'CFA 2','http://el.soccerway.com/national/france/cfa-2/20142015/group-e/r27239/'),(558,51,'II LIGA','http://el.soccerway.com/national/poland/ii-liga/20142015/regular-season/r26171/'),(559,64,'DRUHA LIGA','http://el.soccerway.com/national/ukraine/druha-liga/20142015/regular-season/r26639/'),(622,1,'3. LIGA','http://el.soccerway.com/national/germany/3-liga/20142015/regular-season/r25551/'),(917,23,'NASL','http://el.soccerway.com/national/united-states/nasl/2014/spring-season/r23642/'),(918,23,'USL PRO','http://el.soccerway.com/national/united-states/usl-pro/2012/regular-season/r17036/'),(945,1,'U-19 BUNDESLIGA','http://el.soccerway.com/national/germany/u-19-bundesliga/20142015/west/r26717/'),(1020,11,'SEGUNDA DIVISIÓN','http://el.soccerway.com/national/chile/segunda-division/20142015/2nd-phase/r28895/'),(1110,55,'K LEAGUE CHALLENGE','http://el.soccerway.com/national/korea-republic/k-league/2014/regular-season/r24172/'),(1133,23,'USL PRO / MLS RESERVE','http://el.soccerway.com/national/united-states/mls-reserve-league/2014/regular-season/r24258/'),(1417,32,'INDIAN SUPER LEAGUE','http://el.soccerway.com/national/india/indian-super-league/2014/regular-season/r28731/');
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match` (
  `idMatch` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `localTeam` text CHARACTER SET utf8,
  `awayTeam` text CHARACTER SET utf8,
  `idLeague` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `localGoals` int(11) DEFAULT NULL,
  `awayGoals` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMatch`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `idResult` int(11) NOT NULL,
  `idMatch` int(11) DEFAULT NULL,
  `team` varchar(255) DEFAULT NULL,
  `condition` varchar(2) DEFAULT NULL,
  `goals` int(11) DEFAULT NULL,
  `localGoals` int(11) DEFAULT NULL,
  `awayGoals` int(11) DEFAULT NULL,
  PRIMARY KEY (`idResult`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templeague`
--

DROP TABLE IF EXISTS `templeague`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templeague` (
  `idtempLeague` int(11) NOT NULL AUTO_INCREMENT,
  `nombreLiga` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `identifierSW` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtempLeague`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templeague`
--

LOCK TABLES `templeague` WRITE;
/*!40000 ALTER TABLE `templeague` DISABLE KEYS */;
INSERT INTO `templeague` VALUES (1,'Bundesliga','Alemania','http://el.soccerway.com/national/germany/bundesliga/20142015/regular-season/r25093/',9),(2,'2. Bundesliga','Alemania','http://el.soccerway.com/national/germany/2-bundesliga/20142015/regular-season/r25285/',11),(3,'3. LIGA','Alemania','http://el.soccerway.com/national/germany/3-liga/20142015/regular-season/r25551/',622),(4,'REGIONALLIGA','Alemania','http://el.soccerway.com/national/germany/regionalliga/20142015/bayern/r25741/',55),(5,'U-19 BUNDESLIGA','Alemania','http://el.soccerway.com/national/germany/u-19-bundesliga/20142015/west/r26717/',945),(6,'PRIMERA DIVISIÓN','Argentina','http://el.soccerway.com/national/argentina/primera-division/20142015/regular-season/r25715/',87),(7,'PRIM B NACIONAL','Argentina','http://el.soccerway.com/national/argentina/prim-b-nacional/20142015/regular-season/r26623/',88),(8,'PRIM B METRO','Argentina','http://el.soccerway.com/national/argentina/prim-b-metro/20142015/regular-season/r26741/',471),(9,'LIGA A','Australia','http://el.soccerway.com/national/australia/a-league/20142015/regular-season/r25553/',283),(10,'BUNDESLIGA','Austria','http://el.soccerway.com/national/austria/bundesliga/20142015/regular-season/r25271/',49),(11,'1. LIGA','Austria','http://el.soccerway.com/national/austria/1-liga/20142015/regular-season/r25763/',50),(12,'PREMIER LEAGUE','Belarus','http://el.soccerway.com/national/belarus/premier-league/2014/regular-season/r24142/',66),(13,'LFPB','Bolivia','http://el.soccerway.com/national/bolivia/lfpb/20142015/apertura/r27613/',69),(14,'SERIE A','Brasil','http://el.soccerway.com/national/brazil/serie-a/2014/regular-season/r24110/',26),(15,'SERIE B','Brasil','http://el.soccerway.com/national/brazil/serie-b/2014/regular-season/r24111/',89),(16,'SERIE C','Brasil','http://el.soccerway.com/national/brazil/serie-c/2014/regular-season/r24208/',321),(17,'A PFG','Bulgaria','http://el.soccerway.com/national/bulgaria/a-pfg/20142015/regular-season/r25721/',59),(18,'B PFG','Bulgaria','http://el.soccerway.com/national/bulgaria/b-pfg/20142015/regular-season/r26361/',60),(19,'PRO LEAGUE','Bélgica','http://el.soccerway.com/national/belgium/pro-league/20142015/regular-season/r25415/',24),(20,'SEGUNDA DIVISIÓN','Bélgica','http://el.soccerway.com/national/belgium/second-division/20142015/regular-season/r26159/',52),(21,'TERCERA DIVISIÓN','Bélgica','http://el.soccerway.com/national/belgium/third-division/20142015/group-b/r26487/',133),(22,'LIGA DE ESTRELLAS','Catar','http://el.soccerway.com/national/qatar/stars-league/20142015/regular-season/r27715/',215),(23,'PRIMERA DIVISIÓN','Chile','http://el.soccerway.com/national/chile/primera-division/20142015/apertura/r25467/',90),(24,'PRIMERA B','Chile','http://el.soccerway.com/national/chile/primera-b/20142015/apertura---2nd-phase/r26703/',438),(25,'SEGUNDA DIVISIÓN','Chile','http://el.soccerway.com/national/chile/segunda-division/20142015/2nd-phase/r28895/',1020),(26,'PRIMERA A','Colombia','http://el.soccerway.com/national/colombia/primera-a/2014/apertura/r23570/',91),(27,'PRIMERA B','Colombia','http://el.soccerway.com/national/colombia/primera-b/2014/clausura---semi-finals/group-a/g6750/',448),(28,'PRIMERA DIVISIÓN','Costa Rica','http://el.soccerway.com/national/costa-rica/primera-division/20142015/torneo-de-invierno/r27105/',315),(29,'1. HNL','Croacia','http://el.soccerway.com/national/croatia/1-hnl/20142015/regular-season/r25603/',61),(30,'2. HNL','Croacia','http://el.soccerway.com/national/croatia/2-hnl/20142015/regular-season/r26327/',62),(31,'SUPERLIGA','Dinamarca','http://el.soccerway.com/national/denmark/superliga/20142015/regular-season/r25425/',30),(32,'1RA DIVISIÓN','Dinamarca','http://el.soccerway.com/national/denmark/1st-division/20142015/regular-season/r25783/',39),(33,'PRIMERA A','Ecuador','http://el.soccerway.com/national/ecuador/primera-a/2014/1st-phase/r23808/',165),(34,'PRIMERA B','Ecuador','http://el.soccerway.com/national/ecuador/primera-b/2014/league/r23836/',447),(35,'PRIMERA DIVISIÓN','El Salvador','http://el.soccerway.com/national/el-salvador/primera-division/20142015/apertura/r27099/',378),(36,'UFL','Emiratos Árabes Unidos','http://el.soccerway.com/national/united-arab-emirates/premier-league/20142015/regular-season/r26021/',344),(37,'PREMIER LEAGUE','Escocia','http://el.soccerway.com/national/scotland/premier-league/20142015/1st-phase/r25295/',43),(38,'PRIMERA DIVISIÓN','Escocia','http://el.soccerway.com/national/scotland/first-division/20142015/regular-season/r25299/',45),(39,'SEGUNDA DIVISIÓN','Escocia','http://el.soccerway.com/national/scotland/second-division/20142015/regular-season/r25301/',46),(40,'TERCERA DIVISIÓN','Escocia','http://el.soccerway.com/national/scotland/third-division/20142015/regular-season/r25303/',47),(41,'SUPER LIGA','Eslovaquia','http://el.soccerway.com/national/slovakia/super-liga/20142015/regular-season/r25955/',123),(42,'LIGA I','Eslovaquia','http://el.soccerway.com/national/slovakia/i-liga/20142015/west/r26657/',124),(43,'1. SNL','Eslovenia','http://el.soccerway.com/national/slovenia/1-snl/20142015/regular-season/r25937/',86),(44,'2. SNL','Eslovenia','http://el.soccerway.com/national/slovenia/2-snl/20142015/regular-season/r26407/',299),(45,'PRIMERA DIVISIÓN','España','http://el.soccerway.com/national/spain/primera-division/20142015/regular-season/r25985/',7),(46,'SEGUNDA DIVISIÓN','España','http://el.soccerway.com/national/spain/segunda-division/20142015/regular-season/r27291/',12),(47,'SEGUNDA B','España','http://el.soccerway.com/national/spain/segunda-b/20142015/group-4/r27391/',98),(48,'MLS','Estados Unidos','http://el.soccerway.com/national/united-states/mls/2014/regular-season/r23603/',33),(49,'NASL','Estados Unidos','http://el.soccerway.com/national/united-states/nasl/2014/spring-season/r23642/',917),(50,'USL PRO','Estados Unidos','http://el.soccerway.com/national/united-states/usl-pro/2012/regular-season/r17036/',918),(51,'USSF DIVISIÓN 2','Estados Unidos','http://el.soccerway.com/national/united-states/ussf-division-2/2010/regular-season/r11160/',145),(52,'USL 2','Estados Unidos','http://el.soccerway.com/national/united-states/usl-2/2010/regular-season/r11161/',521),(53,'USL PRO / MLS RESERVE','Estados Unidos','http://el.soccerway.com/national/united-states/mls-reserve-league/2014/regular-season/r24258/',1133),(54,'VEIKKAUSLIIGA','Finlandia','http://el.soccerway.com/national/finland/veikkausliiga/2014/regular-season/r23927/',22),(55,'LIGA 1','Francia','http://el.soccerway.com/national/france/ligue-1/20142015/regular-season/r25141/',16),(56,'LIGA 2','Francia','http://el.soccerway.com/national/france/ligue-2/20142015/regular-season/r25309/',17),(57,'NACIONAL','Francia','http://el.soccerway.com/national/france/national/20142015/regular-season/r26157/',57),(58,'CFA','Francia','http://el.soccerway.com/national/france/cfa/20142015/group-a/r26961/',354),(59,'CFA 2','Francia','http://el.soccerway.com/national/france/cfa-2/20142015/group-e/r27239/',557),(60,'PREMIER LEAGUE','Gales','http://el.soccerway.com/national/wales/premier-league/20142015/1st-phase/r26025/',74),(61,'UMAGLESI LIGA','Georgia','http://el.soccerway.com/national/georgia/umaglesi-liga/20142015/regular-season/r27345/',166),(62,'SUPER LIGA','Grecia','http://el.soccerway.com/national/greece/super-league/20142015/regular-season/r25911/',107),(63,'LIGA DE FÚTBOL','Grecia','http://el.soccerway.com/national/greece/football-league/20142015/notios/r28841/',108),(64,'LIGA NACIONAL','Guatemala','http://el.soccerway.com/national/guatemala/liga-nacional/20142015/apertura/r25921/',320),(65,'LIGA NACIONAL','Honduras','http://el.soccerway.com/national/honduras/liga-nacional/20142015/apertura/r27427/',463),(66,'NB I','Hungría','http://el.soccerway.com/national/hungary/nb-i/20142015/regular-season/r25735/',67),(67,'NB II','Hungría','http://el.soccerway.com/national/hungary/nb-ii/20142015/regular-season/r26411/',68),(68,'INDIAN SUPER LEAGUE','India','http://el.soccerway.com/national/india/indian-super-league/2014/regular-season/r28731/',1417),(69,'LIGA I','India','http://el.soccerway.com/national/india/i-league/20132014/regular-season/r22699/',150),(70,'PREMIER LEAGUE','Inglaterra','http://el.soccerway.com/national/england/premier-league/20142015/regular-season/r25191/',8),(71,'CAMPEONATO','Inglaterra','http://el.soccerway.com/national/england/championship/20142015/regular-season/r25197/?ICID=TN_02_01_09',70),(72,'LIGA UNO','Inglaterra','http://el.soccerway.com/national/england/league-one/20142015/regular-season/r25263/',15),(73,'LIGA DOS','Inglaterra','http://el.soccerway.com/national/england/league-two/20142015/regular-season/r25245/',32),(74,'CONFERENCE NATIONAL','Inglaterra','http://el.soccerway.com/national/england/conference-national/20142015/regular-season/r25255/',71),(75,'PRIMERA DIVISIÓN','Irlanda del Norte','http://el.soccerway.com/national/northern-ireland/ifa-premiership/20142015/regular-season/r25595/',78),(76,'COPA DEL GOLFO PERSICO','Irán','http://el.soccerway.com/national/iran/premier-league/20142015/regular-season/r27163/',76),(77,'SERIE A','Italia','http://el.soccerway.com/national/italy/serie-a/20142015/regular-season/r27139/',13),(78,'SERIE B','Italia','http://el.soccerway.com/national/italy/serie-b/20142015/regular-season/r26405/',14),(80,'PREMIER LEAGUE','Jamaica','http://el.soccerway.com/national/jamaica/premier-league/20142015/regular-season/r28653/',477),(81,'LIGA J1','Japón','http://el.soccerway.com/national/japan/j1-league/2014/regular-season/r23771/',109),(82,'LIGA J2','Japón','http://el.soccerway.com/national/japan/j2-league/2014/regular-season/r23772/',110),(83,'DIVISIÓN NACIONAL','Luxemburgo','http://el.soccerway.com/national/luxembourg/national-division/20142015/regular-season/r26359/',134),(84,'SUPER LIGA','Malasia','http://el.soccerway.com/national/malaysia/super-league/2014/regular-season/r23006/',153),(85,'PREMIER LEAGUE','Malta','http://el.soccerway.com/national/malta/premier-league/20142015/regular-season/r26473/',152),(86,'PRIMERA LIGA','Montenegro','http://el.soccerway.com/national/montenegro/first-league/20142015/regular-season/r26325/',445),(87,'PRIMERA DIVISIÓN','México','http://el.soccerway.com/national/mexico/primera-division/20142015/apertura/r25381/',155),(88,'LIGA DE ASCENSO','México','http://el.soccerway.com/national/mexico/liga-de-ascenso/20142015/apertura/r25397/',156),(89,'PRIMERA DIVISIÓN','Nicaragua','http://el.soccerway.com/national/nicaragua/primera-division/20142015/apertura/r27193/',351),(90,'ELITESERIEN','Noruega','http://el.soccerway.com/national/norway/eliteserien/2014/regular-season/r23260/',29),(91,'PRIMERA DIVISIÓN','Nueva Zelanda','http://el.soccerway.com/national/new-zealand/premiership/20142015/regular-season/r29223/',73),(92,'LPF','Panamá','http://el.soccerway.com/national/panama/lpf/20142015/apertura/r26625/',525),(93,'DIVISIÓN PROFESIONAL','Paraguay','http://el.soccerway.com/national/paraguay/division-profesional/2014/clausura/r23713/',157),(94,'EREDIVISIE','Países Bajos','http://el.soccerway.com/national/netherlands/eredivisie/20142015/regular-season/r25289/',1),(95,'EERSTE DIVISIE','Países Bajos','http://el.soccerway.com/national/netherlands/eerste-divisie/20142015/regular-season/r25485/',5),(96,'VROUWEN EREDIVISIE','Países Bajos','http://el.soccerway.com/national/netherlands/vrouwen-eredivisie/2011-2012/regular-season/r15396/',549),(97,'PRIMERA DIVISIÓN','Perú','http://el.soccerway.com/national/peru/primera-division/2014/clausura/r24202/',158),(98,'SEGUNDA DIVISIÓN','Perú','http://el.soccerway.com/national/peru/segunda-division/2014/regular-season/r24581/',439),(99,'EKSTRAKLASA','Polonia','http://el.soccerway.com/national/poland/ekstraklasa/20142015/regular-season/r25643/',119),(100,'I LIGA','Polonia','http://el.soccerway.com/national/poland/i-liga/20142015/regular-season/r26145/',120),(101,'II LIGA','Polonia','http://el.soccerway.com/national/poland/ii-liga/20142015/regular-season/r26171/',558),(102,'PRIMEIRA LIGA','Portugal','http://el.soccerway.com/national/portugal/portuguese-liga-/20142015/regular-season/r25727/',63),(103,'LIGA DE HONRA','Portugal','http://el.soccerway.com/national/portugal/liga-de-honra/20142015/regular-season/r25951/',100),(104,'II DIVISAO','Portugal','http://el.soccerway.com/national/portugal/ii-divisao/20142015/group-c/r26561/',101),(105,'CSL','China','http://el.soccerway.com/national/china-pr/csl/2014/regular-season/r23926/',51),(106,'LIGA CHECA','República Checa','http://el.soccerway.com/national/czech-republic/czech-liga/20142015/regular-season/r25601/',82),(107,'2. LIGA','República Checa','http://el.soccerway.com/national/czech-republic/2-liga/20142015/regular-season/r26053/',83),(108,'LIGA K','República de Corea','http://el.soccerway.com/national/korea-republic/k-league-classic/2014/regular-season/r24076/',136),(109,'K LEAGUE CHALLENGE','República de Corea','http://el.soccerway.com/national/korea-republic/k-league/2014/regular-season/r24172/',1110),(110,'LIGA I','Rumania','http://el.soccerway.com/national/romania/liga-i/20142015/regular-season/r25729/',85),(111,'PREMIER LEAGUE','Rusia','http://el.soccerway.com/national/russia/premier-league/20142015/regular-season/r25305/',121),(112,'1. DIVISIÓN','Rusia','http://el.soccerway.com/national/russia/1-division/20142015/regular-season/r25639/',122),(113,'LIGA S','Singapur','http://el.soccerway.com/national/singapore/sleague/2014/regular-season/r23906/',137),(114,'PSL','Sudáfrica','http://el.soccerway.com/national/south-africa/psl/20142015/regular-season/r25629/',214),(115,'ALLSVENSKAN','Suecia','http://el.soccerway.com/national/sweden/allsvenskan/2014/regular-season/r23311/',28),(116,'SUPERETTAN','Suecia','http://el.soccerway.com/national/sweden/superettan/2014/regular-season/r23312/',37),(117,'DIVISIÓN 1','Suecia','http://el.soccerway.com/national/sweden/division-1/2014/sodra/r23839/',427),(118,'SUPER LIGA','Suiza','http://el.soccerway.com/national/switzerland/super-league/20142015/regular-season/r25183/',27),(119,'CHALLENGE LEAGUE','Suiza','http://el.soccerway.com/national/switzerland/challenge-league/20142015/regular-season/r25691/',99),(120,'PREMIER LEAGUE DE TAILANDIA','Tailandia','http://el.soccerway.com/national/thailand/thai-premier-league/2014/regular-season/r23787/',519),(121,'SÜPER LIG','Turquía','http://el.soccerway.com/national/turkey/super-lig/20142015/regular-season/r25151/',19),(122,'1. LIG','Turquía','http://el.soccerway.com/national/turkey/1-lig/20142015/regular-season/r25153/',97),(123,'PREMIER LEAGUE','Ucrania','http://el.soccerway.com/national/ukraine/premier-league/20142015/regular-season/r26855/',125),(124,'PERSHA LIGA','Ucrania','http://el.soccerway.com/national/ukraine/persha-liga/20142015/regular-season/r26641/',233),(125,'DRUHA LIGA','Ucrania','http://el.soccerway.com/national/ukraine/druha-liga/20142015/regular-season/r26639/',559),(126,'PRIMERA DIVISIÓN','Uruguay','http://el.soccerway.com/national/uruguay/primera-division/20142015/apertura/r26829/',162),(127,'SEGUNDA DIVISIÓN','Uruguay','http://el.soccerway.com/national/uruguay/segunda-division/20142015/regular-season/r28547/',532),(128,'PRIMERA DIVISIÓN','Venezuela','http://el.soccerway.com/national/venezuela/primera-division/20142015/apertura/r26723/',163);
/*!40000 ALTER TABLE `templeague` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-04 14:01:10

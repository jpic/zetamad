-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--


/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:28
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeCategory`
--

DROP TABLE IF EXISTS `recipeCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeCategory` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeCategory`
--


/*!40000 ALTER TABLE `recipeCategory` DISABLE KEYS */;
INSERT INTO `recipeCategory` VALUES (1),(2),(3),(4),(5),(6),(7);
/*!40000 ALTER TABLE `recipeCategory` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:28
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeCategory_slug`
--

DROP TABLE IF EXISTS `recipeCategory_slug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeCategory_slug` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeCategory_slug`
--


/*!40000 ALTER TABLE `recipeCategory_slug` DISABLE KEYS */;
INSERT INTO `recipeCategory_slug` VALUES (1,'dessert'),(2,'gourmandise'),(3,'plat'),(4,'aperitif'),(5,'entree'),(6,'ariake'),(7,'');
/*!40000 ALTER TABLE `recipeCategory_slug` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:31
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeCategory_title`
--

DROP TABLE IF EXISTS `recipeCategory_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeCategory_title` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeCategory_title`
--


/*!40000 ALTER TABLE `recipeCategory_title` DISABLE KEYS */;
INSERT INTO `recipeCategory_title` VALUES (1,'dessert'),(2,'gourmandise'),(3,'plat'),(4,'apÃ©ritif'),(5,'entrÃ©e'),(6,'ariakÃ©'),(7,' ');
/*!40000 ALTER TABLE `recipeCategory_title` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:31
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeIngredientProduct`
--

DROP TABLE IF EXISTS `recipeIngredientProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeIngredientProduct` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeIngredientProduct`
--


/*!40000 ALTER TABLE `recipeIngredientProduct` DISABLE KEYS */;
INSERT INTO `recipeIngredientProduct` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86);
/*!40000 ALTER TABLE `recipeIngredientProduct` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeIngredientProduct_product`
--

DROP TABLE IF EXISTS `recipeIngredientProduct_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeIngredientProduct_product` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeIngredientProduct_product`
--


/*!40000 ALTER TABLE `recipeIngredientProduct_product` DISABLE KEYS */;
INSERT INTO `recipeIngredientProduct_product` VALUES (1,'2441'),(2,'37101'),(3,'36782'),(4,'168'),(5,'1827'),(6,'168'),(7,'2349'),(8,'2440'),(9,'2440PrÃ©ambule ConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.  ConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.  ConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.  ConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.  ConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.  ConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.  ConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.  L\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.  HAUT DE PAGE  Article premier Tous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.  HAUT DE PAGE  Article 2 1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.  HAUT DE PAGE  Article 3 Tout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.  HAUT DE PAGE  Article 6 Chacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.  HAUT DE PAGE  Article 7 Tous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es.  2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays.  2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit Ã  une nationalitÃ©.  2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.  HAUT DE PAGE  Article 16 1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux.  3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©. 2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.  HAUT DE PAGE  Article 18 Toute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques.  2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis.  2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays. 3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage.  2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal.  3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©.  2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite.  2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix.  3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent.  2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique.  3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.  '),(10,'505'),(11,'1467'),(12,'10323'),(13,'10239'),(14,'2440'),(15,'2440'),(16,'2441'),(17,'565418484'),(18,'2441'),(19,'1683'),(20,'2232'),(21,'168'),(22,'1683'),(23,'1491'),(24,'1492'),(25,'326'),(26,'1685'),(27,'1491'),(28,'1492'),(29,'2232'),(30,'37309'),(31,'1685'),(32,'168'),(33,'304'),(34,'1491'),(35,'1492'),(36,'1684'),(37,'1683'),(38,'1684'),(39,'1683'),(40,'1683'),(41,'1684'),(42,'1685'),(43,'1686'),(44,'2441'),(45,'2440'),(46,'1491'),(47,'1171'),(48,'1172'),(49,'1491'),(50,'1492'),(51,'2440'),(52,'577'),(53,'2440'),(54,'2440'),(55,'1491'),(56,'1492'),(57,'2447'),(58,'2440'),(59,'1491'),(60,'2440'),(61,'1491'),(62,'2655'),(63,'2655'),(64,'2654'),(65,'1683'),(66,'1684'),(67,'2654'),(68,'2657'),(69,'2657'),(70,'2650'),(71,'2650'),(72,'2656'),(73,'2656'),(74,'2651'),(75,'2652'),(76,'2653'),(77,'369'),(78,'2652'),(79,'2651'),(80,'2660'),(81,'2660'),(82,'168'),(83,'2659'),(84,'2662'),(85,'2662'),(86,'2659');
/*!40000 ALTER TABLE `recipeIngredientProduct_product` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeIngredientProduct_recipe`
--

DROP TABLE IF EXISTS `recipeIngredientProduct_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeIngredientProduct_recipe` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeIngredientProduct_recipe`
--


/*!40000 ALTER TABLE `recipeIngredientProduct_recipe` DISABLE KEYS */;
INSERT INTO `recipeIngredientProduct_recipe` VALUES (1,'2'),(2,'3'),(3,'3'),(4,'4'),(5,'5'),(6,'5'),(7,'7'),(8,'8'),(9,'9'),(10,'10'),(11,'10'),(12,'10'),(13,'10'),(14,'11'),(15,'11'),(16,'11'),(17,'11'),(18,'12'),(19,'14'),(20,'14'),(21,'14'),(22,'15'),(23,'15'),(24,'15'),(25,'15'),(26,'16'),(27,'16'),(28,'16'),(29,'16'),(30,'16'),(31,'17'),(32,'17'),(33,'17'),(34,'17'),(35,'17'),(36,'18'),(37,'19'),(38,'21'),(39,'22'),(40,'23'),(41,'23'),(42,'23'),(43,'23'),(44,'23'),(45,'27'),(46,'27'),(47,'28'),(48,'29'),(49,'30'),(50,'30'),(51,'30'),(52,'31'),(53,'31'),(54,'33'),(55,'33'),(56,'33'),(57,'33'),(58,'34'),(59,'34'),(60,'35'),(61,'37'),(62,'38'),(63,'39'),(64,'40'),(65,'40'),(66,'40'),(67,'41'),(68,'42'),(69,'43'),(70,'44'),(71,'45'),(72,'46'),(73,'47'),(74,'48'),(75,'48'),(76,'49'),(77,'50'),(78,'50'),(79,'50'),(80,'51'),(81,'52'),(82,'54'),(83,'54'),(84,'54'),(85,'55'),(86,'55');
/*!40000 ALTER TABLE `recipeIngredientProduct_recipe` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeIngredientQuantity`
--

DROP TABLE IF EXISTS `recipeIngredientQuantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeIngredientQuantity` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeIngredientQuantity`
--


/*!40000 ALTER TABLE `recipeIngredientQuantity` DISABLE KEYS */;
INSERT INTO `recipeIngredientQuantity` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100),(101),(102),(103),(104),(105),(106),(107),(108),(109),(110),(111),(112),(113),(114),(115),(116),(117),(118),(119),(120),(121),(122),(123),(124),(125),(126),(127),(128),(129),(130),(131),(132),(133),(134),(135),(136),(137),(138),(139),(140),(141),(142),(143),(144),(145),(146),(147),(148),(149),(150),(151),(152),(153),(154),(155),(156),(157),(158),(159),(160),(161),(162),(163),(164),(165),(166),(167),(168),(169),(170),(171),(172),(173),(174),(175),(176),(177),(178),(179),(180),(181),(182),(183),(184),(185),(186),(187),(188),(189),(190),(191),(192),(193),(194),(195),(196),(197),(198),(199),(200),(201),(202),(203),(204),(205),(206),(207),(208),(209),(210),(211),(212),(213),(214),(215),(216),(217),(218),(219),(220),(221),(222),(223),(224),(225),(226),(227),(228),(229),(230),(231),(232),(233),(234),(235),(236),(237),(238),(239),(240),(241),(242),(243),(244),(245),(246),(247),(248),(249),(250),(251),(252),(253),(254),(255),(256),(257),(258),(259),(260),(261),(262),(263),(264),(265),(266),(267),(268),(269),(270),(271),(272),(273),(274),(275),(276),(277),(278),(279),(280),(281),(282),(283),(284),(285),(286),(287),(288),(289),(290),(291),(292),(293),(294),(295),(296),(297),(298),(299),(300),(301),(302),(303),(304),(305),(306),(307),(308),(309),(310),(311),(312),(313),(314),(315),(316),(317),(318),(319),(320),(321),(322),(323),(324),(325),(326),(327),(328),(329),(330),(331),(332),(333),(334),(335),(336),(337),(338),(339),(340),(341),(342),(343),(344),(345);
/*!40000 ALTER TABLE `recipeIngredientQuantity` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeIngredientQuantity_ingredient`
--

DROP TABLE IF EXISTS `recipeIngredientQuantity_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeIngredientQuantity_ingredient` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeIngredientQuantity_ingredient`
--


/*!40000 ALTER TABLE `recipeIngredientQuantity_ingredient` DISABLE KEYS */;
INSERT INTO `recipeIngredientQuantity_ingredient` VALUES (1,'Lait de coco'),(2,'Lait entier'),(3,'Sucre blond en poudre'),(4,'Mangue'),(5,'Fruit de la passion'),(6,'Sucre'),(7,'GÃ©latine'),(8,'Gousse de vanille'),(9,'Oeufs'),(10,'ArÃ´me de vanille liquide'),(11,'Sucre glace'),(12,'Amidon (maÃ¯zena, fÃ©cule de pomme de terre, de riz)'),(13,'Moules de bouchot'),(14,'Vin blanc sec'),(15,'Echalotes'),(16,'Oignon'),(17,'ConcentrÃ© de tomates'),(18,'Fumet de poisson'),(19,'MaÃ¯zena'),(20,'Safran en poudre'),(21,'CrÃ¨me liquide'),(22,'Poivre du moulin'),(23,'Bouquet garni'),(24,'Queue de cabillaud'),(25,'Beurre en dÃ©s'),(26,'Poudre dâ€™amandes'),(27,'Feuilles de brick'),(28,'Tomate'),(29,'Poivron rouge'),(30,'Oignon'),(31,'Huile dâ€™olive'),(32,'Brin de thym'),(33,'Sel'),(34,'Poivre de moulin'),(35,'Calamaretti'),(36,'Citron de Menton'),(37,'Oignon rouge de 50g'),(38,'Vinaigre de vin'),(39,'Branches de basilic'),(40,'Huile dâ€™olive'),(41,'Sel, Poivre du Moulin'),(42,'Cerises de burlat'),(43,'Farine'),(44,'Sucre'),(45,'Beurre'),(46,'Sel'),(47,'Semoule de blÃ© dur fine'),(48,'Miel de fleur dâ€™oranger'),(49,'Jus dâ€™orange frais'),(50,'Abricot moelleux'),(51,'Figues sÃ©chÃ©es'),(52,'Dattes medjool'),(53,'Pignons de pin '),(54,'Raisins secs blonds'),(55,'Sucre en poudre'),(56,'Fleur de sel'),(57,'Huile dâ€™argan'),(58,'Oranges'),(59,'Brin de menthe'),(60,'Farine'),(61,'Noisettes en poudre'),(62,'Vanille en poudre'),(63,'Sucre'),(64,'Levure chimique'),(65,'Oeuf'),(66,'Huile de noisettes grillÃ©es'),(67,'Lait'),(68,'Framboise'),(69,'Noisettes brutes'),(70,'LaitPrÃ©ambule ConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.  ConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.  ConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.  ConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.  ConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.  ConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.  ConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.  L\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.  HAUT DE PAGE  Article premier Tous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.  HAUT DE PAGE  Article 2 1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.  HAUT DE PAGE  Article 3 Tout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.  HAUT DE PAGE  Article 6 Chacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.  HAUT DE PAGE  Article 7 Tous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es.  2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays.  2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit Ã  une nationalitÃ©.  2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.  HAUT DE PAGE  Article 16 1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux.  3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©. 2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.  HAUT DE PAGE  Article 18 Toute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques.  2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis.  2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays. 3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage.  2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal.  3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©.  2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite.  2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix.  3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent.  2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique.  3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.  '),(71,'Eau Froide'),(72,'Beurre en dÃ¨s'),(73,'Sel fin'),(74,'Oeuf de 60g'),(75,'Farine'),(76,'Cacao en poudre'),(77,'Suvre en grains nÂ°6'),(78,'Vermicelles en chocolat'),(79,'Collier d\'agneau dÃ©cossÃ©'),(80,'Gousse d\'ail'),(81,'Petit oignon blanc'),(82,'Sel fin'),(83,'Poivre'),(84,'Huile de pÃ©pins de raisin'),(85,'Brins de thym'),(86,'Feuille de laurier'),(87,'ConcentrÃ© de tomate'),(88,'Vin blanc sec'),(89,'Fond de veau clair'),(90,'Carotte fanes fines'),(91,'Navets ronds fanes'),(92,'Rattes ou de pommes de terre de 50g Ã  chair ferme'),(93,'Petits oignons grelots'),(94,'courgettes'),(95,'Poires fermes et juteuses (Comice ou ConfÃ©rence)'),(96,'Sucre'),(97,'Eau chaude'),(98,'Biscuits Ã  la cuillÃ¨re nature'),(99,'Sirop au caramel'),(100,'Eau-de-vie de poire'),(101,'Lait'),(102,'GÃ©latine'),(103,'Jaunes d\'oeufs'),(104,'CrÃ¨me fleurette trÃ¨s froide'),(105,'GelÃ©e d\'abricot ou de pomme'),(106,'cuisses de poulet '),(107,'tranches de bacon en lardons'),(108,'branches de cÃ©leri coupÃ©es en 2'),(109,'petites carottes coupÃ©es en 2'),(110,'oignons nouveaux, blanchis et pelÃ©s'),(111,'champignons de Paris coupÃ©s en 4'),(112,'gousses dâ€™ail Ã©crasÃ©es'),(113,'tasse de farine'),(114,'tasses de vin rouge (merlot)'),(115,'tasses dâ€™eau'),(116,'tasses de Fond de Veau Ariake'),(117,'cafÃ© de Base de Poulet'),(118,'Huile de Canola pour la cuisson'),(119,'Du beurre pour la cuisson'),(120,'brins de thym frais'),(121,'feuilles de laurier'),(122,'Sachet de Bouillon Volaille ARIAKE'),(123,'Champignons de Paris'),(124,'Riz SpÃ©cial Risotto'),(125,'Beurre'),(126,'Ã‰chalotes Ã©mincÃ©es'),(127,'Vin blanc sec'),(128,'Parmesan rÃ¢pÃ©'),(129,'Huile d\'olive'),(130,'Botte dâ€™asperges vertes'),(131,'Quelques feuilles dâ€™Ã©pinard'),(132,'Sachet de bouillon de Volaille ARiakÃ©'),(133,'Sel, poivre'),(134,'Graines de sÃ©same'),(135,'Pate feuilletÃ©e'),(136,'Sachets de Bouillon de Coquillages AriakÃ© (1 sachet/personne)'),(137,'Riz Arborio pour Risotto'),(138,'Oignon'),(139,'Ã‰chalote'),(140,'Asperges vertes'),(141,'Huile dâ€™olive'),(142,'Soupe de crÃ¨me fraÃ®che'),(143,'Parmesan fraÃ®chement rÃ¢pÃ©'),(144,'Vin blanc'),(145,'Sel, poivre du moulin'),(146,'Sachets de Bouillon de Coquillages AriakÃ© (1 sachet/personne)'),(147,'Belles portions de poisson blanc (du MÃ©rou, par exemple)'),(148,'PanachÃ©s de moules, coques et crevettes'),(149,'Langoustines'),(150,'Petites pommes de terre cuites Ã  la vapeur'),(151,'Oignon'),(152,'Gousses dâ€™ail'),(153,'Ã‰chalotes'),(154,'Safran'),(155,'Bouquet de basilic'),(156,'Huile dâ€™olive'),(157,'Tomates'),(158,'ConcentrÃ© de tomates'),(159,'sel, poivre du moulin'),(160,'Sachets de Bouillon de Boeuf AriakÃ©'),(161,'Champignons japonais (le shiitake, ou tout autre champignon asiatique parfumÃ©)'),(162,'Carotte'),(163,'Tofu blanc'),(164,'Coriandre fraÃ®che'),(165,'Sauce nuoc mam'),(166,'Sachets de Bouillon de Volaille AriakÃ©'),(167,'Ravioles de foie gras'),(168,'Ciboulette fraÃ®che'),(169,'Sachets de Bouillon de Coquillages AriakÃ© (1 sachet/personne)'),(170,'Coquilles Saint-Jacques avec ou sans corail, selon votre goÃ»t'),(171,'Coriandre fraÃ®che'),(172,'Citronnelle'),(173,'Minis lÃ©gumes'),(174,'Beurre ou huile dâ€™olive, selon votre goÃ»t'),(175,'Sachet de Bouillon de Boeuf AriakÃ©'),(176,'Branche de thym'),(177,'CÃ´tes dâ€™agneau'),(178,'Huile dâ€™olive'),(179,'Beurre'),(180,'Sachets de Bouillon de Volaille AriakÃ©'),(181,'CrÃ¨me fraÃ®che liquide (non sucrÃ©e)'),(182,'Petits pois, frais de prÃ©fÃ©rence'),(183,'Roquette'),(184,'Bouillon de Boeuf, Bouillon de Volaille ou Bouillon de Coquillages AriakÃ© (En fonction du choix de lâ€™aspic, prenez le bouillon correspondant)'),(185,'Agar-agar en poudre'),(186,'Amandes Ã©mondÃ©es'),(187,'Sucre en poudre'),(188,'Miel liquide'),(189,'Blancs d\'oeufs'),(190,'CrÃ¨me liquide froide'),(191,'Sucre glace'),(192,'Fruits confits macÃ©rÃ©s'),(193,'Sucre glace'),(194,'Amande en poudre'),(195,'Levure chimique'),(196,'Blancs d\'oeufs'),(197,'Beurre de noisette'),(198,'Vanille liquide'),(199,'Beurre'),(200,'Sucre glace'),(201,'Gros oeufs'),(202,'Farine'),(203,'Levure chimique'),(204,'Chocolat hachÃ© ou de pÃ©pites de chocolat'),(205,'Cerises'),(206,'Lait '),(207,'Liqueur de kirsch'),(208,'Citron'),(209,'Farine'),(210,'Oeufs'),(211,'Sucre semoule'),(212,'Beurre'),(213,'Sel '),(214,'Poudre d\'amandes'),(215,'Sucre glace'),(216,'Blancs dâ€™oeufs'),(217,'Sucre semoule'),(218,'Colorants/cacao en poudre/cafÃ© moulu/...'),(219,'Poudre d\'amandes'),(220,'Sucre glace'),(221,'Eau'),(222,'Blancs d\'oeufs'),(223,'Colorants/cacao en poudre/cafÃ© moulu/...'),(224,'Farine'),(225,'Lait'),(226,'Oeufs'),(227,'GruyÃ¨re rÃ¢pÃ©'),(228,'Sel fin'),(229,'Poivre'),(230,'Lardons'),(231,'PÃ¢te Ã  brioche (voir la recette des \"Briochettes\")'),(232,'Abricots frais bien mÃ»rs ou 1 boÃ®te 4/4 dâ€™abricots au sirop'),(233,'Lait'),(234,'Beaux jaunes d\'oeufs'),(235,'Sucre'),(236,'Farine'),(237,'FÃ©cule de maÃ¯s'),(238,'Extrait de vanille'),(239,'Chocolat noir'),(240,'Beurre'),(241,'Sucre glace'),(242,'Sucre vanillÃ©'),(243,'Farine'),(244,'MaÃ¯zena'),(245,'Sel'),(246,'Pommes de terre '),(247,'Oignons'),(248,'Gousse d\'ail'),(249,'Herbes de Provence'),(250,'GruyÃ¨re rÃ¢pÃ©'),(251,'CrÃ¨me liquide'),(252,'Farine'),(253,'Beurre'),(254,'Sel, poivre'),(255,'Farine'),(256,'Levure de boulanger'),(257,'Lait'),(258,'Beurre'),(259,'Sucre'),(260,'Raisins secs'),(261,'Oeufs'),(262,'Amandes'),(263,'Sel '),(264,'Farine'),(265,'Levure chimique'),(266,'Sucre en poudre'),(267,'Oeuf'),(268,'Beurre'),(269,'Liquide (soit moitiÃ© lait, moitiÃ© rhum, soit tout lait avec un parfum au choix : vanille, zeste de citron, â€¦)'),(270,'Sucre'),(271,'Oeufs'),(272,'Farine'),(273,'Levure'),(274,'Beurre'),(275,'Lait'),(276,'Vanille ou citron'),(277,'Beurre ramolli'),(278,'Sucre en poudre'),(279,'Oeufs'),(280,'Lait'),(281,'Farine tamisÃ©e'),(282,'Levure chimique '),(283,'Vanille liquide'),(284,'Myrtilles'),(285,'Sucre glace'),(286,'Sel'),(287,'Concombres en fleur'),(288,'Eau de cornichons au vinaigre'),(289,'Kappa'),(290,'CÃ¨pes frais'),(291,'Bouillon aux cÃ¨pes'),(292,'Kappa'),(293,'Bouillon de viande et volaille'),(294,'Gellan'),(295,'ConsommÃ© sans sel'),(296,'Pistils de safran'),(297,'Gellan'),(298,'Lait'),(299,'Iota'),(300,'Jus d\'ananas'),(301,'Iota'),(302,'Bouillon de langoustines'),(303,'Agar'),(304,'Eau au basilic'),(305,'Agar'),(306,'Sel'),(307,'Parmesan rÃ¢pÃ©'),(308,'Eau'),(309,'Lecite'),(310,'Jus de lime'),(311,'Eau'),(312,'Lecite'),(313,'Jus de melon Cantaloupe'),(314,'Algin'),(315,'Eau'),(316,'Calcic'),(317,'Eau'),(318,'Citras'),(319,'Algin'),(320,'PurÃ©e de mangue'),(321,'Calcic'),(322,'Eau'),(323,'ThÃ© Earl Grey'),(324,'Sucre'),(325,'Jus de citron'),(326,'Algin'),(327,'Calcic'),(328,'MÃ©lange de sangria blanche'),(329,'Xantana'),(330,'Bouillon de jambon ibÃ©rique'),(331,'Graisse de jambon ibÃ©rique'),(332,'Xantana'),(333,'Eau'),(334,'FÃ¨ves tendres Ã©cossÃ©es et Ã©pluchÃ©es'),(335,'MÃ©lange de Metil'),(336,'Isomalt'),(337,'Glucose'),(338,'Sucro'),(339,'Huile dâ€™olive vierge extra'),(340,'Glice'),(341,'Eau d\'huile d\'olive noire'),(342,'Feuille de gÃ©latine'),(343,'Sucro'),(344,'Graisse dâ€™olive noire'),(345,'Glice');
/*!40000 ALTER TABLE `recipeIngredientQuantity_ingredient` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeIngredientQuantity_quantity`
--

DROP TABLE IF EXISTS `recipeIngredientQuantity_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeIngredientQuantity_quantity` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeIngredientQuantity_quantity`
--


/*!40000 ALTER TABLE `recipeIngredientQuantity_quantity` DISABLE KEYS */;
INSERT INTO `recipeIngredientQuantity_quantity` VALUES (1,'1 boÃ®te de 33cl environ'),(2,'1 verre'),(3,'100g'),(4,'1'),(5,'2'),(6,'250g'),(7,'6 feuilles'),(8,'1.5'),(9,'3'),(10,'5g'),(11,'50g'),(12,'40g'),(13,'3L'),(14,'1L'),(15,'2'),(16,'1'),(17,'1 c. Ã  c.'),(18,'80cl'),(19,'8g'),(20,'1 capsule'),(21,'25cl'),(23,'1 branche de thym, 1 feuille de laurier et  3 rubans de zeste dâ€™orange'),(24,'500g'),(25,'40g'),(26,'60g'),(27,'5'),(28,'1'),(29,'1'),(30,'1/2'),(32,'1'),(35,'1kg'),(36,'1'),(37,'1'),(38,'5cl'),(39,'2'),(42,'1 livre'),(43,'300g'),(44,'150g'),(45,'150g'),(46,'1 pincÃ©e'),(47,'180g'),(48,'60g'),(49,'40cl'),(50,'4'),(51,'4'),(52,'4'),(53,'50g'),(54,'30g'),(55,'20g'),(56,'1 pincÃ©e'),(57,'1 c. Ã  c.'),(58,'2'),(59,'1'),(60,'175g'),(61,'20g'),(62,'1/2 c. Ã  c.'),(63,'70g'),(64,'6g'),(65,'1'),(67,'115g'),(68,'18'),(69,'30g'),(70,'12.5clPrÃ©ambule ConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.  ConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.  ConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.  ConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.  ConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.  ConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.  ConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.  L\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.  HAUT DE PAGE  Article premier Tous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.  HAUT DE PAGE  Article 2 1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.  HAUT DE PAGE  Article 3 Tout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.  HAUT DE PAGE  Article 6 Chacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.  HAUT DE PAGE  Article 7 Tous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es.  2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays.  2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit Ã  une nationalitÃ©.  2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.  HAUT DE PAGE  Article 16 1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux.  3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©. 2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.  HAUT DE PAGE  Article 18 Toute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques.  2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis.  2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays. 3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage.  2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal.  3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©.  2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite.  2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix.  3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent.  2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique.  3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.  '),(71,'12cl'),(72,'125g'),(73,'4g'),(74,'4'),(75,'110g'),(76,'30g'),(77,'200g'),(78,'4 cuillÃ¨res Ã  soupe'),(79,'800g'),(80,'1'),(81,'1'),(86,'1'),(87,'20g (1c. Ã  s.)'),(88,'8cl'),(89,'15cl'),(90,'6'),(91,'5'),(92,'300g'),(93,'20g'),(94,'200g'),(95,'3'),(96,'300g+ 25g pour la bavaroise'),(97,'500g'),(98,'30'),(99,'200g'),(100,'5g'),(101,'90g'),(102,'1 feuille'),(103,'4'),(104,'150g'),(105,'100g'),(106,'6'),(107,'5'),(108,'2'),(109,'2'),(110,'25'),(111,'12'),(112,'2'),(113,'1'),(114,'2'),(115,'2'),(116,'2/3'),(117,'2c'),(120,'4'),(121,'2'),(122,'2 litres'),(123,'150g'),(124,'350g'),(125,'30g'),(126,'2'),(127,'15 cl'),(128,'50g'),(129,'3 c Ã  s.'),(130,'1'),(132,'33 cl'),(136,'3'),(137,'160g environ'),(138,'1'),(139,'1'),(140,'6'),(141,'6 c. Ã  s.'),(142,'4 c. Ã  s.'),(143,'4 c. Ã  s.'),(144,'1 verre'),(146,'4'),(147,'600g ou 4'),(148,'400g'),(149,'8'),(150,'8'),(151,'1'),(152,'4'),(153,'2'),(154,'2 doses'),(155,'1'),(156,'4 c. Ã  s.'),(157,'2'),(158,'2 c. Ã  s.'),(160,'2'),(161,'150g'),(162,'1'),(163,'100g'),(166,'3'),(167,'12'),(169,'3'),(170,'12'),(171,'1 c. Ã  c.'),(172,'2 petits bÃ¢tons'),(173,'4 carottes, 1 blanc de poireaux'),(174,'1 c. Ã  s.'),(175,'1'),(176,'1'),(177,'4'),(178,'4 c. Ã  s.'),(179,'1 c. Ã  s.'),(180,'2'),(181,'25 cl'),(182,'100g'),(183,'100g'),(184,'PrÃ©voir un 1 sachet pour 3 verrines.'),(186,'100g'),(187,'25g'),(188,'100ml'),(189,'4'),(190,'400ml'),(191,'40g'),(192,'60g dans 50l de rhum'),(193,'225g'),(194,'80g'),(195,'2g'),(196,'11'),(197,'120g'),(198,'2g'),(199,'125g'),(200,'125g'),(201,'2'),(202,'180g'),(203,'6g'),(204,'200g'),(205,'500g'),(206,'25 cl'),(207,'1/4 de verre'),(208,'un demi'),(209,'180g'),(210,'3'),(211,'100g'),(212,'60g'),(213,'1 pincÃ©e'),(214,'100g'),(215,'100g'),(216,'4'),(217,'30g'),(219,'100g'),(220,'100g'),(221,'25ml'),(222,'2'),(224,'125g'),(225,'1/2 litre'),(226,'3'),(227,'100g'),(228,'1 c. Ã  c.'),(229,'1 pincÃ©e'),(230,'100g'),(231,'300g'),(232,'600g'),(233,'1/4 de litre'),(234,'2'),(235,'60g'),(236,'15g'),(237,'15g'),(239,'100g'),(240,'50g'),(241,'200g'),(242,'1 sachet'),(243,'30g'),(244,'20g'),(245,'1 pincÃ©e'),(246,'800g'),(247,'2'),(248,'1'),(250,'150g'),(251,'25cl'),(252,'1 c. Ã  s.'),(253,'30g'),(255,'1kg'),(256,'50g'),(257,'1/2 litre'),(258,'100g'),(259,'200g'),(260,'200g'),(261,'4'),(264,'250g'),(265,'1 sachet'),(266,'150g'),(267,'1'),(268,'75g'),(269,'1dl'),(270,'190g'),(271,'2'),(272,'240g'),(273,'6g'),(274,'90g'),(275,'75g'),(277,'125g'),(278,'175g'),(279,'2'),(280,'25cl'),(281,'300g'),(282,'1 c. Ã  c.'),(283,'1 c. Ã  c.'),(284,'100g'),(286,'1 pincÃ©e'),(287,'20'),(288,'20g'),(289,'0.75g'),(290,'5'),(291,'200g'),(292,'3g'),(293,'250g'),(294,'6.5g'),(295,'250g'),(296,'10'),(297,'4.8g'),(298,'200g'),(299,'0.6g'),(300,'250g'),(301,'0.3g'),(302,'250g'),(303,'0.6g'),(304,'250g'),(305,'0.9g'),(307,'500g'),(308,'450g'),(309,'3g'),(310,'225g'),(311,'275g'),(312,'1.5g'),(313,'250g'),(314,'2g'),(315,'500g'),(316,'2.5g'),(317,'1250g'),(318,'1.3g'),(319,'1.8g'),(320,'250g'),(321,'5g'),(322,'975g'),(323,'16g'),(324,'25g'),(325,'50g'),(326,'1.5g'),(327,'3.25g'),(328,'500g'),(329,'1.4g'),(330,'50g'),(331,'30g'),(332,'0.2g'),(333,'100g'),(334,'65g'),(335,'20g'),(336,'100g'),(337,'25g'),(338,'1.5g'),(339,'45g'),(340,'1.5g'),(341,'50g'),(342,'1 (rÃ©hydratÃ©e dans de lâ€™eau froide)'),(343,'0.5g'),(344,'50g'),(345,'0.5g');
/*!40000 ALTER TABLE `recipeIngredientQuantity_quantity` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeIngredientQuantity_recipe`
--

DROP TABLE IF EXISTS `recipeIngredientQuantity_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeIngredientQuantity_recipe` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeIngredientQuantity_recipe`
--


/*!40000 ALTER TABLE `recipeIngredientQuantity_recipe` DISABLE KEYS */;
INSERT INTO `recipeIngredientQuantity_recipe` VALUES (1,'1'),(2,'1'),(3,'1'),(4,'1'),(5,'1'),(6,'2'),(7,'2'),(8,'2'),(9,'2'),(10,'2'),(11,'2'),(12,'2'),(13,'3'),(14,'3'),(15,'3'),(16,'3'),(17,'3'),(18,'3'),(19,'3'),(20,'3'),(21,'3'),(22,'3'),(23,'3'),(24,'4'),(25,'4'),(26,'4'),(27,'4'),(28,'4'),(29,'4'),(30,'4'),(31,'4'),(32,'4'),(33,'4'),(34,'4'),(35,'5'),(36,'5'),(37,'5'),(38,'5'),(39,'5'),(40,'5'),(41,'5'),(42,'6'),(43,'6'),(44,'6'),(45,'6'),(46,'6'),(47,'7'),(48,'7'),(49,'7'),(50,'7'),(51,'7'),(52,'7'),(53,'7'),(54,'7'),(55,'7'),(56,'7'),(57,'7'),(58,'7'),(59,'7'),(60,'8'),(61,'8'),(62,'8'),(63,'8'),(64,'8'),(65,'8'),(66,'8'),(67,'8'),(68,'8'),(69,'8'),(70,'9'),(71,'9'),(72,'9'),(73,'9'),(74,'9'),(75,'9'),(76,'9'),(77,'9'),(78,'9'),(79,'10'),(80,'10'),(81,'10'),(82,'10'),(83,'10'),(84,'10'),(85,'10'),(86,'10'),(87,'10'),(88,'10'),(89,'10'),(90,'10'),(91,'10'),(92,'10'),(93,'10'),(94,'11'),(95,'12'),(96,'12'),(97,'12'),(98,'12'),(99,'12'),(100,'12'),(101,'12'),(102,'12'),(103,'12'),(104,'12'),(105,'12'),(106,'13'),(107,'13'),(108,'13'),(109,'13'),(110,'13'),(111,'13'),(112,'13'),(113,'13'),(114,'13'),(115,'13'),(116,'13'),(117,'13'),(118,'13'),(119,'13'),(120,'13'),(121,'13'),(122,'14'),(123,'14'),(124,'14'),(125,'14'),(126,'14'),(127,'14'),(128,'14'),(129,'14'),(130,'15'),(131,'15'),(132,'15'),(133,'15'),(134,'15'),(135,'15'),(136,'16'),(137,'16'),(138,'16'),(139,'16'),(140,'16'),(141,'16'),(142,'16'),(143,'16'),(144,'16'),(145,'16'),(146,'17'),(147,'17'),(148,'17'),(149,'17'),(150,'17'),(151,'17'),(152,'17'),(153,'17'),(154,'17'),(155,'17'),(156,'17'),(157,'17'),(158,'17'),(159,'17'),(160,'18'),(161,'18'),(162,'18'),(163,'18'),(164,'18'),(165,'18'),(166,'19'),(167,'19'),(168,'19'),(169,'20'),(170,'20'),(171,'20'),(172,'20'),(173,'20'),(174,'20'),(175,'21'),(176,'21'),(177,'21'),(178,'21'),(179,'21'),(180,'22'),(181,'22'),(182,'22'),(183,'22'),(184,'23'),(185,'23'),(186,'24'),(187,'24'),(188,'24'),(189,'24'),(190,'24'),(191,'24'),(192,'24'),(193,'25'),(194,'25'),(195,'25'),(196,'25'),(197,'25'),(198,'25'),(199,'26'),(200,'26'),(201,'26'),(202,'26'),(203,'26'),(204,'26'),(205,'27'),(206,'27'),(207,'27'),(208,'27'),(209,'27'),(210,'27'),(211,'27'),(212,'27'),(213,'27'),(214,'28'),(215,'28'),(216,'28'),(217,'28'),(218,'28'),(219,'29'),(220,'29'),(221,'29'),(222,'29'),(223,'29'),(224,'30'),(225,'30'),(226,'30'),(227,'30'),(228,'30'),(229,'30'),(230,'30'),(231,'31'),(232,'31'),(233,'31'),(234,'31'),(235,'31'),(236,'31'),(237,'31'),(238,'31'),(239,'32'),(240,'32'),(241,'32'),(242,'32'),(243,'32'),(244,'32'),(245,'32'),(246,'33'),(247,'33'),(248,'33'),(249,'33'),(250,'33'),(251,'33'),(252,'33'),(253,'33'),(254,'33'),(255,'34'),(256,'34'),(257,'34'),(258,'34'),(259,'34'),(260,'34'),(261,'34'),(262,'34'),(263,'34'),(264,'35'),(265,'35'),(266,'35'),(267,'35'),(268,'35'),(269,'35'),(270,'36'),(271,'36'),(272,'36'),(273,'36'),(274,'36'),(275,'36'),(276,'36'),(277,'37'),(278,'37'),(279,'37'),(280,'37'),(281,'37'),(282,'37'),(283,'37'),(284,'37'),(285,'37'),(286,'37'),(287,'38'),(288,'38'),(289,'38'),(290,'39'),(291,'39'),(292,'39'),(293,'40'),(294,'40'),(295,'41'),(296,'41'),(297,'41'),(298,'42'),(299,'42'),(300,'43'),(301,'43'),(302,'44'),(303,'44'),(304,'45'),(305,'45'),(306,'45'),(307,'46'),(308,'46'),(309,'46'),(310,'47'),(311,'47'),(312,'47'),(313,'48'),(314,'48'),(315,'48'),(316,'48'),(317,'49'),(318,'49'),(319,'49'),(320,'49'),(321,'49'),(322,'50'),(323,'50'),(324,'50'),(325,'50'),(326,'50'),(327,'50'),(328,'51'),(329,'51'),(330,'52'),(331,'52'),(332,'52'),(333,'53'),(334,'53'),(335,'53'),(336,'54'),(337,'54'),(338,'54'),(339,'54'),(340,'54'),(341,'55'),(342,'55'),(343,'55'),(344,'55'),(345,'55');
/*!40000 ALTER TABLE `recipeIngredientQuantity_recipe` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipePicture`
--

DROP TABLE IF EXISTS `recipePicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipePicture` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipePicture`
--


/*!40000 ALTER TABLE `recipePicture` DISABLE KEYS */;
INSERT INTO `recipePicture` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22);
/*!40000 ALTER TABLE `recipePicture` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipePicture_picture`
--

DROP TABLE IF EXISTS `recipePicture_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipePicture_picture` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipePicture_picture`
--


/*!40000 ALTER TABLE `recipePicture_picture` DISABLE KEYS */;
INSERT INTO `recipePicture_picture` VALUES (1,'photo_creme_cocomangue.jpg'),(2,'photo_guimauvevanille2.jpg'),(3,'photo_moulescremes.jpg'),(4,'photo_fingercabillaud.jpg'),(5,'photo_calamaraletouffee3.jpg'),(6,'photo_crumblecerises.jpg'),(7,'photo_couscoussucre.jpg'),(8,'photo_muffinsframboise2.jpg'),(9,'photo_chouquettechocolat2.jpg'),(10,'photo_navarinagneau2.jpg'),(11,'photo_flandecourgette.jpg'),(12,'photo_charlottepoirecaramel2.jpg'),(13,'risottochampignon.jpg'),(14,'gaspacho.jpg'),(15,'Recette-Ariake-Risotto-2.jpg'),(16,'Recette-Ariake-Safran-brode.jpg'),(17,'Recette-Ariake-Soupe-Japona.jpg'),(18,'Recette-Ariake-Bouillon-aux.jpg'),(19,'Recette-Ariake-Nage-Saint-J.jpg'),(20,'Recette-Ariake-Deglacage-2.jpg'),(21,'Recette-Ariake-Cappucino-de.jpg'),(22,'Recette-Ariake-Aspics-en-ve_.jpg');
/*!40000 ALTER TABLE `recipePicture_picture` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipePicture_recipe`
--

DROP TABLE IF EXISTS `recipePicture_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipePicture_recipe` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipePicture_recipe`
--


/*!40000 ALTER TABLE `recipePicture_recipe` DISABLE KEYS */;
INSERT INTO `recipePicture_recipe` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9'),(10,'10'),(11,'11'),(12,'12'),(13,'14'),(14,'15'),(15,'16'),(16,'17'),(17,'18'),(18,'19'),(19,'20'),(20,'21'),(21,'22'),(22,'23');
/*!40000 ALTER TABLE `recipePicture_recipe` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipePicture_sortkey`
--

DROP TABLE IF EXISTS `recipePicture_sortkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipePicture_sortkey` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipePicture_sortkey`
--


/*!40000 ALTER TABLE `recipePicture_sortkey` DISABLE KEYS */;
INSERT INTO `recipePicture_sortkey` VALUES (1,'0'),(2,'0'),(3,'0'),(4,'0'),(5,'0'),(6,'0'),(7,'0'),(8,'0'),(9,'0'),(10,'0'),(11,'0'),(12,'0'),(13,'0'),(14,'0'),(15,'0'),(16,'0'),(17,'0'),(18,'0'),(19,'0'),(20,'0'),(21,'0'),(22,'0');
/*!40000 ALTER TABLE `recipePicture_sortkey` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipePicture_title`
--

DROP TABLE IF EXISTS `recipePicture_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipePicture_title` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipePicture_title`
--


/*!40000 ALTER TABLE `recipePicture_title` DISABLE KEYS */;
INSERT INTO `recipePicture_title` VALUES (1,''),(2,''),(3,''),(4,''),(5,''),(6,''),(7,''),(8,''),(9,''),(10,''),(11,''),(12,''),(13,''),(14,''),(15,''),(16,''),(17,''),(18,''),(19,''),(20,''),(21,''),(22,'');
/*!40000 ALTER TABLE `recipePicture_title` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeStep`
--

DROP TABLE IF EXISTS `recipeStep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeStep` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeStep`
--


/*!40000 ALTER TABLE `recipeStep` DISABLE KEYS */;
INSERT INTO `recipeStep` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80);
/*!40000 ALTER TABLE `recipeStep` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeStep_description`
--

DROP TABLE IF EXISTS `recipeStep_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeStep_description` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeStep_description`
--


/*!40000 ALTER TABLE `recipeStep_description` DISABLE KEYS */;
INSERT INTO `recipeStep_description` VALUES (1,'MÃ©langez le lait de coco avec le lait entier et le sucre. Portez le tout Ã  Ã©bullition, laissez cuire 3 min. Ã‰teignez le feu et laissez refroidir.\r\n\r\nPelez la mangue et mixez-la afin de la rÃ©duire en purÃ©e.\r\n\r\nRÃ©partissez dans le fond de 4 verres un peu de purÃ©e de mangue.\r\n\r\nVersez doucement le mÃ©lange de laits.\r\n\r\nEnfin, ajoutez dans chaque verre une grosse cuillerÃ©e Ã  soupe de pulpe de fruits de la Passion. Servez bien frais.\r\n\r\nVous pouvez aussi mixer tous les ingrÃ©dients afin dâ€™obtenir un milk-shake bien mousseux.  '),(2,'PrÃ©parez les guimauves : versez le sucre dans une casserole. Ajoutez 8 cl dâ€™eau. Faites chauffer Ã  feu moyen jusquâ€™Ã  petite Ã©bullition. Laissez cuire en surveillant la montÃ©e en tempÃ©rature avec un thermomÃ¨tre jusquâ€™Ã  130 Â°C. \n\r\nPendant ce temps, mettez la gÃ©latine Ã  tremper dans un bol dâ€™eau froide. Fendez les gousses de vanille en deux dans la longueur avec un couteau d\'office. Grattez l\'intÃ©rieur pour rÃ©cupÃ©rer les graines. Clarifiez les oeufs en sÃ©parant les jaunes des blancs. Pesez 90 g de blancs et versez-les dans le bol dâ€™un batteur. Battez les blancs jusquâ€™Ã  ce quâ€™ils aient une consistance mousseuse. Ã‰gouttez la gÃ©latine, essorez-la. \n\r\nQuand le sirop atteint 130 Â°C, retirez-le du feu. Versez le sirop chaud sur les Å“ufs tout en laissant tourner le batteur. Toujours en laissant tourner le batteur, ajoutez les graines de vanille puis la gÃ©latine et enfin lâ€™arÃ´me de vanille.  \n\r\nPrÃ©parez lâ€™enrobage : mÃ©langez dans un bol le sucre glace et la fÃ©cule. Recouvrez une plaque de papier sulfurisÃ©. Posez un carrÃ© en inox sur une moitiÃ©. Poudrez-en le fond avec lâ€™enrobage. Poudrez lâ€™autre partie de la feuille de la mÃªme maniÃ¨re. \n\r\nArrÃªtez le robot : la pÃ¢te doit Ãªtre assez Ã©paisse et tiÃ¨de. RÃ©partissez une partie du mÃ©lange Ã  lâ€™intÃ©rieur du carrÃ© en inox. Remplissez-le bien Ã  ras bords en vous aidant dâ€™une spatule. Ã‰galisez la surface. Remplissez une poche Ã  douille munie dâ€™une douille unie de 10 mm avec le reste de prÃ©paration. Formez des boudins rÃ©guliers sur toute la largeur de lâ€™autre moitiÃ© de la feuille en maintenant la poche dâ€™une main tandis que lâ€™autre main presse doucement pour faire sortir la pÃ¢te. Poudrez le dessus des boudins et du carrÃ© dâ€™enrobage. '),(3,'Laissez prendre 2 h Ã  tempÃ©rature ambiante. Coupez les boudins en deux avec un couteau Ã  lame large.  Formez des noeuds avec chaque demi-boudin. Trempez-les dans lâ€™enrobage. Retirez lâ€™excÃ©dent du bout du doigt et dÃ©posez les noeuds sur une plaque. \n\r\nPour dÃ©mouler le carrÃ©, trempez un couteau dâ€™office dans de lâ€™eau chaude et passez la pointe sur les bords. Soulevez le carrÃ© en maintenant la guimauve de lâ€™autre main. Coupez le carrÃ© en deux avec un couteau Ã©minceur Ã  lame large. Humidifiez la lame. Recoupez chaque moitiÃ© en deux. Tournez la plaque et coupez Ã  la perpendiculaire pour obtenir des cubes. Trempez-les dans lâ€™enrobage.  Retirez lâ€™excÃ©dent du bout du doigt et dÃ©posez les cubes sur la plaque. Câ€™est prÃªt !\n\r\n'),(4,'Nettoyez les moules en les grattant et en les frottant les uns contres les autres. Lavez-les. Epluchez les Ã©chalotes et lâ€™oignon. Emincez-les finement. \r\nDans un faitout, mettez les moules avec les Ã©chalotes, lâ€™oignon, le vin blanc et le bouquet garni. Poivrez. Couvrez et portez Ã  Ã©bullition sur feu vif. \r\nLorsque les moules sont juste ouvertes, Ã©gouttez-les bien en conservant le jus. DÃ©cortiquez les moules. Mettez 100 g de moules dÃ©cortiquÃ©es de  cÃ´tÃ© pour la liaison de la soupe. \r\nDÃ©posez les autres dans un plat et recouvrez-les dâ€™une peu de jus de cuisson. '),(5,'Filtrez le jus des moules au chinois ou dans une passoire fine. Dans le faitout des moules, versez le jus avec le fumet de poisson. Faites rÃ©duire ce jus de moitiÃ© Ã  feu vif. Ajoutez au jus rÃ©duit le concentrÃ© de tomates et la maÃ¯zena, tout en fouettant. Laissez cuire Ã  feu doux 5 minutes. Ajoutez la crÃ¨me liquide et le safran. Laissez cuire encore 5 minutes Ã  feu doux. '),(6,'Mixez la crÃ¨me avec les moules mises de cÃ´tÃ© pour la liaison Ã  lâ€™aide dâ€™un mixer blender ou dâ€™un mixer plongeant pendant 1 minute. Rectifiez lâ€™assaisonnement et rÃ©partissez la crÃ¨me dans des assiettes creuses. DÃ©corez de moules. Servez aussitÃ´t.  '),(7,'PrÃ©parez le jus de poivron : lavez la tomate et le poivron. Pelez lâ€™oignon, coupez-le en lamelles avec le couteau Ã©minceur. Ã”tez le pÃ©doncule de la tomate, coupez-la en quatre puis en tranches fines. Ã”tez le pÃ©doncule du poivron, les filaments blancs et les pÃ©pins. Coupez-le en laniÃ¨res. Faites chauffer 2 c. Ã  s. dâ€™huile dans la casserole. Versez lâ€™oignon et le thym, et laissez fondre 30 s Ã  feu moyen. MÃ©langez. Ajoutez la tomate et le poivron. Assaisonnez avec 2 pincÃ©es de sel et 10 tours de moulin Ã  poivre. MÃ©langez, couvrez et laissez cuire 25 min Ã  feu doux, en remuant de temps en temps. \r\n\r\nFaites fondre les dÃ©s de beurre Ã  feu doux dans la casserole. Versez dans un autre rÃ©cipient en laissant le dÃ©pÃ´t formÃ© au fond de la casserole. \r\n\r\nIncisez le cÃ´tÃ© pointu de la queue du poisson et faites glisser le couteau Ã  filet de sole entre la chair et la peau. Jetez la peau. Taillez la chair du poisson en bÃ¢tonnets rÃ©guliers de 1,5 cm de largeur environ. \r\n\r\nÃ‰talez la poudre dâ€™amandes en couche rÃ©guliÃ¨re dans une assiette. Posez les feuilles de brick les unes sur les autres. Badigeonnez la premiÃ¨re de beurre clarifiÃ© Ã  lâ€™aide du pinceau. PrÃ©chauffez votre four Ã  240 Â°C (th. 8-9). \r\n\r\nSalez les bÃ¢tonnets. Posez-les sur la poudre dâ€™amandes et retournez-les pour les enrober. Posez 3 bÃ¢tonnets bout Ã  bout au centre dâ€™une feuille de brick. Coupez la feuille entre les bÃ¢tonnets. Roulez les bÃ¢tonnets dans leur morceau de brick. Ã‰galisez les bouts. Posez les fingers de cabillaud sur la plaque. Toutes les feuilles empilÃ©es ont Ã©tÃ© coupÃ©es en mÃªme temps que la 1Ã¨re. Enroulez de la mÃªme maniÃ¨re chaque bÃ¢tonnet dans un morceau de brick. Badigeonnez les fingers de beurre fondu au pinceau. \r\n\r\nEnfournez et laissez cuire 10 min. \r\n\r\nRetirez le thym de la casserole contenant le poivron. Versez les lÃ©gumes dans un rÃ©cipient haut. Entourez le rÃ©cipient et le mixeur plongeant de film alimentaire pour Ã©viter les projections. Mixez. Filtrez le poivron dans la passoire fine en appuyant avec une cuillÃ¨re. \r\n\r\nSortez la plaque du four. Enfilez une brochette dans chaque finger. Posez les fingers sur du papier absorbant pour les Ã©ponger. DÃ©posez le jus de poivron au centre dâ€™un plat. Entourez avec les fingers et servez aussitÃ´t.'),(8,'Nettoyer les calamaretti. Bien les laver, les tamponner dans un torchon. Les laisser entiers. Les rÃ©server au frais.'),(9,'Couper la moitiÃ© du citron en fines tranches de 3 mm. Les poÃªler rapidement dans une goutte dâ€™huile dâ€™olive. Ajouter le jus de lâ€™autre moitiÃ© du citron. Confire les tranches Ã  feu doux jusquâ€™Ã  ce que le jus soit rÃ©duit. \n\n\r\nLes dÃ©barrasser. Les recouper en huit en forme de triangles.'),(10,'Eplucher lâ€™oignon, le tailler en rouelles de 3 mm. \n\n\r\nChauffer un lit dâ€™huile dans un sautoir. Y jeter les calamaretti. Les cuire Ã  feu vif pendant 3 minutes. Ajouter les rouelles dâ€™oignon. Cuire 1 minute. DÃ©glacer en trois fois avec le vinaigre. Retirer le sautoir du feu. Verser 5 cl dâ€™huile dâ€™olive. Remuer pour bien lier le tout. \n\n\r\n'),(11,'Dresser les calamars dans les assiettes, ajouter les triangles de citron et quelques feuilles du basilic. Donner un tour de moulin Ã  poivre. '),(12,'PrÃ©chauffer le four (th.5). \r\n\r\nTapisser le fond dâ€™un plat rectangulaire de cerises dÃ©noyautÃ©es sans les superposer. \r\n\r\nDans un grand bol, mÃ©langer quelques minutes et du bout des doigts, la farine, le sucre, le beurre et le sel. \r\n\r\nSaupoudrer ce sable grossier uniformÃ©ment sur les cerises. \r\n\r\nEnfourner et laisser cuire 30 minutes.'),(13,'Versez le miel dans un bol, faites-le chauffer 40 s au micro-ondes (900 W) afin quâ€™il se liquÃ©fie. Versez la semoule dans un saladier, ajoutez le miel et 25 cl de jus dâ€™orange. Laissez gonfler 15 min. \r\n\r\nCoupez les abricots en dÃ©s. Coupez les figues en dÃ©s. DÃ©noyautez les dattes : fendez-les puis Ã´tez leur noyau avec la pointe du couteau. Coupez-les en quatre puis en dÃ©s. \r\n\r\nÃ‰grenez la semoule Ã  lâ€™aide dâ€™une fourchette. Ajoutez les fruits secs ainsi que les 15 cl de jus dâ€™orange restants. MÃ©langez et laissez gonfler encore. \r\n\r\nFaites dorer les pignons Ã  feu vif dans une poÃªle, en agitant sans cesse la poÃªle de faÃ§on circulaire. Ajoutez les raisins, faites sauter pendant 20 s. \r\n\r\nVersez le sucre en pluie et mÃ©langez avec une spatule jusquâ€™Ã  caramÃ©lisation. Ajoutez une pincÃ©e de fleur de sel. Arrosez dâ€™huile dâ€™argan. DÃ©barrassez sur du papier sulfurisÃ© pour arrÃªter la cuisson. \r\n\r\nPelez les oranges Ã  vif : retirez les extrÃ©mitÃ©s et taillez la peau verticalement en suivant la courbe du fruit. Incisez de chaque cÃ´tÃ© des suprÃªmes pour les dÃ©tacher de leur membrane. Ciselez la menthe. Puis ajoutez-la aux oranges. \r\nAÃ©rez la semoule Ã  la fourchette et couvrez-la de film alimentaire.\r\n'),(14,'Laissez-la reposer au rÃ©frigÃ©rateur pendant au moins 3 h (voire 1 nuit). Au moment de servir, dressez la semoule et rÃ©partissez dessus les pignons et raisins caramÃ©lisÃ©s. Accompagnez de la salade dâ€™orange Ã  la menthe.'),(15,'PrÃ©chauffez votre four Ã  180 Â°C (th. 6) en chaleur tournante. Pesez tous les ingrÃ©dients. Versez les ingrÃ©dients en poudre dans un saladier : la farine, les noisettes en poudre, la vanille, le sucre et la levure. Cassez lâ€™oeuf dans un bol. Versez l\'huile dessus en fouettant. Ajoutez le lait et mÃ©langez. MÃ©langez les ingrÃ©dients en poudre. \n\r\n\n\r\nCreusez une fontaine (un creux) au centre. Versez les ingrÃ©dients liquides dessus. Raclez bien le bol avec une maryse  pour tout rÃ©cupÃ©rer. MÃ©langez au fouet en commenÃ§ant par le centre et en incorporant petit Ã  petit les ingrÃ©dients en poudre. La pÃ¢te doit Ãªtre molle mais non liquide. \n\r\n\n\r\nEmplissez les moules au tiers de leur hauteur avec une cuillÃ¨re Ã  soupe. Enfoncez 3 framboises dans chaque moule, sans quâ€™elles touchent le bord ni le fond. Finissez de remplir les moules, en couvrant bien les framboises. \n\r\n\n\r\nÃ‰clatez les noisettes une Ã  une avec le plat de la lame dâ€™un couteau Ã©minceur, en tapant avec la main. Hachez doucement les gros morceaux avec le couteau. Parsemez les muffins de noisettes. '),(16,'Enfournez et laissez cuire 25 min, en tournant la plaque Ã  mi-cuisson. Laissez reposer 5 min : la pÃ¢te se rÃ©tracte lÃ©gÃ¨rement, ce qui facilite le dÃ©moulage. DÃ©moulez sur une grille et laissez refroidir.'),(17,'PrÃ©chauffez votre four Ã  150 Â°C (th. 5) en chaleur tournante (170 Â°C), th. 6 en chaleur traditionnelle). \r\n\r\n\r\n\r\nVersez le lait dans la casserole. Ajoutez lâ€™eau. Ajoutez le beurre. Salez et portez doucement Ã  Ã©bullition en remuant un peu.\r\n\r\nPendant ce temps, cassez 3 Å“ufs Ã  part. Battez le dernier Ã  la fourchette.\r\n\r\nTamisez la farine et le cacao sur une feuille de papier sulfurisÃ©. \r\n\r\nLorsque le liquide est Ã  Ã©bullition, retirez la casserole du feu et versez dâ€™un coup le mÃ©lange farine-cacao. MÃ©langez avec la maryse. Remettez la casserole sur feu moyen et continuez de mÃ©langer pendant 1 min pour dessÃ©cher la pÃ¢te. Versez la pÃ¢te dans un saladier. Ajoutez les 3 oeufs un par un en remuant vigoureusement. Ajoutez lâ€™Å“uf battu par petites quantitÃ©s, jusquâ€™Ã  lâ€™obtention dâ€™une pÃ¢te lisse. \r\n\r\n\r\n\r\nFixez la douille sur la poche et remplissez la poche de pÃ¢te Ã  choux au chocolat. Pochez des choux de 3,5 cm de diamÃ¨tre environ sur chaque plaque Ã  pÃ¢tisserie, en les espaÃ§ant de 3 cm. Parsemez largement de sucre en grains. Saupoudrez de vermicelles en chocolat. Secouez chaque plaque au-dessus dâ€™une feuille de papier sulfurisÃ© pour faire tomber lâ€™excÃ©dent de sucre et de vermicelles.  '),(18,'Enfournez en plaÃ§ant une plaque en haut du four et lâ€™autre en bas. Laissez cuire 30 min. DÃ©collez les chouquettes de leur plaque de cuisson avec la spatule retournÃ©e et laissez-les refroidir. Câ€™est prÃªt \r\n\r\n PrÃ©ambule\r\nConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.\r\n\r\nConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.\r\n\r\nConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.\r\n\r\nConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.\r\n\r\nConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.\r\n\r\nConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.\r\n\r\nConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.\r\n\r\nL\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle premier\r\nTous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 2\r\n1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation. \r\n2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 3\r\nTout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 4\r\nNul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 5\r\nNul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 6\r\nChacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 7\r\nTous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 8\r\nToute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 9\r\nNul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 10\r\nToute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 11\r\n1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es. \r\n2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 12\r\nNul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 13\r\n1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat. \r\n2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 14\r\n1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays. \r\n2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 15\r\n1. Tout individu a droit Ã  une nationalitÃ©. \r\n2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 16\r\n1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution. \r\n2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux. \r\n3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 17\r\n1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©.\r\n2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 18\r\nToute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 19\r\nTout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 20\r\n1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques. \r\n2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 21\r\n1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis. \r\n2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays.\r\n3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 22\r\nToute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 23\r\n1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage. \r\n2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal. \r\n3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale. \r\n4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 24\r\nToute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 25\r\n1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©. \r\n2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 26\r\n1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite. \r\n2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix. \r\n3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 27\r\n1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent. \r\n2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 28\r\nToute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 29\r\n1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible. \r\n2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique. \r\n3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 30\r\nAucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.\r\n'),(19,'Ã‰pluchez lâ€™ail et lâ€™oignon. Coupez lâ€™ail en deux, retirez le germe. Coupez lâ€™oignon en petits dÃ©s avec le couteau Ã©minceur. Coupez la viande en cubes de 3 cm de cÃ´tÃ©. Salez-les et poivrez-les.\n\r\n\n\r\nFaites chauffer 1 c. Ã  s. dâ€™huile dans la cocotte. Versez les cubes de viande. Faites-les colorer 5-6 min Ã  feu vif, en remuant avec la spatule. Ajoutez lâ€™ail, lâ€™oignon, 1 brin de thym et le laurier. Laissez revenir le tout 1 min. Incorporez le concentrÃ© de tomate et laissez cuire 1 min en mÃ©langeant soigneusement. Nettoyez les bords de la cocotte avec le pinceau humide. Arrosez de vin blanc. \n\r\n\n\r\nPrÃ©chauffez le four Ã  160 Â°C (th. 5-6) en chaleur tournante.\n\r\n\n\r\nDÃ©collez les sucs de cuisson en grattant avec la spatule et laissez rÃ©duire le vin 3-4 min pour en enlever lâ€™aciditÃ© ; il doit en rester 2-3 c. Ã  s. Versez le fond de veau. Portez Ã  Ã©bullition puis couvrez la cocotte, enfournez et laissez cuire 1 h.\n\r\n\n\r\nPendant ce temps, lavez et Ã©pluchez les carottes et les navets. Coupez les carottes en tronÃ§ons biseautÃ©s de 3 cm de longueur. Coupez les navets en quatre. Grattez les pommes de terre. Ã‰pluchez les petits oignons. Rangez les lÃ©gumes sur un plat et couvrez-les dâ€™un papier absorbant humide. \n\r\n\n\r\nAprÃ¨s 1 h de cuisson, sortez la cocotte du four, ouvrez-la et mÃ©langez. Salez les lÃ©gumes. Ajoutez-les tous. MÃ©langez bien et versez un peu dâ€™eau sâ€™il nâ€™y a pas assez de liquide.\n\r\n\n\r\nNettoyez les bords de la cocotte avec le pinceau humide. Couvrez de nouveau la cocotte, enfournez et laissez cuire 30 min. VÃ©rifiez la cuisson en piquant les lÃ©gumes et la viande avec la pointe dâ€™un couteau. '),(20,'DÃ©posez la viande et les lÃ©gumes sur des assiettes bien chaudes en les nappant dâ€™un peu de jus. GoÃ»tez et rectifiez lâ€™assaisonnement. DÃ©corez chaque assiette dâ€™un brin de thym. Servez immÃ©diatement.'),(21,'  PrÃ©chauffer le four Ã  150 Â°C (th. 3), sortir le beurre, beurrer le ramequin (de bas en haut avec le pinceau, pour que le flan monte facilement), et le mettre Ã  refroidir au rÃ©frigÃ©rateur.\r\nBien laver la courgette sous lâ€™eau courante car on lui laisse sa peau pour donner de la couleur au plat. La couper en 4 dans le sens de la longueur. Si elle contient des pÃ©pins, les enlever Ã  la cuillÃ¨re. Mettre les morceaux dans le panier Ã  vapeur, Ã  cuire 5 mn (niveau dâ€™eau 1).\r\nJeter le jus de cuisson, et transvaser dans le mixeur. Mixer pour une consistance homogÃ¨ne (2 ou 3 impulsions). Puis laisser reposer pour quâ€™elle tiÃ©disse.\r\nBattre lâ€™oeuf dans le saladier ; y ajouter le fromage blanc, la noisette de beurre, puis la courgette tiÃ¨de. MÃ©langer Ã©nergiquement. Transvaser dans le ramequin jusquâ€™Ã  mi-hauteur.\r\nFaire tomber la tempÃ©rature du four Ã  120 Â°C (th. 2). Verser un peu dâ€™eau dans le plat Ã  gratin, y placer le ramequin, et enfourner pour faire cuire le flan au bain-marie pendant 15 Ã  20 mn.\r\nVÃ©rifier que la cuisson est Ã  point en enfonÃ§ant un couteau dans la prÃ©paration : si la lame ressort sans trace, le flan est prÃªt Ã  la dÃ©gustation.\r\n\r\nUne recette lÃ©gÃ¨re et complÃ¨te, digeste et rafraÃ®chissante, fondante sur la langue et douce au palais. Le calcium du fromage blanc et le phosphore de lâ€™Å“uf font de bons os et de belles dents. La densitÃ© en minÃ©raux et en vitamines de la courgette met en grande forme. '),(22,'La veille, prÃ©parez la poÃªlÃ©e de poires : mettez une casserole sur feu vif. Versez peu Ã  peu le sucre. Laissez colorer en tournant sans arrÃªt. Laissez brunir le caramel. Versez lâ€™eau chaude avec prÃ©caution. Faites bouillir. \r\n\r\nÃ‰pluchez les poires Ã  lâ€™Ã©conome. Coupez-les en deux. Ã‰videz le cÅ“ur avec une cuillÃ¨re Ã  pomme parisienne. Avec un Ã©minceur, coupez 2 demi-poires en huit (pour la dÃ©coration de la charlotte) et le reste en tranches plus Ã©paisses. Versez dâ€™abord les gros quartiers dans la casserole. Ajoutez ensuite les tranches fines. Laissez frÃ©mir 5 min. Versez la prÃ©paration dans un grand bol. Couvrez de film alimentaire et laissez refroidir. Ã‰gouttez les morceaux de poire au-dessus dâ€™un grand bol pour recueillir le sirop. RÃ©servez le tout au rÃ©frigÃ©rateur. \r\n\r\nPrÃ©parez la bavaroise au caramel : versez le sucre dans une casserole Ã  feu vif et laissez caramÃ©liser en remuant. Faites chauffer le lait Ã  part. Versez le lait bouillant sur le caramel, sans cesser de remuer. Ã”tez du feu quand Ã§a mousse. Faites ramollir la gÃ©latine dans de lâ€™eau froide. \r\n\r\nVersez les jaunes dâ€™oeufs dans un bol, mÃ©langez-les. Ajoutez peu Ã  peu le lait caramÃ©lisÃ©, sans cesser de remuer. Reversez dans la casserole. Faites cuire Ã  feu doux Â« Ã  la nappe Â». Faites un testÂ : tirez avec un doigt un trait sur la spatule : si la crÃ¨me ne goutte pas sur le trait, elle est Â« Ã  la nappe Â». ArrÃªtez la cuisson. Ã‰gouttez la gÃ©latine ramollie. Ajoutez-la dans la casserole. MÃ©langez bien pour la faire fondre. Versez la crÃ¨me dans un bol. Couvrez de film alimentaire et laissez reposer au rÃ©frigÃ©rateur. \r\n\r\nPrÃ©parez le sirop pour les biscuits en mÃ©langeant lâ€™eau-de-vie avec le sirop au caramel. Posez une grille sur une grande assiette. Trempez trÃ¨s rapidement les biscuits dans ce sirop. Laissez-les sâ€™Ã©goutter sur la grille. Chemisez les parois (cÃ´tÃ© sucrÃ© des biscuits vers lâ€™extÃ©rieur), puis le fond du moule (cÃ´tÃ© sucrÃ© vers lâ€™intÃ©rieur). \r\n\r\n'),(23,'Sortez la crÃ¨me au caramel gÃ©lifiÃ©e du rÃ©frigÃ©rateur. Lissez-la avec un fouet. Versez la crÃ¨me fleurette dans le bol dâ€™un batteur. Faites-la monter. MÃ©langez dÃ©licatement la crÃ¨me fouettÃ©e avec la crÃ¨me au caramel. Remplissez une poche Ã  douille avec cette prÃ©paration. Garnissez le fond de la charlotte dâ€™une couche de bavaroise au caramel. Recouvrez-la, sans appuyer, dâ€™une couche de gros quartiers de poire. Ajoutez une couche de biscuits. Continuez avec une couche de bavaroise. Terminez par des biscuits (cÃ´tÃ© sucrÃ© contre la crÃ¨me). Couvrez la charlotte de film alimentaire et laissez-la reposer 12 h au rÃ©frigÃ©rateur.\r\n\r\n Le jour mÃªme, dÃ©moulez la charlotte. Disposez dessus les tranches fines de poire en rosace. Nappez les poires de gelÃ©e dâ€™abricot chaude avec un pinceau.'),(24,'1. Vous aurez besoin de 2 grands rÃ©cipients pour cette recette : une grande sauteuse et une grande cocotte avec un couvercle.\r\n2. Saler et poivrer lÃ©gÃ¨rement les morceaux de poulet, puis les enrober de farine. Enlever le surplus de farine en excÃ¨s et rÃ©server.\r\n3. Faire chauffer la sauteuse sur feu doux. Ajouter 1c. soupe dâ€™huile et mettre le bacon Ã  griller.\r\n4. Une fois que le bacon est bien dorÃ©, lâ€™enlever de la sauteuse en conservant le gras. Mettre sur feu moyen, ajouter 2-3 c. soupe supplÃ©mentaires dâ€™huile.\r\n5. Lorsque la sauteuse est bien chaude, mettre 3 ou 4 morceaux de poulet Ã  dorer en retournant les morceaux toutes les 4 minutes environ. Veiller Ã  ne pas mettre trop de morceaux en mÃªme temps et recommencer avec tout le poulet.\r\n6. Lorsque le poulet est cuit, placer les morceaux dans la cocotte.\r\n7. Enlever la moitiÃ© de lâ€™huile de la sauteuse, mettre sur feu moyen. Ajouter les champignons et faire cuire pendant 3 minutes. Puis les ajouter au poulet.\r\n8. Ajouter les oignons nouveaux et les gousses dâ€™ail dans la sauteuse, faire dorer lÃ©gÃ¨rement. Ajouter 3 c. soupe de farine et 2 c. soupe de beurre et mÃ©langer. Faire cuire 1 minute puis ajouter au poulet.\r\n9. Ajouter dans la cocotte carotte, cÃ©leri, thym, laurier, le vin, lâ€™eau la base de poulet et le fond de veau. Bien mÃ©langer et porter Ã  Ã©bullition.\r\n10. Laisser Ã  mi-couvert et continuer Ã  faire cuire lentement pendant 1 heure environ.\r\n11. Lorsque le poulet est bien tender, le retirer du feu.\r\n12. Retirer carottes, cÃ©leri, feuilles de laurier, ail et thym.\r\n13. VÃ©rifier lâ€™assaisonnement et rectifier si nÃ©cessaire.\r\n14. Servir avec des pommes de terre rÃ´ties ou tout autre accompagnement.\r\n15. Le coq au vin est meilleur prÃ©parÃ© Ã  lâ€™avance (au moins la veille). Il peut Ãªtre conserve au rÃ©frigÃ©rateur jusquâ€™Ã  3 jours.'),(25,'Laissez infuser 5mn minimum le bouillon Ariake dans 2l d\'eau portÃ©e Ã  Ã©bullition.\r\nFaites revenir les Ã©chalotes et les champignons prÃ©parÃ©s en fines tranches, dans une sauteuse Ã  feu moyen. Ajoutez le riz et remuez jusqu\'Ã  ce qu\'il devienne translucide. \r\n\r\nAjoutez le vin et laissez rÃ©duire. Versez le bouillon louche aprÃ¨s louche juqu\'Ã  complÃ¨te cuisson du riz.\r\nLorsque le riz n\'est plus croquant, ajoutez le beurre, le parmesan, rectifiez l\'assaisonnement.\r\n\r\nAjoutez une derniÃ¨re louche de bouillon et couvrez hors feu 4mn.'),(26,'PrÃ©chauffer votre four Ã  220Â°C\r\n\r\nPorter Ã  Ã©bullition 33cl dâ€™eau, plonger le sachet a infuser dans lâ€™eau frÃ©missante.\r\nCouvrir et laisser infuser 5 minutes Ã  feu doux en remuant de temps en temps puis reserver.\r\n\r\nÃ‰plucher les asperges et les cuire dans de lâ€™eau bouillante salÃ©e. Bien les refroidir pour quâ€™elles restent bien vertes. Eplucher les feuilles dâ€™Ã©pinard puis les plonger dans lâ€™eau bouillante 1 minute. Bien les refroidir. Couper et rÃ©server les pointes dâ€™asperges Dans un bol Â« mixeur Â», mettre les corps dâ€™asperge, les feuilles dâ€™Ã©pinard et le bouillon de volaille AriakÃ© froid. Mixer jusqu\'Ã  consistance bien onctueuse.\r\nAssaisonner.\r\n\r\n'),(27,'Etaler votre pate feuilletÃ©e puis la mouiller a lâ€™aide dâ€™un pinceau, parsemer de graines de sÃ©same puis tailler des lamelles et les enfourner 4 Ã  5 minutes.'),(28,'Verser un peu de gaspacho bien frais dans une assiette creuse ou dans un verre, parsemer le tout avec les pointes dâ€™asperges puis poser la mouillette de sÃ©same.\r\n'),(29,'Infusez les 3 sachets de Bouillon de Coquillages AriakÃ© dans 1 litre dâ€™eau frÃ©missante.\r\n\r\nDans un poÃªlon, faites transpirer lâ€™oignon et lâ€™Ã©chalote Ã©mincÃ©s dans lâ€™huile dâ€™olive. Ajoutez le riz Ã  feu doux jusquâ€™Ã  ce quâ€™il devienne translucide sans cesser de mÃ©langer doucement avec une cuillÃ¨re en bois.\r\n\r\nUne fois le riz translucide, dÃ©glacez avec le verre de vin blanc puis ajoutez louche prÃ¨s louche le Bouillon de Coquillages afin que le riz se gorge progressivement.\r\n\r\nAjoutez ensuite les coquillages, laissez cuire environ 10 min. toujours en mÃ©langeant doucement.\r\nPuis ajoutez la crÃ¨me fraÃ®che et le Parmesan. Laissez cuire encore 10 min. en mÃ©langeant jusquâ€™Ã  obtention dâ€™un aspect crÃ©meux.\r\n\r\nEntre temps, blanchissez les asperges dans un peu dâ€™eau salÃ©e et finissez de les cuire Ã  la poÃªle dans 1 cuillÃ¨re Ã  soupe dâ€™huile dâ€™olive. Ajoutez les pointes dâ€™asperges au risotto crÃ©meux. Servez bien chaud.'),(30,'Infusez les Bouillons de Coquillages AriakÃ© 5 minutes dans 1,33 litre dâ€™eau frÃ©missante (lâ€™Ã©quivalent de 4 bols).\r\nDÃ©layez le safran dans le bouillon et rÃ©servez au chaud.\r\n\r\nDans une sauteuse, faites revenir lâ€™ail, lâ€™oignon et lâ€™Ã©chalote Ã©mincÃ©s. Ajoutez le concentrÃ© de tomate, mÃ©langez. Ajoutez les pommes de terre, les coquillages, les tomates dÃ©coupÃ©es en morceaux. MÃ©langez bien l\'ensemble.\r\n\r\nDÃ©posez ensuite les portions de poisson sur lâ€™ensemble et recouvrez entiÃ¨rement avec le Bouillon de Coquillages AriakÃ© bien chaud.\r\n\r\nTerminez au four quelques minutes. Rectifiez lâ€™assaisonnement. Ã‰mincez le basilic et parsemez chaque assiette avant de servir'),(31,'Infusez le Bouillon de Boeuf AriakÃ© 5 min. dans 66 cl dâ€™eau frÃ©missante (lâ€™Ã©quivalent de 2 bols).\r\n \r\nDans ce bouillon, faites cuire la carotte Ã©mincÃ©e et les champignons taillÃ©s en larges lamelles. Ajoutez le tofu coupÃ© en dÃ©s. Ajoutez quelques gouttes de sauce nuocmam.\r\nRÃ©partissez lâ€™ensemble dans des bols individuels.\r\n\r\nParsemez chaque bol de coriandre fraÃ®chement ciselÃ©e. Servez bien chaud.'),(32,'Infusez les 3 Bouillons de Volaille AriakÃ© 5 min. dans 1 litre dâ€™eau frÃ©missante.\r\n\r\nDisposez les ravioles de foie gras (3/personne) dans de grands bols individuels. Versez-y le Bouillon de Volaille AriakÃ© bien chaud. Parsemez chaque bol de ciboulette fraÃ®chement ciselÃ©e.\r\n* Variante : vous pouvez remplacer les ravioles de foie gras par des ravioles de fromages.'),(33,'Infusez les 3 Bouillons de Coquillages 5 min. dans 1 litre dâ€™eau frÃ©missante. PoÃªlez les Saint-Jacques avec la matiÃ¨re grasse (beurre ou huile dâ€™olive), puis rÃ©servez.\r\n\r\nFaites revenir carottes et blanc de poireaux Ã©mincÃ©s dans la matiÃ¨re grasse. RÃ©partissez les Saint-Jacques, les lÃ©gumes et la citronnelle dans des assiettes creuses.\r\n\r\nRecouvrez chaque assiette Ã  mi-hauteur de Bouillon de Coquillages AriakÃ© bien chaud.\r\n \r\nAvant de servir, parsemez chaque assiette de coriandre fraÃ®che ciselÃ©e. Servez chaud.'),(34,'Infusez le sachet de Bouillon de Boeuf AriakÃ© 5 Ã  8 minutes dans 33 cl dâ€™eau frÃ©missante (lâ€™Ã©quivalent dâ€™un bol).\r\n\r\nDans une poÃªle, faites revenir les cÃ´tes dâ€™agneau, puis rÃ©servez-les au chaud.\r\n\r\nDÃ©glacez la poÃªle en versant le Bouillon de Boeuf AriakÃ© et la branche de thym. Ã€ lâ€™aide dâ€™une cuillÃ¨re en bois, grattez le fond de la poÃªle pour rÃ©cupÃ©rer les sucs\r\nde cuisson de la viande. Portez Ã  Ã©bullition le bouillon, faites rÃ©duire, puis ajoutez le beurre en fouettant.\r\n\r\nVersez sur les cÃ´tes d\'agneau. Servez immÃ©diatement.'),(35,'Infusez le Bouillon de Volaille AriakÃ© 5 minutes dans 66 cl dâ€™eau frÃ©missante (lâ€™Ã©quivalent de 2 bols) et laissez refroidir. Montez la crÃ¨me fraÃ®che en chantilly.\r\n\r\nCuisez les petits pois. Blanchissez la roquette dans un peu dâ€™eau portÃ©e Ã  Ã©bullition.\r\nDans un peu de bouillon chaud, mixez les petits pois et la roquette, laissez refroidir.\r\n\r\nMÃ©langez le tout dÃ©licatement avec la chantilly. DÃ©posez dÃ©licatement sur le bouillon froid. Servez frais.'),(36,'Infusez le bouillon de votre choix 5 min. dans 33 cl (lâ€™Ã©quivalent dâ€™un bol) dâ€™eau frÃ©missante.\r\n\r\nAjoutez 1 cuillÃ¨re Ã  cafÃ© dâ€™agar-agar dans le bouillon et portez Ã  Ã©bullition. Versez 1 cm de bouillon dans chaque verrine et laissez figer au congÃ©lateur.\r\n\r\nSortez les verrines et disposez par dessus le bouillon figÃ© le produit de votre choix (oeuf pochÃ©, saumon, lÃ©gumeâ€¦). Recouvrez entiÃ¨rement de Bouillon AriakÃ©.\r\n\r\nRemettez les verrines au congÃ©lateur et sortez-les suivant le degrÃ© de croquant que vous souhaitez.\r\nServez en cocktail ou entrÃ©e apÃ©ritive.'),(37,'MÃªlez les amandes avec le miel et le sucre. Disposez-les sur la tÃ´le du four et faites les caramÃ©liser 5 min. sous le grill. Laissez-les refroidir.\r\n\r\nBattez les oeufs en neige ferme. Montez la crÃ¨me Chantilly et ajoutez-lui le sucre glace, les blancs en neige, les fruits confits macÃ©rÃ©s et les amandes grillÃ©es. \r\n\r\nVersez la prÃ©paration dans les pyramides et mettez au congÃ©lateur 2 heures. DÃ©moulez au moment de servir.'),(38,'Tamisez la farine avec la levure, puis incorporez le sucre glace, la poudre dâ€™amande. MÃ©langez les poudres, puis le blanc dâ€™oeufs. Incorporer le beurre noisette chaud avec le mÃ©lange puis la vanille liquide. \r\n\r\nUne fois le mÃ©lange obtenu, moulez le plus rapidement possible votre appareil, puis faites cuire au four 15 minutes Ã  220-240Â°C (th.7/8).'),(39,'Travaillez le beurre ramolli avec le sucre. Ajoutez progressivement les oeufs et la farine tamisÃ©e avec la levure. Ne pas trop travailler la masse. Versez le chocolat hachÃ© Ã  la fi n et mÃ©langez. Garnissez les moules Ã  cake. \r\n'),(40,'Faites cuire Ã  200Â°C (th.6-7) durant environ 30 minutes.'),(41,'Lavez les cerises, sÃ©chez-les avec du papier absorbant, Ã©queutez-les et dÃ©noyautez-les.\r\nMettez la farine en fontaine dans une bassine. Ajoutez au milieu les oeufs, le sucre, une pincÃ©e de sel et dÃ©layez au fouet en absorbant la farine peu Ã  peu. DÃ©tendez progressivement en ajoutant le lait, et terminez lâ€™opÃ©ration en incorporant 30 gr de beurre fondu. Aromatisez dâ€™une goutte de kirsch et dâ€™un jus de citron, et travaillez soigneusement le tout pour obtenir une pÃ¢te souple et homogÃ¨ne. MÃ©langez les cerises Ã  la pÃ¢te et coulez cette pÃ¢te dans les moules. Mettez une noisette de beurre sur chaque Coeur.'),(42,'Mettez Ã  cuire environ 20-25 minutes Ã  four chaud, 220Â°C (th. 7). Servez tiÃ¨de ou froid.'),(43,'MÃ©langer le sucre glace et la poudre dâ€™amandes. Tamiser. Monter trÃ¨s fermement les blancs dâ€™oeufs avec le sucre semoule. Verser en pluie le mÃ©lange amandes/sucre glace sur les blancs en neige.\r\n\r\nMacaroner en soulevant la masse dÃ©licatement Ã  la spatule jusquâ€™Ã  une brillance de lâ€™appareil.\r\n\r\nColorer lâ€™appareil Ã  macaron selon les parfums et utilisations.\r\nDresser des petits macarons Ã  la poche Ã  douille sur la feuille de cuisson et laisser croÃ»ter Ã  lâ€™air libre au moins 30 minutes.\r\nCuire Ã  180Â°C pendant 8 minutes.\r\n\r\nLaisser refroidir les macarons et les dÃ©coller.\r\nSouder les macarons 2 par 2 en les garnissant de ganache ou de confi ture.\r\n\r\nLaisser ensuite durcir les macarons au rÃ©frigÃ©rateur pendant au moins 24 heures avant de les dÃ©guster.'),(44,'Verser la poudre dâ€™amandes et le sucre glace dans la cuve du mixer. Faire tourner quelques minutes afin dâ€™affiner le Â«tant pour tant Â». Tamiser ensuite ce mÃ©lange. RÃ©server.\r\n\r\nDans une casserole, mÃ©langer le sucre et lâ€™eau, puis faire chauffer. Plonger le thermomÃ¨tre dans le sirop pour contrÃ´ler sa tempÃ©rature.\r\nPendant ce temps, monter un blanc dâ€™oeuf en neige ferme.\r\nDÃ©s que le thermomÃ¨tre indique 118Â°C, retirer la casserole du feu, baisser la vitesse du batteur (vitesse moyenne), et verser petit Ã  petit le sucre cuit sur le blanc montÃ©, en prenant soin de le faire couler sur les bords du bol afin dâ€™Ã©viter toute projection de sucre. Quand tout le sirop est versÃ©, faire tourner de nouveau le batteur Ã  pleine vitesse pour refroidir la meringue italienne (environ 40Â°C).\r\nAjouter Ã  ce moment lÃ  lâ€™arÃ´me ou le colorant. ArrÃªter le batteur quand la meringue est bien lisse, brillante et assez consistante, dite au Â«bec dâ€™oiseauÂ», car elle forme un lÃ©ger bec au bout du fouet.\r\n\r\nPendant ce temps, verser le blanc dâ€™oeuf restant sur le tant pour tant et mÃ©langer Ã  lâ€™aide dâ€™une spatule : on doit obtenir une pÃ¢te dâ€™amandes assez Ã©paisse.\r\nIncorporer une partie de la meringue italienne dans le mÃ©lange Â« tant pour tant Â» afin de dÃ©tendre le tout. Ajouter le restant de meringue et macaroner en soulevant la masse dÃ©licatement.\r\n\r\nSur la feuille de cuisson, et Ã  lâ€™aide dâ€™une poche Ã  douille (douille 8 mm), faire des petits macarons. Taper lÃ©gÃ¨rement la plaque sur le plan de travail pour Ã©galiser leur surface.\r\nLaisser croÃ»ter au moins 30 minutes Ã  tempÃ©rature ambiante. Enfourner 8 minutes Ã  150Â°C.\r\n\r\nLaisser complÃ¨tement refroidir les coques avant de les garnir de ganache ou de confiture Ã  lâ€™aide dâ€™une poche Ã  douille. Fermer ensuite chaque macaron avec une coque sans ganache. Laisser ensuite durcir les macarons au rÃ©frigÃ©rateur pendant au moins 24 heures avant de les dÃ©guster.\r\n'),(45,'Mettez la farine dans une bassine et ajoutez les oeufs un Ã  un, le lait et mÃ©langez Ã©nergiquement jusquâ€™Ã  obtenir une pÃ¢te homogÃ¨ne. Ajouter le gruyÃ¨re rÃ¢pÃ©, salez, poivrez et mÃ©langez Ã  nouveau. \r\n\r\nFaites revenir lÃ©gÃ¨rement les lardons Ã  la poÃªle et disposez-les ensuite dans le moule Ã  tarte. Recouvrez de la pÃ¢te.'),(46,'Faites cuire au four chaud Ã  225Â°C (th 7-8) pendant environ 40 minutes.'),(47,'Portez 20 cl de lait et la vanille Ã  Ã©bullition. Blanchissez les jaunes dâ€™oeufs avec le sucre. Ajoutez la farine et la fÃ©cule tamisÃ©e, puis le reste du lait froid. MÃ©langer jusquâ€™Ã  obtention dâ€™une pÃ¢te lisse. Ajoutez ensuite 1/3 du lait vanillÃ© bouillant, puis le reste tout en mÃ©langeant. Remettez le tout Ã  feu moyen et amenez Ã  Ã©bullition sans cesser de remuer. Maintenez lâ€™Ã©bullition 20 secondes. Versez la crÃ¨me dans un rÃ©cipient froid.'),(48,'Etalez la pÃ¢te Ã  brioche dans le moule Ã  tarte rond. Garnissez aussitÃ´t avec la crÃ¨me pÃ¢tissiÃ¨re froide jusquâ€™Ã  1 cm du bord. Rangez les abricots en demi, ou en quartiers sâ€™ils sont gros, aprÃ¨s les avoir lavÃ©s, Ã©gouttÃ©s et dÃ©noyautÃ©s. Laissez lever la pÃ¢te dans un endroit tempÃ©rÃ© (30Â°C). Dorez la bordure et faites cuire Ã  200Â°C (th. 6-7) pendant 20 minutes. AprÃ¨s refroidissement, lustrez au nappage bouillant.'),(49,'Faites fondre le beurre doucement dans une casserole et, dans une autre casserole, fondre le chocolat au bain-marie. SÃ©parez les blancs des jaunes dâ€™oeufs. Dans une bassine, fouettez les jaunes avec la moitiÃ© du sucre glace et le sachet de sucre vanillÃ©. Montez les blancs en neige avec une pincÃ©e de sel et ajoutez-leur le reste du sucre glace. Ajoutez le beurre dans le mÃ©lange jaunes dâ€™oeufs et sucre glace. Travaillez pour obtenir un bon amalgame. Ajoutez Ã  cette prÃ©paration le chocolat fondu, la farine et la maÃ¯zena. MÃ©langez Ã  lâ€™aide dâ€™une spatule.\r\n\r\nIncorporez alors dÃ©licatement les blancs dâ€™oeufs en soulevant la masse par le dessous pour ne pas briser la texture des blancs en neige. Versez la pÃ¢te dans le moule Coeur.\r\n'),(50,'Cuisez Ã  four Ã  150Â°C (th. 5) pendant 40 minutes environ. DÃ©moulez tiÃ¨de ou froid.\r\nSaupoudrez de sucre glace.'),(51,'Epluchez les pommes de terre, lavez-les et dÃ©coupez-les en fines rondelles. Emincez les oignons. Hachez lâ€™ail. Beurrez lÃ©gÃ¨rement le moule rectangulaire. Disposez la moitiÃ© des rondelles de pommes terre au fond du moule. Disposez les oignons, lâ€™ail, saupoudrez dâ€™herbes de Provence de la moitiÃ© du gruyÃ¨re rÃ¢pÃ©. Salez, poivrez. Mettre quelques noisettes de beurre. Finissez de garnir avec le reste des pommes de terre. Dans un bol, mÃ©langez la crÃ¨me liquide avec la cuillÃ¨re de farine. Versez la crÃ¨me sur les pommes de terre. Mettre le reste du beurre en noisettes sur le plat, puis le reste du gruyÃ¨re rÃ¢pÃ©. '),(52,'Faites cuire au four Ã  180 Â°C (th.6) pendant 1 heure environ.'),(53,'MÃ©langez la levure Ã©miettÃ©e, 1/4 l. de lait tiÃ¨de et environ 150 gr. de farine. On doit obtenir une pÃ¢te un peu molle : le levain. Laissez-le lever dans un endroit tiÃ¨de.Faites gonfler les raisins dans de lâ€™eau tiÃ¨de. PÃ©trissez la farine, les oeufs, le reste du lait, le sucre et le sel jusquâ€™Ã  ce que la pÃ¢te ne colle plus (10 minutes environ). Incorporez le beurre ramolli et le levain qui doit avoir doublÃ© de volume. Travaillez la pÃ¢te encore quelques instants. La couvrir dâ€™un linge et la laisser lever 1 heure dans un endroit tiÃ¨de. La tapoter pour la faire retomber. Incorporez les raisins Ã©gouttÃ©s. RÃ©partissez les amandes dans le moule Ã  Kougloff et versez la pÃ¢te. Laissez la pÃ¢te Ã  nouveau monter.\r\n'),(54,'Enfournez Ã  150Â°C (th. 5) environ 45 minutes.'),(55,'MÃ©langez bien le sucre, le beurre ramolli et la levure avec le liquide choisi. SÃ©parez le jaune dâ€™oeuf du blanc. Travaillez le mÃ©lange prÃ©cÃ©dent avec la farine et le jaune dâ€™oeuf. Lorsque la prÃ©paration est parfaitement homogÃ¨ne, ajoutez les raisins secs.\r\n\r\nIncorporez ensuite dÃ©licatement le blanc battu en neige ferme. Versez la prÃ©paration dans le moule Ã  cake. '),(56,'Faites cuire Ã  four chaud 220Â°C (th. 7-8) pendant 10 minutes, puis prolongez la cuisson Ã  feu doux, 160Â°C (th.5-6) pendant 40 minutes.\r\nDÃ©moulez Ã  chaud.'),(57,'MÃ©langez le sucre, la vanille (ou citron) et la moitiÃ© du lait avec les oeufs entiers jusquâ€™Ã  ce que le mÃ©lange devienne mousseux. Versez la farine en pluie avec la levure en remuant. Ajoutez le restant du lait. Incorporez le beurre fondu tiÃ¨de. Garnissez les moules Ã  la poche Ã  douilles ou Ã  la petite cuillÃ¨re. Laissez reposer quelques minutes. '),(58,'Faites cuire dans le bas du four Ã  200-220Â°C (th. 6-7) pendant environ 15 minutes. DÃ©moulez aussitÃ´t.Laissez refroidir sur une grille.'),(59,'PrÃ©chauffez le four Ã  150Â°C (thermostat 5). Dans une bassine conique, mÃ©langez le beurre ramolli et le sucre en poudre jusquâ€™Ã  ce que le mÃ©lange prenne une consistance crÃ©meuse. Ajoutez les oeufs un par un en mÃ©langeant vigoureusement, puis la farine, le sel et la levure, en alternant avec le lait en fi let. Travaillez le mÃ©lange aussi rapidement que possible Ã  lâ€™aide dâ€™une spatule afi n dâ€˜obtenir une pÃ¢te bien aÃ©rÃ©e.\r\nAjoutez lâ€™extrait de vanille liquide, puis les myrtilles, sans cesser de mÃ©langer. Versez la prÃ©paration dans les moules et saupoudrez de sucre glace. '),(60,'Enfournez environ 30 minutes. DÃ©gustez tiÃ¨de.'),(61,'Nettoyer les concombres en fleur, puis rÃ©server au rÃ©frigÃ©rateur. Ajouter 100 g dâ€™eau de cornichons et le Kappa dans un poÃªlon. Porter Ã  Ã©bullition. Baigner les concombres deux fois dans le mÃ©lange tiÃ¨de avant de les conserver au rÃ©frigÃ©rateur.'),(62,'DÃ©tailler les cÃ¨pes en lamelles de 0,3 cm dâ€™Ã©paisseur.\r\n\r\nMÃ©langer le bouillon avec le Kappa et porter Ã  Ã©bullition jusquâ€™Ã  dissolution complÃ¨te. Introduire une lamelle de cÃ¨pe dans le mÃ©lange, puis dÃ©poser sur un rÃ©cipient plat. Recommencer lâ€™opÃ©ration avec le reste des lamelles.'),(63,'MÃ©langer le Gellan au bouillon, puis malaxer. Porter Ã  Ã©bullition et couler dans un rÃ©cipient. Laisser coaguler, puis dÃ©tailler des rectangles de 0,15 cm dâ€™Ã©paisseur Ã  la mandoline. \r\n\r\nEnrouler chaque rectangle Ã  lâ€™aide de la barrette afin dâ€™obtenir des macaronis.'),(64,'MÃ©langer les trois ingrÃ©dients, puis porter Ã  Ã©bullition. Laisser coaguler dans un rÃ©cipient plat. '),(65,'DÃ©tailler en bandelettes de 0,5 mm de large afin dâ€™obtenir les tagliatelles.'),(66,'MÃ©langer le lait avec lâ€™Iota, puis mixer jusquâ€™Ã  dissolution. Chauffer Ã  80 Â°C dans un poÃªlon, puis laisser gÃ©lifier au rÃ©frigÃ©rateur'),(67,'MÃ©langer le jus dâ€™ananas avec lâ€™Iota, puis placer dans un poÃªlon. Faire frÃ©mir et laisser gÃ©lifier au rÃ©frigÃ©rateur.'),(68,'MÃ©langer le bouillon de langoustines salÃ© avec lâ€™Agar. Porter Ã  Ã©bullition Ã  feu moyen sans cesser de mÃ©langer. Laisser coaguler au rÃ©frigÃ©rateur au moins 2 h, puis chauffer Ã  la  salamandre lors du service.'),(69,'MÃ©langer 1/4 de la qunatitÃ© dâ€™eau avec de lâ€™agar-agar en poudre. Porter Ã  Ã©bullition Ã  feu modÃ©rÃ© sans cesser de remuer.\r\nRetirer du feu, puis ajouter le reste dâ€™eau au basilic salÃ©e.Ã‰cumer. Laisser coaguler dans un rÃ©cipient carrÃ© Ã  hauteur dâ€™1 cm.\r\n\r\nLaisser au rÃ©frigÃ©rateur pendant au mois 3 heures.'),(70,'MÃ©langer le parmesan avec lâ€™eau, puis chauffer progressivement jusquâ€™Ã  lâ€™obtention dâ€™une tempÃ©rature de 80 Â°C.\r\nLaisser infuser 30 minutes avant de passer.\r\n\r\nIncorporer 1,3 g de Lecite par portion de 250 g de sÃ©rum de parmesan obtenu. Activer le mixeur Ã  la surface du liquide, laisser stabiliser une minute, puis recueillir lâ€™air qui sâ€™est formÃ© sur la partie supÃ©rieure. Congeler lâ€™air dans le rÃ©cipient de votre choix.'),(71,'MÃ©langer les trois ingrÃ©dients, puis activer le mixeur Ã  la surface du liquide.\r\nLaisser stabiliser une minute, puis recueillir lâ€™air qui sâ€™est formÃ© sur la partie supÃ©rieure.'),(72,'Ajouter lâ€™Algin dans une proportion Ã©quivalente Ã  1/3 de la quantitÃ© de jus de melon, puis mixer. Ajouter les 2/3 restants, passer et rÃ©server. Dissoudre le Calcic dans lâ€™eau.\r\nRemplir 4 seringues avec le mÃ©lange de melon et dâ€™Algin. Dresser goutte Ã  goutte sur la base de Calcic. Retirer au bout dâ€™une minute, passer, puis laver le caviar obtenu Ã  lâ€™eau froide.'),(73,'Mixer le Citras avec 250 g dâ€™eau, ajouter lâ€™Algin, puis mixer de nouveau. Faire frÃ©mir,\r\nlaisser refroidir, puis mÃ©langer avec la purÃ©e de mangue. MÃ©langer 1.000 g dâ€™eau au Calcic, puis y verser le contenu dâ€™une cuillÃ¨re de dosage remplie du mÃ©lange de mangue et dâ€™Algin, laisser reposer 2 minutes, puis rincer Ã  lâ€™eau froide. Recommencer lâ€™opÃ©ration avec le reste des raviolis.'),(74,'MÃ©langer 400 g dâ€™eau, le thÃ© et 20 g de sucre Ã  froid, puis laisser macÃ©rer au rÃ©frigÃ©rateur pendant 24 heures. Passer. \r\n\r\nMÃ©langer le jus de citron avec 5 g de sucre, congeler dans un bac Ã  glaÃ§ons. Mixer lâ€™Algin avec 75 g dâ€™eau. Diluer le Calcic dans 500 g dâ€™eau. MÃ©langer lâ€™infusion de thÃ© avec la base dâ€™Algin, puis laisser reposer. Refroidir au congÃ©lateur sans arriver au point de congÃ©lation. Placer un glaÃ§on au citron dans une cuillÃ¨re de dosage de 3 cm, que lâ€™on terminera de remplir avec la base de thÃ©. Introduire 30 secondes dans le bain de Calcic. \r\nNettoyer le ravioli Ã  lâ€™eau froide.'),(75,'Mettre ensemble dans une jatte la sangria et le Xantana.\r\nBien les mÃ©langer Ã  lâ€™aide dâ€™un mixeur.\r\nFiltrer et emballer sous vide afin de supprimer les bulles retenues Ã  lâ€™intÃ©rieur du mÃ©lange. La consistance obtenue permet de maintenir en suspension diffÃ©rents Ã©lÃ©ments: aromates, fruits, caviar sphÃ©rique...'),(76,'MÃ©langer les trois ingrÃ©dients et les faire Ã©mulsionner Ã  lâ€™aide dâ€™un mixeur jusquâ€™Ã  obtention dâ€™une Ã©mulsion onctueuse et sans grumeaux. Conserver au rÃ©frigÃ©rateur. Cette crÃ¨me accompagnera lâ€™huÃ®tre et sa perle.'),(77,'MÃ©langer les deux ingrÃ©dients Ã  tempÃ©rature ambiante puis les mixer dans un blender jusquâ€™Ã  obtention dâ€™un mÃ©lange sans grumeaux. Filtrer et laisser reposer 24 h au rÃ©frigÃ©rateur.'),(78,'MÃ©langer les fÃ¨ves tendres Ã©pluchÃ©es avec le mÃ©lange de Metil. Faire 8 boulettes de 8,5 g chacune. RÃ©server au rÃ©frigÃ©rateur.\r\nPlonger les boulettes dans de lâ€™eau salÃ©e portÃ©e Ã  90 Â°C et faire cuire 1 min.'),(79,'MÃ©langer lâ€™Isomalt, le glucose et le Sucro et faire cuire le tout Ã  160 Â°C (les 5 Â°C manquants seront atteints grÃ¢ce Ã  la chaleur elle-mÃªme). Pendant que le caramel cuit, dissoudre Glice dans lâ€™huile dâ€™olive vierge Ã  50 Â°C. Lorsque le caramel est Ã  160 Â°C, y verser lâ€™huile dâ€™olive en fin filet et lâ€™incorporer Ã  lâ€™aide dâ€™une spatule. Lorsque le caramel a absorbÃ© toute lâ€™huile dâ€™olive, Ã©taler le mÃ©lange sur du papier sulfurisÃ©.\r\nCe caramel permet de rÃ©aliser toutes sortes de formes, comme, par exemple, la spirale\r\ndâ€™huile dâ€™olive.'),(80,'Dissoudre la gÃ©latine avec un tiers de lâ€™eau dâ€™olive portÃ©e Ã  tempÃ©rature moyenne puis ajouter le reste de lâ€™eau. Ajouter le Sucro et passer au mixeur. En mÃªme temps, faire dissoudre le Glice dans la graisse dâ€™olive noire, chauffÃ©e Ã  environ 50 Â°C.\r\nIncorporer peu Ã  peu la graisse Ã  lâ€™eau dâ€™olive noire tout en mariant les deux Ã  lâ€™aide du mixer. Garder au rÃ©frigÃ©rateur pendant 2 h. Lorsque le mÃ©lange a pris, en dÃ©tailler 10 parts de 0,2 g chacune.\r\nCette Ã©mulsion sert de garniture au disque de mangue.');
/*!40000 ALTER TABLE `recipeStep_description` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeStep_recipe`
--

DROP TABLE IF EXISTS `recipeStep_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeStep_recipe` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeStep_recipe`
--


/*!40000 ALTER TABLE `recipeStep_recipe` DISABLE KEYS */;
INSERT INTO `recipeStep_recipe` VALUES (1,'1'),(2,'2'),(3,'2'),(4,'3'),(5,'3'),(6,'3'),(7,'4'),(8,'5'),(9,'5'),(10,'5'),(11,'5'),(12,'6'),(13,'7'),(14,'7'),(15,'8'),(16,'8'),(17,'9'),(18,'9'),(19,'10'),(20,'10'),(21,'11'),(22,'12'),(23,'12'),(24,'13'),(25,'14'),(26,'15'),(27,'15'),(28,'15'),(29,'16'),(30,'17'),(31,'18'),(32,'19'),(33,'20'),(34,'21'),(35,'22'),(36,'23'),(37,'24'),(38,'25'),(39,'26'),(40,'26'),(41,'27'),(42,'27'),(43,'28'),(44,'29'),(45,'30'),(46,'30'),(47,'31'),(48,'31'),(49,'32'),(50,'32'),(51,'33'),(52,'33'),(53,'34'),(54,'34'),(55,'35'),(56,'35'),(57,'36'),(58,'36'),(59,'37'),(60,'37'),(61,'38'),(62,'39'),(63,'40'),(64,'41'),(65,'41'),(66,'42'),(67,'43'),(68,'44'),(69,'45'),(70,'46'),(71,'47'),(72,'48'),(73,'49'),(74,'50'),(75,'51'),(76,'52'),(77,'53'),(78,'53'),(79,'54'),(80,'55');
/*!40000 ALTER TABLE `recipeStep_recipe` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:32
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeStep_title`
--

DROP TABLE IF EXISTS `recipeStep_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeStep_title` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeStep_title`
--


/*!40000 ALTER TABLE `recipeStep_title` DISABLE KEYS */;
INSERT INTO `recipeStep_title` VALUES (1,'PrÃ©paration'),(2,'PrÃ©paration'),(3,'Finition'),(4,'PrÃ©paration et cuisson des moules'),(5,'RÃ©alisation de la crÃ¨me de moules'),(6,'Finition'),(7,'PrÃ©paration'),(8,'PrÃ©paration des calamaretti '),(9,'PrÃ©paration du citron confit'),(10,'Cuisson des calamaretti'),(11,'Finition et prÃ©paration'),(12,'PrÃ©paration'),(13,'PrÃ©paration'),(14,'Finition et dressage'),(15,'PrÃ©paration'),(16,'Cuisson'),(17,'PrÃ©paration'),(18,'Cuisson'),(19,'PrÃ©paration et cuisson'),(20,'Finition et dressage'),(21,'PrÃ©paration'),(22,'PrÃ©paration'),(23,'Dressage et finition'),(24,'PrÃ©paration'),(25,'PrÃ©paration'),(26,'Gaspacho d\'asperge'),(27,'Mouillettes de graines de sÃ©same'),(28,'Dressage'),(29,'PrÃ©paration'),(30,'PrÃ©paration'),(31,'PrÃ©paration'),(32,'PrÃ©paration'),(33,'PrÃ©paration'),(34,'PrÃ©paration'),(35,'PrÃ©paration'),(36,'PrÃ©paration'),(37,'PrÃ©paration'),(38,'PrÃ©paration'),(39,'PrÃ©paration '),(40,'Cuisson'),(41,'PrÃ©paration'),(42,'Cuisson'),(43,'PrÃ©paration'),(44,'PrÃ©paration'),(45,'PrÃ©paration'),(46,'Cuisson'),(47,'CrÃ¨me pÃ¢tissiÃ¨re'),(48,'Tarte'),(49,'PrÃ©paration'),(50,'Cuisson'),(51,'PrÃ©paration'),(52,'Cuisson'),(53,'PrÃ©paration'),(54,'Cuisson'),(55,'PrÃ©paration'),(56,'Cuisson'),(57,'PrÃ©paration'),(58,'Cuisson'),(59,'PrÃ©paration'),(60,'Cuisson'),(61,'PrÃ©paration'),(62,'PrÃ©paration'),(63,'PrÃ©paration'),(64,'PrÃ©paration'),(65,'PrÃ©sentation'),(66,'PrÃ©paration'),(67,'PrÃ©paration'),(68,'PrÃ©paration'),(69,'PrÃ©paration'),(70,'PrÃ©paration'),(71,'PrÃ©paration'),(72,''),(73,'PrÃ©paration'),(74,'PrÃ©paration'),(75,''),(76,'PrÃ©paration'),(77,'PrÃ©paration'),(78,'Pour les boulettes de fÃ¨ves tendres'),(79,'PrÃ©paration'),(80,'PrÃ©paration');
/*!40000 ALTER TABLE `recipeStep_title` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:33
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeTool`
--

DROP TABLE IF EXISTS `recipeTool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeTool` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeTool`
--


/*!40000 ALTER TABLE `recipeTool` DISABLE KEYS */;
INSERT INTO `recipeTool` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82);
/*!40000 ALTER TABLE `recipeTool` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:33
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeToolProduct`
--

DROP TABLE IF EXISTS `recipeToolProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeToolProduct` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeToolProduct`
--


/*!40000 ALTER TABLE `recipeToolProduct` DISABLE KEYS */;
INSERT INTO `recipeToolProduct` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80);
/*!40000 ALTER TABLE `recipeToolProduct` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:33
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeToolProduct_product`
--

DROP TABLE IF EXISTS `recipeToolProduct_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeToolProduct_product` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeToolProduct_product`
--


/*!40000 ALTER TABLE `recipeToolProduct_product` DISABLE KEYS */;
INSERT INTO `recipeToolProduct_product` VALUES (1,'10176'),(2,'10088'),(3,'10608'),(4,'10382'),(5,'10176'),(6,'10667'),(7,'10176'),(8,'10239'),(9,'1492'),(10,'10648'),(11,'10325'),(12,'1372'),(13,'10648'),(14,'10228'),(15,'10530'),(16,'10620'),(17,'10347'),(18,'10613'),(19,'10620'),(20,'10608'),(21,'10088'),(22,'10313'),(23,'10228'),(24,'105830'),(25,'1525484614'),(26,'10088'),(27,'10530'),(28,'10620'),(29,'10502'),(30,'10228'),(31,'10088'),(32,'10608'),(33,'10176'),(34,'10176'),(35,'10161'),(36,'10176'),(37,'10176'),(38,'10648'),(39,'10648'),(40,'10530'),(41,'10176'),(42,'10015'),(43,'10415'),(44,'10176'),(45,'10040'),(46,'10039'),(47,'10530'),(48,'10530'),(49,'10608'),(50,'10088'),(51,'10675'),(52,'10382'),(53,'10176'),(54,'10530'),(55,'10228'),(56,'10675'),(57,'10088'),(58,'10608'),(59,'10648'),(60,'10070'),(61,'10509'),(62,'10041'),(63,'10176'),(64,'10228'),(65,'10510'),(66,'10511'),(67,'10043'),(68,'10043'),(69,'10608'),(70,'10088'),(71,'10035'),(72,'10176'),(73,'10176'),(74,'10176'),(75,'10176'),(76,'2571'),(77,'10176'),(78,'10176'),(79,'10382'),(80,'10228');
/*!40000 ALTER TABLE `recipeToolProduct_product` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:33
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeToolProduct_recipe`
--

DROP TABLE IF EXISTS `recipeToolProduct_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeToolProduct_recipe` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeToolProduct_recipe`
--


/*!40000 ALTER TABLE `recipeToolProduct_recipe` DISABLE KEYS */;
INSERT INTO `recipeToolProduct_recipe` VALUES (1,'1'),(2,'2'),(3,'2'),(4,'2'),(5,'2'),(6,'3'),(7,'4'),(8,'4'),(9,'4'),(10,'5'),(11,'5'),(12,'5'),(13,'7'),(14,'7'),(15,'8'),(16,'8'),(17,'9'),(18,'9'),(19,'9'),(20,'9'),(21,'9'),(22,'9'),(23,'9'),(24,'11'),(25,'11'),(26,'11'),(27,'11'),(28,'11'),(29,'12'),(30,'12'),(31,'12'),(32,'12'),(33,'15'),(34,'16'),(35,'17'),(36,'17'),(37,'18'),(38,'20'),(39,'21'),(40,'22'),(41,'22'),(42,'24'),(43,'25'),(44,'25'),(45,'26'),(46,'27'),(47,'27'),(48,'28'),(49,'28'),(50,'28'),(51,'28'),(52,'29'),(53,'29'),(54,'29'),(55,'29'),(56,'29'),(57,'29'),(58,'29'),(59,'30'),(60,'30'),(61,'31'),(62,'32'),(63,'32'),(64,'32'),(65,'33'),(66,'34'),(67,'35'),(68,'36'),(69,'36'),(70,'36'),(71,'37'),(72,'43'),(73,'44'),(74,'45'),(75,'46'),(76,'48'),(77,'49'),(78,'54'),(79,'54'),(80,'54');
/*!40000 ALTER TABLE `recipeToolProduct_recipe` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:33
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeTool_name`
--

DROP TABLE IF EXISTS `recipeTool_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeTool_name` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeTool_name`
--


/*!40000 ALTER TABLE `recipeTool_name` DISABLE KEYS */;
INSERT INTO `recipeTool_name` VALUES (1,'1 casserole'),(2,'4 verres'),(3,'1 mixer'),(4,'Poche Ã  douille'),(5,'1 casserole'),(6,'1 thermomÃ¨tre'),(7,'1 bol'),(8,'1 couteau d\'office'),(9,'1 batteur'),(10,'Papier sulfurisÃ©'),(11,'1 couteau Ã  Ã©mincer'),(12,'1 faitout'),(13,'1 plat'),(14,'1 chinois ou une passoire fine'),(15,'1 poÃªle'),(16,'1 fouet'),(17,'1 mixeur blender ou 1 mixeur plongeant'),(18,'2 casseroles'),(19,'1 couteau Ã  filet de sole'),(20,'1 pinceau'),(21,'1 plaque de cuisson'),(22,'1 brochettes en bois'),(23,'Papier absorbant'),(24,'1 couteau Ã©minceur'),(25,'1 mixeur plongeant'),(26,'1 passoire fine'),(27,'1 poÃªle'),(28,'1 couteau'),(29,'1 sautoir'),(30,'Torchon'),(31,'1 saladier'),(32,'1 couteau'),(33,'1 fourchette'),(34,'1 poÃªle'),(35,'1 spatule'),(36,'1 plaque en silicone de 6 moules ronds de 7 cm de diamÃ¨tre'),(37,'1 saladier'),(38,'1 fouet'),(39,'1 maryse'),(40,'1 cuillÃ¨re Ã  soupe'),(41,'1 couteau Ã©minceur'),(42,'1 casserole'),(43,'1 tamis ou une passoire fine'),(44,'Papier sulfurisÃ©'),(45,'1 maryse (spatule en silicone)'),(46,'1 poche Ã Â  douille'),(47,'1 douille unie nÂ°10'),(48,'2 plaques Ã Â  patisserie'),(49,'1 spatule largePrÃ©ambule ConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.  ConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.  ConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.  ConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.  ConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.  ConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.  ConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.  L\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.  HAUT DE PAGE  Article premier Tous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.  HAUT DE PAGE  Article 2 1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.  HAUT DE PAGE  Article 3 Tout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.  HAUT DE PAGE  Article 6 Chacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.  HAUT DE PAGE  Article 7 Tous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es.  2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays.  2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit Ã  une nationalitÃ©.  2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.  HAUT DE PAGE  Article 16 1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux.  3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©. 2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.  HAUT DE PAGE  Article 18 Toute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques.  2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis.  2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays. 3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage.  2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal.  3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©.  2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite.  2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix.  3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent.  2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique.  3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.  '),(50,'1 couteau d\'office'),(51,'1 couteau Ã©conome'),(52,'1 couteau Ã©minceur'),(53,'1 cocotte ronde de 28cm'),(54,'1 spatule'),(55,'1 pinceau'),(56,'Papier absorbant'),(57,'pinceau'),(58,'1 casserole'),(59,'1 Ã©conome'),(60,'Des bols'),(61,'1 grille'),(62,'1 spatule'),(63,'1 poche Ã  douille'),(64,'Film alimentaire'),(65,'1 poÃªlon'),(66,'1 cuillÃ¨re en bois'),(67,'1 bassine'),(68,'1 mixeur'),(69,'1 batteur'),(70,'1 bassine'),(71,'1 bassine'),(72,'1 couteau Ã  Ã©mincer'),(73,'1 Ã©conome'),(74,'1 bol'),(75,'1 bassine'),(76,'1 barrette en pvc de 0,3 cm de diamÃ¨tre'),(77,'1 mixeur'),(78,'1 mixeur'),(79,'1 mixeur'),(80,'1 mixeur'),(81,'1 mixeur'),(82,'1 blender');
/*!40000 ALTER TABLE `recipeTool_name` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:33
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipeTool_recipe`
--

DROP TABLE IF EXISTS `recipeTool_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipeTool_recipe` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeTool_recipe`
--


/*!40000 ALTER TABLE `recipeTool_recipe` DISABLE KEYS */;
INSERT INTO `recipeTool_recipe` VALUES (1,'1'),(2,'1'),(3,'1'),(4,'2'),(5,'2'),(6,'2'),(7,'2'),(8,'2'),(9,'2'),(10,'2'),(11,'3'),(12,'3'),(13,'3'),(14,'3'),(15,'3'),(16,'3'),(17,'3'),(18,'4'),(19,'4'),(20,'4'),(21,'4'),(22,'4'),(23,'4'),(24,'4'),(25,'4'),(26,'4'),(27,'5'),(28,'5'),(29,'5'),(30,'5'),(31,'7'),(32,'7'),(33,'7'),(34,'7'),(35,'7'),(36,'8'),(37,'8'),(38,'8'),(39,'8'),(40,'8'),(41,'8'),(42,'9'),(43,'9'),(44,'9'),(45,'9'),(46,'9'),(47,'9'),(48,'9'),(49,'9'),(50,'10'),(51,'10'),(52,'10'),(53,'10'),(54,'10'),(55,'10'),(56,'10'),(57,'11'),(58,'12'),(59,'12'),(60,'12'),(61,'12'),(62,'12'),(63,'12'),(64,'12'),(65,'16'),(66,'21'),(67,'27'),(68,'29'),(69,'29'),(70,'30'),(71,'32'),(72,'33'),(73,'33'),(74,'33'),(75,'37'),(76,'40'),(77,'47'),(78,'48'),(79,'49'),(80,'51'),(81,'52'),(82,'53');
/*!40000 ALTER TABLE `recipeTool_recipe` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:33
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_author`
--

DROP TABLE IF EXISTS `recipe_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_author` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_author`
--


/*!40000 ALTER TABLE `recipe_author` DISABLE KEYS */;
INSERT INTO `recipe_author` VALUES (11,'Madeleine Market'),(12,'Madeleine Market'),(13,'AriakÃ©'),(14,'AriakÃ©'),(15,'AriakÃ©'),(16,'AriakÃ©'),(17,'AriakÃ©'),(18,'AriakÃ©'),(19,'AriakÃ©'),(20,'AriakÃ©'),(21,'AriakÃ©'),(22,'AriakÃ©'),(23,'AriakÃ©'),(24,'De Buyer'),(25,'De Buyer'),(26,'De Buyer'),(27,'De buyer'),(28,'De Buyer'),(29,'De Buyer'),(30,'De Buyer'),(31,'De Buyer'),(32,'De Buyer'),(33,'De Buyer'),(34,'De Buyer'),(35,'De Buyer'),(36,'De Buyer'),(37,'De Buyer'),(38,'Albert et Ferran AdriÃ '),(39,'Albert et Ferran AdriÃ '),(40,'Albert et Ferran AdriÃ '),(41,'Albert et Ferran AdriÃ '),(42,'Albert et Ferran AdriÃ '),(43,'Albert et Ferran AdriÃ '),(44,'Albert et Ferran AdriÃ '),(45,'Albert et Ferran AdriÃ '),(46,'Albert et Ferran AdriÃ '),(47,'Albert et Ferran AdriÃ '),(48,'Albert et Ferran AdriÃ '),(49,'Albert et Ferran AdriÃ '),(50,'Albert et Ferran AdriÃ '),(51,'Albert et Ferran AdriÃ '),(52,'Albert et Ferran AdriÃ '),(53,'Albert et Ferran AdriÃ '),(54,'Albert et Ferran AdriÃ '),(55,'Albert et Ferran AdriÃ '),(1,NULL);
/*!40000 ALTER TABLE `recipe_author` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:33
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_cookTime`
--

DROP TABLE IF EXISTS `recipe_cookTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_cookTime` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_cookTime`
--


/*!40000 ALTER TABLE `recipe_cookTime` DISABLE KEYS */;
INSERT INTO `recipe_cookTime` VALUES (1,'15'),(2,'5'),(4,'35'),(5,'5 Ã  10'),(6,'30'),(7,'10'),(8,'25'),(9,'30PrÃ©ambule ConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.  ConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.  ConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.  ConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.  ConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.  ConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.  ConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.  L\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.  HAUT DE PAGE  Article premier Tous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.  HAUT DE PAGE  Article 2 1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.  HAUT DE PAGE  Article 3 Tout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.  HAUT DE PAGE  Article 6 Chacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.  HAUT DE PAGE  Article 7 Tous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es.  2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays.  2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit Ã  une nationalitÃ©.  2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.  HAUT DE PAGE  Article 16 1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux.  3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©. 2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.  HAUT DE PAGE  Article 18 Toute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques.  2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis.  2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays. 3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage.  2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal.  3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©.  2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite.  2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix.  3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent.  2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique.  3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.  '),(10,'100'),(11,'20 '),(12,'10'),(15,'10'),(17,'10'),(19,'5'),(24,'5'),(25,'15'),(26,'30'),(27,'20-25'),(28,'8'),(29,'8'),(30,'40'),(31,'20'),(32,'40'),(33,'60'),(34,'45'),(35,'50'),(36,'15'),(37,'30'),(53,'1');
/*!40000 ALTER TABLE `recipe_cookTime` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:33
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_numberOfPeople`
--

DROP TABLE IF EXISTS `recipe_numberOfPeople`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_numberOfPeople` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_numberOfPeople`
--


/*!40000 ALTER TABLE `recipe_numberOfPeople` DISABLE KEYS */;
INSERT INTO `recipe_numberOfPeople` VALUES (3,'7'),(9,'Pour 80 chouquettes environ');
/*!40000 ALTER TABLE `recipe_numberOfPeople` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:33
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_prepTime`
--

DROP TABLE IF EXISTS `recipe_prepTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_prepTime` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_prepTime`
--


/*!40000 ALTER TABLE `recipe_prepTime` DISABLE KEYS */;
INSERT INTO `recipe_prepTime` VALUES (2,'25'),(4,'25'),(5,'15'),(6,'10'),(7,'20'),(8,'10'),(9,'15PrÃ©ambule ConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.  ConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.  ConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.  ConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.  ConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.  ConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.  ConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.  L\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.  HAUT DE PAGE  Article premier Tous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.  HAUT DE PAGE  Article 2 1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.  HAUT DE PAGE  Article 3 Tout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.  HAUT DE PAGE  Article 6 Chacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.  HAUT DE PAGE  Article 7 Tous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es.  2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays.  2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit Ã  une nationalitÃ©.  2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.  HAUT DE PAGE  Article 16 1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux.  3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©. 2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.  HAUT DE PAGE  Article 18 Toute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques.  2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis.  2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays. 3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage.  2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal.  3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©.  2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite.  2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix.  3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent.  2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique.  3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.  '),(10,'30'),(11,'30'),(14,'45'),(1,NULL);
/*!40000 ALTER TABLE `recipe_prepTime` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:33
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_preparationTime`
--

DROP TABLE IF EXISTS `recipe_preparationTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_preparationTime` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_preparationTime`
--


/*!40000 ALTER TABLE `recipe_preparationTime` DISABLE KEYS */;
INSERT INTO `recipe_preparationTime` VALUES (3,'40'),(9,'20');
/*!40000 ALTER TABLE `recipe_preparationTime` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:34
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_profile`
--

DROP TABLE IF EXISTS `recipe_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_profile` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_profile`
--


/*!40000 ALTER TABLE `recipe_profile` DISABLE KEYS */;
INSERT INTO `recipe_profile` VALUES (1,'2'),(2,'4'),(3,'4'),(4,'4'),(5,'4'),(6,'4'),(7,'4'),(8,'4'),(9,'4'),(10,'7'),(11,'4'),(12,'4'),(13,'8'),(14,'8'),(15,'8'),(16,'8'),(17,'8'),(18,'8'),(19,'8'),(20,'8'),(21,'8'),(22,'8'),(23,'8'),(24,'9'),(25,'9'),(26,'9'),(27,'9'),(28,'9'),(29,'9'),(30,'9'),(31,'9'),(32,'9'),(33,'9'),(34,'9'),(35,'9'),(36,'9'),(37,'9'),(38,'10'),(39,'10'),(40,'10'),(41,'10'),(42,'10'),(43,'10'),(44,'10'),(45,'10'),(46,'10'),(47,'10'),(48,'10'),(49,'10'),(50,'10'),(51,'10'),(52,'10'),(53,'10'),(54,'10'),(55,'10');
/*!40000 ALTER TABLE `recipe_profile` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:34
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_recipeCategory`
--

DROP TABLE IF EXISTS `recipe_recipeCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_recipeCategory` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_recipeCategory`
--


/*!40000 ALTER TABLE `recipe_recipeCategory` DISABLE KEYS */;
INSERT INTO `recipe_recipeCategory` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61);
/*!40000 ALTER TABLE `recipe_recipeCategory` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:34
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_recipeCategory_recipe`
--

DROP TABLE IF EXISTS `recipe_recipeCategory_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_recipeCategory_recipe` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_recipeCategory_recipe`
--


/*!40000 ALTER TABLE `recipe_recipeCategory_recipe` DISABLE KEYS */;
INSERT INTO `recipe_recipeCategory_recipe` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9'),(10,'10'),(11,'11'),(12,'12'),(13,'13'),(14,'14'),(15,'15'),(16,'16'),(17,'17'),(18,'18'),(19,'19'),(20,'20'),(21,'21'),(22,'22'),(23,'23'),(24,'24'),(25,'25'),(26,'26'),(27,'27'),(28,'28'),(29,'29'),(30,'30'),(31,'31'),(32,'32'),(33,'33'),(34,'34'),(35,'35'),(36,'36'),(37,'37'),(38,'38'),(39,'39'),(40,'40'),(41,'41'),(42,'42'),(43,'43'),(44,'44'),(45,'45'),(46,'46'),(47,'47'),(48,'48'),(49,'49'),(50,'50'),(51,'51'),(52,'52'),(53,'53'),(54,'54'),(55,'55'),(56,'1'),(57,'1'),(58,'1'),(59,'1'),(60,'1'),(61,'1');
/*!40000 ALTER TABLE `recipe_recipeCategory_recipe` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:34
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_recipeCategory_recipeCategory`
--

DROP TABLE IF EXISTS `recipe_recipeCategory_recipeCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_recipeCategory_recipeCategory` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_recipeCategory_recipeCategory`
--


/*!40000 ALTER TABLE `recipe_recipeCategory_recipeCategory` DISABLE KEYS */;
INSERT INTO `recipe_recipeCategory_recipeCategory` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'3'),(6,'1'),(7,'3'),(8,'1'),(9,'1'),(10,'3'),(11,'5'),(12,'1'),(13,'3'),(14,'6'),(15,'6'),(16,'3'),(17,'3'),(18,'3'),(19,'3'),(20,'5'),(21,'3'),(22,'5'),(23,'5'),(24,'1'),(25,'1'),(26,'1'),(27,'1'),(28,'1'),(29,'1'),(30,'3'),(31,'1'),(32,'1'),(33,'3'),(34,'1'),(35,'1'),(36,'1'),(37,'1'),(38,'7'),(39,'5'),(40,'3'),(41,'3'),(42,'7'),(43,'7'),(44,'7'),(45,'7'),(46,'7'),(47,'7'),(48,'1'),(49,'7'),(50,'7'),(51,'4'),(52,'7'),(53,'3'),(54,'7'),(55,'7'),(56,'2'),(57,'3'),(58,'4'),(59,'3'),(60,'4'),(61,'5');
/*!40000 ALTER TABLE `recipe_recipeCategory_recipeCategory` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:34
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_restTime`
--

DROP TABLE IF EXISTS `recipe_restTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_restTime` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_restTime`
--


/*!40000 ALTER TABLE `recipe_restTime` DISABLE KEYS */;
INSERT INTO `recipe_restTime` VALUES (1,'5'),(2,'120'),(7,'3h'),(9,'PrÃ©ambule ConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.  ConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.  ConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.  ConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.  ConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.  ConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.  ConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.  L\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.  HAUT DE PAGE  Article premier Tous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.  HAUT DE PAGE  Article 2 1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.  HAUT DE PAGE  Article 3 Tout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.  HAUT DE PAGE  Article 6 Chacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.  HAUT DE PAGE  Article 7 Tous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es.  2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays.  2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit Ã  une nationalitÃ©.  2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.  HAUT DE PAGE  Article 16 1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux.  3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©. 2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.  HAUT DE PAGE  Article 18 Toute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques.  2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis.  2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays. 3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage.  2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal.  3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©.  2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite.  2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix.  3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent.  2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique.  3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.  '),(12,'720 (12 heures)'),(24,'120'),(28,'24 heures'),(29,'24 heures'),(34,'60'),(53,'24h');
/*!40000 ALTER TABLE `recipe_restTime` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:34
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_slug`
--

DROP TABLE IF EXISTS `recipe_slug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_slug` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_slug`
--


/*!40000 ALTER TABLE `recipe_slug` DISABLE KEYS */;
INSERT INTO `recipe_slug` VALUES (1,'creme-coco-mangue-passion'),(2,'guimauve-a-la-vanille'),(3,'creme-de-moules-de-bouchot'),(4,'fingers-de-cabillaud'),(5,'calamaretti-a-l-etouffee'),(6,'crumble-cerise'),(7,'couscous-sucre'),(8,'muffins-aux-framboises'),(9,'chouquettes-au-chocolat'),(10,'navarin-d-agneau-printanier'),(11,'flan-de-courgette'),(12,'charlotte-poire-caramel'),(13,'coq-au-vin'),(14,'risotto-aux-champignons'),(15,'gaspacho-d-asperges-vertes-et-mouillette-croustillante-de-graines-de-sesame'),(16,'risotto-cremeux-aux-fruits-de-mer'),(17,'safran-brodetto-la-bouillabaisse-transalpine'),(18,'soupe-japonaise-subtile-et-revigorante'),(19,'bouillon-de-poule-aux-fines-ravioles-de-foie-gras'),(20,'nage-de-saint-jacques-au-bouillon-de-coquillages'),(21,'deglacage-au-bouillon-de-boeuf-ariake'),(22,'capuccino-de-volaille-et-petits-pois-roquette'),(23,'aspics-en-verrines'),(24,'nougat-glace'),(25,'visitandines'),(26,'cakes-au-pepites-de-chocolat'),(27,'clafoutis-aux-cerises'),(28,'recette-rapide-des-macarons'),(29,'recette-pro-des-macarons'),(30,'quiche-sans-pate-aux-lardons'),(31,'tarte-briochee-aux-abricots'),(32,'delice-au-chocolat'),(33,'gratin-de-pommes-de-terre'),(34,'kougloff'),(35,'cake'),(36,'madeleine'),(37,'muffins-aux-myrtilles'),(38,'concombres-en-fleur-gelatinises'),(39,'nectar-de-cepes'),(40,'macaronis-au-consomme'),(41,'tagliatelles-au-safran'),(42,'gelatine-au-lait'),(43,'gelatine-a-l-ananas'),(44,'gelatine-chaude-de-langoustines'),(45,'terrine-au-basilic'),(46,'air-glace-au-parmesan'),(47,'air-a-la-lime'),(48,'caviar-spherique-au-melon-cantaloupe'),(49,'raviolis-spheriques-a-la-mangue'),(50,'raviolis-spheriques-au-the'),(51,'sangria-blanche-en-suspension'),(52,'veloute-de-jambon-iberique'),(53,'boulettes-de-feves-tendres'),(54,'spirale-d-huile-d-olive'),(55,'emulsion-d-olive-noire');
/*!40000 ALTER TABLE `recipe_slug` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:35
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_source`
--

DROP TABLE IF EXISTS `recipe_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_source` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_source`
--


/*!40000 ALTER TABLE `recipe_source` DISABLE KEYS */;
INSERT INTO `recipe_source` VALUES (3,'Recette et photo tirÃ©es de lâ€™ouvrage La Cuisine de Ducasse par Sophie, publiÃ© aux Ã‰ditions Alain Ducasse. AuteurÂ : Sophie Dudemaine. Photographe : FranÃ§oise Nicol & Catherine Madani, en vente en librairie 23 â‚¬ et sur cookboutic.fr'),(9,'Recette et photo tirÃ©es de lâ€™ouvrage LeÃ§on de cuisineÂ : pÃ¢te Ã  choux, publiÃ© aux Ã‰ditions Culinaires. AuteurÂ : SÃ©bastien Serveau Photographe : Soins graphiques, en vente en librairie 9,90â‚¬ et sur cookboutic.fr');
/*!40000 ALTER TABLE `recipe_source` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:35
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_summary`
--

DROP TABLE IF EXISTS `recipe_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_summary` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_summary`
--


/*!40000 ALTER TABLE `recipe_summary` DISABLE KEYS */;
INSERT INTO `recipe_summary` VALUES (1,'Une recette douce et lÃ©gÃ¨re aux saveurs exotiques qui apportera une touche de fraÃ®cheur Ã  la fin de votre repas. '),(2,'Que tous les gourmands se rÃ©jouissent : vous allez dÃ©sormais pouvoir rÃ©aliser vous mÃªme vos guimauves!\n\r\n\n\r\n'),(3,'Les moules c\'est bon. '),(4,'Recette originale idÃ©ale pour l\'apÃ©ritif. Partagez la douceur du cabillaud et les saveurs du poivrons entre amis.'),(5,'A rÃ©diger'),(6,'A rÃ©diger.'),(7,'A rÃ©diger'),(8,'Une recette simple et lÃ©gÃ¨re de ce gÃ¢teau d\'origine anglaise. IdÃ©ale pour le goÃ»ter.'),(9,'Recette de chouquettes au chocolat idÃ©ale pour le goÃ»ter. \r\n\r\n<p>\r\n           Bonjour et bienvenue sur mon site !\r\n\r\n           Ceci est mon premier test, alors <em>soyez indulgents</em> s\'il vous plaÃ®t, j\'apprends petit Ã  petit comment Ã§a marche Ã  l\'aide des tutoriels du Site du ZÃ©r0.\r\n       </p>\r\n\r\nPrÃ©ambule\r\nConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.\r\n\r\nConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.\r\n\r\nConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.\r\n\r\nConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.\r\n\r\nConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.\r\n\r\nConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.\r\n\r\nConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.\r\n\r\nL\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle premier\r\nTous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 2\r\n1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation. \r\n2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 3\r\nTout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 4\r\nNul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 5\r\nNul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 6\r\nChacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 7\r\nTous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 8\r\nToute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 9\r\nNul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 10\r\nToute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 11\r\n1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es. \r\n2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 12\r\nNul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 13\r\n1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat. \r\n2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 14\r\n1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays. \r\n2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 15\r\n1. Tout individu a droit Ã  une nationalitÃ©. \r\n2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 16\r\n1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution. \r\n2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux. \r\n3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 17\r\n1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©.\r\n2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 18\r\nToute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 19\r\nTout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 20\r\n1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques. \r\n2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 21\r\n1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis. \r\n2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays.\r\n3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 22\r\nToute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 23\r\n1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage. \r\n2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal. \r\n3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale. \r\n4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 24\r\nToute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 25\r\n1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©. \r\n2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 26\r\n1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite. \r\n2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix. \r\n3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 27\r\n1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent. \r\n2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 28\r\nToute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 29\r\n1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible. \r\n2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique. \r\n3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 30\r\nAucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.\r\n\r\n'),(10,'Le navarin d\'agneau printanier est un plat rustique qui trouve ses saveurs dans les nouveaux lÃ©gumes du printemps. C\'est en partie de lÃ  qu\'il tire son nom.\r\n\r\nhttp://www.madeleinemarket.com/epicerie-fine/epices-condiments/epices/epices-entieres/548-epice-muscade-noix.html'),(11,' EntrÃ©e fine et lÃ©gÃ¨re, idÃ©ale pour l\'Ã©tÃ©.  '),(12,'Un grand classique revisitÃ©...'),(13,' '),(14,'  '),(15,'  '),(16,' '),(17,' '),(18,' '),(19,' '),(20,' '),(21,' '),(22,' '),(23,' '),(24,'  '),(25,' '),(26,' '),(27,' '),(28,' '),(29,' '),(30,' '),(31,'  '),(32,'  '),(33,' '),(34,'  '),(35,' '),(36,' '),(37,' '),(38,' '),(39,' '),(40,' '),(41,' '),(42,' '),(43,' '),(44,' '),(45,' '),(46,' '),(47,' '),(48,'  '),(49,' '),(50,' '),(51,' '),(52,'  '),(53,' '),(54,' '),(55,' ');
/*!40000 ALTER TABLE `recipe_summary` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:35
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_tag`
--

DROP TABLE IF EXISTS `recipe_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_tag` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_tag`
--


/*!40000 ALTER TABLE `recipe_tag` DISABLE KEYS */;
INSERT INTO `recipe_tag` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `recipe_tag` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:35
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_tag_recipe`
--

DROP TABLE IF EXISTS `recipe_tag_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_tag_recipe` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_tag_recipe`
--


/*!40000 ALTER TABLE `recipe_tag_recipe` DISABLE KEYS */;
INSERT INTO `recipe_tag_recipe` VALUES (1,'1'),(2,'1'),(3,'1'),(4,'1');
/*!40000 ALTER TABLE `recipe_tag_recipe` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:35
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_tag_tag`
--

DROP TABLE IF EXISTS `recipe_tag_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_tag_tag` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_tag_tag`
--


/*!40000 ALTER TABLE `recipe_tag_tag` DISABLE KEYS */;
INSERT INTO `recipe_tag_tag` VALUES (1,'1'),(2,'2'),(3,'1'),(4,'2');
/*!40000 ALTER TABLE `recipe_tag_tag` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:35
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_title`
--

DROP TABLE IF EXISTS `recipe_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_title` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_title`
--


/*!40000 ALTER TABLE `recipe_title` DISABLE KEYS */;
INSERT INTO `recipe_title` VALUES (1,'CrÃ¨me coco-mangue-passion'),(2,'Guimauve Ã  la vanille'),(3,'CrÃ¨me de moules de bouchot'),(4,'Fingers de Cabillaud'),(5,'Calamaretti Ã  lâ€™Ã©touffÃ©e'),(6,'Crumble aux cerises'),(7,'Couscous sucrÃ©'),(8,'Muffins aux framboises'),(9,'Chouquettes au chocolat '),(10,'Navarin dâ€™agneau printanier'),(11,'Flan de courgette'),(12,'Charlotte Poire-Caramel'),(13,'Coq au vin '),(14,'Risotto aux champignons '),(15,'Gaspacho d\'asperges vertes et mouillette croustillante de graines de sÃ©same '),(16,'Risotto crÃ©meux aux fruits de mer'),(17,'Safran brodetto, la bouillabaisse transalpine'),(18,'Soupe japonaise, subtile et revigorante'),(19,'Bouillon de poule aux fines ravioles de foie gras'),(20,'Nage de saint-jacques au bouillon de coquillages'),(21,'DÃ©glaÃ§age au bouillon de boeuf AriakÃ©'),(22,'Capuccino de volaille et petits pois â€“ roquette'),(23,'Aspics en verrines'),(24,'Nougat GlacÃ©'),(25,'Visitandines'),(26,'Cakes au PÃ©pites de Chocolat'),(27,'Clafoutis aux Cerises'),(28,'Recette rapide des macarons'),(29,'Recette pro des macarons'),(30,'Quiche sans pÃ¢te aux lardons'),(31,'Tarte briochÃ©e aux abricots'),(32,'DÃ©lice au chocolat'),(33,'Gratin de Pommes de Terre'),(34,'Kougloff'),(35,'Cake'),(36,'Madeleine'),(37,'Muffins aux Myrtilles'),(38,'Concombres en fleur gÃ©latinisÃ©s'),(39,'Nectar de cÃ¨pes'),(40,'Macaronis au ConsommÃ©'),(41,'Tagliatelles au safran'),(42,'GÃ©latine au lait'),(43,'GÃ©latine Ã  lâ€™ananas'),(44,'GÃ©latine chaude de langoustines'),(45,'Terrine au basilic'),(46,'Air glacÃ© au parmesan'),(47,'Air Ã  la lime'),(48,'Caviar sphÃ©rique au melon Cantaloupe'),(49,'Raviolis sphÃ©riques Ã  la mangue'),(50,'Raviolis sphÃ©riques au thÃ©'),(51,'Sangria blanche en suspension'),(52,'VeloutÃ© de jambon ibÃ©rique'),(53,'Boulettes de fÃ¨ves tendres'),(54,'Spirale dâ€™huile dâ€™olive'),(55,'Ã‰mulsion dâ€™olive noire');
/*!40000 ALTER TABLE `recipe_title` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:35
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_updated`
--

DROP TABLE IF EXISTS `recipe_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_updated` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_updated`
--


/*!40000 ALTER TABLE `recipe_updated` DISABLE KEYS */;
INSERT INTO `recipe_updated` VALUES (1,'2010-06-07'),(2,'2010-05-07'),(3,'2010-05-12'),(4,'2010-04-30'),(5,'2010-05-07'),(6,'2010-04-30'),(7,'2010-04-30'),(8,'2010-05-07'),(9,'2010-05-18'),(10,'2010-05-07'),(11,'2010-05-19'),(12,'2010-05-19'),(13,'2010-05-20'),(14,'2010-05-20'),(15,'2010-05-20'),(16,'2010-05-26'),(17,'2010-05-26'),(18,'2010-05-26'),(19,'2010-05-26'),(20,'2010-05-26'),(21,'2010-05-26'),(22,'2010-05-26'),(23,'2010-05-26'),(24,'2010-05-28'),(25,'2010-05-28'),(26,'2010-05-28'),(27,'2010-05-28'),(28,'2010-05-28'),(29,'2010-05-28'),(30,'2010-05-28'),(31,'2010-05-28'),(32,'2010-05-28'),(33,'2010-05-28'),(34,'2010-05-28'),(35,'2010-05-28'),(36,'2010-05-28'),(37,'2010-05-28'),(38,'2010-05-31'),(39,'2010-05-31'),(40,'2010-05-31'),(41,'2010-05-31'),(42,'2010-05-31'),(43,'2010-05-31'),(44,'2010-05-31'),(45,'2010-05-31'),(46,'2010-05-31'),(47,'2010-05-31'),(48,'2010-05-31'),(49,'2010-05-31'),(50,'2010-05-31'),(51,'2010-05-31'),(52,'2010-05-31'),(53,'2010-05-31'),(54,'2010-05-31'),(55,'2010-05-31');
/*!40000 ALTER TABLE `recipe_updated` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:36
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_video`
--

DROP TABLE IF EXISTS `recipe_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_video` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_video`
--


/*!40000 ALTER TABLE `recipe_video` DISABLE KEYS */;
INSERT INTO `recipe_video` VALUES (1,'http://www.madeleinemarket.com/epicerie-fine/chocolats-confiseries/gourmandises-confiseries/1688-petit-ourson-guimauve-tendre-amour.html#comments');
/*!40000 ALTER TABLE `recipe_video` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:36
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `recipe_yield`
--

DROP TABLE IF EXISTS `recipe_yield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_yield` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_yield`
--


/*!40000 ALTER TABLE `recipe_yield` DISABLE KEYS */;
INSERT INTO `recipe_yield` VALUES (2,'pour 30 nÅ“uds ou 32 cubes environ'),(3,'4 personnes'),(4,'4'),(5,'4 personnes'),(7,'4'),(8,'6 muffins'),(9,'80 chouquettesPrÃ©ambule ConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.  ConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.  ConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.  ConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.  ConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.  ConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.  ConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.  L\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.  HAUT DE PAGE  Article premier Tous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.  HAUT DE PAGE  Article 2 1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.  HAUT DE PAGE  Article 3 Tout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.  HAUT DE PAGE  Article 6 Chacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.  HAUT DE PAGE  Article 7 Tous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es.  2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays.  2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit Ã  une nationalitÃ©.  2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.  HAUT DE PAGE  Article 16 1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux.  3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©. 2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.  HAUT DE PAGE  Article 18 Toute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques.  2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis.  2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays. 3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage.  2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal.  3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©.  2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite.  2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix.  3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent.  2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique.  3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.  '),(10,'4 personnes'),(11,'4'),(12,'4 personnes'),(14,'4'),(15,'4 personnes'),(16,'2'),(17,'4 personnes'),(18,'2 personnes'),(19,'4 personnes'),(20,'4 personnes'),(21,'2 personnes'),(22,'2 personnes'),(23,'3 verrines'),(24,'Pour 12 pyramides'),(26,'Pour 18 cakes'),(27,'16 petits clafoutis'),(28,'Environ 40 macarons'),(29,'Environ 40 macarons'),(36,'18 madeleines'),(37,'12 Muffins'),(38,'4 personnes'),(39,'4'),(40,'4'),(41,'4'),(42,'4'),(43,'4'),(44,'4'),(45,'4'),(47,'4'),(49,'4'),(50,'4'),(51,'4'),(52,'4'),(54,'4'),(55,'4'),(1,NULL);
/*!40000 ALTER TABLE `recipe_yield` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:36
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--


/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1),(2);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:36
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `tag_name`
--

DROP TABLE IF EXISTS `tag_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_name` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_name`
--


/*!40000 ALTER TABLE `tag_name` DISABLE KEYS */;
INSERT INTO `tag_name` VALUES (1,'foo'),(2,'bar');
/*!40000 ALTER TABLE `tag_name` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:36
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `tag_slug`
--

DROP TABLE IF EXISTS `tag_slug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_slug` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_slug`
--


/*!40000 ALTER TABLE `tag_slug` DISABLE KEYS */;
INSERT INTO `tag_slug` VALUES (1,'foo'),(2,'bar');
/*!40000 ALTER TABLE `tag_slug` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:36
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--


/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:36
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `user_email`
--

DROP TABLE IF EXISTS `user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_email` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_email`
--


/*!40000 ALTER TABLE `user_email` DISABLE KEYS */;
INSERT INTO `user_email` VALUES (1,'bob@bob.bob'),(2,'laurent.touchet@madeleinemarket.com'),(3,'guillaume.madeleine@madeleinemarket.com'),(4,'christophe@xsilence.net'),(5,'vcastel@madeleinemarket.com'),(6,'mathieuschlegel@gmail.com'),(7,'guillaume.blanco@madeleinemarket.com'),(8,'guilllaume.blanco@madeleinemarket.com'),(9,'jamespic@gmail.com'),(10,'myrr75@hotmail.com'),(11,'alison.bernicke@hotmail.fr'),(12,'m.verbrugghe@madeleinemarket.com'),(13,'chloe.strauss@gmail.com');
/*!40000 ALTER TABLE `user_email` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:37
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `user_firstName`
--

DROP TABLE IF EXISTS `user_firstName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_firstName` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_firstName`
--


/*!40000 ALTER TABLE `user_firstName` DISABLE KEYS */;
INSERT INTO `user_firstName` VALUES (1,'Bob'),(2,'laurent'),(3,'Guillaume'),(4,'Christophe'),(5,'vincent'),(6,'Mathieu'),(7,'Guillaume'),(8,'Guillaume'),(9,'Pic'),(10,'remi'),(11,'Alison'),(12,'Michael'),(13,'ChloÃ©');
/*!40000 ALTER TABLE `user_firstName` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:37
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `user_lastName`
--

DROP TABLE IF EXISTS `user_lastName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_lastName` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_lastName`
--


/*!40000 ALTER TABLE `user_lastName` DISABLE KEYS */;
INSERT INTO `user_lastName` VALUES (1,'BOB'),(2,'TOUCHET'),(3,'Blanco'),(4,'BIARROTTE'),(5,'CASTEL'),(6,'SCHLEGEL'),(7,'Blanco'),(8,'Blanco'),(9,'JAMES'),(10,'pathier'),(11,'Bernicke'),(12,'VERBRUGGHE'),(13,'STRAUSS');
/*!40000 ALTER TABLE `user_lastName` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:37
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `user_optin`
--

DROP TABLE IF EXISTS `user_optin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_optin` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_optin`
--


/*!40000 ALTER TABLE `user_optin` DISABLE KEYS */;
INSERT INTO `user_optin` VALUES (7,'1'),(8,'1');
/*!40000 ALTER TABLE `user_optin` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:37
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `user_password`
--

DROP TABLE IF EXISTS `user_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_password` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_password`
--


/*!40000 ALTER TABLE `user_password` DISABLE KEYS */;
INSERT INTO `user_password` VALUES (1,'33cdd248123355e1c1fce38a1b214927'),(2,'f232d41616ffafff7ffb714b6de8697f'),(3,'c4f2ec38c561b34be9edf4b210139952'),(4,'33cdd248123355e1c1fce38a1b214927'),(5,'f8cf6d92369c94cddd001e1834716b82'),(6,'3788381e2257eda0d4f4a69bc78584c2'),(7,'madeleine2009'),(8,'madeleine2009'),(9,'92dc44087c4d550d300d16526f404714'),(10,'pathier'),(11,'8921a21d654f12a47880b5860825c193'),(12,'f8cf6d92369c94cddd001e1834716b82'),(13,'23ae8a0c8cbe93ee3a50f8ad685cbbed');
/*!40000 ALTER TABLE `user_password` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:37
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `user_prestashopId`
--

DROP TABLE IF EXISTS `user_prestashopId`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_prestashopId` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_prestashopId`
--


/*!40000 ALTER TABLE `user_prestashopId` DISABLE KEYS */;
INSERT INTO `user_prestashopId` VALUES (1,'835'),(2,'1745'),(3,'5355'),(4,'1513'),(5,'748'),(6,'849'),(7,'5678'),(9,'5481'),(11,'5722'),(12,'1566'),(13,'1498');
/*!40000 ALTER TABLE `user_prestashopId` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:37
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--


/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (7,'administrator'),(8,'chief'),(9,'administrator'),(10,'customer'),(11,'customer'),(12,'customer'),(13,'customer');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:37
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `user_slug`
--

DROP TABLE IF EXISTS `user_slug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_slug` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_slug`
--


/*!40000 ALTER TABLE `user_slug` DISABLE KEYS */;
INSERT INTO `user_slug` VALUES (1,'bob-bob'),(2,'laurent-touchet'),(3,'guillaume-blanco'),(4,'christophe-biarrotte'),(5,'vincent-castel'),(6,'mathieu-schlegel'),(7,'guillaume-blanco--'),(8,'guillaume-blanco-'),(9,'pic-james'),(10,'remi-pathier'),(11,'alison-bernicke'),(12,'michael-verbrugghe'),(13,'chloe-strauss');
/*!40000 ALTER TABLE `user_slug` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:37
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `user_title`
--

DROP TABLE IF EXISTS `user_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_title` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_title`
--


/*!40000 ALTER TABLE `user_title` DISABLE KEYS */;
INSERT INTO `user_title` VALUES (7,'Mr.'),(8,'Mr.'),(10,'Mr.');
/*!40000 ALTER TABLE `user_title` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:37
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `user_updated`
--

DROP TABLE IF EXISTS `user_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_updated` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_updated`
--


/*!40000 ALTER TABLE `user_updated` DISABLE KEYS */;
INSERT INTO `user_updated` VALUES (1,'2010-05-10'),(2,'2010-05-10'),(3,'2010-05-10'),(4,'2010-05-10'),(5,'2010-05-11'),(6,'2010-05-12'),(7,'2010-05-12'),(8,'2010-05-12'),(9,'2010-05-10'),(10,'2010-05-17'),(11,'2010-05-19'),(12,'2010-05-19'),(13,'2010-05-27');
/*!40000 ALTER TABLE `user_updated` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:37
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--


/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:38
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profileProduct`
--

DROP TABLE IF EXISTS `profileProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profileProduct` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profileProduct`
--


/*!40000 ALTER TABLE `profileProduct` DISABLE KEYS */;
INSERT INTO `profileProduct` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11);
/*!40000 ALTER TABLE `profileProduct` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:38
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profileProduct_product`
--

DROP TABLE IF EXISTS `profileProduct_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profileProduct_product` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profileProduct_product`
--


/*!40000 ALTER TABLE `profileProduct_product` DISABLE KEYS */;
INSERT INTO `profileProduct_product` VALUES (1,'test Ã  la crÃ¨me'),(2,'chocolat'),(3,'1827'),(4,'1492'),(5,'168'),(6,'418'),(7,'2384'),(8,'2271'),(9,'37432'),(10,'10648'),(11,'2564');
/*!40000 ALTER TABLE `profileProduct_product` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:38
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profileProduct_profile`
--

DROP TABLE IF EXISTS `profileProduct_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profileProduct_profile` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profileProduct_profile`
--


/*!40000 ALTER TABLE `profileProduct_profile` DISABLE KEYS */;
INSERT INTO `profileProduct_profile` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'3'),(5,'5'),(6,'5'),(7,'6'),(8,'6'),(9,'8'),(10,'9'),(11,'10');
/*!40000 ALTER TABLE `profileProduct_profile` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:38
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profileSite`
--

DROP TABLE IF EXISTS `profileSite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profileSite` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profileSite`
--


/*!40000 ALTER TABLE `profileSite` DISABLE KEYS */;
INSERT INTO `profileSite` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34);
/*!40000 ALTER TABLE `profileSite` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:39
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profileSite_profile`
--

DROP TABLE IF EXISTS `profileSite_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profileSite_profile` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profileSite_profile`
--


/*!40000 ALTER TABLE `profileSite_profile` DISABLE KEYS */;
INSERT INTO `profileSite_profile` VALUES (1,'1'),(2,'2'),(3,'2'),(4,'2'),(5,'2'),(6,'2'),(7,'2'),(8,'2'),(9,'2'),(10,'2'),(11,'2'),(12,'2'),(13,'2'),(14,'2'),(15,'2'),(16,'2'),(17,'2'),(18,'2'),(19,'2'),(20,'2'),(21,'2'),(22,'2'),(23,'2'),(24,'2'),(25,'3'),(26,'4'),(27,'4'),(28,'5'),(29,'6'),(30,'7'),(31,'7'),(32,'8'),(33,'9'),(34,'10');
/*!40000 ALTER TABLE `profileSite_profile` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:39
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profileSite_site`
--

DROP TABLE IF EXISTS `profileSite_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profileSite_site` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profileSite_site`
--


/*!40000 ALTER TABLE `profileSite_site` DISABLE KEYS */;
INSERT INTO `profileSite_site` VALUES (1,'test'),(2,'http://www.madeleinemarket.com/'),(3,'http://www.madeleinemarket.com/'),(4,'http://www.madeleinemarket.com/'),(5,'http://www.madeleinemarket.com/'),(6,'http://www.madeleinemarket.com/'),(7,'http://www.madeleinemarket.com/'),(8,'http://www.madeleinemarket.com/'),(9,'http://www.madeleinemarket.com/'),(10,'http://www.madeleinemarket.com/'),(11,'http://www.madeleinemarket.com/'),(12,'http://www.madeleinemarket.com/'),(13,'http://www.madeleinemarket.com/'),(14,'http://www.madeleinemarket.com/'),(15,'http://www.madeleinemarket.com/'),(16,'http://www.madeleinemarket.com/http://www.madeleinemarket.com/'),(17,'http://www.madeleinemarket.com/'),(18,'http://www.madeleinemarket.com/'),(19,'http://www.madeleinemarket.com/'),(20,'http://www.madeleinemarket.com/'),(21,'http://www.madeleinemarket.com/'),(22,'http://www.madeleinemarket.com/'),(23,'http://www.madeleinemarket.com/'),(24,'http://www.madeleinemarket.com/'),(25,'http://www.christophemichalak.com/'),(26,'http://www.madeleinemarket.com/'),(27,'http://blog.madeleinemarket.com/'),(28,'www.marcveyrat.fr'),(29,'http://www.bocuse.fr/'),(30,'http://www.madeleinemarket.com/'),(31,'http://blog.madeleinemarket.com/'),(32,'http://www.ariake-europe.com/fr/'),(33,'http://www.debuyer.com/'),(34,'http://www.elbulli.com/');
/*!40000 ALTER TABLE `profileSite_site` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:39
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profile_email`
--

DROP TABLE IF EXISTS `profile_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_email` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_email`
--


/*!40000 ALTER TABLE `profile_email` DISABLE KEYS */;
INSERT INTO `profile_email` VALUES (1,'test'),(2,'http://www.madeleinemarket.com/'),(3,'pr@christophemichalak.com'),(4,'marketing@madeleinemarket.com'),(5,'marketing@madeleinemarket.com'),(6,'marketing@madeleinemarket.com'),(7,'marketing@madeleinemarket.com');
/*!40000 ALTER TABLE `profile_email` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:39
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profile_introduction`
--

DROP TABLE IF EXISTS `profile_introduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_introduction` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_introduction`
--


/*!40000 ALTER TABLE `profile_introduction` DISABLE KEYS */;
INSERT INTO `profile_introduction` VALUES (1,'test'),(2,' PrÃ©ambule\r\nConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.\r\n\r\nConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.\r\n\r\nConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.\r\n\r\nConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.\r\n\r\nConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.\r\n\r\nConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.\r\n\r\nConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.\r\n\r\nL\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle premier\r\nTous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 2\r\n1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation. \r\n2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 3\r\nTout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 4\r\nNul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 5\r\nNul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 6\r\nChacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 7\r\nTous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 8\r\nToute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 9\r\nNul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 10\r\nToute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 11\r\n1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es. \r\n2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 12\r\nNul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 13\r\n1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat. \r\n2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 14\r\n1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays. \r\n2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 15\r\n1. Tout individu a droit Ã  une nationalitÃ©. \r\n2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 16\r\n1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution. \r\n2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux. \r\n3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 17\r\n1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©.\r\n2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 18\r\nToute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 19\r\nTout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 20\r\n1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques. \r\n2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 21\r\n1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis. \r\n2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays.\r\n3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 22\r\nToute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 23\r\n1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage. \r\n2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal. \r\n3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale. \r\n4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 24\r\nToute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 25\r\n1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©. \r\n2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 26\r\n1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite. \r\n2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix. \r\n3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 27\r\n1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent. \r\n2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 28\r\nToute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 29\r\n1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible. \r\n2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique. \r\n3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 30\r\nAucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.\r\n'),(3,' Petit apprenti dâ€™une modeste pÃ¢tisserie de province, il est devenu, Ã  34 ans, lâ€™un des chefs pÃ¢tissiers les plus reconnus de la profession.\r\nEt pourtantâ€¦ rien ne semblait prÃ©disposer ce Picard aux mÃ©tiers de bouche. \r\nIssu dâ€™une famille italienne, il nâ€™a Ã©tÃ© nourri que de rigueur et de rage de vaincre.\r\nEnfant, il voulait Ãªtre dessinateur, ce qui dÃ©notait dÃ©jÃ  un sens artistique dÃ©veloppÃ©; faute dâ€™entrer aux Beaux-Arts, il passe directement Ã  la vie active. Â«A 15 ans, lors de mes dÃ©buts, jâ€™ai eu un Ã©clair de luciditÃ©: Jâ€™ai compris quâ€™on pouvait donner beaucoup de bonheur avec peu de choses. On ne peut pas Ãªtre pÃ¢tissier sans Ãªtre gÃ©nÃ©reux et gourmand, mon mÃ©tier me permet de mâ€™exprimer Ã  travers mes crÃ©ations, le dÃ©sir de faire plaisir aux autres mâ€™a alors subjuguÃ©Â», raconte-t-il. \r\nA 16 ans, il se constitue une bibliothÃ¨que culinaire quâ€™il ne cesse de complÃ©ter. Il cultive sa mÃ©moire gustative, outil essentiel du MaÃ®tre-pÃ¢tissier.  Â«Je me suis contraint; la vie mâ€™a faÃ§onnÃ©Â»,  avoue-t-il.'),(4,'Madeleine Market vous donne accÃ¨s Ã  des recettes de grands chefs ainsi qu\'Ã  leurs produits prÃ©fÃ©rÃ©s afin que vous puissiez avoir le meilleur de la gastronomie chez vous.'),(5,'Marc Veyrat est un cuisinier trÃ¨s crÃ©atif qui innove dans l\'utilisation des techniques de gastronomie molÃ©culaire pour Â« amplifier Â» les goÃ»ts des aliments. PassionnÃ© d\'herbes aromatiques, de plantes aromatiques, de racines et fleurs sauvages comestibles des Alpes. Il remplace la farine, l\'huile, la crÃ¨me ou le beurre... par des plantes des montagnes. Il allie les traditions rÃ©gionales, du terroir, et des techniques de cuisine modernes.\r\nIl privilÃ©gie les jus de cuisson, les bouillons de lÃ©gumes, les infusions de plantes, les dÃ©coctions sans ajout de graisse, et utilise des mÃ©thodes de cuissons novatrices comme par exemple la cuisson Ã  trÃ¨s basse tempÃ©rature par -196Â°C Ã  l\'azote liquide.\r\nIl se dit influencÃ© par le chef trois Ã©toiles JoÃ«l Robuchon et par le botaniste FranÃ§ois Couplan qu\'il qualifie de plus grand botaniste du monde.'),(6,'Issu dâ€™une  famille de cuisiniers depuis plus de quatre gÃ©nÃ©rations, toujours soucieux de  prÃ©server les traditions, je tiens Ã  servir une cuisine classique, identifiable,  avec des os et des arÃªtes. EpaulÃ© par un fidÃ¨le Ã©quipage, dont cinq Meilleurs  Ouvriers de France, nous contribuons Ã  travers lâ€™amour du travail bien fait et  notre professionnalisme Ã  la transmission aux gÃ©nÃ©rations futures pour assurer  lâ€™avenir de notre beau mÃ©tier.\r\n\r\nLa devise de  la Maison demeureÂ : \r\nBons produits = Bonne cuisine.'),(7,'Madeleine Market vous donne accÃ¨s aux recettes des grands chefs ainsi qu\'Ã  leurs produits prÃ©ferÃ©s. Des ustensiles de cuisine de qualitÃ© ont Ã©tÃ© selectionnÃ©s pour que vous puissiez retrouver le meilleur de la gastronomie chez vous. '),(8,'TrÃ¨s connue au Japon et aux Etats-Unis pour ses bouillons et ses bases culinaires naturelles, la sociÃ©tÃ© Ariake a dÃ©veloppÃ© depuis 40 ans une expertise unique pour extraire de faÃ§on naturelle les saveurs de tous les ingrÃ©dients. Soucieux de produire le meilleur, Ariake  sâ€™est adjoint le talent du chef franÃ§ais JoÃ«l Robuchon pour mettre au point les saveurs de ses recettes de bouillons naturels.\r\nLes produits AriakÃ©\r\nElaborÃ©s uniquement Ã  partir dâ€™ingrÃ©dients nobles, garantis sans colorants ni exhausteur de goÃ»t, les bouillons AriakÃ© permettent de retrouver le goÃ»t dâ€™un authentique bouillon prÃ©parÃ© maison. Peu salÃ©s, ils peuvent se boire en consommÃ©, ou sâ€™utiliser  pour prÃ©parer des fonds de sauce, des jus de cuisson, des risottosâ€¦ Quâ€™ils soient de bÅ“uf (70% de viande et de jus !), de volaille ou de coquillages, leur qualitÃ© et leur saveur exceptionnelles  vous permettent de cuisiner tout en finesse,  avec un vÃ©ritable ingrÃ©dient de chef.\r\n'),(9,' '),(10,' ');
/*!40000 ALTER TABLE `profile_introduction` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:39
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profile_name`
--

DROP TABLE IF EXISTS `profile_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_name` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_name`
--


/*!40000 ALTER TABLE `profile_name` DISABLE KEYS */;
INSERT INTO `profile_name` VALUES (1,'MM'),(2,'PrÃ©ambule ConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.  ConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.  ConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.  ConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.  ConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.  ConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.  ConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.  L\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.  HAUT DE PAGE  Article premier Tous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.  HAUT DE PAGE  Article 2 1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.  HAUT DE PAGE  Article 3 Tout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.  HAUT DE PAGE  Article 6 Chacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.  HAUT DE PAGE  Article 7 Tous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es.  2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays.  2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit Ã  une nationalitÃ©.  2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.  HAUT DE PAGE  Article 16 1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux.  3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©. 2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.  HAUT DE PAGE  Article 18 Toute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques.  2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis.  2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays. 3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage.  2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal.  3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©.  2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite.  2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix.  3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent.  2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique.  3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.  '),(3,'christophe Michalak'),(4,'Madeleine Market'),(5,'Marc Veyrat'),(6,'Paul Bocuse'),(7,'Madeleine Market'),(8,'AriakÃ©'),(9,'De Buyer'),(10,'Albert y Ferran AdriÃ ');
/*!40000 ALTER TABLE `profile_name` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:39
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profile_picture`
--

DROP TABLE IF EXISTS `profile_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_picture` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_picture`
--


/*!40000 ALTER TABLE `profile_picture` DISABLE KEYS */;
INSERT INTO `profile_picture` VALUES (3,'cmichalak2.jpg'),(4,'Logo MM madeleine market.jpg'),(5,'veyrat.jpg'),(6,'600px-Paul_Bocuse_2007.jpg'),(7,'logo carre madeleine market.jpg'),(8,'37432-146623-large.jpg'),(9,'logo De Buyer pour fiche produit.jpg'),(10,'el bulli.jpg');
/*!40000 ALTER TABLE `profile_picture` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:39
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profile_presentation`
--

DROP TABLE IF EXISTS `profile_presentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_presentation` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_presentation`
--


/*!40000 ALTER TABLE `profile_presentation` DISABLE KEYS */;
INSERT INTO `profile_presentation` VALUES (1,'test'),(2,' PrÃ©ambule\r\nConsidÃ©rant que la reconnaissance de la dignitÃ© inhÃ©rente Ã  tous les membres de la famille humaine et de leurs droits Ã©gaux et inaliÃ©nables constitue le fondement de la libertÃ©, de la justice et de la paix dans le monde.\r\n\r\nConsidÃ©rant que la mÃ©connaissance et le mÃ©pris des droits de l\'homme ont conduit Ã  des actes de barbarie qui rÃ©voltent la conscience de l\'humanitÃ© et que l\'avÃ¨nement d\'un monde oÃ¹ les Ãªtres humains seront libres de parler et de croire, libÃ©rÃ©s de la terreur et de la misÃ¨re, a Ã©tÃ© proclamÃ© comme la plus haute aspiration de l\'homme.\r\n\r\nConsidÃ©rant qu\'il est essentiel que les droits de l\'homme soient protÃ©gÃ©s par un rÃ©gime de droit pour que l\'homme ne soit pas contraint, en suprÃªme recours, Ã  la rÃ©volte contre la tyrannie et l\'oppression.\r\n\r\nConsidÃ©rant qu\'il est essentiel d\'encourager le dÃ©veloppement de relations amicales entre nations.\r\n\r\nConsidÃ©rant que dans la Charte les peuples des Nations Unies ont proclamÃ© Ã  nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignitÃ© et la valeur de la personne humaine, dans l\'Ã©galitÃ© des droits des hommes et des femmes, et qu\'ils se sont dÃ©clarÃ©s rÃ©solus Ã  favoriser le progrÃ¨s social et Ã  instaurer de meilleures conditions de vie dans une libertÃ© plus grande.\r\n\r\nConsidÃ©rant que les Etats Membres se sont engagÃ©s Ã  assurer, en coopÃ©ration avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertÃ©s fondamentales.\r\n\r\nConsidÃ©rant qu\'une conception commune de ces droits et libertÃ©s est de la plus haute importance pour remplir pleinement cet engagement.\r\n\r\nL\'AssemblÃ©e GÃ©nÃ©rale proclame la prÃ©sente DÃ©claration universelle des droits de l\'homme comme l\'idÃ©al commun Ã  atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la sociÃ©tÃ©, ayant cette DÃ©claration constamment Ã  l\'esprit, s\'efforcent, par l\'enseignement et l\'Ã©ducation, de dÃ©velopper le respect de ces droits et libertÃ©s et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mÃªmes que parmi celles des territoires placÃ©s sous leur juridiction.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle premier\r\nTous les Ãªtres humains naissent libres et Ã©gaux en dignitÃ© et en droits. Ils sont douÃ©s de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternitÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 2\r\n1.Chacun peut se prÃ©valoir de tous les droits et de toutes les libertÃ©s proclamÃ©s dans la prÃ©sente DÃ©claration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation. \r\n2.De plus, il ne sera fait aucune distinction fondÃ©e sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indÃ©pendant, sous tutelle, non autonome ou soumis Ã  une limitation quelconque de souverainetÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 3\r\nTout individu a droit Ã  la vie, Ã  la libertÃ© et Ã  la sÃ»retÃ© de sa personne.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 4\r\nNul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 5\r\nNul ne sera soumis Ã  la torture, ni Ã  des peines ou traitements cruels, inhumains ou dÃ©gradants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 6\r\nChacun a le droit Ã  la reconnaissance en tous lieux de sa personnalitÃ© juridique.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 7\r\nTous sont Ã©gaux devant la loi et ont droit sans distinction Ã  une Ã©gale protection de la loi. Tous ont droit Ã  une protection Ã©gale contre toute discrimination qui violerait la prÃ©sente DÃ©claration et contre toute provocation Ã  une telle discrimination.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 8\r\nToute personne a droit Ã  un recours effectif devant les juridictions nationales compÃ©tentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 9\r\nNul ne peut Ãªtre arbitrairement arrÃªtÃ©, dÃ©tenu ou exilÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 10\r\nToute personne a droit, en pleine Ã©galitÃ©, Ã  ce que sa cause soit entendue Ã©quitablement et publiquement par un tribunal indÃ©pendant et impartial, qui dÃ©cidera, soit de ses droits et obligations, soit du bien-fondÃ© de toute accusation en matiÃ¨re pÃ©nale dirigÃ©e contre elle.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 11\r\n1. Toute personne accusÃ©e d\'un acte dÃ©lictueux est prÃ©sumÃ©e innocente jusqu\'Ã  ce que sa culpabilitÃ© ait Ã©tÃ© lÃ©galement Ã©tablie au cours d\'un procÃ¨s public oÃ¹ toutes les garanties nÃ©cessaires Ã  sa dÃ©fense lui auront Ã©tÃ© assurÃ©es. \r\n2. Nul ne sera condamnÃ© pour des actions ou omissions qui, au moment oÃ¹ elles ont Ã©tÃ© commises, ne constituaient pas un acte dÃ©lictueux d\'aprÃ¨s le droit national ou international. De mÃªme, il ne sera infligÃ© aucune peine plus forte que celle qui Ã©tait applicable au moment oÃ¹ l\'acte dÃ©lictueux a Ã©tÃ© commis.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 12\r\nNul ne sera l\'objet d\'immixtions arbitraires dans sa vie privÃ©e, sa famille, son domicile ou sa correspondance, ni d\'atteintes Ã  son honneur et Ã  sa rÃ©putation. Toute personne a droit Ã  la protection de la loi contre de telles immixtions ou de telles atteintes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 13\r\n1. Toute personne a le droit de circuler librement et de choisir sa rÃ©sidence Ã  l\'intÃ©rieur d\'un Etat. \r\n2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 14\r\n1. Devant la persÃ©cution, toute personne a le droit de chercher asile et de bÃ©nÃ©ficier de l\'asile en d\'autres pays. \r\n2. Ce droit ne peut Ãªtre invoquÃ© dans le cas de poursuites rÃ©ellement fondÃ©es sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 15\r\n1. Tout individu a droit Ã  une nationalitÃ©. \r\n2. Nul ne peut Ãªtre arbitrairement privÃ© de sa nationalitÃ©, ni du droit de changer de nationalitÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 16\r\n1. A partir de l\'Ã¢ge nubile, l\'homme et la femme, sans aucune restriction quant Ã  la race, la nationalitÃ© ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits Ã©gaux au regard du mariage, durant le mariage et lors de sa dissolution. \r\n2. Le mariage ne peut Ãªtre conclu qu\'avec le libre et plein consentement des futurs Ã©poux. \r\n3. La famille est l\'Ã©lÃ©ment naturel et fondamental de la sociÃ©tÃ© et a droit Ã  la protection de la sociÃ©tÃ© et de l\'Etat.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 17\r\n1. Toute personne, aussi bien seule qu\'en collectivitÃ©, a droit Ã  la propriÃ©tÃ©.\r\n2. Nul ne peut Ãªtre arbitrairement privÃ© de sa propriÃ©tÃ©.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 18\r\nToute personne a droit Ã  la libertÃ© de pensÃ©e, de conscience et de religion ; ce droit implique la libertÃ© de changer de religion ou de conviction ainsi que la libertÃ© de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privÃ©, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 19\r\nTout individu a droit Ã  la libertÃ© d\'opinion et d\'expression, ce qui implique le droit de ne pas Ãªtre inquiÃ©tÃ© pour ses opinions et celui de chercher, de recevoir et de rÃ©pandre, sans considÃ©rations de frontiÃ¨res, les informations et les idÃ©es par quelque moyen d\'expression que ce soit.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 20\r\n1. Toute personne a droit Ã  la libertÃ© de rÃ©union et d\'association pacifiques. \r\n2. Nul ne peut Ãªtre obligÃ© de faire partie d\'une association.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 21\r\n1. Toute personne a le droit de prendre part Ã  la direction des affaires publiques de son pays, soit directement, soit par l\'intermÃ©diaire de reprÃ©sentants librement choisis. \r\n2. Toute personne a droit Ã  accÃ©der, dans des conditions d\'Ã©galitÃ©, aux fonctions publiques de son pays.\r\n3. La volontÃ© du peuple est le fondement de l\'autoritÃ© des pouvoirs publics ; cette volontÃ© doit s\'exprimer par des Ã©lections honnÃªtes qui doivent avoir lieu pÃ©riodiquement, au suffrage universel Ã©gal et au vote secret ou suivant une procÃ©dure Ã©quivalente assurant la libertÃ© du vote.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 22\r\nToute personne, en tant que membre de la sociÃ©tÃ©, a droit Ã  la sÃ©curitÃ© sociale ; elle est fondÃ©e Ã  obtenir la satisfaction des droits Ã©conomiques, sociaux et culturels indispensables Ã  sa dignitÃ© et au libre dÃ©veloppement de sa personnalitÃ©, grÃ¢ce Ã  l\'effort national et Ã  la coopÃ©ration internationale, compte tenu de l\'organisation et des ressources de chaque pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 23\r\n1. Toute personne a droit au travail, au libre choix de son travail, Ã  des conditions Ã©quitables et satisfaisantes de travail et Ã  la protection contre le chÃ´mage. \r\n2. Tous ont droit, sans aucune discrimination, Ã  un salaire Ã©gal pour un travail Ã©gal. \r\n3. Quiconque travaille a droit Ã  une rÃ©munÃ©ration Ã©quitable et satisfaisante lui assurant ainsi qu\'Ã  sa famille une existence conforme Ã  la dignitÃ© humaine et complÃ©tÃ©e, s\'il y a lieu, par tous autres moyens de protection sociale. \r\n4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier Ã  des syndicats pour la dÃ©fense de ses intÃ©rÃªts.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 24\r\nToute personne a droit au repos et aux loisirs et notamment Ã  une limitation raisonnable de la durÃ©e du travail et Ã  des congÃ©s payÃ©s pÃ©riodiques.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 25\r\n1. Toute personne a droit Ã  un niveau de vie suffisant pour assurer sa santÃ©, son bien-Ãªtre et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins mÃ©dicaux ainsi que pour les services sociaux nÃ©cessaires ; elle a droit Ã  la sÃ©curitÃ© en cas de chÃ´mage, de maladie, d\'invaliditÃ©, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indÃ©pendantes de sa volontÃ©. \r\n2. La maternitÃ© et l\'enfance ont droit Ã  une aide et Ã  une assistance spÃ©ciales. Tous les enfants, qu\'ils soient nÃ©s dans le mariage ou hors mariage, jouissent de la mÃªme protection sociale.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 26\r\n1. Toute personne a droit Ã  l\'Ã©ducation. L\'Ã©ducation doit Ãªtre gratuite, au moins en ce qui concerne l\'enseignement Ã©lÃ©mentaire et fondamental. L\'enseignement Ã©lÃ©mentaire est obligatoire. L\'enseignement technique et professionnel doit Ãªtre gÃ©nÃ©ralisÃ© ; l\'accÃ¨s aux Ã©tudes supÃ©rieures doit Ãªtre ouvert en pleine Ã©galitÃ© Ã  tous en fonction de leur mÃ©rite. \r\n2. L\'Ã©ducation doit viser au plein Ã©panouissement de la personnalitÃ© humaine et au renforcement du respect des droits de l\'homme et des libertÃ©s fondamentales. Elle doit favoriser la comprÃ©hension, la tolÃ©rance et l\'amitiÃ© entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le dÃ©veloppement des activitÃ©s des Nations Unies pour le maintien de la paix. \r\n3. Les parents ont, par prioritÃ©, le droit de choisir le genre d\'Ã©ducation Ã  donner Ã  leurs enfants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 27\r\n1. Toute personne a le droit de prendre part librement Ã  la vie culturelle de la communautÃ©, de jouir des arts et de participer au progrÃ¨s scientifique et aux bienfaits qui en rÃ©sultent. \r\n2. Chacun a droit Ã  la protection des intÃ©rÃªts moraux et matÃ©riels dÃ©coulant de toute production scientifique, littÃ©raire ou artistique dont il est l\'auteur.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 28\r\nToute personne a droit Ã  ce que rÃ¨gne, sur le plan social et sur le plan international, un ordre tel que les droits et libertÃ©s Ã©noncÃ©s dans la prÃ©sente DÃ©claration puissent y trouver plein effet.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 29\r\n1. L\'individu a des devoirs envers la communautÃ© dans laquelle seule le libre et plein dÃ©veloppement de sa personnalitÃ© est possible. \r\n2. Dans l\'exercice de ses droits et dans la jouissance de ses libertÃ©s, chacun n\'est soumis qu\'aux limitations Ã©tablies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertÃ©s d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-Ãªtre gÃ©nÃ©ral dans une sociÃ©tÃ© dÃ©mocratique. \r\n3. Ces droits et libertÃ©s ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 30\r\nAucune disposition de la prÃ©sente DÃ©claration ne peut Ãªtre interprÃ©tÃ©e comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer Ã  une activitÃ© ou d\'accomplir un acte visant Ã  la destruction des droits et libertÃ©s qui y sont Ã©noncÃ©s.\r\n'),(3,' Avec lâ€™humilitÃ© qui le caractÃ©rise, Christophe Michalak ajoute: Â«Ce nâ€™est pas le sommet qui est important, câ€™est dâ€™y resterÂ».\r\nCet Ã©ternel gourmand dÃ©veloppe chaque jour son envie de surprendre et de revisiter de grands classiques de la pÃ¢tisserie. On doit au Chef des dizaines de douceurs aussi dÃ©sirables que la Religieuse au caramel beurre de sel, les Macarons pÃªche melba ou les incontournables Bisounours en guimauve!\r\nIl ajoute: Â«Jâ€™habille mes gÃ¢teaux comme le ferait  un grand couturier avec les femmes, le beau et le bon sont indissociables! Lâ€™ivresse de pouvoir dÃ©celer une lueur de douce folie gourmande Ã  travers les yeux des clients nâ€™a pas de prix.Â»\r\n \r\nSensible et passionnÃ©, il dÃ©cide de crÃ©er les tendances et surtout de ne pas les suivre. Christophe aime citer cette phrase mythique de Bob Kennedy:\r\nÂ«Certains voient la rÃ©alitÃ© et disent pourquoiâ€¦ moi je rÃªve de lâ€™impossible et dis pourquoi pas!Â»\r\n '),(4,'Madeleine MarketÂ vous permetÂ dâ€™accÃ©der sur Internet au meilleur de la gastronomie. Madeleine MarketÂ propose plus de 6000 produits et 200 marques parmi les plusÂ prestigieuses et reconnues pour leur qualitÃ©. On trouve chez MadeleineÂ Market les nouveautÃ©s de la gastronomie, tous les ingrÃ©dientsÂ indispensables pour cuisiner et recevoir, les produits dâ€™exceptions,Â chocolats et idÃ©es cadeaux pour gastronomes, vins et spiritueux.\r\nMadeleine Market propose Ã©galement une vaste librairie culinaire etÂ toute une gamme dâ€™ustensiles de cuisine. Toute lâ€™annÃ©e, MadeleineÂ Market, câ€™est aussi une sÃ©lection de bonnes affaires.'),(5,'Marc Veyra est un grand chef cuisinier franÃ§ais. Il est trÃ¨s attachÃ© Ã  sa Haute-Savoie natale. Sa cuisine fait le lien entre les herbes de sa rÃ©gion et la gastronomie molÃ©culaire.\r\nIl a obtenu deux fois trois Ã©toiles au Guide Michelin, le Gault-Millau l\'a dÃ©signÃ© meilleur cuisinier et lui a attribuÃ© la note maximale de 20/20.'),(6,'Paul Bocuse (nÃ© Ã  Collonges-au-Mont-d\'Or le 11 fÃ©vrier 1926) est un grand chef cuisinier franÃ§ais (Trois Ã©toiles au Guide Michelin depuis 1965) et dÃ©signÃ© Â« Cuisinier du SiÃ¨cle Â» par Gault-Millau et Â« Pape de la cuisine Â» en 1989. Il dirige plusieurs restaurants Ã  Collonges-au-Mont-d\'Or et Ã  Lyon.'),(7,'Madeleine Market (http://www.madeleinemarket.com) vous permet dâ€™accÃ©der sur Internet au meilleur de la gastronomie. Madeleine Market propose plus de 6000 produits et 200 marques parmi les plus prestigieuses et reconnues pour leur qualitÃ©. On trouve chez Madeleine Market les nouveautÃ©s de la gastronomie, tous les ingrÃ©dients indispensables pour cuisiner et recevoir, les produits dâ€™exceptions, chocolats et idÃ©es cadeaux pour gastronomes, vins et spiritueux. Madeleine Market propose Ã©galement une vaste librairie culinaire et toute une gamme dâ€™ustensiles de cuisine. Toute lâ€™annÃ©e, Madeleine Market, câ€™est aussi une sÃ©lection de bonnes affaires.'),(8,'0 annÃ©es de recherche, au service de recettes culinaires naturelles, uniques sur le plan gustatif et nutritionnel.\r\n\r\nAriake sâ€™applique Ã  dÃ©velopper des assaisonnements (bouillons, fonds de sauce, sauces chaudes) Ã  la fois savoureux, entiÃ¨rement naturels, exempts dâ€™additifs et prÃ©servant les qualitÃ©s nutritionnelles. \r\n\r\nCette expertise est le fruit dâ€™une politique de Recherche et DÃ©veloppement volontariste. Ariake est Ã  la pointe de la recherche sur les domaines touchant Ã  lâ€™analyse sensorielle, lâ€™extraction douce, la conservation des nutriments et des pigments de couleur, le sÃ©chage non dÃ©naturantâ€¦\r\n\r\nPeu rÃ©pandue, en Europe, la maÃ®trise de lâ€™extraction est pourtant fondamentale.\r\nLâ€™extraction consiste Ã  extraire un premier bouillon trÃ¨s pur Ã  partir de la viande, des os, des lÃ©gumes. Puis, suivant les recettes, Ã  ajouter des aromates et des lÃ©gumes pour pratiquer une longue rÃ©duction jusquâ€™Ã  obtention de la saveur et de la consistance dÃ©sirÃ©e. Lâ€™extraction permet donc de rÃ©aliser des sauces Ã  lâ€™identique dâ€™un cuisinier, mais sur une Ã©chelle industrielle. Partant directement de la matiÃ¨re premiÃ¨re, lâ€™extraction permet aussi une meilleure traÃ§abilitÃ© et plus de sÃ©curitÃ© alimentaire. \r\nLa R&D en quelques chiffres : \r\n- 35 spÃ©cialistes en nutrition, biologie, fermentation, \r\n- 4 cuisiniers Ã  temps plein, \r\n- 17 brevets dÃ©posÃ©s et de nombreuses publications.\r\n\r\nAriake travaille avec des cuisiniers pour des cuisiniers. La cuisine nâ€™est pas statique, elle Ã©volue. A ce titre, lâ€™apport de nos chefs Â« maison Â» est fondamental et nous permet dâ€™amÃ©liorer sans cesse nos recettes pour apporter plus de goÃ»t, plus de naturel, plus de praticitÃ©. \r\nDepuis 5 ans, JoÃ«l Robuchon et Ariake ont entamÃ© une longue collaboration visant Ã  mettre leur expÃ©rience en commun pour rÃ©volutionner les prÃ©parations culinaires, en Europe et au Japon. '),(10,' ');
/*!40000 ALTER TABLE `profile_presentation` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:39
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profile_slug`
--

DROP TABLE IF EXISTS `profile_slug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_slug` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_slug`
--


/*!40000 ALTER TABLE `profile_slug` DISABLE KEYS */;
INSERT INTO `profile_slug` VALUES (1,'mm'),(2,'preambule-considerant-que-la-reconnaissance-de-la-dignite-inherente-a-tous-les-membres-de-la-famille'),(3,'christophe-michalak'),(4,'madeleine-market'),(5,'marc-veyrat'),(6,'paul-bocuse'),(7,'madeleine-market'),(8,'ariake'),(9,'de-buyer'),(10,'albert-y-ferran-adria');
/*!40000 ALTER TABLE `profile_slug` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:39
-- MySQL dump 10.13  Distrib 5.1.47, for portbld-freebsd8.0 (i386)
--
-- Host: localhost    Database: mad
-- ------------------------------------------------------
-- Server version	5.1.39

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
-- Table structure for table `profile_updated`
--

DROP TABLE IF EXISTS `profile_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_updated` (
  `id` int(12) DEFAULT NULL,
  `value` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_updated`
--


/*!40000 ALTER TABLE `profile_updated` DISABLE KEYS */;
INSERT INTO `profile_updated` VALUES (1,'2010-04-27'),(2,'2010-05-11'),(3,'2010-05-12'),(4,'2010-04-27'),(5,'2010-05-03'),(6,'2010-05-03'),(7,'2010-05-18'),(8,'2010-05-20'),(9,'2010-05-28'),(10,'2010-05-31');
/*!40000 ALTER TABLE `profile_updated` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07 14:56:39

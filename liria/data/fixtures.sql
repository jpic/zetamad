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

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:54
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeCategory`
--

LOCK TABLES `recipeCategory` WRITE;
/*!40000 ALTER TABLE `recipeCategory` DISABLE KEYS */;
INSERT INTO `recipeCategory` VALUES (1),(2),(3),(4),(5),(6);
/*!40000 ALTER TABLE `recipeCategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:54
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

LOCK TABLES `recipeCategory_slug` WRITE;
/*!40000 ALTER TABLE `recipeCategory_slug` DISABLE KEYS */;
INSERT INTO `recipeCategory_slug` VALUES (1,'dessert'),(2,'gourmandise'),(3,'plat'),(4,'aperitif'),(5,'entree'),(6,'ariake');
/*!40000 ALTER TABLE `recipeCategory_slug` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:54
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

LOCK TABLES `recipeCategory_title` WRITE;
/*!40000 ALTER TABLE `recipeCategory_title` DISABLE KEYS */;
INSERT INTO `recipeCategory_title` VALUES (1,'dessert'),(2,'gourmandise'),(3,'plat'),(4,'apéritif'),(5,'entrée'),(6,'ariaké');
/*!40000 ALTER TABLE `recipeCategory_title` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:54
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

LOCK TABLES `recipeIngredientProduct` WRITE;
/*!40000 ALTER TABLE `recipeIngredientProduct` DISABLE KEYS */;
INSERT INTO `recipeIngredientProduct` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86);
/*!40000 ALTER TABLE `recipeIngredientProduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:54
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

LOCK TABLES `recipeIngredientProduct_product` WRITE;
/*!40000 ALTER TABLE `recipeIngredientProduct_product` DISABLE KEYS */;
INSERT INTO `recipeIngredientProduct_product` VALUES (1,'2441'),(2,'37101'),(3,'36782'),(4,'168'),(5,'1827'),(6,'168'),(7,'2349'),(8,'2440'),(9,'2440Préambule Considérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.  Considérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.  Considérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.  Considérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.  Considérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.  Considérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.  Considérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.  L\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.  HAUT DE PAGE  Article premier Tous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.  HAUT DE PAGE  Article 2 1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.  HAUT DE PAGE  Article 3 Tout individu a droit à la vie, à la liberté et à la sûreté de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.  HAUT DE PAGE  Article 6 Chacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.  HAUT DE PAGE  Article 7 Tous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut être arbitrairement arrêté, détenu ou exilé.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées.  2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays.  2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit à une nationalité.  2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.  HAUT DE PAGE  Article 16 1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux.  3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété. 2. Nul ne peut être arbitrairement privé de sa propriété.  HAUT DE PAGE  Article 18 Toute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit à la liberté de réunion et d\'association pacifiques.  2. Nul ne peut être obligé de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis.  2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays. 3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage.  2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal.  3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté.  2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite.  2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix.  3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent.  2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique.  3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.  '),(10,'505'),(11,'1467'),(12,'10323'),(13,'10239'),(14,'2440'),(15,'2440'),(16,'2441'),(17,'565418484'),(18,'2441'),(19,'1683'),(20,'2232'),(21,'168'),(22,'1683'),(23,'1491'),(24,'1492'),(25,'326'),(26,'1685'),(27,'1491'),(28,'1492'),(29,'2232'),(30,'37309'),(31,'1685'),(32,'168'),(33,'304'),(34,'1491'),(35,'1492'),(36,'1684'),(37,'1683'),(38,'1684'),(39,'1683'),(40,'1683'),(41,'1684'),(42,'1685'),(43,'1686'),(44,'2441'),(45,'2440'),(46,'1491'),(47,'1171'),(48,'1172'),(49,'1491'),(50,'1492'),(51,'2440'),(52,'577'),(53,'2440'),(54,'2440'),(55,'1491'),(56,'1492'),(57,'2447'),(58,'2440'),(59,'1491'),(60,'2440'),(61,'1491'),(62,'2655'),(63,'2655'),(64,'2654'),(65,'1683'),(66,'1684'),(67,'2654'),(68,'2657'),(69,'2657'),(70,'2650'),(71,'2650'),(72,'2656'),(73,'2656'),(74,'2651'),(75,'2652'),(76,'2653'),(77,'369'),(78,'2652'),(79,'2651'),(80,'2660'),(81,'2660'),(82,'168'),(83,'2659'),(84,'2662'),(85,'2662'),(86,'2659');
/*!40000 ALTER TABLE `recipeIngredientProduct_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:54
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

LOCK TABLES `recipeIngredientProduct_recipe` WRITE;
/*!40000 ALTER TABLE `recipeIngredientProduct_recipe` DISABLE KEYS */;
INSERT INTO `recipeIngredientProduct_recipe` VALUES (1,'2'),(2,'3'),(3,'3'),(4,'4'),(5,'5'),(6,'5'),(7,'7'),(8,'8'),(9,'9'),(10,'10'),(11,'10'),(12,'10'),(13,'10'),(14,'11'),(15,'11'),(16,'11'),(17,'11'),(18,'12'),(19,'14'),(20,'14'),(21,'14'),(22,'15'),(23,'15'),(24,'15'),(25,'15'),(26,'16'),(27,'16'),(28,'16'),(29,'16'),(30,'16'),(31,'17'),(32,'17'),(33,'17'),(34,'17'),(35,'17'),(36,'18'),(37,'19'),(38,'21'),(39,'22'),(40,'23'),(41,'23'),(42,'23'),(43,'23'),(44,'23'),(45,'27'),(46,'27'),(47,'28'),(48,'29'),(49,'30'),(50,'30'),(51,'30'),(52,'31'),(53,'31'),(54,'33'),(55,'33'),(56,'33'),(57,'33'),(58,'34'),(59,'34'),(60,'35'),(61,'37'),(62,'38'),(63,'39'),(64,'40'),(65,'40'),(66,'40'),(67,'41'),(68,'42'),(69,'43'),(70,'44'),(71,'45'),(72,'46'),(73,'47'),(74,'48'),(75,'48'),(76,'49'),(77,'50'),(78,'50'),(79,'50'),(80,'51'),(81,'52'),(82,'54'),(83,'54'),(84,'54'),(85,'55'),(86,'55');
/*!40000 ALTER TABLE `recipeIngredientProduct_recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeIngredientQuantity` WRITE;
/*!40000 ALTER TABLE `recipeIngredientQuantity` DISABLE KEYS */;
INSERT INTO `recipeIngredientQuantity` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100),(101),(102),(103),(104),(105),(106),(107),(108),(109),(110),(111),(112),(113),(114),(115),(116),(117),(118),(119),(120),(121),(122),(123),(124),(125),(126),(127),(128),(129),(130),(131),(132),(133),(134),(135),(136),(137),(138),(139),(140),(141),(142),(143),(144),(145),(146),(147),(148),(149),(150),(151),(152),(153),(154),(155),(156),(157),(158),(159),(160),(161),(162),(163),(164),(165),(166),(167),(168),(169),(170),(171),(172),(173),(174),(175),(176),(177),(178),(179),(180),(181),(182),(183),(184),(185),(186),(187),(188),(189),(190),(191),(192),(193),(194),(195),(196),(197),(198),(199),(200),(201),(202),(203),(204),(205),(206),(207),(208),(209),(210),(211),(212),(213),(214),(215),(216),(217),(218),(219),(220),(221),(222),(223),(224),(225),(226),(227),(228),(229),(230),(231),(232),(233),(234),(235),(236),(237),(238),(239),(240),(241),(242),(243),(244),(245),(246),(247),(248),(249),(250),(251),(252),(253),(254),(255),(256),(257),(258),(259),(260),(261),(262),(263),(264),(265),(266),(267),(268),(269),(270),(271),(272),(273),(274),(275),(276),(277),(278),(279),(280),(281),(282),(283),(284),(285),(286),(287),(288),(289),(290),(291),(292),(293),(294),(295),(296),(297),(298),(299),(300),(301),(302),(303),(304),(305),(306),(307),(308),(309),(310),(311),(312),(313),(314),(315),(316),(317),(318),(319),(320),(321),(322),(323),(324),(325),(326),(327),(328),(329),(330),(331),(332),(333),(334),(335),(336),(337),(338),(339),(340),(341),(342),(343),(344),(345);
/*!40000 ALTER TABLE `recipeIngredientQuantity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeIngredientQuantity_ingredient` WRITE;
/*!40000 ALTER TABLE `recipeIngredientQuantity_ingredient` DISABLE KEYS */;
INSERT INTO `recipeIngredientQuantity_ingredient` VALUES (1,'Lait de coco'),(2,'Lait entier'),(3,'Sucre blond en poudre'),(4,'Mangue'),(5,'Fruit de la passion'),(6,'Sucre'),(7,'Gélatine'),(8,'Gousse de vanille'),(9,'Oeufs'),(10,'Arôme de vanille liquide'),(11,'Sucre glace'),(12,'Amidon (maïzena, fécule de pomme de terre, de riz)'),(13,'Moules de bouchot'),(14,'Vin blanc sec'),(15,'Echalotes'),(16,'Oignon'),(17,'Concentré de tomates'),(18,'Fumet de poisson'),(19,'Maïzena'),(20,'Safran en poudre'),(21,'Crème liquide'),(22,'Poivre du moulin'),(23,'Bouquet garni'),(24,'Queue de cabillaud'),(25,'Beurre en dés'),(26,'Poudre d’amandes'),(27,'Feuilles de brick'),(28,'Tomate'),(29,'Poivron rouge'),(30,'Oignon'),(31,'Huile d’olive'),(32,'Brin de thym'),(33,'Sel'),(34,'Poivre de moulin'),(35,'Calamaretti'),(36,'Citron de Menton'),(37,'Oignon rouge de 50g'),(38,'Vinaigre de vin'),(39,'Branches de basilic'),(40,'Huile d’olive'),(41,'Sel, Poivre du Moulin'),(42,'Cerises de burlat'),(43,'Farine'),(44,'Sucre'),(45,'Beurre'),(46,'Sel'),(47,'Semoule de blé dur fine'),(48,'Miel de fleur d’oranger'),(49,'Jus d’orange frais'),(50,'Abricot moelleux'),(51,'Figues séchées'),(52,'Dattes medjool'),(53,'Pignons de pin '),(54,'Raisins secs blonds'),(55,'Sucre en poudre'),(56,'Fleur de sel'),(57,'Huile d’argan'),(58,'Oranges'),(59,'Brin de menthe'),(60,'Farine'),(61,'Noisettes en poudre'),(62,'Vanille en poudre'),(63,'Sucre'),(64,'Levure chimique'),(65,'Oeuf'),(66,'Huile de noisettes grillées'),(67,'Lait'),(68,'Framboise'),(69,'Noisettes brutes'),(70,'LaitPréambule Considérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.  Considérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.  Considérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.  Considérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.  Considérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.  Considérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.  Considérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.  L\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.  HAUT DE PAGE  Article premier Tous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.  HAUT DE PAGE  Article 2 1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.  HAUT DE PAGE  Article 3 Tout individu a droit à la vie, à la liberté et à la sûreté de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.  HAUT DE PAGE  Article 6 Chacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.  HAUT DE PAGE  Article 7 Tous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut être arbitrairement arrêté, détenu ou exilé.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées.  2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays.  2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit à une nationalité.  2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.  HAUT DE PAGE  Article 16 1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux.  3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété. 2. Nul ne peut être arbitrairement privé de sa propriété.  HAUT DE PAGE  Article 18 Toute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit à la liberté de réunion et d\'association pacifiques.  2. Nul ne peut être obligé de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis.  2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays. 3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage.  2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal.  3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté.  2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite.  2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix.  3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent.  2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique.  3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.  '),(71,'Eau Froide'),(72,'Beurre en dès'),(73,'Sel fin'),(74,'Oeuf de 60g'),(75,'Farine'),(76,'Cacao en poudre'),(77,'Suvre en grains n°6'),(78,'Vermicelles en chocolat'),(79,'Collier d\'agneau décossé'),(80,'Gousse d\'ail'),(81,'Petit oignon blanc'),(82,'Sel fin'),(83,'Poivre'),(84,'Huile de pépins de raisin'),(85,'Brins de thym'),(86,'Feuille de laurier'),(87,'Concentré de tomate'),(88,'Vin blanc sec'),(89,'Fond de veau clair'),(90,'Carotte fanes fines'),(91,'Navets ronds fanes'),(92,'Rattes ou de pommes de terre de 50g à chair ferme'),(93,'Petits oignons grelots'),(94,'courgettes'),(95,'Poires fermes et juteuses (Comice ou Conférence)'),(96,'Sucre'),(97,'Eau chaude'),(98,'Biscuits à la cuillère nature'),(99,'Sirop au caramel'),(100,'Eau-de-vie de poire'),(101,'Lait'),(102,'Gélatine'),(103,'Jaunes d\'oeufs'),(104,'Crème fleurette très froide'),(105,'Gelée d\'abricot ou de pomme'),(106,'cuisses de poulet '),(107,'tranches de bacon en lardons'),(108,'branches de céleri coupées en 2'),(109,'petites carottes coupées en 2'),(110,'oignons nouveaux, blanchis et pelés'),(111,'champignons de Paris coupés en 4'),(112,'gousses d’ail écrasées'),(113,'tasse de farine'),(114,'tasses de vin rouge (merlot)'),(115,'tasses d’eau'),(116,'tasses de Fond de Veau Ariake'),(117,'café de Base de Poulet'),(118,'Huile de Canola pour la cuisson'),(119,'Du beurre pour la cuisson'),(120,'brins de thym frais'),(121,'feuilles de laurier'),(122,'Sachet de Bouillon Volaille ARIAKE'),(123,'Champignons de Paris'),(124,'Riz Spécial Risotto'),(125,'Beurre'),(126,'Échalotes émincées'),(127,'Vin blanc sec'),(128,'Parmesan râpé'),(129,'Huile d\'olive'),(130,'Botte d’asperges vertes'),(131,'Quelques feuilles d’épinard'),(132,'Sachet de bouillon de Volaille ARiaké'),(133,'Sel, poivre'),(134,'Graines de sésame'),(135,'Pate feuilletée'),(136,'Sachets de Bouillon de Coquillages Ariaké (1 sachet/personne)'),(137,'Riz Arborio pour Risotto'),(138,'Oignon'),(139,'Échalote'),(140,'Asperges vertes'),(141,'Huile d’olive'),(142,'Soupe de crème fraîche'),(143,'Parmesan fraîchement râpé'),(144,'Vin blanc'),(145,'Sel, poivre du moulin'),(146,'Sachets de Bouillon de Coquillages Ariaké (1 sachet/personne)'),(147,'Belles portions de poisson blanc (du Mérou, par exemple)'),(148,'Panachés de moules, coques et crevettes'),(149,'Langoustines'),(150,'Petites pommes de terre cuites à la vapeur'),(151,'Oignon'),(152,'Gousses d’ail'),(153,'Échalotes'),(154,'Safran'),(155,'Bouquet de basilic'),(156,'Huile d’olive'),(157,'Tomates'),(158,'Concentré de tomates'),(159,'sel, poivre du moulin'),(160,'Sachets de Bouillon de Boeuf Ariaké'),(161,'Champignons japonais (le shiitake, ou tout autre champignon asiatique parfumé)'),(162,'Carotte'),(163,'Tofu blanc'),(164,'Coriandre fraîche'),(165,'Sauce nuoc mam'),(166,'Sachets de Bouillon de Volaille Ariaké'),(167,'Ravioles de foie gras'),(168,'Ciboulette fraîche'),(169,'Sachets de Bouillon de Coquillages Ariaké (1 sachet/personne)'),(170,'Coquilles Saint-Jacques avec ou sans corail, selon votre goût'),(171,'Coriandre fraîche'),(172,'Citronnelle'),(173,'Minis légumes'),(174,'Beurre ou huile d’olive, selon votre goût'),(175,'Sachet de Bouillon de Boeuf Ariaké'),(176,'Branche de thym'),(177,'Côtes d’agneau'),(178,'Huile d’olive'),(179,'Beurre'),(180,'Sachets de Bouillon de Volaille Ariaké'),(181,'Crème fraîche liquide (non sucrée)'),(182,'Petits pois, frais de préférence'),(183,'Roquette'),(184,'Bouillon de Boeuf, Bouillon de Volaille ou Bouillon de Coquillages Ariaké (En fonction du choix de l’aspic, prenez le bouillon correspondant)'),(185,'Agar-agar en poudre'),(186,'Amandes émondées'),(187,'Sucre en poudre'),(188,'Miel liquide'),(189,'Blancs d\'oeufs'),(190,'Crème liquide froide'),(191,'Sucre glace'),(192,'Fruits confits macérés'),(193,'Sucre glace'),(194,'Amande en poudre'),(195,'Levure chimique'),(196,'Blancs d\'oeufs'),(197,'Beurre de noisette'),(198,'Vanille liquide'),(199,'Beurre'),(200,'Sucre glace'),(201,'Gros oeufs'),(202,'Farine'),(203,'Levure chimique'),(204,'Chocolat haché ou de pépites de chocolat'),(205,'Cerises'),(206,'Lait '),(207,'Liqueur de kirsch'),(208,'Citron'),(209,'Farine'),(210,'Oeufs'),(211,'Sucre semoule'),(212,'Beurre'),(213,'Sel '),(214,'Poudre d\'amandes'),(215,'Sucre glace'),(216,'Blancs d’oeufs'),(217,'Sucre semoule'),(218,'Colorants/cacao en poudre/café moulu/...'),(219,'Poudre d\'amandes'),(220,'Sucre glace'),(221,'Eau'),(222,'Blancs d\'oeufs'),(223,'Colorants/cacao en poudre/café moulu/...'),(224,'Farine'),(225,'Lait'),(226,'Oeufs'),(227,'Gruyère râpé'),(228,'Sel fin'),(229,'Poivre'),(230,'Lardons'),(231,'Pâte à brioche (voir la recette des \"Briochettes\")'),(232,'Abricots frais bien mûrs ou 1 boîte 4/4 d’abricots au sirop'),(233,'Lait'),(234,'Beaux jaunes d\'oeufs'),(235,'Sucre'),(236,'Farine'),(237,'Fécule de maïs'),(238,'Extrait de vanille'),(239,'Chocolat noir'),(240,'Beurre'),(241,'Sucre glace'),(242,'Sucre vanillé'),(243,'Farine'),(244,'Maïzena'),(245,'Sel'),(246,'Pommes de terre '),(247,'Oignons'),(248,'Gousse d\'ail'),(249,'Herbes de Provence'),(250,'Gruyère râpé'),(251,'Crème liquide'),(252,'Farine'),(253,'Beurre'),(254,'Sel, poivre'),(255,'Farine'),(256,'Levure de boulanger'),(257,'Lait'),(258,'Beurre'),(259,'Sucre'),(260,'Raisins secs'),(261,'Oeufs'),(262,'Amandes'),(263,'Sel '),(264,'Farine'),(265,'Levure chimique'),(266,'Sucre en poudre'),(267,'Oeuf'),(268,'Beurre'),(269,'Liquide (soit moitié lait, moitié rhum, soit tout lait avec un parfum au choix : vanille, zeste de citron, …)'),(270,'Sucre'),(271,'Oeufs'),(272,'Farine'),(273,'Levure'),(274,'Beurre'),(275,'Lait'),(276,'Vanille ou citron'),(277,'Beurre ramolli'),(278,'Sucre en poudre'),(279,'Oeufs'),(280,'Lait'),(281,'Farine tamisée'),(282,'Levure chimique '),(283,'Vanille liquide'),(284,'Myrtilles'),(285,'Sucre glace'),(286,'Sel'),(287,'Concombres en fleur'),(288,'Eau de cornichons au vinaigre'),(289,'Kappa'),(290,'Cèpes frais'),(291,'Bouillon aux cèpes'),(292,'Kappa'),(293,'Bouillon de viande et volaille'),(294,'Gellan'),(295,'Consommé sans sel'),(296,'Pistils de safran'),(297,'Gellan'),(298,'Lait'),(299,'Iota'),(300,'Jus d\'ananas'),(301,'Iota'),(302,'Bouillon de langoustines'),(303,'Agar'),(304,'Eau au basilic'),(305,'Agar'),(306,'Sel'),(307,'Parmesan râpé'),(308,'Eau'),(309,'Lecite'),(310,'Jus de lime'),(311,'Eau'),(312,'Lecite'),(313,'Jus de melon Cantaloupe'),(314,'Algin'),(315,'Eau'),(316,'Calcic'),(317,'Eau'),(318,'Citras'),(319,'Algin'),(320,'Purée de mangue'),(321,'Calcic'),(322,'Eau'),(323,'Thé Earl Grey'),(324,'Sucre'),(325,'Jus de citron'),(326,'Algin'),(327,'Calcic'),(328,'Mélange de sangria blanche'),(329,'Xantana'),(330,'Bouillon de jambon ibérique'),(331,'Graisse de jambon ibérique'),(332,'Xantana'),(333,'Eau'),(334,'Fèves tendres écossées et épluchées'),(335,'Mélange de Metil'),(336,'Isomalt'),(337,'Glucose'),(338,'Sucro'),(339,'Huile d’olive vierge extra'),(340,'Glice'),(341,'Eau d\'huile d\'olive noire'),(342,'Feuille de gélatine'),(343,'Sucro'),(344,'Graisse d’olive noire'),(345,'Glice');
/*!40000 ALTER TABLE `recipeIngredientQuantity_ingredient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeIngredientQuantity_quantity` WRITE;
/*!40000 ALTER TABLE `recipeIngredientQuantity_quantity` DISABLE KEYS */;
INSERT INTO `recipeIngredientQuantity_quantity` VALUES (1,'1 boîte de 33cl environ'),(2,'1 verre'),(3,'100g'),(4,'1'),(5,'2'),(6,'250g'),(7,'6 feuilles'),(8,'1.5'),(9,'3'),(10,'5g'),(11,'50g'),(12,'40g'),(13,'3L'),(14,'1L'),(15,'2'),(16,'1'),(17,'1 c. à c.'),(18,'80cl'),(19,'8g'),(20,'1 capsule'),(21,'25cl'),(23,'1 branche de thym, 1 feuille de laurier et  3 rubans de zeste d’orange'),(24,'500g'),(25,'40g'),(26,'60g'),(27,'5'),(28,'1'),(29,'1'),(30,'1/2'),(32,'1'),(35,'1kg'),(36,'1'),(37,'1'),(38,'5cl'),(39,'2'),(42,'1 livre'),(43,'300g'),(44,'150g'),(45,'150g'),(46,'1 pincée'),(47,'180g'),(48,'60g'),(49,'40cl'),(50,'4'),(51,'4'),(52,'4'),(53,'50g'),(54,'30g'),(55,'20g'),(56,'1 pincée'),(57,'1 c. à c.'),(58,'2'),(59,'1'),(60,'175g'),(61,'20g'),(62,'1/2 c. à c.'),(63,'70g'),(64,'6g'),(65,'1'),(67,'115g'),(68,'18'),(69,'30g'),(70,'12.5clPréambule Considérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.  Considérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.  Considérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.  Considérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.  Considérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.  Considérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.  Considérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.  L\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.  HAUT DE PAGE  Article premier Tous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.  HAUT DE PAGE  Article 2 1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.  HAUT DE PAGE  Article 3 Tout individu a droit à la vie, à la liberté et à la sûreté de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.  HAUT DE PAGE  Article 6 Chacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.  HAUT DE PAGE  Article 7 Tous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut être arbitrairement arrêté, détenu ou exilé.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées.  2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays.  2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit à une nationalité.  2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.  HAUT DE PAGE  Article 16 1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux.  3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété. 2. Nul ne peut être arbitrairement privé de sa propriété.  HAUT DE PAGE  Article 18 Toute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit à la liberté de réunion et d\'association pacifiques.  2. Nul ne peut être obligé de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis.  2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays. 3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage.  2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal.  3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté.  2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite.  2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix.  3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent.  2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique.  3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.  '),(71,'12cl'),(72,'125g'),(73,'4g'),(74,'4'),(75,'110g'),(76,'30g'),(77,'200g'),(78,'4 cuillères à soupe'),(79,'800g'),(80,'1'),(81,'1'),(86,'1'),(87,'20g (1c. à s.)'),(88,'8cl'),(89,'15cl'),(90,'6'),(91,'5'),(92,'300g'),(93,'20g'),(94,'200g'),(95,'3'),(96,'300g+ 25g pour la bavaroise'),(97,'500g'),(98,'30'),(99,'200g'),(100,'5g'),(101,'90g'),(102,'1 feuille'),(103,'4'),(104,'150g'),(105,'100g'),(106,'6'),(107,'5'),(108,'2'),(109,'2'),(110,'25'),(111,'12'),(112,'2'),(113,'1'),(114,'2'),(115,'2'),(116,'2/3'),(117,'2c'),(120,'4'),(121,'2'),(122,'2 litres'),(123,'150g'),(124,'350g'),(125,'30g'),(126,'2'),(127,'15 cl'),(128,'50g'),(129,'3 c à s.'),(130,'1'),(132,'33 cl'),(136,'3'),(137,'160g environ'),(138,'1'),(139,'1'),(140,'6'),(141,'6 c. à s.'),(142,'4 c. à s.'),(143,'4 c. à s.'),(144,'1 verre'),(146,'4'),(147,'600g ou 4'),(148,'400g'),(149,'8'),(150,'8'),(151,'1'),(152,'4'),(153,'2'),(154,'2 doses'),(155,'1'),(156,'4 c. à s.'),(157,'2'),(158,'2 c. à s.'),(160,'2'),(161,'150g'),(162,'1'),(163,'100g'),(166,'3'),(167,'12'),(169,'3'),(170,'12'),(171,'1 c. à c.'),(172,'2 petits bâtons'),(173,'4 carottes, 1 blanc de poireaux'),(174,'1 c. à s.'),(175,'1'),(176,'1'),(177,'4'),(178,'4 c. à s.'),(179,'1 c. à s.'),(180,'2'),(181,'25 cl'),(182,'100g'),(183,'100g'),(184,'Prévoir un 1 sachet pour 3 verrines.'),(186,'100g'),(187,'25g'),(188,'100ml'),(189,'4'),(190,'400ml'),(191,'40g'),(192,'60g dans 50l de rhum'),(193,'225g'),(194,'80g'),(195,'2g'),(196,'11'),(197,'120g'),(198,'2g'),(199,'125g'),(200,'125g'),(201,'2'),(202,'180g'),(203,'6g'),(204,'200g'),(205,'500g'),(206,'25 cl'),(207,'1/4 de verre'),(208,'un demi'),(209,'180g'),(210,'3'),(211,'100g'),(212,'60g'),(213,'1 pincée'),(214,'100g'),(215,'100g'),(216,'4'),(217,'30g'),(219,'100g'),(220,'100g'),(221,'25ml'),(222,'2'),(224,'125g'),(225,'1/2 litre'),(226,'3'),(227,'100g'),(228,'1 c. à c.'),(229,'1 pincée'),(230,'100g'),(231,'300g'),(232,'600g'),(233,'1/4 de litre'),(234,'2'),(235,'60g'),(236,'15g'),(237,'15g'),(239,'100g'),(240,'50g'),(241,'200g'),(242,'1 sachet'),(243,'30g'),(244,'20g'),(245,'1 pincée'),(246,'800g'),(247,'2'),(248,'1'),(250,'150g'),(251,'25cl'),(252,'1 c. à s.'),(253,'30g'),(255,'1kg'),(256,'50g'),(257,'1/2 litre'),(258,'100g'),(259,'200g'),(260,'200g'),(261,'4'),(264,'250g'),(265,'1 sachet'),(266,'150g'),(267,'1'),(268,'75g'),(269,'1dl'),(270,'190g'),(271,'2'),(272,'240g'),(273,'6g'),(274,'90g'),(275,'75g'),(277,'125g'),(278,'175g'),(279,'2'),(280,'25cl'),(281,'300g'),(282,'1 c. à c.'),(283,'1 c. à c.'),(284,'100g'),(286,'1 pincée'),(287,'20'),(288,'20g'),(289,'0.75g'),(290,'5'),(291,'200g'),(292,'3g'),(293,'250g'),(294,'6.5g'),(295,'250g'),(296,'10'),(297,'4.8g'),(298,'200g'),(299,'0.6g'),(300,'250g'),(301,'0.3g'),(302,'250g'),(303,'0.6g'),(304,'250g'),(305,'0.9g'),(307,'500g'),(308,'450g'),(309,'3g'),(310,'225g'),(311,'275g'),(312,'1.5g'),(313,'250g'),(314,'2g'),(315,'500g'),(316,'2.5g'),(317,'1250g'),(318,'1.3g'),(319,'1.8g'),(320,'250g'),(321,'5g'),(322,'975g'),(323,'16g'),(324,'25g'),(325,'50g'),(326,'1.5g'),(327,'3.25g'),(328,'500g'),(329,'1.4g'),(330,'50g'),(331,'30g'),(332,'0.2g'),(333,'100g'),(334,'65g'),(335,'20g'),(336,'100g'),(337,'25g'),(338,'1.5g'),(339,'45g'),(340,'1.5g'),(341,'50g'),(342,'1 (réhydratée dans de l’eau froide)'),(343,'0.5g'),(344,'50g'),(345,'0.5g');
/*!40000 ALTER TABLE `recipeIngredientQuantity_quantity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeIngredientQuantity_recipe` WRITE;
/*!40000 ALTER TABLE `recipeIngredientQuantity_recipe` DISABLE KEYS */;
INSERT INTO `recipeIngredientQuantity_recipe` VALUES (1,'1'),(2,'1'),(3,'1'),(4,'1'),(5,'1'),(6,'2'),(7,'2'),(8,'2'),(9,'2'),(10,'2'),(11,'2'),(12,'2'),(13,'3'),(14,'3'),(15,'3'),(16,'3'),(17,'3'),(18,'3'),(19,'3'),(20,'3'),(21,'3'),(22,'3'),(23,'3'),(24,'4'),(25,'4'),(26,'4'),(27,'4'),(28,'4'),(29,'4'),(30,'4'),(31,'4'),(32,'4'),(33,'4'),(34,'4'),(35,'5'),(36,'5'),(37,'5'),(38,'5'),(39,'5'),(40,'5'),(41,'5'),(42,'6'),(43,'6'),(44,'6'),(45,'6'),(46,'6'),(47,'7'),(48,'7'),(49,'7'),(50,'7'),(51,'7'),(52,'7'),(53,'7'),(54,'7'),(55,'7'),(56,'7'),(57,'7'),(58,'7'),(59,'7'),(60,'8'),(61,'8'),(62,'8'),(63,'8'),(64,'8'),(65,'8'),(66,'8'),(67,'8'),(68,'8'),(69,'8'),(70,'9'),(71,'9'),(72,'9'),(73,'9'),(74,'9'),(75,'9'),(76,'9'),(77,'9'),(78,'9'),(79,'10'),(80,'10'),(81,'10'),(82,'10'),(83,'10'),(84,'10'),(85,'10'),(86,'10'),(87,'10'),(88,'10'),(89,'10'),(90,'10'),(91,'10'),(92,'10'),(93,'10'),(94,'11'),(95,'12'),(96,'12'),(97,'12'),(98,'12'),(99,'12'),(100,'12'),(101,'12'),(102,'12'),(103,'12'),(104,'12'),(105,'12'),(106,'13'),(107,'13'),(108,'13'),(109,'13'),(110,'13'),(111,'13'),(112,'13'),(113,'13'),(114,'13'),(115,'13'),(116,'13'),(117,'13'),(118,'13'),(119,'13'),(120,'13'),(121,'13'),(122,'14'),(123,'14'),(124,'14'),(125,'14'),(126,'14'),(127,'14'),(128,'14'),(129,'14'),(130,'15'),(131,'15'),(132,'15'),(133,'15'),(134,'15'),(135,'15'),(136,'16'),(137,'16'),(138,'16'),(139,'16'),(140,'16'),(141,'16'),(142,'16'),(143,'16'),(144,'16'),(145,'16'),(146,'17'),(147,'17'),(148,'17'),(149,'17'),(150,'17'),(151,'17'),(152,'17'),(153,'17'),(154,'17'),(155,'17'),(156,'17'),(157,'17'),(158,'17'),(159,'17'),(160,'18'),(161,'18'),(162,'18'),(163,'18'),(164,'18'),(165,'18'),(166,'19'),(167,'19'),(168,'19'),(169,'20'),(170,'20'),(171,'20'),(172,'20'),(173,'20'),(174,'20'),(175,'21'),(176,'21'),(177,'21'),(178,'21'),(179,'21'),(180,'22'),(181,'22'),(182,'22'),(183,'22'),(184,'23'),(185,'23'),(186,'24'),(187,'24'),(188,'24'),(189,'24'),(190,'24'),(191,'24'),(192,'24'),(193,'25'),(194,'25'),(195,'25'),(196,'25'),(197,'25'),(198,'25'),(199,'26'),(200,'26'),(201,'26'),(202,'26'),(203,'26'),(204,'26'),(205,'27'),(206,'27'),(207,'27'),(208,'27'),(209,'27'),(210,'27'),(211,'27'),(212,'27'),(213,'27'),(214,'28'),(215,'28'),(216,'28'),(217,'28'),(218,'28'),(219,'29'),(220,'29'),(221,'29'),(222,'29'),(223,'29'),(224,'30'),(225,'30'),(226,'30'),(227,'30'),(228,'30'),(229,'30'),(230,'30'),(231,'31'),(232,'31'),(233,'31'),(234,'31'),(235,'31'),(236,'31'),(237,'31'),(238,'31'),(239,'32'),(240,'32'),(241,'32'),(242,'32'),(243,'32'),(244,'32'),(245,'32'),(246,'33'),(247,'33'),(248,'33'),(249,'33'),(250,'33'),(251,'33'),(252,'33'),(253,'33'),(254,'33'),(255,'34'),(256,'34'),(257,'34'),(258,'34'),(259,'34'),(260,'34'),(261,'34'),(262,'34'),(263,'34'),(264,'35'),(265,'35'),(266,'35'),(267,'35'),(268,'35'),(269,'35'),(270,'36'),(271,'36'),(272,'36'),(273,'36'),(274,'36'),(275,'36'),(276,'36'),(277,'37'),(278,'37'),(279,'37'),(280,'37'),(281,'37'),(282,'37'),(283,'37'),(284,'37'),(285,'37'),(286,'37'),(287,'38'),(288,'38'),(289,'38'),(290,'39'),(291,'39'),(292,'39'),(293,'40'),(294,'40'),(295,'41'),(296,'41'),(297,'41'),(298,'42'),(299,'42'),(300,'43'),(301,'43'),(302,'44'),(303,'44'),(304,'45'),(305,'45'),(306,'45'),(307,'46'),(308,'46'),(309,'46'),(310,'47'),(311,'47'),(312,'47'),(313,'48'),(314,'48'),(315,'48'),(316,'48'),(317,'49'),(318,'49'),(319,'49'),(320,'49'),(321,'49'),(322,'50'),(323,'50'),(324,'50'),(325,'50'),(326,'50'),(327,'50'),(328,'51'),(329,'51'),(330,'52'),(331,'52'),(332,'52'),(333,'53'),(334,'53'),(335,'53'),(336,'54'),(337,'54'),(338,'54'),(339,'54'),(340,'54'),(341,'55'),(342,'55'),(343,'55'),(344,'55'),(345,'55');
/*!40000 ALTER TABLE `recipeIngredientQuantity_recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipePicture` WRITE;
/*!40000 ALTER TABLE `recipePicture` DISABLE KEYS */;
INSERT INTO `recipePicture` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22);
/*!40000 ALTER TABLE `recipePicture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipePicture_picture` WRITE;
/*!40000 ALTER TABLE `recipePicture_picture` DISABLE KEYS */;
INSERT INTO `recipePicture_picture` VALUES (1,'photo_creme_cocomangue.jpg'),(2,'photo_guimauvevanille2.jpg'),(3,'photo_moulescremes.jpg'),(4,'photo_fingercabillaud.jpg'),(5,'photo_calamaraletouffee3.jpg'),(6,'photo_crumblecerises.jpg'),(7,'photo_couscoussucre.jpg'),(8,'photo_muffinsframboise2.jpg'),(9,'photo_chouquettechocolat2.jpg'),(10,'photo_navarinagneau2.jpg'),(11,'photo_flandecourgette.jpg'),(12,'photo_charlottepoirecaramel2.jpg'),(13,'risottochampignon.jpg'),(14,'gaspacho.jpg'),(15,'Recette-Ariake-Risotto-2.jpg'),(16,'Recette-Ariake-Safran-brode.jpg'),(17,'Recette-Ariake-Soupe-Japona.jpg'),(18,'Recette-Ariake-Bouillon-aux.jpg'),(19,'Recette-Ariake-Nage-Saint-J.jpg'),(20,'Recette-Ariake-Deglacage-2.jpg'),(21,'Recette-Ariake-Cappucino-de.jpg'),(22,'Recette-Ariake-Aspics-en-ve_.jpg');
/*!40000 ALTER TABLE `recipePicture_picture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipePicture_recipe` WRITE;
/*!40000 ALTER TABLE `recipePicture_recipe` DISABLE KEYS */;
INSERT INTO `recipePicture_recipe` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9'),(10,'10'),(11,'11'),(12,'12'),(13,'14'),(14,'15'),(15,'16'),(16,'17'),(17,'18'),(18,'19'),(19,'20'),(20,'21'),(21,'22'),(22,'23');
/*!40000 ALTER TABLE `recipePicture_recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipePicture_sortkey` WRITE;
/*!40000 ALTER TABLE `recipePicture_sortkey` DISABLE KEYS */;
INSERT INTO `recipePicture_sortkey` VALUES (1,'0'),(2,'0'),(3,'0'),(4,'0'),(5,'0'),(6,'0'),(7,'0'),(8,'0'),(9,'0'),(10,'0'),(11,'0'),(12,'0'),(13,'0'),(14,'0'),(15,'0'),(16,'0'),(17,'0'),(18,'0'),(19,'0'),(20,'0'),(21,'0'),(22,'0');
/*!40000 ALTER TABLE `recipePicture_sortkey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipePicture_title` WRITE;
/*!40000 ALTER TABLE `recipePicture_title` DISABLE KEYS */;
INSERT INTO `recipePicture_title` VALUES (1,''),(2,''),(3,''),(4,''),(5,''),(6,''),(7,''),(8,''),(9,''),(10,''),(11,''),(12,''),(13,''),(14,''),(15,''),(16,''),(17,''),(18,''),(19,''),(20,''),(21,''),(22,'');
/*!40000 ALTER TABLE `recipePicture_title` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeStep` WRITE;
/*!40000 ALTER TABLE `recipeStep` DISABLE KEYS */;
INSERT INTO `recipeStep` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80);
/*!40000 ALTER TABLE `recipeStep` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeStep_description` WRITE;
/*!40000 ALTER TABLE `recipeStep_description` DISABLE KEYS */;
INSERT INTO `recipeStep_description` VALUES (1,'Mélangez le lait de coco avec le lait entier et le sucre. Portez le tout à ébullition, laissez cuire 3 min. Éteignez le feu et laissez refroidir.\r\n\r\nPelez la mangue et mixez-la afin de la réduire en purée.\r\n\r\nRépartissez dans le fond de 4 verres un peu de purée de mangue.\r\n\r\nVersez doucement le mélange de laits.\r\n\r\nEnfin, ajoutez dans chaque verre une grosse cuillerée à soupe de pulpe de fruits de la Passion. Servez bien frais.\r\n\r\nVous pouvez aussi mixer tous les ingrédients afin d’obtenir un milk-shake bien mousseux.  '),(2,'Préparez les guimauves : versez le sucre dans une casserole. Ajoutez 8 cl d’eau. Faites chauffer à feu moyen jusqu’à petite ébullition. Laissez cuire en surveillant la montée en température avec un thermomètre jusqu’à 130 °C. \n\r\nPendant ce temps, mettez la gélatine à tremper dans un bol d’eau froide. Fendez les gousses de vanille en deux dans la longueur avec un couteau d\'office. Grattez l\'intérieur pour récupérer les graines. Clarifiez les oeufs en séparant les jaunes des blancs. Pesez 90 g de blancs et versez-les dans le bol d’un batteur. Battez les blancs jusqu’à ce qu’ils aient une consistance mousseuse. Égouttez la gélatine, essorez-la. \n\r\nQuand le sirop atteint 130 °C, retirez-le du feu. Versez le sirop chaud sur les œufs tout en laissant tourner le batteur. Toujours en laissant tourner le batteur, ajoutez les graines de vanille puis la gélatine et enfin l’arôme de vanille.  \n\r\nPréparez l’enrobage : mélangez dans un bol le sucre glace et la fécule. Recouvrez une plaque de papier sulfurisé. Posez un carré en inox sur une moitié. Poudrez-en le fond avec l’enrobage. Poudrez l’autre partie de la feuille de la même manière. \n\r\nArrêtez le robot : la pâte doit être assez épaisse et tiède. Répartissez une partie du mélange à l’intérieur du carré en inox. Remplissez-le bien à ras bords en vous aidant d’une spatule. Égalisez la surface. Remplissez une poche à douille munie d’une douille unie de 10 mm avec le reste de préparation. Formez des boudins réguliers sur toute la largeur de l’autre moitié de la feuille en maintenant la poche d’une main tandis que l’autre main presse doucement pour faire sortir la pâte. Poudrez le dessus des boudins et du carré d’enrobage. '),(3,'Laissez prendre 2 h à température ambiante. Coupez les boudins en deux avec un couteau à lame large.  Formez des noeuds avec chaque demi-boudin. Trempez-les dans l’enrobage. Retirez l’excédent du bout du doigt et déposez les noeuds sur une plaque. \n\r\nPour démouler le carré, trempez un couteau d’office dans de l’eau chaude et passez la pointe sur les bords. Soulevez le carré en maintenant la guimauve de l’autre main. Coupez le carré en deux avec un couteau éminceur à lame large. Humidifiez la lame. Recoupez chaque moitié en deux. Tournez la plaque et coupez à la perpendiculaire pour obtenir des cubes. Trempez-les dans l’enrobage.  Retirez l’excédent du bout du doigt et déposez les cubes sur la plaque. C’est prêt !\n\r\n'),(4,'Nettoyez les moules en les grattant et en les frottant les uns contres les autres. Lavez-les. Epluchez les échalotes et l’oignon. Emincez-les finement. \r\nDans un faitout, mettez les moules avec les échalotes, l’oignon, le vin blanc et le bouquet garni. Poivrez. Couvrez et portez à ébullition sur feu vif. \r\nLorsque les moules sont juste ouvertes, égouttez-les bien en conservant le jus. Décortiquez les moules. Mettez 100 g de moules décortiquées de  côté pour la liaison de la soupe. \r\nDéposez les autres dans un plat et recouvrez-les d’une peu de jus de cuisson. '),(5,'Filtrez le jus des moules au chinois ou dans une passoire fine. Dans le faitout des moules, versez le jus avec le fumet de poisson. Faites réduire ce jus de moitié à feu vif. Ajoutez au jus réduit le concentré de tomates et la maïzena, tout en fouettant. Laissez cuire à feu doux 5 minutes. Ajoutez la crème liquide et le safran. Laissez cuire encore 5 minutes à feu doux. '),(6,'Mixez la crème avec les moules mises de côté pour la liaison à l’aide d’un mixer blender ou d’un mixer plongeant pendant 1 minute. Rectifiez l’assaisonnement et répartissez la crème dans des assiettes creuses. Décorez de moules. Servez aussitôt.  '),(7,'Préparez le jus de poivron : lavez la tomate et le poivron. Pelez l’oignon, coupez-le en lamelles avec le couteau éminceur. Ôtez le pédoncule de la tomate, coupez-la en quatre puis en tranches fines. Ôtez le pédoncule du poivron, les filaments blancs et les pépins. Coupez-le en lanières. Faites chauffer 2 c. à s. d’huile dans la casserole. Versez l’oignon et le thym, et laissez fondre 30 s à feu moyen. Mélangez. Ajoutez la tomate et le poivron. Assaisonnez avec 2 pincées de sel et 10 tours de moulin à poivre. Mélangez, couvrez et laissez cuire 25 min à feu doux, en remuant de temps en temps. \r\n\r\nFaites fondre les dés de beurre à feu doux dans la casserole. Versez dans un autre récipient en laissant le dépôt formé au fond de la casserole. \r\n\r\nIncisez le côté pointu de la queue du poisson et faites glisser le couteau à filet de sole entre la chair et la peau. Jetez la peau. Taillez la chair du poisson en bâtonnets réguliers de 1,5 cm de largeur environ. \r\n\r\nÉtalez la poudre d’amandes en couche régulière dans une assiette. Posez les feuilles de brick les unes sur les autres. Badigeonnez la première de beurre clarifié à l’aide du pinceau. Préchauffez votre four à 240 °C (th. 8-9). \r\n\r\nSalez les bâtonnets. Posez-les sur la poudre d’amandes et retournez-les pour les enrober. Posez 3 bâtonnets bout à bout au centre d’une feuille de brick. Coupez la feuille entre les bâtonnets. Roulez les bâtonnets dans leur morceau de brick. Égalisez les bouts. Posez les fingers de cabillaud sur la plaque. Toutes les feuilles empilées ont été coupées en même temps que la 1ère. Enroulez de la même manière chaque bâtonnet dans un morceau de brick. Badigeonnez les fingers de beurre fondu au pinceau. \r\n\r\nEnfournez et laissez cuire 10 min. \r\n\r\nRetirez le thym de la casserole contenant le poivron. Versez les légumes dans un récipient haut. Entourez le récipient et le mixeur plongeant de film alimentaire pour éviter les projections. Mixez. Filtrez le poivron dans la passoire fine en appuyant avec une cuillère. \r\n\r\nSortez la plaque du four. Enfilez une brochette dans chaque finger. Posez les fingers sur du papier absorbant pour les éponger. Déposez le jus de poivron au centre d’un plat. Entourez avec les fingers et servez aussitôt.'),(8,'Nettoyer les calamaretti. Bien les laver, les tamponner dans un torchon. Les laisser entiers. Les réserver au frais.'),(9,'Couper la moitié du citron en fines tranches de 3 mm. Les poêler rapidement dans une goutte d’huile d’olive. Ajouter le jus de l’autre moitié du citron. Confire les tranches à feu doux jusqu’à ce que le jus soit réduit. \n\n\r\nLes débarrasser. Les recouper en huit en forme de triangles.'),(10,'Eplucher l’oignon, le tailler en rouelles de 3 mm. \n\n\r\nChauffer un lit d’huile dans un sautoir. Y jeter les calamaretti. Les cuire à feu vif pendant 3 minutes. Ajouter les rouelles d’oignon. Cuire 1 minute. Déglacer en trois fois avec le vinaigre. Retirer le sautoir du feu. Verser 5 cl d’huile d’olive. Remuer pour bien lier le tout. \n\n\r\n'),(11,'Dresser les calamars dans les assiettes, ajouter les triangles de citron et quelques feuilles du basilic. Donner un tour de moulin à poivre. '),(12,'Préchauffer le four (th.5). \r\n\r\nTapisser le fond d’un plat rectangulaire de cerises dénoyautées sans les superposer. \r\n\r\nDans un grand bol, mélanger quelques minutes et du bout des doigts, la farine, le sucre, le beurre et le sel. \r\n\r\nSaupoudrer ce sable grossier uniformément sur les cerises. \r\n\r\nEnfourner et laisser cuire 30 minutes.'),(13,'Versez le miel dans un bol, faites-le chauffer 40 s au micro-ondes (900 W) afin qu’il se liquéfie. Versez la semoule dans un saladier, ajoutez le miel et 25 cl de jus d’orange. Laissez gonfler 15 min. \r\n\r\nCoupez les abricots en dés. Coupez les figues en dés. Dénoyautez les dattes : fendez-les puis ôtez leur noyau avec la pointe du couteau. Coupez-les en quatre puis en dés. \r\n\r\nÉgrenez la semoule à l’aide d’une fourchette. Ajoutez les fruits secs ainsi que les 15 cl de jus d’orange restants. Mélangez et laissez gonfler encore. \r\n\r\nFaites dorer les pignons à feu vif dans une poêle, en agitant sans cesse la poêle de façon circulaire. Ajoutez les raisins, faites sauter pendant 20 s. \r\n\r\nVersez le sucre en pluie et mélangez avec une spatule jusqu’à caramélisation. Ajoutez une pincée de fleur de sel. Arrosez d’huile d’argan. Débarrassez sur du papier sulfurisé pour arrêter la cuisson. \r\n\r\nPelez les oranges à vif : retirez les extrémités et taillez la peau verticalement en suivant la courbe du fruit. Incisez de chaque côté des suprêmes pour les détacher de leur membrane. Ciselez la menthe. Puis ajoutez-la aux oranges. \r\nAérez la semoule à la fourchette et couvrez-la de film alimentaire.\r\n'),(14,'Laissez-la reposer au réfrigérateur pendant au moins 3 h (voire 1 nuit). Au moment de servir, dressez la semoule et répartissez dessus les pignons et raisins caramélisés. Accompagnez de la salade d’orange à la menthe.'),(15,'Préchauffez votre four à 180 °C (th. 6) en chaleur tournante. Pesez tous les ingrédients. Versez les ingrédients en poudre dans un saladier : la farine, les noisettes en poudre, la vanille, le sucre et la levure. Cassez l’oeuf dans un bol. Versez l\'huile dessus en fouettant. Ajoutez le lait et mélangez. Mélangez les ingrédients en poudre. \n\r\n\n\r\nCreusez une fontaine (un creux) au centre. Versez les ingrédients liquides dessus. Raclez bien le bol avec une maryse  pour tout récupérer. Mélangez au fouet en commençant par le centre et en incorporant petit à petit les ingrédients en poudre. La pâte doit être molle mais non liquide. \n\r\n\n\r\nEmplissez les moules au tiers de leur hauteur avec une cuillère à soupe. Enfoncez 3 framboises dans chaque moule, sans qu’elles touchent le bord ni le fond. Finissez de remplir les moules, en couvrant bien les framboises. \n\r\n\n\r\nÉclatez les noisettes une à une avec le plat de la lame d’un couteau éminceur, en tapant avec la main. Hachez doucement les gros morceaux avec le couteau. Parsemez les muffins de noisettes. '),(16,'Enfournez et laissez cuire 25 min, en tournant la plaque à mi-cuisson. Laissez reposer 5 min : la pâte se rétracte légèrement, ce qui facilite le démoulage. Démoulez sur une grille et laissez refroidir.'),(17,'Préchauffez votre four à 150 °C (th. 5) en chaleur tournante (170 °C), th. 6 en chaleur traditionnelle). \r\n\r\n\r\n\r\nVersez le lait dans la casserole. Ajoutez l’eau. Ajoutez le beurre. Salez et portez doucement à ébullition en remuant un peu.\r\n\r\nPendant ce temps, cassez 3 œufs à part. Battez le dernier à la fourchette.\r\n\r\nTamisez la farine et le cacao sur une feuille de papier sulfurisé. \r\n\r\nLorsque le liquide est à ébullition, retirez la casserole du feu et versez d’un coup le mélange farine-cacao. Mélangez avec la maryse. Remettez la casserole sur feu moyen et continuez de mélanger pendant 1 min pour dessécher la pâte. Versez la pâte dans un saladier. Ajoutez les 3 oeufs un par un en remuant vigoureusement. Ajoutez l’œuf battu par petites quantités, jusqu’à l’obtention d’une pâte lisse. \r\n\r\n\r\n\r\nFixez la douille sur la poche et remplissez la poche de pâte à choux au chocolat. Pochez des choux de 3,5 cm de diamètre environ sur chaque plaque à pâtisserie, en les espaçant de 3 cm. Parsemez largement de sucre en grains. Saupoudrez de vermicelles en chocolat. Secouez chaque plaque au-dessus d’une feuille de papier sulfurisé pour faire tomber l’excédent de sucre et de vermicelles.  '),(18,'Enfournez en plaçant une plaque en haut du four et l’autre en bas. Laissez cuire 30 min. Décollez les chouquettes de leur plaque de cuisson avec la spatule retournée et laissez-les refroidir. C’est prêt \r\n\r\n Préambule\r\nConsidérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.\r\n\r\nConsidérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.\r\n\r\nConsidérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.\r\n\r\nConsidérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.\r\n\r\nConsidérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.\r\n\r\nConsidérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.\r\n\r\nConsidérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.\r\n\r\nL\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle premier\r\nTous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 2\r\n1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation. \r\n2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 3\r\nTout individu a droit à la vie, à la liberté et à la sûreté de sa personne.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 4\r\nNul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 5\r\nNul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 6\r\nChacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 7\r\nTous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 8\r\nToute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 9\r\nNul ne peut être arbitrairement arrêté, détenu ou exilé.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 10\r\nToute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 11\r\n1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées. \r\n2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 12\r\nNul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 13\r\n1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat. \r\n2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 14\r\n1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays. \r\n2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 15\r\n1. Tout individu a droit à une nationalité. \r\n2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 16\r\n1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution. \r\n2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux. \r\n3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 17\r\n1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété.\r\n2. Nul ne peut être arbitrairement privé de sa propriété.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 18\r\nToute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 19\r\nTout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 20\r\n1. Toute personne a droit à la liberté de réunion et d\'association pacifiques. \r\n2. Nul ne peut être obligé de faire partie d\'une association.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 21\r\n1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis. \r\n2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays.\r\n3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 22\r\nToute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 23\r\n1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage. \r\n2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal. \r\n3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale. \r\n4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 24\r\nToute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 25\r\n1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté. \r\n2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 26\r\n1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite. \r\n2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix. \r\n3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 27\r\n1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent. \r\n2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 28\r\nToute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 29\r\n1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible. \r\n2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique. \r\n3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 30\r\nAucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.\r\n'),(19,'Épluchez l’ail et l’oignon. Coupez l’ail en deux, retirez le germe. Coupez l’oignon en petits dés avec le couteau éminceur. Coupez la viande en cubes de 3 cm de côté. Salez-les et poivrez-les.\n\r\n\n\r\nFaites chauffer 1 c. à s. d’huile dans la cocotte. Versez les cubes de viande. Faites-les colorer 5-6 min à feu vif, en remuant avec la spatule. Ajoutez l’ail, l’oignon, 1 brin de thym et le laurier. Laissez revenir le tout 1 min. Incorporez le concentré de tomate et laissez cuire 1 min en mélangeant soigneusement. Nettoyez les bords de la cocotte avec le pinceau humide. Arrosez de vin blanc. \n\r\n\n\r\nPréchauffez le four à 160 °C (th. 5-6) en chaleur tournante.\n\r\n\n\r\nDécollez les sucs de cuisson en grattant avec la spatule et laissez réduire le vin 3-4 min pour en enlever l’acidité ; il doit en rester 2-3 c. à s. Versez le fond de veau. Portez à ébullition puis couvrez la cocotte, enfournez et laissez cuire 1 h.\n\r\n\n\r\nPendant ce temps, lavez et épluchez les carottes et les navets. Coupez les carottes en tronçons biseautés de 3 cm de longueur. Coupez les navets en quatre. Grattez les pommes de terre. Épluchez les petits oignons. Rangez les légumes sur un plat et couvrez-les d’un papier absorbant humide. \n\r\n\n\r\nAprès 1 h de cuisson, sortez la cocotte du four, ouvrez-la et mélangez. Salez les légumes. Ajoutez-les tous. Mélangez bien et versez un peu d’eau s’il n’y a pas assez de liquide.\n\r\n\n\r\nNettoyez les bords de la cocotte avec le pinceau humide. Couvrez de nouveau la cocotte, enfournez et laissez cuire 30 min. Vérifiez la cuisson en piquant les légumes et la viande avec la pointe d’un couteau. '),(20,'Déposez la viande et les légumes sur des assiettes bien chaudes en les nappant d’un peu de jus. Goûtez et rectifiez l’assaisonnement. Décorez chaque assiette d’un brin de thym. Servez immédiatement.'),(21,'  Préchauffer le four à 150 °C (th. 3), sortir le beurre, beurrer le ramequin (de bas en haut avec le pinceau, pour que le flan monte facilement), et le mettre à refroidir au réfrigérateur.\r\nBien laver la courgette sous l’eau courante car on lui laisse sa peau pour donner de la couleur au plat. La couper en 4 dans le sens de la longueur. Si elle contient des pépins, les enlever à la cuillère. Mettre les morceaux dans le panier à vapeur, à cuire 5 mn (niveau d’eau 1).\r\nJeter le jus de cuisson, et transvaser dans le mixeur. Mixer pour une consistance homogène (2 ou 3 impulsions). Puis laisser reposer pour qu’elle tiédisse.\r\nBattre l’oeuf dans le saladier ; y ajouter le fromage blanc, la noisette de beurre, puis la courgette tiède. Mélanger énergiquement. Transvaser dans le ramequin jusqu’à mi-hauteur.\r\nFaire tomber la température du four à 120 °C (th. 2). Verser un peu d’eau dans le plat à gratin, y placer le ramequin, et enfourner pour faire cuire le flan au bain-marie pendant 15 à 20 mn.\r\nVérifier que la cuisson est à point en enfonçant un couteau dans la préparation : si la lame ressort sans trace, le flan est prêt à la dégustation.\r\n\r\nUne recette légère et complète, digeste et rafraîchissante, fondante sur la langue et douce au palais. Le calcium du fromage blanc et le phosphore de l’œuf font de bons os et de belles dents. La densité en minéraux et en vitamines de la courgette met en grande forme. '),(22,'La veille, préparez la poêlée de poires : mettez une casserole sur feu vif. Versez peu à peu le sucre. Laissez colorer en tournant sans arrêt. Laissez brunir le caramel. Versez l’eau chaude avec précaution. Faites bouillir. \r\n\r\nÉpluchez les poires à l’économe. Coupez-les en deux. Évidez le cœur avec une cuillère à pomme parisienne. Avec un éminceur, coupez 2 demi-poires en huit (pour la décoration de la charlotte) et le reste en tranches plus épaisses. Versez d’abord les gros quartiers dans la casserole. Ajoutez ensuite les tranches fines. Laissez frémir 5 min. Versez la préparation dans un grand bol. Couvrez de film alimentaire et laissez refroidir. Égouttez les morceaux de poire au-dessus d’un grand bol pour recueillir le sirop. Réservez le tout au réfrigérateur. \r\n\r\nPréparez la bavaroise au caramel : versez le sucre dans une casserole à feu vif et laissez caraméliser en remuant. Faites chauffer le lait à part. Versez le lait bouillant sur le caramel, sans cesser de remuer. Ôtez du feu quand ça mousse. Faites ramollir la gélatine dans de l’eau froide. \r\n\r\nVersez les jaunes d’oeufs dans un bol, mélangez-les. Ajoutez peu à peu le lait caramélisé, sans cesser de remuer. Reversez dans la casserole. Faites cuire à feu doux « à la nappe ». Faites un test : tirez avec un doigt un trait sur la spatule : si la crème ne goutte pas sur le trait, elle est « à la nappe ». Arrêtez la cuisson. Égouttez la gélatine ramollie. Ajoutez-la dans la casserole. Mélangez bien pour la faire fondre. Versez la crème dans un bol. Couvrez de film alimentaire et laissez reposer au réfrigérateur. \r\n\r\nPréparez le sirop pour les biscuits en mélangeant l’eau-de-vie avec le sirop au caramel. Posez une grille sur une grande assiette. Trempez très rapidement les biscuits dans ce sirop. Laissez-les s’égoutter sur la grille. Chemisez les parois (côté sucré des biscuits vers l’extérieur), puis le fond du moule (côté sucré vers l’intérieur). \r\n\r\n'),(23,'Sortez la crème au caramel gélifiée du réfrigérateur. Lissez-la avec un fouet. Versez la crème fleurette dans le bol d’un batteur. Faites-la monter. Mélangez délicatement la crème fouettée avec la crème au caramel. Remplissez une poche à douille avec cette préparation. Garnissez le fond de la charlotte d’une couche de bavaroise au caramel. Recouvrez-la, sans appuyer, d’une couche de gros quartiers de poire. Ajoutez une couche de biscuits. Continuez avec une couche de bavaroise. Terminez par des biscuits (côté sucré contre la crème). Couvrez la charlotte de film alimentaire et laissez-la reposer 12 h au réfrigérateur.\r\n\r\n Le jour même, démoulez la charlotte. Disposez dessus les tranches fines de poire en rosace. Nappez les poires de gelée d’abricot chaude avec un pinceau.'),(24,'1. Vous aurez besoin de 2 grands récipients pour cette recette : une grande sauteuse et une grande cocotte avec un couvercle.\r\n2. Saler et poivrer légèrement les morceaux de poulet, puis les enrober de farine. Enlever le surplus de farine en excès et réserver.\r\n3. Faire chauffer la sauteuse sur feu doux. Ajouter 1c. soupe d’huile et mettre le bacon à griller.\r\n4. Une fois que le bacon est bien doré, l’enlever de la sauteuse en conservant le gras. Mettre sur feu moyen, ajouter 2-3 c. soupe supplémentaires d’huile.\r\n5. Lorsque la sauteuse est bien chaude, mettre 3 ou 4 morceaux de poulet à dorer en retournant les morceaux toutes les 4 minutes environ. Veiller à ne pas mettre trop de morceaux en même temps et recommencer avec tout le poulet.\r\n6. Lorsque le poulet est cuit, placer les morceaux dans la cocotte.\r\n7. Enlever la moitié de l’huile de la sauteuse, mettre sur feu moyen. Ajouter les champignons et faire cuire pendant 3 minutes. Puis les ajouter au poulet.\r\n8. Ajouter les oignons nouveaux et les gousses d’ail dans la sauteuse, faire dorer légèrement. Ajouter 3 c. soupe de farine et 2 c. soupe de beurre et mélanger. Faire cuire 1 minute puis ajouter au poulet.\r\n9. Ajouter dans la cocotte carotte, céleri, thym, laurier, le vin, l’eau la base de poulet et le fond de veau. Bien mélanger et porter à ébullition.\r\n10. Laisser à mi-couvert et continuer à faire cuire lentement pendant 1 heure environ.\r\n11. Lorsque le poulet est bien tender, le retirer du feu.\r\n12. Retirer carottes, céleri, feuilles de laurier, ail et thym.\r\n13. Vérifier l’assaisonnement et rectifier si nécessaire.\r\n14. Servir avec des pommes de terre rôties ou tout autre accompagnement.\r\n15. Le coq au vin est meilleur préparé à l’avance (au moins la veille). Il peut être conserve au réfrigérateur jusqu’à 3 jours.'),(25,'Laissez infuser 5mn minimum le bouillon Ariake dans 2l d\'eau portée à ébullition.\r\nFaites revenir les échalotes et les champignons préparés en fines tranches, dans une sauteuse à feu moyen. Ajoutez le riz et remuez jusqu\'à ce qu\'il devienne translucide. \r\n\r\nAjoutez le vin et laissez réduire. Versez le bouillon louche après louche juqu\'à complète cuisson du riz.\r\nLorsque le riz n\'est plus croquant, ajoutez le beurre, le parmesan, rectifiez l\'assaisonnement.\r\n\r\nAjoutez une dernière louche de bouillon et couvrez hors feu 4mn.'),(26,'Préchauffer votre four à 220°C\r\n\r\nPorter à ébullition 33cl d’eau, plonger le sachet a infuser dans l’eau frémissante.\r\nCouvrir et laisser infuser 5 minutes à feu doux en remuant de temps en temps puis reserver.\r\n\r\nÉplucher les asperges et les cuire dans de l’eau bouillante salée. Bien les refroidir pour qu’elles restent bien vertes. Eplucher les feuilles d’épinard puis les plonger dans l’eau bouillante 1 minute. Bien les refroidir. Couper et réserver les pointes d’asperges Dans un bol « mixeur », mettre les corps d’asperge, les feuilles d’épinard et le bouillon de volaille Ariaké froid. Mixer jusqu\'à consistance bien onctueuse.\r\nAssaisonner.\r\n\r\n'),(27,'Etaler votre pate feuilletée puis la mouiller a l’aide d’un pinceau, parsemer de graines de sésame puis tailler des lamelles et les enfourner 4 à 5 minutes.'),(28,'Verser un peu de gaspacho bien frais dans une assiette creuse ou dans un verre, parsemer le tout avec les pointes d’asperges puis poser la mouillette de sésame.\r\n'),(29,'Infusez les 3 sachets de Bouillon de Coquillages Ariaké dans 1 litre d’eau frémissante.\r\n\r\nDans un poêlon, faites transpirer l’oignon et l’échalote émincés dans l’huile d’olive. Ajoutez le riz à feu doux jusqu’à ce qu’il devienne translucide sans cesser de mélanger doucement avec une cuillère en bois.\r\n\r\nUne fois le riz translucide, déglacez avec le verre de vin blanc puis ajoutez louche près louche le Bouillon de Coquillages afin que le riz se gorge progressivement.\r\n\r\nAjoutez ensuite les coquillages, laissez cuire environ 10 min. toujours en mélangeant doucement.\r\nPuis ajoutez la crème fraîche et le Parmesan. Laissez cuire encore 10 min. en mélangeant jusqu’à obtention d’un aspect crémeux.\r\n\r\nEntre temps, blanchissez les asperges dans un peu d’eau salée et finissez de les cuire à la poêle dans 1 cuillère à soupe d’huile d’olive. Ajoutez les pointes d’asperges au risotto crémeux. Servez bien chaud.'),(30,'Infusez les Bouillons de Coquillages Ariaké 5 minutes dans 1,33 litre d’eau frémissante (l’équivalent de 4 bols).\r\nDélayez le safran dans le bouillon et réservez au chaud.\r\n\r\nDans une sauteuse, faites revenir l’ail, l’oignon et l’échalote émincés. Ajoutez le concentré de tomate, mélangez. Ajoutez les pommes de terre, les coquillages, les tomates découpées en morceaux. Mélangez bien l\'ensemble.\r\n\r\nDéposez ensuite les portions de poisson sur l’ensemble et recouvrez entièrement avec le Bouillon de Coquillages Ariaké bien chaud.\r\n\r\nTerminez au four quelques minutes. Rectifiez l’assaisonnement. Émincez le basilic et parsemez chaque assiette avant de servir'),(31,'Infusez le Bouillon de Boeuf Ariaké 5 min. dans 66 cl d’eau frémissante (l’équivalent de 2 bols).\r\n \r\nDans ce bouillon, faites cuire la carotte émincée et les champignons taillés en larges lamelles. Ajoutez le tofu coupé en dés. Ajoutez quelques gouttes de sauce nuocmam.\r\nRépartissez l’ensemble dans des bols individuels.\r\n\r\nParsemez chaque bol de coriandre fraîchement ciselée. Servez bien chaud.'),(32,'Infusez les 3 Bouillons de Volaille Ariaké 5 min. dans 1 litre d’eau frémissante.\r\n\r\nDisposez les ravioles de foie gras (3/personne) dans de grands bols individuels. Versez-y le Bouillon de Volaille Ariaké bien chaud. Parsemez chaque bol de ciboulette fraîchement ciselée.\r\n* Variante : vous pouvez remplacer les ravioles de foie gras par des ravioles de fromages.'),(33,'Infusez les 3 Bouillons de Coquillages 5 min. dans 1 litre d’eau frémissante. Poêlez les Saint-Jacques avec la matière grasse (beurre ou huile d’olive), puis réservez.\r\n\r\nFaites revenir carottes et blanc de poireaux émincés dans la matière grasse. Répartissez les Saint-Jacques, les légumes et la citronnelle dans des assiettes creuses.\r\n\r\nRecouvrez chaque assiette à mi-hauteur de Bouillon de Coquillages Ariaké bien chaud.\r\n \r\nAvant de servir, parsemez chaque assiette de coriandre fraîche ciselée. Servez chaud.'),(34,'Infusez le sachet de Bouillon de Boeuf Ariaké 5 à 8 minutes dans 33 cl d’eau frémissante (l’équivalent d’un bol).\r\n\r\nDans une poêle, faites revenir les côtes d’agneau, puis réservez-les au chaud.\r\n\r\nDéglacez la poêle en versant le Bouillon de Boeuf Ariaké et la branche de thym. À l’aide d’une cuillère en bois, grattez le fond de la poêle pour récupérer les sucs\r\nde cuisson de la viande. Portez à ébullition le bouillon, faites réduire, puis ajoutez le beurre en fouettant.\r\n\r\nVersez sur les côtes d\'agneau. Servez immédiatement.'),(35,'Infusez le Bouillon de Volaille Ariaké 5 minutes dans 66 cl d’eau frémissante (l’équivalent de 2 bols) et laissez refroidir. Montez la crème fraîche en chantilly.\r\n\r\nCuisez les petits pois. Blanchissez la roquette dans un peu d’eau portée à ébullition.\r\nDans un peu de bouillon chaud, mixez les petits pois et la roquette, laissez refroidir.\r\n\r\nMélangez le tout délicatement avec la chantilly. Déposez délicatement sur le bouillon froid. Servez frais.'),(36,'Infusez le bouillon de votre choix 5 min. dans 33 cl (l’équivalent d’un bol) d’eau frémissante.\r\n\r\nAjoutez 1 cuillère à café d’agar-agar dans le bouillon et portez à ébullition. Versez 1 cm de bouillon dans chaque verrine et laissez figer au congélateur.\r\n\r\nSortez les verrines et disposez par dessus le bouillon figé le produit de votre choix (oeuf poché, saumon, légume…). Recouvrez entièrement de Bouillon Ariaké.\r\n\r\nRemettez les verrines au congélateur et sortez-les suivant le degré de croquant que vous souhaitez.\r\nServez en cocktail ou entrée apéritive.'),(37,'Mêlez les amandes avec le miel et le sucre. Disposez-les sur la tôle du four et faites les caraméliser 5 min. sous le grill. Laissez-les refroidir.\r\n\r\nBattez les oeufs en neige ferme. Montez la crème Chantilly et ajoutez-lui le sucre glace, les blancs en neige, les fruits confits macérés et les amandes grillées. \r\n\r\nVersez la préparation dans les pyramides et mettez au congélateur 2 heures. Démoulez au moment de servir.'),(38,'Tamisez la farine avec la levure, puis incorporez le sucre glace, la poudre d’amande. Mélangez les poudres, puis le blanc d’oeufs. Incorporer le beurre noisette chaud avec le mélange puis la vanille liquide. \r\n\r\nUne fois le mélange obtenu, moulez le plus rapidement possible votre appareil, puis faites cuire au four 15 minutes à 220-240°C (th.7/8).'),(39,'Travaillez le beurre ramolli avec le sucre. Ajoutez progressivement les oeufs et la farine tamisée avec la levure. Ne pas trop travailler la masse. Versez le chocolat haché à la fi n et mélangez. Garnissez les moules à cake. \r\n'),(40,'Faites cuire à 200°C (th.6-7) durant environ 30 minutes.'),(41,'Lavez les cerises, séchez-les avec du papier absorbant, équeutez-les et dénoyautez-les.\r\nMettez la farine en fontaine dans une bassine. Ajoutez au milieu les oeufs, le sucre, une pincée de sel et délayez au fouet en absorbant la farine peu à peu. Détendez progressivement en ajoutant le lait, et terminez l’opération en incorporant 30 gr de beurre fondu. Aromatisez d’une goutte de kirsch et d’un jus de citron, et travaillez soigneusement le tout pour obtenir une pâte souple et homogène. Mélangez les cerises à la pâte et coulez cette pâte dans les moules. Mettez une noisette de beurre sur chaque Coeur.'),(42,'Mettez à cuire environ 20-25 minutes à four chaud, 220°C (th. 7). Servez tiède ou froid.'),(43,'Mélanger le sucre glace et la poudre d’amandes. Tamiser. Monter très fermement les blancs d’oeufs avec le sucre semoule. Verser en pluie le mélange amandes/sucre glace sur les blancs en neige.\r\n\r\nMacaroner en soulevant la masse délicatement à la spatule jusqu’à une brillance de l’appareil.\r\n\r\nColorer l’appareil à macaron selon les parfums et utilisations.\r\nDresser des petits macarons à la poche à douille sur la feuille de cuisson et laisser croûter à l’air libre au moins 30 minutes.\r\nCuire à 180°C pendant 8 minutes.\r\n\r\nLaisser refroidir les macarons et les décoller.\r\nSouder les macarons 2 par 2 en les garnissant de ganache ou de confi ture.\r\n\r\nLaisser ensuite durcir les macarons au réfrigérateur pendant au moins 24 heures avant de les déguster.'),(44,'Verser la poudre d’amandes et le sucre glace dans la cuve du mixer. Faire tourner quelques minutes afin d’affiner le «tant pour tant ». Tamiser ensuite ce mélange. Réserver.\r\n\r\nDans une casserole, mélanger le sucre et l’eau, puis faire chauffer. Plonger le thermomètre dans le sirop pour contrôler sa température.\r\nPendant ce temps, monter un blanc d’oeuf en neige ferme.\r\nDés que le thermomètre indique 118°C, retirer la casserole du feu, baisser la vitesse du batteur (vitesse moyenne), et verser petit à petit le sucre cuit sur le blanc monté, en prenant soin de le faire couler sur les bords du bol afin d’éviter toute projection de sucre. Quand tout le sirop est versé, faire tourner de nouveau le batteur à pleine vitesse pour refroidir la meringue italienne (environ 40°C).\r\nAjouter à ce moment là l’arôme ou le colorant. Arrêter le batteur quand la meringue est bien lisse, brillante et assez consistante, dite au «bec d’oiseau», car elle forme un léger bec au bout du fouet.\r\n\r\nPendant ce temps, verser le blanc d’oeuf restant sur le tant pour tant et mélanger à l’aide d’une spatule : on doit obtenir une pâte d’amandes assez épaisse.\r\nIncorporer une partie de la meringue italienne dans le mélange « tant pour tant » afin de détendre le tout. Ajouter le restant de meringue et macaroner en soulevant la masse délicatement.\r\n\r\nSur la feuille de cuisson, et à l’aide d’une poche à douille (douille 8 mm), faire des petits macarons. Taper légèrement la plaque sur le plan de travail pour égaliser leur surface.\r\nLaisser croûter au moins 30 minutes à température ambiante. Enfourner 8 minutes à 150°C.\r\n\r\nLaisser complètement refroidir les coques avant de les garnir de ganache ou de confiture à l’aide d’une poche à douille. Fermer ensuite chaque macaron avec une coque sans ganache. Laisser ensuite durcir les macarons au réfrigérateur pendant au moins 24 heures avant de les déguster.\r\n'),(45,'Mettez la farine dans une bassine et ajoutez les oeufs un à un, le lait et mélangez énergiquement jusqu’à obtenir une pâte homogène. Ajouter le gruyère râpé, salez, poivrez et mélangez à nouveau. \r\n\r\nFaites revenir légèrement les lardons à la poêle et disposez-les ensuite dans le moule à tarte. Recouvrez de la pâte.'),(46,'Faites cuire au four chaud à 225°C (th 7-8) pendant environ 40 minutes.'),(47,'Portez 20 cl de lait et la vanille à ébullition. Blanchissez les jaunes d’oeufs avec le sucre. Ajoutez la farine et la fécule tamisée, puis le reste du lait froid. Mélanger jusqu’à obtention d’une pâte lisse. Ajoutez ensuite 1/3 du lait vanillé bouillant, puis le reste tout en mélangeant. Remettez le tout à feu moyen et amenez à ébullition sans cesser de remuer. Maintenez l’ébullition 20 secondes. Versez la crème dans un récipient froid.'),(48,'Etalez la pâte à brioche dans le moule à tarte rond. Garnissez aussitôt avec la crème pâtissière froide jusqu’à 1 cm du bord. Rangez les abricots en demi, ou en quartiers s’ils sont gros, après les avoir lavés, égouttés et dénoyautés. Laissez lever la pâte dans un endroit tempéré (30°C). Dorez la bordure et faites cuire à 200°C (th. 6-7) pendant 20 minutes. Après refroidissement, lustrez au nappage bouillant.'),(49,'Faites fondre le beurre doucement dans une casserole et, dans une autre casserole, fondre le chocolat au bain-marie. Séparez les blancs des jaunes d’oeufs. Dans une bassine, fouettez les jaunes avec la moitié du sucre glace et le sachet de sucre vanillé. Montez les blancs en neige avec une pincée de sel et ajoutez-leur le reste du sucre glace. Ajoutez le beurre dans le mélange jaunes d’oeufs et sucre glace. Travaillez pour obtenir un bon amalgame. Ajoutez à cette préparation le chocolat fondu, la farine et la maïzena. Mélangez à l’aide d’une spatule.\r\n\r\nIncorporez alors délicatement les blancs d’oeufs en soulevant la masse par le dessous pour ne pas briser la texture des blancs en neige. Versez la pâte dans le moule Coeur.\r\n'),(50,'Cuisez à four à 150°C (th. 5) pendant 40 minutes environ. Démoulez tiède ou froid.\r\nSaupoudrez de sucre glace.'),(51,'Epluchez les pommes de terre, lavez-les et découpez-les en fines rondelles. Emincez les oignons. Hachez l’ail. Beurrez légèrement le moule rectangulaire. Disposez la moitié des rondelles de pommes terre au fond du moule. Disposez les oignons, l’ail, saupoudrez d’herbes de Provence de la moitié du gruyère râpé. Salez, poivrez. Mettre quelques noisettes de beurre. Finissez de garnir avec le reste des pommes de terre. Dans un bol, mélangez la crème liquide avec la cuillère de farine. Versez la crème sur les pommes de terre. Mettre le reste du beurre en noisettes sur le plat, puis le reste du gruyère râpé. '),(52,'Faites cuire au four à 180 °C (th.6) pendant 1 heure environ.'),(53,'Mélangez la levure émiettée, 1/4 l. de lait tiède et environ 150 gr. de farine. On doit obtenir une pâte un peu molle : le levain. Laissez-le lever dans un endroit tiède.Faites gonfler les raisins dans de l’eau tiède. Pétrissez la farine, les oeufs, le reste du lait, le sucre et le sel jusqu’à ce que la pâte ne colle plus (10 minutes environ). Incorporez le beurre ramolli et le levain qui doit avoir doublé de volume. Travaillez la pâte encore quelques instants. La couvrir d’un linge et la laisser lever 1 heure dans un endroit tiède. La tapoter pour la faire retomber. Incorporez les raisins égouttés. Répartissez les amandes dans le moule à Kougloff et versez la pâte. Laissez la pâte à nouveau monter.\r\n'),(54,'Enfournez à 150°C (th. 5) environ 45 minutes.'),(55,'Mélangez bien le sucre, le beurre ramolli et la levure avec le liquide choisi. Séparez le jaune d’oeuf du blanc. Travaillez le mélange précédent avec la farine et le jaune d’oeuf. Lorsque la préparation est parfaitement homogène, ajoutez les raisins secs.\r\n\r\nIncorporez ensuite délicatement le blanc battu en neige ferme. Versez la préparation dans le moule à cake. '),(56,'Faites cuire à four chaud 220°C (th. 7-8) pendant 10 minutes, puis prolongez la cuisson à feu doux, 160°C (th.5-6) pendant 40 minutes.\r\nDémoulez à chaud.'),(57,'Mélangez le sucre, la vanille (ou citron) et la moitié du lait avec les oeufs entiers jusqu’à ce que le mélange devienne mousseux. Versez la farine en pluie avec la levure en remuant. Ajoutez le restant du lait. Incorporez le beurre fondu tiède. Garnissez les moules à la poche à douilles ou à la petite cuillère. Laissez reposer quelques minutes. '),(58,'Faites cuire dans le bas du four à 200-220°C (th. 6-7) pendant environ 15 minutes. Démoulez aussitôt.Laissez refroidir sur une grille.'),(59,'Préchauffez le four à 150°C (thermostat 5). Dans une bassine conique, mélangez le beurre ramolli et le sucre en poudre jusqu’à ce que le mélange prenne une consistance crémeuse. Ajoutez les oeufs un par un en mélangeant vigoureusement, puis la farine, le sel et la levure, en alternant avec le lait en fi let. Travaillez le mélange aussi rapidement que possible à l’aide d’une spatule afi n d‘obtenir une pâte bien aérée.\r\nAjoutez l’extrait de vanille liquide, puis les myrtilles, sans cesser de mélanger. Versez la préparation dans les moules et saupoudrez de sucre glace. '),(60,'Enfournez environ 30 minutes. Dégustez tiède.'),(61,'Nettoyer les concombres en fleur, puis réserver au réfrigérateur. Ajouter 100 g d’eau de cornichons et le Kappa dans un poêlon. Porter à ébullition. Baigner les concombres deux fois dans le mélange tiède avant de les conserver au réfrigérateur.'),(62,'Détailler les cèpes en lamelles de 0,3 cm d’épaisseur.\r\n\r\nMélanger le bouillon avec le Kappa et porter à ébullition jusqu’à dissolution complète. Introduire une lamelle de cèpe dans le mélange, puis déposer sur un récipient plat. Recommencer l’opération avec le reste des lamelles.'),(63,'Mélanger le Gellan au bouillon, puis malaxer. Porter à ébullition et couler dans un récipient. Laisser coaguler, puis détailler des rectangles de 0,15 cm d’épaisseur à la mandoline. \r\n\r\nEnrouler chaque rectangle à l’aide de la barrette afin d’obtenir des macaronis.'),(64,'Mélanger les trois ingrédients, puis porter à ébullition. Laisser coaguler dans un récipient plat. '),(65,'Détailler en bandelettes de 0,5 mm de large afin d’obtenir les tagliatelles.'),(66,'Mélanger le lait avec l’Iota, puis mixer jusqu’à dissolution. Chauffer à 80 °C dans un poêlon, puis laisser gélifier au réfrigérateur'),(67,'Mélanger le jus d’ananas avec l’Iota, puis placer dans un poêlon. Faire frémir et laisser gélifier au réfrigérateur.'),(68,'Mélanger le bouillon de langoustines salé avec l’Agar. Porter à ébullition à feu moyen sans cesser de mélanger. Laisser coaguler au réfrigérateur au moins 2 h, puis chauffer à la  salamandre lors du service.'),(69,'Mélanger 1/4 de la qunatité d’eau avec de l’agar-agar en poudre. Porter à ébullition à feu modéré sans cesser de remuer.\r\nRetirer du feu, puis ajouter le reste d’eau au basilic salée.Écumer. Laisser coaguler dans un récipient carré à hauteur d’1 cm.\r\n\r\nLaisser au réfrigérateur pendant au mois 3 heures.'),(70,'Mélanger le parmesan avec l’eau, puis chauffer progressivement jusqu’à l’obtention d’une température de 80 °C.\r\nLaisser infuser 30 minutes avant de passer.\r\n\r\nIncorporer 1,3 g de Lecite par portion de 250 g de sérum de parmesan obtenu. Activer le mixeur à la surface du liquide, laisser stabiliser une minute, puis recueillir l’air qui s’est formé sur la partie supérieure. Congeler l’air dans le récipient de votre choix.'),(71,'Mélanger les trois ingrédients, puis activer le mixeur à la surface du liquide.\r\nLaisser stabiliser une minute, puis recueillir l’air qui s’est formé sur la partie supérieure.'),(72,'Ajouter l’Algin dans une proportion équivalente à 1/3 de la quantité de jus de melon, puis mixer. Ajouter les 2/3 restants, passer et réserver. Dissoudre le Calcic dans l’eau.\r\nRemplir 4 seringues avec le mélange de melon et d’Algin. Dresser goutte à goutte sur la base de Calcic. Retirer au bout d’une minute, passer, puis laver le caviar obtenu à l’eau froide.'),(73,'Mixer le Citras avec 250 g d’eau, ajouter l’Algin, puis mixer de nouveau. Faire frémir,\r\nlaisser refroidir, puis mélanger avec la purée de mangue. Mélanger 1.000 g d’eau au Calcic, puis y verser le contenu d’une cuillère de dosage remplie du mélange de mangue et d’Algin, laisser reposer 2 minutes, puis rincer à l’eau froide. Recommencer l’opération avec le reste des raviolis.'),(74,'Mélanger 400 g d’eau, le thé et 20 g de sucre à froid, puis laisser macérer au réfrigérateur pendant 24 heures. Passer. \r\n\r\nMélanger le jus de citron avec 5 g de sucre, congeler dans un bac à glaçons. Mixer l’Algin avec 75 g d’eau. Diluer le Calcic dans 500 g d’eau. Mélanger l’infusion de thé avec la base d’Algin, puis laisser reposer. Refroidir au congélateur sans arriver au point de congélation. Placer un glaçon au citron dans une cuillère de dosage de 3 cm, que l’on terminera de remplir avec la base de thé. Introduire 30 secondes dans le bain de Calcic. \r\nNettoyer le ravioli à l’eau froide.'),(75,'Mettre ensemble dans une jatte la sangria et le Xantana.\r\nBien les mélanger à l’aide d’un mixeur.\r\nFiltrer et emballer sous vide afin de supprimer les bulles retenues à l’intérieur du mélange. La consistance obtenue permet de maintenir en suspension différents éléments: aromates, fruits, caviar sphérique...'),(76,'Mélanger les trois ingrédients et les faire émulsionner à l’aide d’un mixeur jusqu’à obtention d’une émulsion onctueuse et sans grumeaux. Conserver au réfrigérateur. Cette crème accompagnera l’huître et sa perle.'),(77,'Mélanger les deux ingrédients à température ambiante puis les mixer dans un blender jusqu’à obtention d’un mélange sans grumeaux. Filtrer et laisser reposer 24 h au réfrigérateur.'),(78,'Mélanger les fèves tendres épluchées avec le mélange de Metil. Faire 8 boulettes de 8,5 g chacune. Réserver au réfrigérateur.\r\nPlonger les boulettes dans de l’eau salée portée à 90 °C et faire cuire 1 min.'),(79,'Mélanger l’Isomalt, le glucose et le Sucro et faire cuire le tout à 160 °C (les 5 °C manquants seront atteints grâce à la chaleur elle-même). Pendant que le caramel cuit, dissoudre Glice dans l’huile d’olive vierge à 50 °C. Lorsque le caramel est à 160 °C, y verser l’huile d’olive en fin filet et l’incorporer à l’aide d’une spatule. Lorsque le caramel a absorbé toute l’huile d’olive, étaler le mélange sur du papier sulfurisé.\r\nCe caramel permet de réaliser toutes sortes de formes, comme, par exemple, la spirale\r\nd’huile d’olive.'),(80,'Dissoudre la gélatine avec un tiers de l’eau d’olive portée à température moyenne puis ajouter le reste de l’eau. Ajouter le Sucro et passer au mixeur. En même temps, faire dissoudre le Glice dans la graisse d’olive noire, chauffée à environ 50 °C.\r\nIncorporer peu à peu la graisse à l’eau d’olive noire tout en mariant les deux à l’aide du mixer. Garder au réfrigérateur pendant 2 h. Lorsque le mélange a pris, en détailler 10 parts de 0,2 g chacune.\r\nCette émulsion sert de garniture au disque de mangue.');
/*!40000 ALTER TABLE `recipeStep_description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeStep_recipe` WRITE;
/*!40000 ALTER TABLE `recipeStep_recipe` DISABLE KEYS */;
INSERT INTO `recipeStep_recipe` VALUES (1,'1'),(2,'2'),(3,'2'),(4,'3'),(5,'3'),(6,'3'),(7,'4'),(8,'5'),(9,'5'),(10,'5'),(11,'5'),(12,'6'),(13,'7'),(14,'7'),(15,'8'),(16,'8'),(17,'9'),(18,'9'),(19,'10'),(20,'10'),(21,'11'),(22,'12'),(23,'12'),(24,'13'),(25,'14'),(26,'15'),(27,'15'),(28,'15'),(29,'16'),(30,'17'),(31,'18'),(32,'19'),(33,'20'),(34,'21'),(35,'22'),(36,'23'),(37,'24'),(38,'25'),(39,'26'),(40,'26'),(41,'27'),(42,'27'),(43,'28'),(44,'29'),(45,'30'),(46,'30'),(47,'31'),(48,'31'),(49,'32'),(50,'32'),(51,'33'),(52,'33'),(53,'34'),(54,'34'),(55,'35'),(56,'35'),(57,'36'),(58,'36'),(59,'37'),(60,'37'),(61,'38'),(62,'39'),(63,'40'),(64,'41'),(65,'41'),(66,'42'),(67,'43'),(68,'44'),(69,'45'),(70,'46'),(71,'47'),(72,'48'),(73,'49'),(74,'50'),(75,'51'),(76,'52'),(77,'53'),(78,'53'),(79,'54'),(80,'55');
/*!40000 ALTER TABLE `recipeStep_recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeStep_title` WRITE;
/*!40000 ALTER TABLE `recipeStep_title` DISABLE KEYS */;
INSERT INTO `recipeStep_title` VALUES (1,'Préparation'),(2,'Préparation'),(3,'Finition'),(4,'Préparation et cuisson des moules'),(5,'Réalisation de la crème de moules'),(6,'Finition'),(7,'Préparation'),(8,'Préparation des calamaretti '),(9,'Préparation du citron confit'),(10,'Cuisson des calamaretti'),(11,'Finition et préparation'),(12,'Préparation'),(13,'Préparation'),(14,'Finition et dressage'),(15,'Préparation'),(16,'Cuisson'),(17,'Préparation'),(18,'Cuisson'),(19,'Préparation et cuisson'),(20,'Finition et dressage'),(21,'Préparation'),(22,'Préparation'),(23,'Dressage et finition'),(24,'Préparation'),(25,'Préparation'),(26,'Gaspacho d\'asperge'),(27,'Mouillettes de graines de sésame'),(28,'Dressage'),(29,'Préparation'),(30,'Préparation'),(31,'Préparation'),(32,'Préparation'),(33,'Préparation'),(34,'Préparation'),(35,'Préparation'),(36,'Préparation'),(37,'Préparation'),(38,'Préparation'),(39,'Préparation '),(40,'Cuisson'),(41,'Préparation'),(42,'Cuisson'),(43,'Préparation'),(44,'Préparation'),(45,'Préparation'),(46,'Cuisson'),(47,'Crème pâtissière'),(48,'Tarte'),(49,'Préparation'),(50,'Cuisson'),(51,'Préparation'),(52,'Cuisson'),(53,'Préparation'),(54,'Cuisson'),(55,'Préparation'),(56,'Cuisson'),(57,'Préparation'),(58,'Cuisson'),(59,'Préparation'),(60,'Cuisson'),(61,'Préparation'),(62,'Préparation'),(63,'Préparation'),(64,'Préparation'),(65,'Présentation'),(66,'Préparation'),(67,'Préparation'),(68,'Préparation'),(69,'Préparation'),(70,'Préparation'),(71,'Préparation'),(72,''),(73,'Préparation'),(74,'Préparation'),(75,''),(76,'Préparation'),(77,'Préparation'),(78,'Pour les boulettes de fèves tendres'),(79,'Préparation'),(80,'Préparation');
/*!40000 ALTER TABLE `recipeStep_title` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeTool` WRITE;
/*!40000 ALTER TABLE `recipeTool` DISABLE KEYS */;
INSERT INTO `recipeTool` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82);
/*!40000 ALTER TABLE `recipeTool` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeToolProduct` WRITE;
/*!40000 ALTER TABLE `recipeToolProduct` DISABLE KEYS */;
INSERT INTO `recipeToolProduct` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80);
/*!40000 ALTER TABLE `recipeToolProduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeToolProduct_product` WRITE;
/*!40000 ALTER TABLE `recipeToolProduct_product` DISABLE KEYS */;
INSERT INTO `recipeToolProduct_product` VALUES (1,'10176'),(2,'10088'),(3,'10608'),(4,'10382'),(5,'10176'),(6,'10667'),(7,'10176'),(8,'10239'),(9,'1492'),(10,'10648'),(11,'10325'),(12,'1372'),(13,'10648'),(14,'10228'),(15,'10530'),(16,'10620'),(17,'10347'),(18,'10613'),(19,'10620'),(20,'10608'),(21,'10088'),(22,'10313'),(23,'10228'),(24,'105830'),(25,'1525484614'),(26,'10088'),(27,'10530'),(28,'10620'),(29,'10502'),(30,'10228'),(31,'10088'),(32,'10608'),(33,'10176'),(34,'10176'),(35,'10161'),(36,'10176'),(37,'10176'),(38,'10648'),(39,'10648'),(40,'10530'),(41,'10176'),(42,'10015'),(43,'10415'),(44,'10176'),(45,'10040'),(46,'10039'),(47,'10530'),(48,'10530'),(49,'10608'),(50,'10088'),(51,'10675'),(52,'10382'),(53,'10176'),(54,'10530'),(55,'10228'),(56,'10675'),(57,'10088'),(58,'10608'),(59,'10648'),(60,'10070'),(61,'10509'),(62,'10041'),(63,'10176'),(64,'10228'),(65,'10510'),(66,'10511'),(67,'10043'),(68,'10043'),(69,'10608'),(70,'10088'),(71,'10035'),(72,'10176'),(73,'10176'),(74,'10176'),(75,'10176'),(76,'2571'),(77,'10176'),(78,'10176'),(79,'10382'),(80,'10228');
/*!40000 ALTER TABLE `recipeToolProduct_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:55
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

LOCK TABLES `recipeToolProduct_recipe` WRITE;
/*!40000 ALTER TABLE `recipeToolProduct_recipe` DISABLE KEYS */;
INSERT INTO `recipeToolProduct_recipe` VALUES (1,'1'),(2,'2'),(3,'2'),(4,'2'),(5,'2'),(6,'3'),(7,'4'),(8,'4'),(9,'4'),(10,'5'),(11,'5'),(12,'5'),(13,'7'),(14,'7'),(15,'8'),(16,'8'),(17,'9'),(18,'9'),(19,'9'),(20,'9'),(21,'9'),(22,'9'),(23,'9'),(24,'11'),(25,'11'),(26,'11'),(27,'11'),(28,'11'),(29,'12'),(30,'12'),(31,'12'),(32,'12'),(33,'15'),(34,'16'),(35,'17'),(36,'17'),(37,'18'),(38,'20'),(39,'21'),(40,'22'),(41,'22'),(42,'24'),(43,'25'),(44,'25'),(45,'26'),(46,'27'),(47,'27'),(48,'28'),(49,'28'),(50,'28'),(51,'28'),(52,'29'),(53,'29'),(54,'29'),(55,'29'),(56,'29'),(57,'29'),(58,'29'),(59,'30'),(60,'30'),(61,'31'),(62,'32'),(63,'32'),(64,'32'),(65,'33'),(66,'34'),(67,'35'),(68,'36'),(69,'36'),(70,'36'),(71,'37'),(72,'43'),(73,'44'),(74,'45'),(75,'46'),(76,'48'),(77,'49'),(78,'54'),(79,'54'),(80,'54');
/*!40000 ALTER TABLE `recipeToolProduct_recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipeTool_name` WRITE;
/*!40000 ALTER TABLE `recipeTool_name` DISABLE KEYS */;
INSERT INTO `recipeTool_name` VALUES (1,'1 casserole'),(2,'4 verres'),(3,'1 mixer'),(4,'Poche à douille'),(5,'1 casserole'),(6,'1 thermomètre'),(7,'1 bol'),(8,'1 couteau d\'office'),(9,'1 batteur'),(10,'Papier sulfurisé'),(11,'1 couteau à émincer'),(12,'1 faitout'),(13,'1 plat'),(14,'1 chinois ou une passoire fine'),(15,'1 poêle'),(16,'1 fouet'),(17,'1 mixeur blender ou 1 mixeur plongeant'),(18,'2 casseroles'),(19,'1 couteau à filet de sole'),(20,'1 pinceau'),(21,'1 plaque de cuisson'),(22,'1 brochettes en bois'),(23,'Papier absorbant'),(24,'1 couteau éminceur'),(25,'1 mixeur plongeant'),(26,'1 passoire fine'),(27,'1 poêle'),(28,'1 couteau'),(29,'1 sautoir'),(30,'Torchon'),(31,'1 saladier'),(32,'1 couteau'),(33,'1 fourchette'),(34,'1 poêle'),(35,'1 spatule'),(36,'1 plaque en silicone de 6 moules ronds de 7 cm de diamètre'),(37,'1 saladier'),(38,'1 fouet'),(39,'1 maryse'),(40,'1 cuillère à soupe'),(41,'1 couteau éminceur'),(42,'1 casserole'),(43,'1 tamis ou une passoire fine'),(44,'Papier sulfurisé'),(45,'1 maryse (spatule en silicone)'),(46,'1 poche à  douille'),(47,'1 douille unie n°10'),(48,'2 plaques à  patisserie'),(49,'1 spatule largePréambule Considérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.  Considérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.  Considérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.  Considérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.  Considérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.  Considérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.  Considérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.  L\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.  HAUT DE PAGE  Article premier Tous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.  HAUT DE PAGE  Article 2 1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.  HAUT DE PAGE  Article 3 Tout individu a droit à la vie, à la liberté et à la sûreté de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.  HAUT DE PAGE  Article 6 Chacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.  HAUT DE PAGE  Article 7 Tous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut être arbitrairement arrêté, détenu ou exilé.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées.  2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays.  2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit à une nationalité.  2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.  HAUT DE PAGE  Article 16 1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux.  3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété. 2. Nul ne peut être arbitrairement privé de sa propriété.  HAUT DE PAGE  Article 18 Toute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit à la liberté de réunion et d\'association pacifiques.  2. Nul ne peut être obligé de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis.  2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays. 3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage.  2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal.  3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté.  2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite.  2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix.  3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent.  2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique.  3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.  '),(50,'1 couteau d\'office'),(51,'1 couteau économe'),(52,'1 couteau éminceur'),(53,'1 cocotte ronde de 28cm'),(54,'1 spatule'),(55,'1 pinceau'),(56,'Papier absorbant'),(57,'pinceau'),(58,'1 casserole'),(59,'1 économe'),(60,'Des bols'),(61,'1 grille'),(62,'1 spatule'),(63,'1 poche à douille'),(64,'Film alimentaire'),(65,'1 poêlon'),(66,'1 cuillère en bois'),(67,'1 bassine'),(68,'1 mixeur'),(69,'1 batteur'),(70,'1 bassine'),(71,'1 bassine'),(72,'1 couteau à émincer'),(73,'1 économe'),(74,'1 bol'),(75,'1 bassine'),(76,'1 barrette en pvc de 0,3 cm de diamètre'),(77,'1 mixeur'),(78,'1 mixeur'),(79,'1 mixeur'),(80,'1 mixeur'),(81,'1 mixeur'),(82,'1 blender');
/*!40000 ALTER TABLE `recipeTool_name` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipeTool_recipe` WRITE;
/*!40000 ALTER TABLE `recipeTool_recipe` DISABLE KEYS */;
INSERT INTO `recipeTool_recipe` VALUES (1,'1'),(2,'1'),(3,'1'),(4,'2'),(5,'2'),(6,'2'),(7,'2'),(8,'2'),(9,'2'),(10,'2'),(11,'3'),(12,'3'),(13,'3'),(14,'3'),(15,'3'),(16,'3'),(17,'3'),(18,'4'),(19,'4'),(20,'4'),(21,'4'),(22,'4'),(23,'4'),(24,'4'),(25,'4'),(26,'4'),(27,'5'),(28,'5'),(29,'5'),(30,'5'),(31,'7'),(32,'7'),(33,'7'),(34,'7'),(35,'7'),(36,'8'),(37,'8'),(38,'8'),(39,'8'),(40,'8'),(41,'8'),(42,'9'),(43,'9'),(44,'9'),(45,'9'),(46,'9'),(47,'9'),(48,'9'),(49,'9'),(50,'10'),(51,'10'),(52,'10'),(53,'10'),(54,'10'),(55,'10'),(56,'10'),(57,'11'),(58,'12'),(59,'12'),(60,'12'),(61,'12'),(62,'12'),(63,'12'),(64,'12'),(65,'16'),(66,'21'),(67,'27'),(68,'29'),(69,'29'),(70,'30'),(71,'32'),(72,'33'),(73,'33'),(74,'33'),(75,'37'),(76,'40'),(77,'47'),(78,'48'),(79,'49'),(80,'51'),(81,'52'),(82,'53');
/*!40000 ALTER TABLE `recipeTool_recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_author` WRITE;
/*!40000 ALTER TABLE `recipe_author` DISABLE KEYS */;
INSERT INTO `recipe_author` VALUES (11,'Madeleine Market'),(12,'Madeleine Market'),(13,'Ariaké'),(14,'Ariaké'),(15,'Ariaké'),(16,'Ariaké'),(17,'Ariaké'),(18,'Ariaké'),(19,'Ariaké'),(20,'Ariaké'),(21,'Ariaké'),(22,'Ariaké'),(23,'Ariaké'),(24,'De Buyer'),(25,'De Buyer'),(26,'De Buyer'),(27,'De buyer'),(28,'De Buyer'),(29,'De Buyer'),(30,'De Buyer'),(31,'De Buyer'),(32,'De Buyer'),(33,'De Buyer'),(34,'De Buyer'),(35,'De Buyer'),(36,'De Buyer'),(37,'De Buyer'),(38,'Albert et Ferran Adrià'),(39,'Albert et Ferran Adrià'),(40,'Albert et Ferran Adrià'),(41,'Albert et Ferran Adrià'),(42,'Albert et Ferran Adrià'),(43,'Albert et Ferran Adrià'),(44,'Albert et Ferran Adrià'),(45,'Albert et Ferran Adrià'),(46,'Albert et Ferran Adrià'),(47,'Albert et Ferran Adrià'),(48,'Albert et Ferran Adrià'),(49,'Albert et Ferran Adrià'),(50,'Albert et Ferran Adrià'),(51,'Albert et Ferran Adrià'),(52,'Albert et Ferran Adrià'),(53,'Albert et Ferran Adrià'),(54,'Albert et Ferran Adrià'),(55,'Albert et Ferran Adrià');
/*!40000 ALTER TABLE `recipe_author` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_cookTime` WRITE;
/*!40000 ALTER TABLE `recipe_cookTime` DISABLE KEYS */;
INSERT INTO `recipe_cookTime` VALUES (1,'15'),(2,'5'),(4,'35'),(5,'5 à 10'),(6,'30'),(7,'10'),(8,'25'),(9,'30Préambule Considérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.  Considérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.  Considérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.  Considérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.  Considérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.  Considérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.  Considérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.  L\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.  HAUT DE PAGE  Article premier Tous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.  HAUT DE PAGE  Article 2 1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.  HAUT DE PAGE  Article 3 Tout individu a droit à la vie, à la liberté et à la sûreté de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.  HAUT DE PAGE  Article 6 Chacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.  HAUT DE PAGE  Article 7 Tous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut être arbitrairement arrêté, détenu ou exilé.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées.  2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays.  2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit à une nationalité.  2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.  HAUT DE PAGE  Article 16 1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux.  3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété. 2. Nul ne peut être arbitrairement privé de sa propriété.  HAUT DE PAGE  Article 18 Toute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit à la liberté de réunion et d\'association pacifiques.  2. Nul ne peut être obligé de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis.  2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays. 3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage.  2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal.  3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté.  2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite.  2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix.  3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent.  2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique.  3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.  '),(10,'100'),(11,'20 '),(12,'10'),(15,'10'),(17,'10'),(19,'5'),(24,'5'),(25,'15'),(26,'30'),(27,'20-25'),(28,'8'),(29,'8'),(30,'40'),(31,'20'),(32,'40'),(33,'60'),(34,'45'),(35,'50'),(36,'15'),(37,'30'),(53,'1');
/*!40000 ALTER TABLE `recipe_cookTime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_numberOfPeople` WRITE;
/*!40000 ALTER TABLE `recipe_numberOfPeople` DISABLE KEYS */;
INSERT INTO `recipe_numberOfPeople` VALUES (3,'7'),(9,'Pour 80 chouquettes environ');
/*!40000 ALTER TABLE `recipe_numberOfPeople` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_prepTime` WRITE;
/*!40000 ALTER TABLE `recipe_prepTime` DISABLE KEYS */;
INSERT INTO `recipe_prepTime` VALUES (2,'25'),(4,'25'),(5,'15'),(6,'10'),(7,'20'),(8,'10'),(9,'15Préambule Considérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.  Considérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.  Considérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.  Considérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.  Considérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.  Considérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.  Considérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.  L\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.  HAUT DE PAGE  Article premier Tous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.  HAUT DE PAGE  Article 2 1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.  HAUT DE PAGE  Article 3 Tout individu a droit à la vie, à la liberté et à la sûreté de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.  HAUT DE PAGE  Article 6 Chacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.  HAUT DE PAGE  Article 7 Tous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut être arbitrairement arrêté, détenu ou exilé.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées.  2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays.  2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit à une nationalité.  2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.  HAUT DE PAGE  Article 16 1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux.  3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété. 2. Nul ne peut être arbitrairement privé de sa propriété.  HAUT DE PAGE  Article 18 Toute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit à la liberté de réunion et d\'association pacifiques.  2. Nul ne peut être obligé de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis.  2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays. 3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage.  2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal.  3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté.  2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite.  2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix.  3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent.  2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique.  3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.  '),(10,'30'),(11,'30'),(14,'45');
/*!40000 ALTER TABLE `recipe_prepTime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_preparationTime` WRITE;
/*!40000 ALTER TABLE `recipe_preparationTime` DISABLE KEYS */;
INSERT INTO `recipe_preparationTime` VALUES (3,'40'),(9,'20');
/*!40000 ALTER TABLE `recipe_preparationTime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_profile` WRITE;
/*!40000 ALTER TABLE `recipe_profile` DISABLE KEYS */;
INSERT INTO `recipe_profile` VALUES (1,'7'),(2,'4'),(3,'4'),(4,'4'),(5,'4'),(6,'4'),(7,'4'),(8,'4'),(9,'4'),(10,'7'),(11,'4'),(12,'4'),(13,'8'),(14,'8'),(15,'8'),(16,'8'),(17,'8'),(18,'8'),(19,'8'),(20,'8'),(21,'8'),(22,'8'),(23,'8'),(24,'9'),(25,'9'),(26,'9'),(27,'9'),(28,'9'),(29,'9'),(30,'9'),(31,'9'),(32,'9'),(33,'9'),(34,'9'),(35,'9'),(36,'9'),(37,'9'),(38,'10'),(39,'10'),(40,'10'),(41,'10'),(42,'10'),(43,'10'),(44,'10'),(45,'10'),(46,'10'),(47,'10'),(48,'10'),(49,'10'),(50,'10'),(51,'10'),(52,'10'),(53,'10'),(54,'10'),(55,'10');
/*!40000 ALTER TABLE `recipe_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_recipeCategory`
--

LOCK TABLES `recipe_recipeCategory` WRITE;
/*!40000 ALTER TABLE `recipe_recipeCategory` DISABLE KEYS */;
INSERT INTO `recipe_recipeCategory` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43);
/*!40000 ALTER TABLE `recipe_recipeCategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_recipeCategory_recipe` WRITE;
/*!40000 ALTER TABLE `recipe_recipeCategory_recipe` DISABLE KEYS */;
INSERT INTO `recipe_recipeCategory_recipe` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9'),(10,'10'),(11,'11'),(12,'12'),(13,'13'),(14,'14'),(15,'15'),(16,'16'),(17,'17'),(18,'18'),(19,'19'),(20,'20'),(21,'21'),(22,'22'),(23,'23'),(24,'24'),(25,'25'),(26,'26'),(27,'27'),(28,'28'),(29,'29'),(30,'30'),(31,'31'),(32,'32'),(33,'33'),(34,'34'),(35,'35'),(36,'36'),(37,'37'),(38,'39'),(39,'40'),(40,'41'),(41,'48'),(42,'51'),(43,'53');
/*!40000 ALTER TABLE `recipe_recipeCategory_recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_recipeCategory_recipeCategory` WRITE;
/*!40000 ALTER TABLE `recipe_recipeCategory_recipeCategory` DISABLE KEYS */;
INSERT INTO `recipe_recipeCategory_recipeCategory` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'3'),(6,'1'),(7,'3'),(8,'1'),(9,'1'),(10,'3'),(11,'5'),(12,'1'),(13,'3'),(14,'6'),(15,'6'),(16,'3'),(17,'3'),(18,'3'),(19,'3'),(20,'5'),(21,'3'),(22,'5'),(23,'5'),(24,'1'),(25,'1'),(26,'1'),(27,'1'),(28,'1'),(29,'1'),(30,'3'),(31,'1'),(32,'1'),(33,'3'),(34,'1'),(35,'1'),(36,'1'),(37,'1'),(38,'5'),(39,'3'),(40,'3'),(41,'1'),(42,'4'),(43,'3');
/*!40000 ALTER TABLE `recipe_recipeCategory_recipeCategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_restTime` WRITE;
/*!40000 ALTER TABLE `recipe_restTime` DISABLE KEYS */;
INSERT INTO `recipe_restTime` VALUES (1,'5'),(2,'120'),(7,'3h'),(9,'Préambule Considérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.  Considérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.  Considérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.  Considérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.  Considérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.  Considérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.  Considérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.  L\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.  HAUT DE PAGE  Article premier Tous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.  HAUT DE PAGE  Article 2 1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.  HAUT DE PAGE  Article 3 Tout individu a droit à la vie, à la liberté et à la sûreté de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.  HAUT DE PAGE  Article 6 Chacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.  HAUT DE PAGE  Article 7 Tous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut être arbitrairement arrêté, détenu ou exilé.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées.  2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays.  2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit à une nationalité.  2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.  HAUT DE PAGE  Article 16 1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux.  3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété. 2. Nul ne peut être arbitrairement privé de sa propriété.  HAUT DE PAGE  Article 18 Toute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit à la liberté de réunion et d\'association pacifiques.  2. Nul ne peut être obligé de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis.  2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays. 3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage.  2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal.  3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté.  2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite.  2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix.  3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent.  2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique.  3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.  '),(12,'720 (12 heures)'),(24,'120'),(28,'24 heures'),(29,'24 heures'),(34,'60'),(53,'24h');
/*!40000 ALTER TABLE `recipe_restTime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_slug` WRITE;
/*!40000 ALTER TABLE `recipe_slug` DISABLE KEYS */;
INSERT INTO `recipe_slug` VALUES (1,'creme-coco-mangue-passion'),(2,'guimauve-a-la-vanille'),(3,'creme-de-moules-de-bouchot'),(4,'fingers-de-cabillaud'),(5,'calamaretti-a-l-etouffee'),(6,'crumble-cerise'),(7,'couscous-sucre'),(8,'muffins-aux-framboises'),(9,'chouquettes-au-chocolat'),(10,'navarin-d-agneau-printanier'),(11,'flan-de-courgette'),(12,'charlotte-poire-caramel'),(13,'coq-au-vin'),(14,'risotto-aux-champignons'),(15,'gaspacho-d-asperges-vertes-et-mouillette-croustillante-de-graines-de-sesame'),(16,'risotto-cremeux-aux-fruits-de-mer'),(17,'safran-brodetto-la-bouillabaisse-transalpine'),(18,'soupe-japonaise-subtile-et-revigorante'),(19,'bouillon-de-poule-aux-fines-ravioles-de-foie-gras'),(20,'nage-de-saint-jacques-au-bouillon-de-coquillages'),(21,'deglacage-au-bouillon-de-boeuf-ariake'),(22,'capuccino-de-volaille-et-petits-pois-roquette'),(23,'aspics-en-verrines'),(24,'nougat-glace'),(25,'visitandines'),(26,'cakes-au-pepites-de-chocolat'),(27,'clafoutis-aux-cerises'),(28,'recette-rapide-des-macarons'),(29,'recette-pro-des-macarons'),(30,'quiche-sans-pate-aux-lardons'),(31,'tarte-briochee-aux-abricots'),(32,'delice-au-chocolat'),(33,'gratin-de-pommes-de-terre'),(34,'kougloff'),(35,'cake'),(36,'madeleine'),(37,'muffins-aux-myrtilles'),(38,'concombres-en-fleur-gelatinises'),(39,'nectar-de-cepes'),(40,'macaronis-au-consomme'),(41,'tagliatelles-au-safran'),(42,'gelatine-au-lait'),(43,'gelatine-a-l-ananas'),(44,'gelatine-chaude-de-langoustines'),(45,'terrine-au-basilic'),(46,'air-glace-au-parmesan'),(47,'air-a-la-lime'),(48,'caviar-spherique-au-melon-cantaloupe'),(49,'raviolis-spheriques-a-la-mangue'),(50,'raviolis-spheriques-au-the'),(51,'sangria-blanche-en-suspension'),(52,'veloute-de-jambon-iberique'),(53,'boulettes-de-feves-tendres'),(54,'spirale-d-huile-d-olive'),(55,'emulsion-d-olive-noire');
/*!40000 ALTER TABLE `recipe_slug` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_source` WRITE;
/*!40000 ALTER TABLE `recipe_source` DISABLE KEYS */;
INSERT INTO `recipe_source` VALUES (3,'Recette et photo tirées de l’ouvrage La Cuisine de Ducasse par Sophie, publié aux Éditions Alain Ducasse. Auteur : Sophie Dudemaine. Photographe : Françoise Nicol & Catherine Madani, en vente en librairie 23 € et sur cookboutic.fr'),(9,'Recette et photo tirées de l’ouvrage Leçon de cuisine : pâte à choux, publié aux Éditions Culinaires. Auteur : Sébastien Serveau Photographe : Soins graphiques, en vente en librairie 9,90€ et sur cookboutic.fr');
/*!40000 ALTER TABLE `recipe_source` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_summary` WRITE;
/*!40000 ALTER TABLE `recipe_summary` DISABLE KEYS */;
INSERT INTO `recipe_summary` VALUES (1,'Une recette douce et légère aux saveurs exotiques qui apportera une touche de fraîcheur à la fin de votre repas. '),(2,'Que tous les gourmands se réjouissent : vous allez désormais pouvoir réaliser vous même vos guimauves!\n\r\n\n\r\n'),(3,'Les moules c\'est bon. '),(4,'Recette originale idéale pour l\'apéritif. Partagez la douceur du cabillaud et les saveurs du poivrons entre amis.'),(5,'A rédiger'),(6,'A rédiger.'),(7,'A rédiger'),(8,'Une recette simple et légère de ce gâteau d\'origine anglaise. Idéale pour le goûter.'),(9,'Recette de chouquettes au chocolat idéale pour le goûter. \r\n\r\n<p>\r\n           Bonjour et bienvenue sur mon site !\r\n\r\n           Ceci est mon premier test, alors <em>soyez indulgents</em> s\'il vous plaît, j\'apprends petit à petit comment ça marche à l\'aide des tutoriels du Site du Zér0.\r\n       </p>\r\n\r\nPréambule\r\nConsidérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.\r\n\r\nConsidérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.\r\n\r\nConsidérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.\r\n\r\nConsidérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.\r\n\r\nConsidérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.\r\n\r\nConsidérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.\r\n\r\nConsidérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.\r\n\r\nL\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle premier\r\nTous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 2\r\n1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation. \r\n2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 3\r\nTout individu a droit à la vie, à la liberté et à la sûreté de sa personne.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 4\r\nNul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 5\r\nNul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 6\r\nChacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 7\r\nTous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 8\r\nToute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 9\r\nNul ne peut être arbitrairement arrêté, détenu ou exilé.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 10\r\nToute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 11\r\n1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées. \r\n2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 12\r\nNul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 13\r\n1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat. \r\n2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 14\r\n1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays. \r\n2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 15\r\n1. Tout individu a droit à une nationalité. \r\n2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 16\r\n1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution. \r\n2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux. \r\n3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 17\r\n1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété.\r\n2. Nul ne peut être arbitrairement privé de sa propriété.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 18\r\nToute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 19\r\nTout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 20\r\n1. Toute personne a droit à la liberté de réunion et d\'association pacifiques. \r\n2. Nul ne peut être obligé de faire partie d\'une association.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 21\r\n1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis. \r\n2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays.\r\n3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 22\r\nToute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 23\r\n1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage. \r\n2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal. \r\n3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale. \r\n4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 24\r\nToute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 25\r\n1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté. \r\n2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 26\r\n1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite. \r\n2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix. \r\n3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 27\r\n1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent. \r\n2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 28\r\nToute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 29\r\n1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible. \r\n2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique. \r\n3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 30\r\nAucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.\r\n\r\n'),(10,'Le navarin d\'agneau printanier est un plat rustique qui trouve ses saveurs dans les nouveaux légumes du printemps. C\'est en partie de là qu\'il tire son nom.\r\n\r\nhttp://www.madeleinemarket.com/epicerie-fine/epices-condiments/epices/epices-entieres/548-epice-muscade-noix.html'),(11,' Entrée fine et légère, idéale pour l\'été.  '),(12,'Un grand classique revisité...'),(13,' '),(14,'  '),(15,'  '),(16,' '),(17,' '),(18,' '),(19,' '),(20,' '),(21,' '),(22,' '),(23,' '),(24,'  '),(25,' '),(26,' '),(27,' '),(28,' '),(29,' '),(30,' '),(31,'  '),(32,'  '),(33,' '),(34,'  '),(35,' '),(36,' '),(37,' '),(38,' '),(39,' '),(40,' '),(41,' '),(42,' '),(43,' '),(44,' '),(45,' '),(46,' '),(47,' '),(48,'  '),(49,' '),(50,' '),(51,' '),(52,'  '),(53,' '),(54,' '),(55,' ');
/*!40000 ALTER TABLE `recipe_summary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_title` WRITE;
/*!40000 ALTER TABLE `recipe_title` DISABLE KEYS */;
INSERT INTO `recipe_title` VALUES (1,'Crème coco-mangue-passion'),(2,'Guimauve à la vanille'),(3,'Crème de moules de bouchot'),(4,'Fingers de Cabillaud'),(5,'Calamaretti à l’étouffée'),(6,'Crumble aux cerises'),(7,'Couscous sucré'),(8,'Muffins aux framboises'),(9,'Chouquettes au chocolat '),(10,'Navarin d’agneau printanier'),(11,'Flan de courgette'),(12,'Charlotte Poire-Caramel'),(13,'Coq au vin '),(14,'Risotto aux champignons '),(15,'Gaspacho d\'asperges vertes et mouillette croustillante de graines de sésame '),(16,'Risotto crémeux aux fruits de mer'),(17,'Safran brodetto, la bouillabaisse transalpine'),(18,'Soupe japonaise, subtile et revigorante'),(19,'Bouillon de poule aux fines ravioles de foie gras'),(20,'Nage de saint-jacques au bouillon de coquillages'),(21,'Déglaçage au bouillon de boeuf Ariaké'),(22,'Capuccino de volaille et petits pois – roquette'),(23,'Aspics en verrines'),(24,'Nougat Glacé'),(25,'Visitandines'),(26,'Cakes au Pépites de Chocolat'),(27,'Clafoutis aux Cerises'),(28,'Recette rapide des macarons'),(29,'Recette pro des macarons'),(30,'Quiche sans pâte aux lardons'),(31,'Tarte briochée aux abricots'),(32,'Délice au chocolat'),(33,'Gratin de Pommes de Terre'),(34,'Kougloff'),(35,'Cake'),(36,'Madeleine'),(37,'Muffins aux Myrtilles'),(38,'Concombres en fleur gélatinisés'),(39,'Nectar de cèpes'),(40,'Macaronis au Consommé'),(41,'Tagliatelles au safran'),(42,'Gélatine au lait'),(43,'Gélatine à l’ananas'),(44,'Gélatine chaude de langoustines'),(45,'Terrine au basilic'),(46,'Air glacé au parmesan'),(47,'Air à la lime'),(48,'Caviar sphérique au melon Cantaloupe'),(49,'Raviolis sphériques à la mangue'),(50,'Raviolis sphériques au thé'),(51,'Sangria blanche en suspension'),(52,'Velouté de jambon ibérique'),(53,'Boulettes de fèves tendres'),(54,'Spirale d’huile d’olive'),(55,'Émulsion d’olive noire');
/*!40000 ALTER TABLE `recipe_title` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:56
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

LOCK TABLES `recipe_updated` WRITE;
/*!40000 ALTER TABLE `recipe_updated` DISABLE KEYS */;
INSERT INTO `recipe_updated` VALUES (1,'2010-05-17'),(2,'2010-05-07'),(3,'2010-05-12'),(4,'2010-04-30'),(5,'2010-05-07'),(6,'2010-04-30'),(7,'2010-04-30'),(8,'2010-05-07'),(9,'2010-05-18'),(10,'2010-05-07'),(11,'2010-05-19'),(12,'2010-05-19'),(13,'2010-05-20'),(14,'2010-05-20'),(15,'2010-05-20'),(16,'2010-05-26'),(17,'2010-05-26'),(18,'2010-05-26'),(19,'2010-05-26'),(20,'2010-05-26'),(21,'2010-05-26'),(22,'2010-05-26'),(23,'2010-05-26'),(24,'2010-05-28'),(25,'2010-05-28'),(26,'2010-05-28'),(27,'2010-05-28'),(28,'2010-05-28'),(29,'2010-05-28'),(30,'2010-05-28'),(31,'2010-05-28'),(32,'2010-05-28'),(33,'2010-05-28'),(34,'2010-05-28'),(35,'2010-05-28'),(36,'2010-05-28'),(37,'2010-05-28'),(38,'2010-05-31'),(39,'2010-05-31'),(40,'2010-05-31'),(41,'2010-05-31'),(42,'2010-05-31'),(43,'2010-05-31'),(44,'2010-05-31'),(45,'2010-05-31'),(46,'2010-05-31'),(47,'2010-05-31'),(48,'2010-05-31'),(49,'2010-05-31'),(50,'2010-05-31'),(51,'2010-05-31'),(52,'2010-05-31'),(53,'2010-05-31'),(54,'2010-05-31'),(55,'2010-05-31');
/*!40000 ALTER TABLE `recipe_updated` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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

LOCK TABLES `recipe_video` WRITE;
/*!40000 ALTER TABLE `recipe_video` DISABLE KEYS */;
INSERT INTO `recipe_video` VALUES (1,'http://www.madeleinemarket.com/epicerie-fine/chocolats-confiseries/gourmandises-confiseries/1688-petit-ourson-guimauve-tendre-amour.html#comment');
/*!40000 ALTER TABLE `recipe_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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

LOCK TABLES `recipe_yield` WRITE;
/*!40000 ALTER TABLE `recipe_yield` DISABLE KEYS */;
INSERT INTO `recipe_yield` VALUES (2,'pour 30 nœuds ou 32 cubes environ'),(3,'4 personnes'),(4,'4'),(5,'4 personnes'),(7,'4'),(8,'6 muffins'),(9,'80 chouquettesPréambule Considérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.  Considérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.  Considérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.  Considérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.  Considérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.  Considérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.  Considérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.  L\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.  HAUT DE PAGE  Article premier Tous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.  HAUT DE PAGE  Article 2 1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.  HAUT DE PAGE  Article 3 Tout individu a droit à la vie, à la liberté et à la sûreté de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.  HAUT DE PAGE  Article 6 Chacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.  HAUT DE PAGE  Article 7 Tous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut être arbitrairement arrêté, détenu ou exilé.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées.  2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays.  2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit à une nationalité.  2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.  HAUT DE PAGE  Article 16 1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux.  3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété. 2. Nul ne peut être arbitrairement privé de sa propriété.  HAUT DE PAGE  Article 18 Toute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit à la liberté de réunion et d\'association pacifiques.  2. Nul ne peut être obligé de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis.  2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays. 3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage.  2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal.  3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté.  2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite.  2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix.  3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent.  2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique.  3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.  '),(10,'4 personnes'),(11,'4'),(12,'4 personnes'),(14,'4'),(15,'4 personnes'),(16,'2'),(17,'4 personnes'),(18,'2 personnes'),(19,'4 personnes'),(20,'4 personnes'),(21,'2 personnes'),(22,'2 personnes'),(23,'3 verrines'),(24,'Pour 12 pyramides'),(26,'Pour 18 cakes'),(27,'16 petits clafoutis'),(28,'Environ 40 macarons'),(29,'Environ 40 macarons'),(36,'18 madeleines'),(37,'12 Muffins'),(38,'4 personnes'),(39,'4'),(40,'4'),(41,'4'),(42,'4'),(43,'4'),(44,'4'),(45,'4'),(47,'4'),(49,'4'),(50,'4'),(51,'4'),(52,'4'),(54,'4'),(55,'4');
/*!40000 ALTER TABLE `recipe_yield` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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

LOCK TABLES `user_email` WRITE;
/*!40000 ALTER TABLE `user_email` DISABLE KEYS */;
INSERT INTO `user_email` VALUES (1,'bob@bob.bob'),(2,'laurent.touchet@madeleinemarket.com'),(3,'guillaume.madeleine@madeleinemarket.com'),(4,'christophe@xsilence.net'),(5,'vcastel@madeleinemarket.com'),(6,'mathieuschlegel@gmail.com'),(7,'guillaume.blanco@madeleinemarket.com'),(8,'guilllaume.blanco@madeleinemarket.com'),(9,'jamespic@gmail.com'),(10,'myrr75@hotmail.com'),(11,'alison.bernicke@hotmail.fr'),(12,'m.verbrugghe@madeleinemarket.com'),(13,'chloe.strauss@gmail.com'),(14,'jamespic@gmail.com');
/*!40000 ALTER TABLE `user_email` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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

LOCK TABLES `user_firstName` WRITE;
/*!40000 ALTER TABLE `user_firstName` DISABLE KEYS */;
INSERT INTO `user_firstName` VALUES (1,'Bob'),(2,'laurent'),(3,'Guillaume'),(4,'Christophe'),(5,'vincent'),(6,'Mathieu'),(7,'Guillaume'),(8,'Guillaume'),(9,'Pic'),(10,'remi'),(11,'Alison'),(12,'Michael'),(13,'Chloé'),(14,'ja');
/*!40000 ALTER TABLE `user_firstName` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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

LOCK TABLES `user_lastName` WRITE;
/*!40000 ALTER TABLE `user_lastName` DISABLE KEYS */;
INSERT INTO `user_lastName` VALUES (1,'BOB'),(2,'TOUCHET'),(3,'Blanco'),(4,'BIARROTTE'),(5,'CASTEL'),(6,'SCHLEGEL'),(7,'Blanco'),(8,'Blanco'),(9,'JAMES'),(10,'pathier'),(11,'Bernicke'),(12,'VERBRUGGHE'),(13,'STRAUSS'),(14,'PI');
/*!40000 ALTER TABLE `user_lastName` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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

LOCK TABLES `user_optin` WRITE;
/*!40000 ALTER TABLE `user_optin` DISABLE KEYS */;
INSERT INTO `user_optin` VALUES (7,'1'),(8,'1');
/*!40000 ALTER TABLE `user_optin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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

LOCK TABLES `user_password` WRITE;
/*!40000 ALTER TABLE `user_password` DISABLE KEYS */;
INSERT INTO `user_password` VALUES (1,'33cdd248123355e1c1fce38a1b214927'),(2,'f232d41616ffafff7ffb714b6de8697f'),(3,'c4f2ec38c561b34be9edf4b210139952'),(4,'33cdd248123355e1c1fce38a1b214927'),(5,'f8cf6d92369c94cddd001e1834716b82'),(6,'3788381e2257eda0d4f4a69bc78584c2'),(7,'madeleine2009'),(8,'madeleine2009'),(9,'92dc44087c4d550d300d16526f404714'),(10,'pathier'),(11,'8921a21d654f12a47880b5860825c193'),(12,'f8cf6d92369c94cddd001e1834716b82'),(13,'23ae8a0c8cbe93ee3a50f8ad685cbbed');
/*!40000 ALTER TABLE `user_password` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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

LOCK TABLES `user_prestashopId` WRITE;
/*!40000 ALTER TABLE `user_prestashopId` DISABLE KEYS */;
INSERT INTO `user_prestashopId` VALUES (1,'835'),(2,'1745'),(3,'5355'),(4,'1513'),(5,'748'),(6,'849'),(7,'5678'),(9,'5481'),(11,'5722'),(12,'1566'),(13,'1498'),(14,'4999');
/*!40000 ALTER TABLE `user_prestashopId` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (7,'administrator'),(8,'chief'),(9,'administrator'),(10,'customer'),(11,'customer'),(12,'customer'),(13,'customer'),(14,'customer');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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

LOCK TABLES `user_slug` WRITE;
/*!40000 ALTER TABLE `user_slug` DISABLE KEYS */;
INSERT INTO `user_slug` VALUES (1,'bob-bob'),(2,'laurent-touchet'),(3,'guillaume-blanco'),(4,'christophe-biarrotte'),(5,'vincent-castel'),(6,'mathieu-schlegel'),(7,'guillaume-blanco--'),(8,'guillaume-blanco-'),(9,'pic-james'),(10,'remi-pathier'),(11,'alison-bernicke'),(12,'michael-verbrugghe'),(13,'chloe-strauss');
/*!40000 ALTER TABLE `user_slug` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:57
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

LOCK TABLES `user_title` WRITE;
/*!40000 ALTER TABLE `user_title` DISABLE KEYS */;
INSERT INTO `user_title` VALUES (7,'Mr.'),(8,'Mr.'),(10,'Mr.');
/*!40000 ALTER TABLE `user_title` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `user_updated` WRITE;
/*!40000 ALTER TABLE `user_updated` DISABLE KEYS */;
INSERT INTO `user_updated` VALUES (1,'2010-05-10'),(2,'2010-05-10'),(3,'2010-05-10'),(4,'2010-05-10'),(5,'2010-05-11'),(6,'2010-05-12'),(7,'2010-05-12'),(8,'2010-05-12'),(9,'2010-05-10'),(10,'2010-05-17'),(11,'2010-05-19'),(12,'2010-05-19'),(13,'2010-05-27');
/*!40000 ALTER TABLE `user_updated` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profileProduct`
--

LOCK TABLES `profileProduct` WRITE;
/*!40000 ALTER TABLE `profileProduct` DISABLE KEYS */;
INSERT INTO `profileProduct` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9);
/*!40000 ALTER TABLE `profileProduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profileProduct_product` WRITE;
/*!40000 ALTER TABLE `profileProduct_product` DISABLE KEYS */;
INSERT INTO `profileProduct_product` VALUES (1,'1827'),(2,'1492'),(3,'168'),(4,'418'),(5,'2384'),(6,'2271'),(7,'37432'),(8,'10648'),(9,'2564');
/*!40000 ALTER TABLE `profileProduct_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profileProduct_profile` WRITE;
/*!40000 ALTER TABLE `profileProduct_profile` DISABLE KEYS */;
INSERT INTO `profileProduct_profile` VALUES (1,'3'),(2,'3'),(3,'5'),(4,'5'),(5,'6'),(6,'6'),(7,'8'),(8,'9'),(9,'10');
/*!40000 ALTER TABLE `profileProduct_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profileSite` WRITE;
/*!40000 ALTER TABLE `profileSite` DISABLE KEYS */;
INSERT INTO `profileSite` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34);
/*!40000 ALTER TABLE `profileSite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profileSite_profile` WRITE;
/*!40000 ALTER TABLE `profileSite_profile` DISABLE KEYS */;
INSERT INTO `profileSite_profile` VALUES (1,'1'),(2,'2'),(3,'2'),(4,'2'),(5,'2'),(6,'2'),(7,'2'),(8,'2'),(9,'2'),(10,'2'),(11,'2'),(12,'2'),(13,'2'),(14,'2'),(15,'2'),(16,'2'),(17,'2'),(18,'2'),(19,'2'),(20,'2'),(21,'2'),(22,'2'),(23,'2'),(24,'2'),(25,'3'),(26,'4'),(27,'4'),(28,'5'),(29,'6'),(30,'7'),(31,'7'),(32,'8'),(33,'9'),(34,'10');
/*!40000 ALTER TABLE `profileSite_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profileSite_site` WRITE;
/*!40000 ALTER TABLE `profileSite_site` DISABLE KEYS */;
INSERT INTO `profileSite_site` VALUES (1,'test'),(2,'http://www.madeleinemarket.com/'),(3,'http://www.madeleinemarket.com/'),(4,'http://www.madeleinemarket.com/'),(5,'http://www.madeleinemarket.com/'),(6,'http://www.madeleinemarket.com/'),(7,'http://www.madeleinemarket.com/'),(8,'http://www.madeleinemarket.com/'),(9,'http://www.madeleinemarket.com/'),(10,'http://www.madeleinemarket.com/'),(11,'http://www.madeleinemarket.com/'),(12,'http://www.madeleinemarket.com/'),(13,'http://www.madeleinemarket.com/'),(14,'http://www.madeleinemarket.com/'),(15,'http://www.madeleinemarket.com/'),(16,'http://www.madeleinemarket.com/http://www.madeleinemarket.com/'),(17,'http://www.madeleinemarket.com/'),(18,'http://www.madeleinemarket.com/'),(19,'http://www.madeleinemarket.com/'),(20,'http://www.madeleinemarket.com/'),(21,'http://www.madeleinemarket.com/'),(22,'http://www.madeleinemarket.com/'),(23,'http://www.madeleinemarket.com/'),(24,'http://www.madeleinemarket.com/'),(25,'http://www.christophemichalak.com/'),(26,'http://www.madeleinemarket.com/'),(27,'http://blog.madeleinemarket.com/'),(28,'www.marcveyrat.fr'),(29,'http://www.bocuse.fr/'),(30,'http://www.madeleinemarket.com/'),(31,'http://blog.madeleinemarket.com/'),(32,'http://www.ariake-europe.com/fr/'),(33,'http://www.debuyer.com/'),(34,'http://www.elbulli.com/');
/*!40000 ALTER TABLE `profileSite_site` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profile_email` WRITE;
/*!40000 ALTER TABLE `profile_email` DISABLE KEYS */;
INSERT INTO `profile_email` VALUES (1,'test'),(2,'http://www.madeleinemarket.com/'),(3,'pr@christophemichalak.com'),(4,'marketing@madeleinemarket.com'),(5,'marketing@madeleinemarket.com'),(6,'marketing@madeleinemarket.com'),(7,'marketing@madeleinemarket.com');
/*!40000 ALTER TABLE `profile_email` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profile_introduction` WRITE;
/*!40000 ALTER TABLE `profile_introduction` DISABLE KEYS */;
INSERT INTO `profile_introduction` VALUES (1,'test'),(2,' Préambule\r\nConsidérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.\r\n\r\nConsidérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.\r\n\r\nConsidérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.\r\n\r\nConsidérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.\r\n\r\nConsidérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.\r\n\r\nConsidérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.\r\n\r\nConsidérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.\r\n\r\nL\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle premier\r\nTous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 2\r\n1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation. \r\n2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 3\r\nTout individu a droit à la vie, à la liberté et à la sûreté de sa personne.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 4\r\nNul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 5\r\nNul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 6\r\nChacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 7\r\nTous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 8\r\nToute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 9\r\nNul ne peut être arbitrairement arrêté, détenu ou exilé.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 10\r\nToute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 11\r\n1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées. \r\n2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 12\r\nNul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 13\r\n1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat. \r\n2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 14\r\n1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays. \r\n2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 15\r\n1. Tout individu a droit à une nationalité. \r\n2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 16\r\n1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution. \r\n2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux. \r\n3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 17\r\n1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété.\r\n2. Nul ne peut être arbitrairement privé de sa propriété.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 18\r\nToute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 19\r\nTout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 20\r\n1. Toute personne a droit à la liberté de réunion et d\'association pacifiques. \r\n2. Nul ne peut être obligé de faire partie d\'une association.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 21\r\n1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis. \r\n2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays.\r\n3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 22\r\nToute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 23\r\n1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage. \r\n2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal. \r\n3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale. \r\n4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 24\r\nToute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 25\r\n1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté. \r\n2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 26\r\n1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite. \r\n2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix. \r\n3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 27\r\n1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent. \r\n2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 28\r\nToute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 29\r\n1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible. \r\n2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique. \r\n3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 30\r\nAucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.\r\n'),(3,' Petit apprenti d’une modeste pâtisserie de province, il est devenu, à 34 ans, l’un des chefs pâtissiers les plus reconnus de la profession.\r\nEt pourtant… rien ne semblait prédisposer ce Picard aux métiers de bouche. \r\nIssu d’une famille italienne, il n’a été nourri que de rigueur et de rage de vaincre.\r\nEnfant, il voulait être dessinateur, ce qui dénotait déjà un sens artistique développé; faute d’entrer aux Beaux-Arts, il passe directement à la vie active. «A 15 ans, lors de mes débuts, j’ai eu un éclair de lucidité: J’ai compris qu’on pouvait donner beaucoup de bonheur avec peu de choses. On ne peut pas être pâtissier sans être généreux et gourmand, mon métier me permet de m’exprimer à travers mes créations, le désir de faire plaisir aux autres m’a alors subjugué», raconte-t-il. \r\nA 16 ans, il se constitue une bibliothèque culinaire qu’il ne cesse de compléter. Il cultive sa mémoire gustative, outil essentiel du Maître-pâtissier.  «Je me suis contraint; la vie m’a façonné»,  avoue-t-il.'),(4,'Madeleine Market vous donne accès à des recettes de grands chefs ainsi qu\'à leurs produits préférés afin que vous puissiez avoir le meilleur de la gastronomie chez vous.'),(5,'Marc Veyrat est un cuisinier très créatif qui innove dans l\'utilisation des techniques de gastronomie moléculaire pour « amplifier » les goûts des aliments. Passionné d\'herbes aromatiques, de plantes aromatiques, de racines et fleurs sauvages comestibles des Alpes. Il remplace la farine, l\'huile, la crème ou le beurre... par des plantes des montagnes. Il allie les traditions régionales, du terroir, et des techniques de cuisine modernes.\r\nIl privilégie les jus de cuisson, les bouillons de légumes, les infusions de plantes, les décoctions sans ajout de graisse, et utilise des méthodes de cuissons novatrices comme par exemple la cuisson à très basse température par -196°C à l\'azote liquide.\r\nIl se dit influencé par le chef trois étoiles Joël Robuchon et par le botaniste François Couplan qu\'il qualifie de plus grand botaniste du monde.'),(6,'Issu d’une  famille de cuisiniers depuis plus de quatre générations, toujours soucieux de  préserver les traditions, je tiens à servir une cuisine classique, identifiable,  avec des os et des arêtes. Epaulé par un fidèle équipage, dont cinq Meilleurs  Ouvriers de France, nous contribuons à travers l’amour du travail bien fait et  notre professionnalisme à la transmission aux générations futures pour assurer  l’avenir de notre beau métier.\r\n\r\nLa devise de  la Maison demeure : \r\nBons produits = Bonne cuisine.'),(7,'Madeleine Market vous donne accès aux recettes des grands chefs ainsi qu\'à leurs produits préferés. Des ustensiles de cuisine de qualité ont été selectionnés pour que vous puissiez retrouver le meilleur de la gastronomie chez vous. '),(8,'Très connue au Japon et aux Etats-Unis pour ses bouillons et ses bases culinaires naturelles, la société Ariake a développé depuis 40 ans une expertise unique pour extraire de façon naturelle les saveurs de tous les ingrédients. Soucieux de produire le meilleur, Ariake  s’est adjoint le talent du chef français Joël Robuchon pour mettre au point les saveurs de ses recettes de bouillons naturels.\r\nLes produits Ariaké\r\nElaborés uniquement à partir d’ingrédients nobles, garantis sans colorants ni exhausteur de goût, les bouillons Ariaké permettent de retrouver le goût d’un authentique bouillon préparé maison. Peu salés, ils peuvent se boire en consommé, ou s’utiliser  pour préparer des fonds de sauce, des jus de cuisson, des risottos… Qu’ils soient de bœuf (70% de viande et de jus !), de volaille ou de coquillages, leur qualité et leur saveur exceptionnelles  vous permettent de cuisiner tout en finesse,  avec un véritable ingrédient de chef.\r\n'),(9,' '),(10,' ');
/*!40000 ALTER TABLE `profile_introduction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profile_name` WRITE;
/*!40000 ALTER TABLE `profile_name` DISABLE KEYS */;
INSERT INTO `profile_name` VALUES (1,'MM'),(2,'Préambule Considérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.  Considérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.  Considérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.  Considérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.  Considérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.  Considérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.  Considérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.  L\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.  HAUT DE PAGE  Article premier Tous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.  HAUT DE PAGE  Article 2 1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation.  2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.  HAUT DE PAGE  Article 3 Tout individu a droit à la vie, à la liberté et à la sûreté de sa personne.  HAUT DE PAGE  Article 4 Nul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.  HAUT DE PAGE  Article 5 Nul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.  HAUT DE PAGE  Article 6 Chacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.  HAUT DE PAGE  Article 7 Tous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.  HAUT DE PAGE  Article 8 Toute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.  HAUT DE PAGE  Article 9 Nul ne peut être arbitrairement arrêté, détenu ou exilé.  HAUT DE PAGE  Article 10 Toute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.  HAUT DE PAGE  Article 11 1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées.  2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.  HAUT DE PAGE  Article 12 Nul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.  HAUT DE PAGE  Article 13 1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat.  2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.  HAUT DE PAGE  Article 14 1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays.  2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 15 1. Tout individu a droit à une nationalité.  2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.  HAUT DE PAGE  Article 16 1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution.  2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux.  3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.  HAUT DE PAGE  Article 17 1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété. 2. Nul ne peut être arbitrairement privé de sa propriété.  HAUT DE PAGE  Article 18 Toute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.  HAUT DE PAGE  Article 19 Tout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.  HAUT DE PAGE  Article 20 1. Toute personne a droit à la liberté de réunion et d\'association pacifiques.  2. Nul ne peut être obligé de faire partie d\'une association.  HAUT DE PAGE  Article 21 1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis.  2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays. 3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.  HAUT DE PAGE  Article 22 Toute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.  HAUT DE PAGE  Article 23 1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage.  2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal.  3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale.  4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.  HAUT DE PAGE  Article 24 Toute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.  HAUT DE PAGE  Article 25 1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté.  2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.  HAUT DE PAGE  Article 26 1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite.  2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix.  3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.  HAUT DE PAGE  Article 27 1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent.  2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.  HAUT DE PAGE  Article 28 Toute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.  HAUT DE PAGE  Article 29 1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible.  2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique.  3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.  HAUT DE PAGE  Article 30 Aucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.  '),(3,'christophe Michalak'),(4,'Madeleine Market'),(5,'Marc Veyrat'),(6,'Paul Bocuse'),(7,'Madeleine Market'),(8,'Ariaké'),(9,'De Buyer'),(10,'Albert y Ferran Adrià');
/*!40000 ALTER TABLE `profile_name` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profile_picture` WRITE;
/*!40000 ALTER TABLE `profile_picture` DISABLE KEYS */;
INSERT INTO `profile_picture` VALUES (3,'cmichalak2.jpg'),(4,'Logo MM madeleine market.jpg'),(5,'veyrat.jpg'),(6,'600px-Paul_Bocuse_2007.jpg'),(7,'logo carre madeleine market.jpg'),(8,'37432-146623-large.jpg'),(9,'logo De Buyer pour fiche produit.jpg'),(10,'el bulli.jpg');
/*!40000 ALTER TABLE `profile_picture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profile_presentation` WRITE;
/*!40000 ALTER TABLE `profile_presentation` DISABLE KEYS */;
INSERT INTO `profile_presentation` VALUES (1,'test'),(2,' Préambule\r\nConsidérant que la reconnaissance de la dignité inhérente à tous les membres de la famille humaine et de leurs droits égaux et inaliénables constitue le fondement de la liberté, de la justice et de la paix dans le monde.\r\n\r\nConsidérant que la méconnaissance et le mépris des droits de l\'homme ont conduit à des actes de barbarie qui révoltent la conscience de l\'humanité et que l\'avènement d\'un monde où les êtres humains seront libres de parler et de croire, libérés de la terreur et de la misère, a été proclamé comme la plus haute aspiration de l\'homme.\r\n\r\nConsidérant qu\'il est essentiel que les droits de l\'homme soient protégés par un régime de droit pour que l\'homme ne soit pas contraint, en suprême recours, à la révolte contre la tyrannie et l\'oppression.\r\n\r\nConsidérant qu\'il est essentiel d\'encourager le développement de relations amicales entre nations.\r\n\r\nConsidérant que dans la Charte les peuples des Nations Unies ont proclamé à nouveau leur foi dans les droits fondamentaux de l\'homme, dans la dignité et la valeur de la personne humaine, dans l\'égalité des droits des hommes et des femmes, et qu\'ils se sont déclarés résolus à favoriser le progrès social et à instaurer de meilleures conditions de vie dans une liberté plus grande.\r\n\r\nConsidérant que les Etats Membres se sont engagés à assurer, en coopération avec l\'Organisation des Nations Unies, le respect universel et effectif des droits de l\'homme et des libertés fondamentales.\r\n\r\nConsidérant qu\'une conception commune de ces droits et libertés est de la plus haute importance pour remplir pleinement cet engagement.\r\n\r\nL\'Assemblée Générale proclame la présente Déclaration universelle des droits de l\'homme comme l\'idéal commun à atteindre par tous les peuples et toutes les nations afin que tous les individus et tous les organes de la société, ayant cette Déclaration constamment à l\'esprit, s\'efforcent, par l\'enseignement et l\'éducation, de développer le respect de ces droits et libertés et d\'en assurer, par des mesures progressives d\'ordre national et international, la reconnaissance et l\'application universelles et effectives, tant parmi les populations des Etats Membres eux-mêmes que parmi celles des territoires placés sous leur juridiction.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle premier\r\nTous les êtres humains naissent libres et égaux en dignité et en droits. Ils sont doués de raison et de conscience et doivent agir les uns envers les autres dans un esprit de fraternité.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 2\r\n1.Chacun peut se prévaloir de tous les droits et de toutes les libertés proclamés dans la présente Déclaration, sans distinction aucune, notamment de race, de couleur, de sexe, de langue, de religion, d\'opinion politique ou de toute autre opinion, d\'origine nationale ou sociale, de fortune, de naissance ou de toute autre situation. \r\n2.De plus, il ne sera fait aucune distinction fondée sur le statut politique, juridique ou international du pays ou du territoire dont une personne est ressortissante, que ce pays ou territoire soit indépendant, sous tutelle, non autonome ou soumis à une limitation quelconque de souveraineté.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 3\r\nTout individu a droit à la vie, à la liberté et à la sûreté de sa personne.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 4\r\nNul ne sera tenu en esclavage ni en servitude; l\'esclavage et la traite des esclaves sont interdits sous toutes leurs formes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 5\r\nNul ne sera soumis à la torture, ni à des peines ou traitements cruels, inhumains ou dégradants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 6\r\nChacun a le droit à la reconnaissance en tous lieux de sa personnalité juridique.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 7\r\nTous sont égaux devant la loi et ont droit sans distinction à une égale protection de la loi. Tous ont droit à une protection égale contre toute discrimination qui violerait la présente Déclaration et contre toute provocation à une telle discrimination.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 8\r\nToute personne a droit à un recours effectif devant les juridictions nationales compétentes contre les actes violant les droits fondamentaux qui lui sont reconnus par la constitution ou par la loi.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 9\r\nNul ne peut être arbitrairement arrêté, détenu ou exilé.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 10\r\nToute personne a droit, en pleine égalité, à ce que sa cause soit entendue équitablement et publiquement par un tribunal indépendant et impartial, qui décidera, soit de ses droits et obligations, soit du bien-fondé de toute accusation en matière pénale dirigée contre elle.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 11\r\n1. Toute personne accusée d\'un acte délictueux est présumée innocente jusqu\'à ce que sa culpabilité ait été légalement établie au cours d\'un procès public où toutes les garanties nécessaires à sa défense lui auront été assurées. \r\n2. Nul ne sera condamné pour des actions ou omissions qui, au moment où elles ont été commises, ne constituaient pas un acte délictueux d\'après le droit national ou international. De même, il ne sera infligé aucune peine plus forte que celle qui était applicable au moment où l\'acte délictueux a été commis.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 12\r\nNul ne sera l\'objet d\'immixtions arbitraires dans sa vie privée, sa famille, son domicile ou sa correspondance, ni d\'atteintes à son honneur et à sa réputation. Toute personne a droit à la protection de la loi contre de telles immixtions ou de telles atteintes.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 13\r\n1. Toute personne a le droit de circuler librement et de choisir sa résidence à l\'intérieur d\'un Etat. \r\n2. Toute personne a le droit de quitter tout pays, y compris le sien, et de revenir dans son pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 14\r\n1. Devant la persécution, toute personne a le droit de chercher asile et de bénéficier de l\'asile en d\'autres pays. \r\n2. Ce droit ne peut être invoqué dans le cas de poursuites réellement fondées sur un crime de droit commun ou sur des agissements contraires aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 15\r\n1. Tout individu a droit à une nationalité. \r\n2. Nul ne peut être arbitrairement privé de sa nationalité, ni du droit de changer de nationalité.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 16\r\n1. A partir de l\'âge nubile, l\'homme et la femme, sans aucune restriction quant à la race, la nationalité ou la religion, ont le droit de se marier et de fonder une famille. Ils ont des droits égaux au regard du mariage, durant le mariage et lors de sa dissolution. \r\n2. Le mariage ne peut être conclu qu\'avec le libre et plein consentement des futurs époux. \r\n3. La famille est l\'élément naturel et fondamental de la société et a droit à la protection de la société et de l\'Etat.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 17\r\n1. Toute personne, aussi bien seule qu\'en collectivité, a droit à la propriété.\r\n2. Nul ne peut être arbitrairement privé de sa propriété.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 18\r\nToute personne a droit à la liberté de pensée, de conscience et de religion ; ce droit implique la liberté de changer de religion ou de conviction ainsi que la liberté de manifester sa religion ou sa conviction seule ou en commun, tant en public qu\'en privé, par l\'enseignement, les pratiques, le culte et l\'accomplissement des rites.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 19\r\nTout individu a droit à la liberté d\'opinion et d\'expression, ce qui implique le droit de ne pas être inquiété pour ses opinions et celui de chercher, de recevoir et de répandre, sans considérations de frontières, les informations et les idées par quelque moyen d\'expression que ce soit.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 20\r\n1. Toute personne a droit à la liberté de réunion et d\'association pacifiques. \r\n2. Nul ne peut être obligé de faire partie d\'une association.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 21\r\n1. Toute personne a le droit de prendre part à la direction des affaires publiques de son pays, soit directement, soit par l\'intermédiaire de représentants librement choisis. \r\n2. Toute personne a droit à accéder, dans des conditions d\'égalité, aux fonctions publiques de son pays.\r\n3. La volonté du peuple est le fondement de l\'autorité des pouvoirs publics ; cette volonté doit s\'exprimer par des élections honnêtes qui doivent avoir lieu périodiquement, au suffrage universel égal et au vote secret ou suivant une procédure équivalente assurant la liberté du vote.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 22\r\nToute personne, en tant que membre de la société, a droit à la sécurité sociale ; elle est fondée à obtenir la satisfaction des droits économiques, sociaux et culturels indispensables à sa dignité et au libre développement de sa personnalité, grâce à l\'effort national et à la coopération internationale, compte tenu de l\'organisation et des ressources de chaque pays.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 23\r\n1. Toute personne a droit au travail, au libre choix de son travail, à des conditions équitables et satisfaisantes de travail et à la protection contre le chômage. \r\n2. Tous ont droit, sans aucune discrimination, à un salaire égal pour un travail égal. \r\n3. Quiconque travaille a droit à une rémunération équitable et satisfaisante lui assurant ainsi qu\'à sa famille une existence conforme à la dignité humaine et complétée, s\'il y a lieu, par tous autres moyens de protection sociale. \r\n4. Toute personne a le droit de fonder avec d\'autres des syndicats et de s\'affilier à des syndicats pour la défense de ses intérêts.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 24\r\nToute personne a droit au repos et aux loisirs et notamment à une limitation raisonnable de la durée du travail et à des congés payés périodiques.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 25\r\n1. Toute personne a droit à un niveau de vie suffisant pour assurer sa santé, son bien-être et ceux de sa famille, notamment pour l\'alimentation, l\'habillement, le logement, les soins médicaux ainsi que pour les services sociaux nécessaires ; elle a droit à la sécurité en cas de chômage, de maladie, d\'invalidité, de veuvage, de vieillesse ou dans les autres cas de perte de ses moyens de subsistance par suite de circonstances indépendantes de sa volonté. \r\n2. La maternité et l\'enfance ont droit à une aide et à une assistance spéciales. Tous les enfants, qu\'ils soient nés dans le mariage ou hors mariage, jouissent de la même protection sociale.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 26\r\n1. Toute personne a droit à l\'éducation. L\'éducation doit être gratuite, au moins en ce qui concerne l\'enseignement élémentaire et fondamental. L\'enseignement élémentaire est obligatoire. L\'enseignement technique et professionnel doit être généralisé ; l\'accès aux études supérieures doit être ouvert en pleine égalité à tous en fonction de leur mérite. \r\n2. L\'éducation doit viser au plein épanouissement de la personnalité humaine et au renforcement du respect des droits de l\'homme et des libertés fondamentales. Elle doit favoriser la compréhension, la tolérance et l\'amitié entre toutes les nations et tous les groupes raciaux ou religieux, ainsi que le développement des activités des Nations Unies pour le maintien de la paix. \r\n3. Les parents ont, par priorité, le droit de choisir le genre d\'éducation à donner à leurs enfants.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 27\r\n1. Toute personne a le droit de prendre part librement à la vie culturelle de la communauté, de jouir des arts et de participer au progrès scientifique et aux bienfaits qui en résultent. \r\n2. Chacun a droit à la protection des intérêts moraux et matériels découlant de toute production scientifique, littéraire ou artistique dont il est l\'auteur.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 28\r\nToute personne a droit à ce que règne, sur le plan social et sur le plan international, un ordre tel que les droits et libertés énoncés dans la présente Déclaration puissent y trouver plein effet.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 29\r\n1. L\'individu a des devoirs envers la communauté dans laquelle seule le libre et plein développement de sa personnalité est possible. \r\n2. Dans l\'exercice de ses droits et dans la jouissance de ses libertés, chacun n\'est soumis qu\'aux limitations établies par la loi exclusivement en vue d\'assurer la reconnaissance et le respect des droits et libertés d\'autrui et afin de satisfaire aux justes exigences de la morale, de l\'ordre public et du bien-être général dans une société démocratique. \r\n3. Ces droits et libertés ne pourront, en aucun cas, s\'exercer contrairement aux buts et aux principes des Nations Unies.\r\n\r\nHAUT DE PAGE\r\n\r\nArticle 30\r\nAucune disposition de la présente Déclaration ne peut être interprétée comme impliquant pour un Etat, un groupement ou un individu un droit quelconque de se livrer à une activité ou d\'accomplir un acte visant à la destruction des droits et libertés qui y sont énoncés.\r\n'),(3,' Avec l’humilité qui le caractérise, Christophe Michalak ajoute: «Ce n’est pas le sommet qui est important, c’est d’y rester».\r\nCet éternel gourmand développe chaque jour son envie de surprendre et de revisiter de grands classiques de la pâtisserie. On doit au Chef des dizaines de douceurs aussi désirables que la Religieuse au caramel beurre de sel, les Macarons pêche melba ou les incontournables Bisounours en guimauve!\r\nIl ajoute: «J’habille mes gâteaux comme le ferait  un grand couturier avec les femmes, le beau et le bon sont indissociables! L’ivresse de pouvoir déceler une lueur de douce folie gourmande à travers les yeux des clients n’a pas de prix.»\r\n \r\nSensible et passionné, il décide de créer les tendances et surtout de ne pas les suivre. Christophe aime citer cette phrase mythique de Bob Kennedy:\r\n«Certains voient la réalité et disent pourquoi… moi je rêve de l’impossible et dis pourquoi pas!»\r\n '),(4,'Madeleine Market vous permet d’accéder sur Internet au meilleur de la gastronomie. Madeleine Market propose plus de 6000 produits et 200 marques parmi les plus prestigieuses et reconnues pour leur qualité. On trouve chez Madeleine Market les nouveautés de la gastronomie, tous les ingrédients indispensables pour cuisiner et recevoir, les produits d’exceptions, chocolats et idées cadeaux pour gastronomes, vins et spiritueux.\r\nMadeleine Market propose également une vaste librairie culinaire et toute une gamme d’ustensiles de cuisine. Toute l’année, Madeleine Market, c’est aussi une sélection de bonnes affaires.'),(5,'Marc Veyra est un grand chef cuisinier français. Il est très attaché à sa Haute-Savoie natale. Sa cuisine fait le lien entre les herbes de sa région et la gastronomie moléculaire.\r\nIl a obtenu deux fois trois étoiles au Guide Michelin, le Gault-Millau l\'a désigné meilleur cuisinier et lui a attribué la note maximale de 20/20.'),(6,'Paul Bocuse (né à Collonges-au-Mont-d\'Or le 11 février 1926) est un grand chef cuisinier français (Trois étoiles au Guide Michelin depuis 1965) et désigné « Cuisinier du Siècle » par Gault-Millau et « Pape de la cuisine » en 1989. Il dirige plusieurs restaurants à Collonges-au-Mont-d\'Or et à Lyon.'),(7,'Madeleine Market (http://www.madeleinemarket.com) vous permet d’accéder sur Internet au meilleur de la gastronomie. Madeleine Market propose plus de 6000 produits et 200 marques parmi les plus prestigieuses et reconnues pour leur qualité. On trouve chez Madeleine Market les nouveautés de la gastronomie, tous les ingrédients indispensables pour cuisiner et recevoir, les produits d’exceptions, chocolats et idées cadeaux pour gastronomes, vins et spiritueux. Madeleine Market propose également une vaste librairie culinaire et toute une gamme d’ustensiles de cuisine. Toute l’année, Madeleine Market, c’est aussi une sélection de bonnes affaires.'),(8,'0 années de recherche, au service de recettes culinaires naturelles, uniques sur le plan gustatif et nutritionnel.\r\n\r\nAriake s’applique à développer des assaisonnements (bouillons, fonds de sauce, sauces chaudes) à la fois savoureux, entièrement naturels, exempts d’additifs et préservant les qualités nutritionnelles. \r\n\r\nCette expertise est le fruit d’une politique de Recherche et Développement volontariste. Ariake est à la pointe de la recherche sur les domaines touchant à l’analyse sensorielle, l’extraction douce, la conservation des nutriments et des pigments de couleur, le séchage non dénaturant…\r\n\r\nPeu répandue, en Europe, la maîtrise de l’extraction est pourtant fondamentale.\r\nL’extraction consiste à extraire un premier bouillon très pur à partir de la viande, des os, des légumes. Puis, suivant les recettes, à ajouter des aromates et des légumes pour pratiquer une longue réduction jusqu’à obtention de la saveur et de la consistance désirée. L’extraction permet donc de réaliser des sauces à l’identique d’un cuisinier, mais sur une échelle industrielle. Partant directement de la matière première, l’extraction permet aussi une meilleure traçabilité et plus de sécurité alimentaire. \r\nLa R&D en quelques chiffres : \r\n- 35 spécialistes en nutrition, biologie, fermentation, \r\n- 4 cuisiniers à temps plein, \r\n- 17 brevets déposés et de nombreuses publications.\r\n\r\nAriake travaille avec des cuisiniers pour des cuisiniers. La cuisine n’est pas statique, elle évolue. A ce titre, l’apport de nos chefs « maison » est fondamental et nous permet d’améliorer sans cesse nos recettes pour apporter plus de goût, plus de naturel, plus de praticité. \r\nDepuis 5 ans, Joël Robuchon et Ariake ont entamé une longue collaboration visant à mettre leur expérience en commun pour révolutionner les préparations culinaires, en Europe et au Japon. '),(10,' ');
/*!40000 ALTER TABLE `profile_presentation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profile_slug` WRITE;
/*!40000 ALTER TABLE `profile_slug` DISABLE KEYS */;
INSERT INTO `profile_slug` VALUES (1,'mm'),(2,'preambule-considerant-que-la-reconnaissance-de-la-dignite-inherente-a-tous-les-membres-de-la-famille'),(3,'christophe-michalak'),(4,'madeleine-market'),(5,'marc-veyrat'),(6,'paul-bocuse'),(7,'madeleine-market'),(8,'ariake'),(9,'de-buyer'),(10,'albert-y-ferran-adria');
/*!40000 ALTER TABLE `profile_slug` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:58
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

LOCK TABLES `profile_updated` WRITE;
/*!40000 ALTER TABLE `profile_updated` DISABLE KEYS */;
INSERT INTO `profile_updated` VALUES (1,'2010-04-27'),(2,'2010-05-11'),(3,'2010-05-12'),(4,'2010-04-27'),(5,'2010-05-03'),(6,'2010-05-03'),(7,'2010-05-18'),(8,'2010-05-20'),(9,'2010-05-28'),(10,'2010-05-31');
/*!40000 ALTER TABLE `profile_updated` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-15 14:16:59

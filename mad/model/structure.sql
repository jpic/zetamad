DROP TABLE IF EXISTS `mad_model`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mad_model` (
      `id_attribute` int(15) default NULL,
      `id` varchar(44) default NULL,
      `attribute_key` varchar(50) NOT NULL,
      `attribute_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

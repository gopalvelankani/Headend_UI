-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rmx_contr
-- ------------------------------------------------------
-- Server version	5.5.59-0ubuntu0.14.04.1

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
-- Table structure for table `Firmware`
--

DROP TABLE IF EXISTS `Firmware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Firmware` (
  `rmx_id` int(1) NOT NULL,
  `major_ver` int(11) NOT NULL,
  `min_ver` int(11) NOT NULL,
  `standard` int(11) NOT NULL,
  `cust_option_id` int(11) NOT NULL,
  `cust_option_ver` int(11) NOT NULL,
  PRIMARY KEY (`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Firmware`
--

LOCK TABLES `Firmware` WRITE;
/*!40000 ALTER TABLE `Firmware` DISABLE KEYS */;
INSERT INTO `Firmware` VALUES (0,13,8,0,0,0);
/*!40000 ALTER TABLE `Firmware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HWversion`
--

DROP TABLE IF EXISTS `HWversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HWversion` (
  `rmx_id` int(1) NOT NULL,
  `major_ver` int(11) NOT NULL,
  `min_ver` int(11) NOT NULL,
  `no_of_input` int(11) NOT NULL,
  `no_of_output` int(11) NOT NULL,
  `fifo_size` int(11) NOT NULL,
  `options_implemented` int(11) NOT NULL,
  `core_clk` double NOT NULL,
  PRIMARY KEY (`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HWversion`
--

LOCK TABLES `HWversion` WRITE;
/*!40000 ALTER TABLE `HWversion` DISABLE KEYS */;
INSERT INTO `HWversion` VALUES (0,10,14,4,4,85,0,200);
/*!40000 ALTER TABLE `HWversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ifrequency`
--

DROP TABLE IF EXISTS `Ifrequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ifrequency` (
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `ifrequency` int(10) NOT NULL,
  PRIMARY KEY (`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ifrequency`
--

LOCK TABLES `Ifrequency` WRITE;
/*!40000 ALTER TABLE `Ifrequency` DISABLE KEYS */;
INSERT INTO `Ifrequency` VALUES (1,142),(2,206),(3,270),(4,334),(5,398),(6,462);
/*!40000 ALTER TABLE `Ifrequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NIT_table_timeout`
--

DROP TABLE IF EXISTS `NIT_table_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NIT_table_timeout` (
  `timeout` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rmx_id`,`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NIT_table_timeout`
--

LOCK TABLES `NIT_table_timeout` WRITE;
/*!40000 ALTER TABLE `NIT_table_timeout` DISABLE KEYS */;
/*!40000 ALTER TABLE `NIT_table_timeout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NIT_version`
--

DROP TABLE IF EXISTS `NIT_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NIT_version` (
  `network_id` int(11) NOT NULL,
  `network_name` varchar(100) NOT NULL,
  `nit_version` int(11) NOT NULL,
  `mode` int(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`network_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NIT_version`
--

LOCK TABLES `NIT_version` WRITE;
/*!40000 ALTER TABLE `NIT_version` DISABLE KEYS */;
INSERT INTO `NIT_version` VALUES (1,'VEPL',29,2);
/*!40000 ALTER TABLE `NIT_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_service_list`
--

DROP TABLE IF EXISTS `active_service_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_service_list` (
  `in_channel` int(2) NOT NULL,
  `out_channel` int(2) NOT NULL,
  `channel_num` int(10) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `lcn_id` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`rmx_id`,`in_channel`,`out_channel`,`channel_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_service_list`
--

LOCK TABLES `active_service_list` WRITE;
/*!40000 ALTER TABLE `active_service_list` DISABLE KEYS */;
INSERT INTO `active_service_list` VALUES (0,0,1,1,-1),(0,0,2,1,-1),(0,0,3,1,-1);
/*!40000 ALTER TABLE `active_service_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alarm_flags`
--

DROP TABLE IF EXISTS `alarm_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alarm_flags` (
  `FIFO_Threshold0` int(11) NOT NULL,
  `FIFO_Threshold1` int(11) NOT NULL,
  `FIFO_Threshold2` int(11) NOT NULL,
  `FIFO_Threshold3` int(11) NOT NULL,
  `mode` int(1) NOT NULL,
  `rmx_id` int(1) NOT NULL,
  PRIMARY KEY (`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarm_flags`
--

LOCK TABLES `alarm_flags` WRITE;
/*!40000 ALTER TABLE `alarm_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `alarm_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bouquet_descriptor`
--

DROP TABLE IF EXISTS `bouquet_descriptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bouquet_descriptor` (
  `bouquet_id` int(100) NOT NULL,
  `bouquet_name` varchar(200) NOT NULL,
  `nibble_level_1` varchar(10) NOT NULL DEFAULT '-1',
  `nibble_level_2` varchar(10) NOT NULL DEFAULT '-1',
  `user_nibble1` varchar(10) NOT NULL DEFAULT '0',
  `user_nibble2` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bouquet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bouquet_descriptor`
--

LOCK TABLES `bouquet_descriptor` WRITE;
/*!40000 ALTER TABLE `bouquet_descriptor` DISABLE KEYS */;
INSERT INTO `bouquet_descriptor` VALUES (1,'test','-1','-1','0','0');
/*!40000 ALTER TABLE `bouquet_descriptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bouquet_service_list`
--

DROP TABLE IF EXISTS `bouquet_service_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bouquet_service_list` (
  `bouquet_id` int(10) NOT NULL,
  `service_id` int(100) NOT NULL,
  `rmx_id` int(1) NOT NULL,
  `output` int(1) NOT NULL,
  `input` int(1) NOT NULL,
  `service_type` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bouquet_id`,`service_id`,`rmx_id`,`output`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bouquet_service_list`
--

LOCK TABLES `bouquet_service_list` WRITE;
/*!40000 ALTER TABLE `bouquet_service_list` DISABLE KEYS */;
INSERT INTO `bouquet_service_list` VALUES (1,1,1,0,0,1),(1,2,1,0,0,1);
/*!40000 ALTER TABLE `bouquet_service_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_list`
--

DROP TABLE IF EXISTS `channel_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_list` (
  `input_channel` int(2) NOT NULL,
  `channel_number` int(11) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `lcn_id` int(11) NOT NULL DEFAULT '-1',
  `service_id` int(11) NOT NULL DEFAULT '-1',
  `service_name` varchar(200) NOT NULL DEFAULT '-1',
  `service_type` int(1) NOT NULL DEFAULT '1',
  `encrypted_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rmx_id`,`input_channel`,`channel_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_list`
--

LOCK TABLES `channel_list` WRITE;
/*!40000 ALTER TABLE `channel_list` DISABLE KEYS */;
INSERT INTO `channel_list` VALUES (0,1,1,-1,-1,'-1',1,0),(0,2,1,-1,-1,'-1',1,0),(0,3,1,-1,-1,'-1',1,0),(0,4,1,-1,-1,'-1',1,0),(0,5,1,-1,-1,'-1',1,0),(0,6,1,-1,-1,'-1',1,0),(0,7,1,-1,-1,'-1',1,0),(0,8,1,-1,-1,'-1',1,0),(0,9,1,-1,-1,'-1',1,0),(0,10,1,-1,-1,'-1',1,0),(0,11,1,-1,-1,'-1',1,3),(0,12,1,-1,-1,'-1',1,0),(0,13,1,-1,-1,'-1',1,0),(0,14,1,-1,-1,'-1',1,0),(0,5030,1,-1,-1,'-1',1,3),(0,5031,1,-1,-1,'-1',1,3),(0,5032,1,-1,-1,'-1',1,3),(0,5034,1,-1,-1,'-1',25,3),(0,5035,1,-1,-1,'-1',1,3),(0,5036,1,-1,-1,'-1',22,3),(0,5037,1,-1,-1,'-1',25,3),(0,5038,1,-1,-1,'-1',22,3),(0,5039,1,-1,-1,'-1',1,3),(0,5050,1,-1,-1,'-1',22,3),(0,5051,1,-1,-1,'-1',22,3),(0,5052,1,-1,-1,'-1',22,3),(0,5053,1,-1,-1,'-1',22,3),(0,5054,1,-1,-1,'-1',22,3),(0,5145,1,-1,-1,'-1',22,3),(0,5146,1,-1,-1,'-1',1,3),(0,5147,1,-1,-1,'-1',1,3),(0,5148,1,-1,-1,'-1',1,0),(0,5149,1,-1,-1,'-1',1,0),(0,5151,1,-1,-1,'-1',1,3),(0,5152,1,-1,-1,'-1',1,3),(0,5153,1,-1,-1,'-1',1,3),(0,5154,1,-1,-1,'-1',1,3),(0,5155,1,-1,-1,'-1',1,3),(0,5156,1,-1,-1,'-1',1,3),(1,5030,1,-1,-1,'-1',1,3),(1,5031,1,-1,-1,'-1',1,3),(1,5032,1,-1,-1,'-1',1,3),(1,5034,1,-1,-1,'-1',25,3),(1,5035,1,-1,-1,'-1',1,3),(1,5036,1,-1,-1,'-1',22,3),(1,5037,1,-1,-1,'-1',25,3),(1,5038,1,-1,-1,'-1',22,3),(1,5039,1,-1,-1,'-1',1,3),(1,5050,1,-1,-1,'-1',22,3),(1,5051,1,-1,-1,'-1',22,3),(1,5052,1,-1,-1,'-1',22,3),(1,5053,1,-1,-1,'-1',22,3),(1,5054,1,-1,-1,'-1',22,3),(1,5145,1,-1,-1,'-1',22,3),(1,5146,1,-1,-1,'-1',1,3),(1,5147,1,-1,-1,'-1',1,3),(1,5148,1,-1,-1,'-1',1,0),(1,5149,1,-1,-1,'-1',1,0),(1,5151,1,-1,-1,'-1',1,3),(1,5152,1,-1,-1,'-1',1,3),(1,5153,1,-1,-1,'-1',1,3),(1,5154,1,-1,-1,'-1',1,3),(1,5155,1,-1,-1,'-1',1,3),(1,5156,1,-1,-1,'-1',1,3),(0,13201,2,-1,-1,'-1',0,0),(0,13202,2,-1,-1,'-1',0,0),(0,13203,2,-1,-1,'-1',0,0),(0,13204,2,-1,-1,'-1',0,0),(0,13205,2,-1,-1,'-1',0,0),(0,13206,2,-1,-1,'-1',0,0),(0,13207,2,-1,-1,'-1',0,0),(0,13208,2,-1,-1,'-1',0,0),(0,13209,2,-1,-1,'-1',0,0),(0,13210,2,-1,-1,'-1',0,0),(0,13211,2,-1,-1,'-1',0,0);
/*!40000 ALTER TABLE `channel_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_allegro`
--

DROP TABLE IF EXISTS `config_allegro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_allegro` (
  `mxl_id` int(11) NOT NULL,
  `address` int(11) NOT NULL,
  `enable1` int(11) NOT NULL,
  `volt1` int(11) NOT NULL,
  `enable2` int(11) NOT NULL,
  `volt2` int(11) NOT NULL,
  PRIMARY KEY (`mxl_id`,`address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_allegro`
--

LOCK TABLES `config_allegro` WRITE;
/*!40000 ALTER TABLE `config_allegro` DISABLE KEYS */;
INSERT INTO `config_allegro` VALUES (1,8,1,5,1,5),(1,9,1,5,1,5),(2,8,1,5,1,5),(2,9,1,5,1,5),(3,8,1,5,1,5),(5,8,1,5,1,5),(6,8,1,5,1,5);
/*!40000 ALTER TABLE `config_allegro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `create_alarm_flags`
--

DROP TABLE IF EXISTS `create_alarm_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `create_alarm_flags` (
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `level1` int(11) NOT NULL,
  `level2` int(11) NOT NULL,
  `level3` int(11) NOT NULL,
  `level4` int(11) NOT NULL,
  `mode` int(11) NOT NULL,
  PRIMARY KEY (`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `create_alarm_flags`
--

LOCK TABLES `create_alarm_flags` WRITE;
/*!40000 ALTER TABLE `create_alarm_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `create_alarm_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pids`
--

DROP TABLE IF EXISTS `custom_pids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rmx_no` int(1) NOT NULL,
  `output_channel` int(1) NOT NULL,
  `pid` varchar(200) NOT NULL,
  `output_auth` int(10) NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pids`
--

LOCK TABLES `custom_pids` WRITE;
/*!40000 ALTER TABLE `custom_pids` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvb_spi_output`
--

DROP TABLE IF EXISTS `dvb_spi_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dvb_spi_output` (
  `output` int(1) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `bit_rate` int(15) NOT NULL,
  `falling` int(1) NOT NULL,
  `mode` int(1) NOT NULL,
  PRIMARY KEY (`rmx_id`,`output`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvb_spi_output`
--

LOCK TABLES `dvb_spi_output` WRITE;
/*!40000 ALTER TABLE `dvb_spi_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `dvb_spi_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecm_descriptor`
--

DROP TABLE IF EXISTS `ecm_descriptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecm_descriptor` (
  `service_no` int(11) NOT NULL,
  `output` int(11) NOT NULL,
  `rmx_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `service_pid` int(11) NOT NULL,
  `input` int(11) NOT NULL,
  PRIMARY KEY (`service_no`,`output`,`rmx_id`,`channel_id`,`stream_id`,`input`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecm_descriptor`
--

LOCK TABLES `ecm_descriptor` WRITE;
/*!40000 ALTER TABLE `ecm_descriptor` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecm_descriptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecm_stream`
--

DROP TABLE IF EXISTS `ecm_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecm_stream` (
  `stream_id` int(10) NOT NULL,
  `channel_id` int(10) NOT NULL,
  `ecm_id` int(10) NOT NULL,
  `access_criteria` varchar(10) NOT NULL,
  `cp_number` int(10) NOT NULL,
  `timestamp` varchar(10) NOT NULL,
  `ecm_pid` int(11) NOT NULL,
  PRIMARY KEY (`stream_id`,`channel_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecm_stream`
--

LOCK TABLES `ecm_stream` WRITE;
/*!40000 ALTER TABLE `ecm_stream` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecm_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecmg`
--

DROP TABLE IF EXISTS `ecmg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecmg` (
  `channel_id` int(10) NOT NULL,
  `supercas_id` varchar(10) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `port` int(10) NOT NULL,
  `is_enable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecmg`
--

LOCK TABLES `ecmg` WRITE;
/*!40000 ALTER TABLE `ecmg` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecmg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emmg`
--

DROP TABLE IF EXISTS `emmg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emmg` (
  `channel_id` int(10) NOT NULL,
  `client_id` varchar(10) NOT NULL,
  `data_id` int(10) NOT NULL,
  `bw` int(10) NOT NULL,
  `port` int(10) NOT NULL,
  `stream_id` int(10) NOT NULL,
  `is_enable` int(2) NOT NULL DEFAULT '1',
  `emm_pid` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emmg`
--

LOCK TABLES `emmg` WRITE;
/*!40000 ALTER TABLE `emmg` DISABLE KEYS */;
/*!40000 ALTER TABLE `emmg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emmg_descriptor`
--

DROP TABLE IF EXISTS `emmg_descriptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emmg_descriptor` (
  `channel_id` int(11) NOT NULL,
  `rmx_no` int(11) NOT NULL,
  `output` int(11) NOT NULL,
  `is_enable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`channel_id`,`rmx_no`,`output`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emmg_descriptor`
--

LOCK TABLES `emmg_descriptor` WRITE;
/*!40000 ALTER TABLE `emmg_descriptor` DISABLE KEYS */;
/*!40000 ALTER TABLE `emmg_descriptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encrypted_service_list`
--

DROP TABLE IF EXISTS `encrypted_service_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encrypted_service_list` (
  `in_channel` int(1) NOT NULL,
  `out_channel` int(1) NOT NULL,
  `channel_num` int(10) NOT NULL,
  `rmx_id` int(1) NOT NULL,
  `key_index` bigint(20) NOT NULL,
  PRIMARY KEY (`in_channel`,`out_channel`,`channel_num`,`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encrypted_service_list`
--

LOCK TABLES `encrypted_service_list` WRITE;
/*!40000 ALTER TABLE `encrypted_service_list` DISABLE KEYS */;
INSERT INTO `encrypted_service_list` VALUES (0,0,1,1,2),(0,0,2,1,3),(0,0,3,1,4),(0,0,5030,1,0),(0,0,5031,1,1),(0,1,5032,1,3),(0,1,5034,1,2);
/*!40000 ALTER TABLE `encrypted_service_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freeCA_mode_programs`
--

DROP TABLE IF EXISTS `freeCA_mode_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeCA_mode_programs` (
  `program_number` int(11) NOT NULL,
  `input_channel` int(2) NOT NULL,
  `output_channel` int(2) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`program_number`,`input_channel`,`output_channel`,`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freeCA_mode_programs`
--

LOCK TABLES `freeCA_mode_programs` WRITE;
/*!40000 ALTER TABLE `freeCA_mode_programs` DISABLE KEYS */;
/*!40000 ALTER TABLE `freeCA_mode_programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highPriorityServices`
--

DROP TABLE IF EXISTS `highPriorityServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `highPriorityServices` (
  `program_number` int(11) NOT NULL,
  `input` int(11) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rmx_id`,`input`,`program_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highPriorityServices`
--

LOCK TABLES `highPriorityServices` WRITE;
/*!40000 ALTER TABLE `highPriorityServices` DISABLE KEYS */;
/*!40000 ALTER TABLE `highPriorityServices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `input`
--

DROP TABLE IF EXISTS `input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `input` (
  `input_channel` int(2) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `tuner_type` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`input_channel`,`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input`
--

LOCK TABLES `input` WRITE;
/*!40000 ALTER TABLE `input` DISABLE KEYS */;
INSERT INTO `input` VALUES (0,1,0),(0,2,1),(0,3,0),(0,4,0),(0,5,0),(0,6,0),(1,1,1),(1,2,0),(1,3,0),(1,4,0),(1,5,0),(1,6,0),(2,1,0),(2,2,0),(2,3,0),(2,4,0),(2,5,0),(2,6,0),(3,1,0),(3,2,0),(3,3,0),(3,4,0),(3,5,0),(3,6,0),(4,1,0),(4,2,0),(4,3,0),(4,4,0),(4,5,0),(4,6,0),(5,1,0),(5,2,0),(5,3,0),(5,4,0),(5,5,0),(5,6,0),(6,1,0),(6,2,0),(6,3,0),(6,4,0),(6,5,0),(6,6,0),(7,1,0),(7,2,0),(7,3,0),(7,4,0),(7,5,0),(7,6,0);
/*!40000 ALTER TABLE `input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `input_mode`
--

DROP TABLE IF EXISTS `input_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `input_mode` (
  `input` int(1) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `is_spts` int(1) NOT NULL,
  `pmt` int(4) NOT NULL,
  `sid` int(6) NOT NULL,
  `rise` int(1) NOT NULL,
  `master` int(1) NOT NULL,
  `in_select` int(1) NOT NULL,
  `bitrate` int(10) NOT NULL,
  PRIMARY KEY (`input`,`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input_mode`
--

LOCK TABLES `input_mode` WRITE;
/*!40000 ALTER TABLE `input_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `input_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_input_channels`
--

DROP TABLE IF EXISTS `ip_input_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_input_channels` (
  `rmx_no` int(1) NOT NULL,
  `input_channel` int(1) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `port` int(10) NOT NULL,
  `type` int(1) NOT NULL DEFAULT '1',
  `is_enable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rmx_no`,`input_channel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_input_channels`
--

LOCK TABLES `ip_input_channels` WRITE;
/*!40000 ALTER TABLE `ip_input_channels` DISABLE KEYS */;
INSERT INTO `ip_input_channels` VALUES (1,1,'3908043009',10000,1,0),(1,2,'3908043009',10000,1,0),(2,1,'3908043010',10000,1,0);
/*!40000 ALTER TABLE `ip_input_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_output_channels`
--

DROP TABLE IF EXISTS `ip_output_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_output_channels` (
  `rmx_no` int(1) NOT NULL,
  `output_channel` int(1) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `port` int(10) NOT NULL,
  `is_enable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rmx_no`,`output_channel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_output_channels`
--

LOCK TABLES `ip_output_channels` WRITE;
/*!40000 ALTER TABLE `ip_output_channels` DISABLE KEYS */;
INSERT INTO `ip_output_channels` VALUES (1,1,'4026466561',10001,1),(1,8,'4026466568',10001,1),(2,1,'4026466569',10001,1);
/*!40000 ALTER TABLE `ip_output_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcn`
--

DROP TABLE IF EXISTS `lcn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcn` (
  `program_number` int(10) NOT NULL,
  `input` int(11) NOT NULL,
  `channel_number` int(10) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rmx_id`,`input`,`program_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcn`
--

LOCK TABLES `lcn` WRITE;
/*!40000 ALTER TABLE `lcn` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcn_provider_id`
--

DROP TABLE IF EXISTS `lcn_provider_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcn_provider_id` (
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `provider_id` int(11) NOT NULL,
  PRIMARY KEY (`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcn_provider_id`
--

LOCK TABLES `lcn_provider_id` WRITE;
/*!40000 ALTER TABLE `lcn_provider_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcn_provider_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locked_programs`
--

DROP TABLE IF EXISTS `locked_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locked_programs` (
  `program_number` int(11) NOT NULL,
  `input` int(10) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rmx_id`,`input`,`program_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locked_programs`
--

LOCK TABLES `locked_programs` WRITE;
/*!40000 ALTER TABLE `locked_programs` DISABLE KEYS */;
/*!40000 ALTER TABLE `locked_programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mux_15_1`
--

DROP TABLE IF EXISTS `mux_15_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mux_15_1` (
  `mux_id` int(1) NOT NULL,
  `is_enable` int(1) NOT NULL DEFAULT '0',
  `custom_line` bigint(100) NOT NULL,
  PRIMARY KEY (`mux_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mux_15_1`
--

LOCK TABLES `mux_15_1` WRITE;
/*!40000 ALTER TABLE `mux_15_1` DISABLE KEYS */;
INSERT INTO `mux_15_1` VALUES (1,0,0),(2,0,1048576),(3,0,2097152);
/*!40000 ALTER TABLE `mux_15_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_details`
--

DROP TABLE IF EXISTS `network_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_details` (
  `output` int(1) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `ts_id` int(10) NOT NULL DEFAULT '-1',
  `network_id` int(10) NOT NULL DEFAULT '-1',
  `original_netw_id` int(10) NOT NULL DEFAULT '-1',
  `network_name` varchar(30) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`output`,`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_details`
--

LOCK TABLES `network_details` WRITE;
/*!40000 ALTER TABLE `network_details` DISABLE KEYS */;
INSERT INTO `network_details` VALUES (0,1,11,1,2,'-1'),(0,2,21,1,2,'-1'),(0,3,31,1,2,'-1'),(0,4,41,1,2,'-1'),(0,5,51,1,2,'-1'),(0,6,61,1,2,'-1'),(1,1,12,1,2,'-1'),(1,2,25,1,2,'-1'),(1,3,32,1,2,'-1'),(1,4,42,1,2,'-1'),(1,5,52,1,2,'-1'),(1,6,62,1,2,'-1'),(2,1,19,1,2,'-1'),(2,2,22,1,2,'-1'),(2,3,33,1,2,'-1'),(2,4,43,1,2,'-1'),(2,5,53,1,2,'-1'),(2,6,63,1,2,'-1'),(3,1,14,1,2,'-1'),(3,2,27,1,2,'-1'),(3,3,34,1,2,'-1'),(3,4,44,1,2,'-1'),(3,5,54,1,2,'-1'),(3,6,64,1,2,'-1'),(4,1,15,1,2,'-1'),(4,2,26,1,2,'-1'),(4,3,35,1,2,'-1'),(4,4,45,1,2,'-1'),(4,5,55,1,2,'-1'),(4,6,65,1,2,'-1'),(5,1,16,1,2,'-1'),(5,2,24,1,2,'-1'),(5,3,36,1,2,'-1'),(5,4,46,1,2,'-1'),(5,5,56,1,2,'-1'),(5,6,66,1,2,'-1'),(6,1,17,1,2,'-1'),(6,2,23,1,2,'-1'),(6,3,37,1,2,'-1'),(6,4,47,1,2,'-1'),(6,5,57,1,2,'-1'),(6,6,67,1,2,'-1'),(7,1,18,1,2,'-1'),(7,2,28,1,2,'-1'),(7,3,38,1,2,'-1'),(7,4,48,1,2,'-1'),(7,5,58,1,2,'-1'),(7,6,68,1,2,'-1');
/*!40000 ALTER TABLE `network_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `output`
--

DROP TABLE IF EXISTS `output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `output` (
  `output_channel` int(2) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `qam_id` int(1) NOT NULL DEFAULT '2',
  `nit_mode` int(1) NOT NULL DEFAULT '1',
  `indexValue` bigint(100) NOT NULL,
  `frequency` int(10) NOT NULL,
  `symbol_rate` int(10) NOT NULL,
  `roll_off` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`output_channel`,`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `output`
--

LOCK TABLES `output` WRITE;
/*!40000 ALTER TABLE `output` DISABLE KEYS */;
INSERT INTO `output` VALUES (0,1,2,2,31,114,6400000,1),(0,2,2,2,0,178,6400000,0),(0,3,2,2,0,242,6400000,0),(0,4,2,2,0,306,6400000,0),(0,5,2,2,0,370,6400000,0),(0,6,2,2,0,434,6400000,0),(1,1,2,2,15,122,6400000,0),(1,2,2,2,0,186,6400000,0),(1,3,2,2,0,250,6400000,0),(1,4,2,2,0,314,6400000,0),(1,5,2,2,0,378,6400000,0),(1,6,2,2,0,442,6400000,0),(2,1,2,2,1,130,6400000,0),(2,2,2,2,0,194,6400000,0),(2,3,2,2,0,258,6400000,0),(2,4,2,2,0,322,6400000,0),(2,5,2,2,0,386,6400000,0),(2,6,2,2,0,450,6400000,0),(3,1,2,2,2,138,6400000,0),(3,2,2,2,0,202,6400000,0),(3,3,2,2,0,266,6400000,0),(3,4,2,2,0,330,6400000,0),(3,5,2,2,0,394,6400000,0),(3,6,2,2,0,458,6400000,0),(4,1,2,2,1,146,6400000,0),(4,2,2,2,0,210,6400000,0),(4,3,2,2,0,274,6400000,0),(4,4,2,2,0,338,6400000,0),(4,5,2,2,0,402,6400000,0),(4,6,2,2,0,466,6400000,0),(5,1,2,2,0,154,6400000,0),(5,2,2,2,0,218,6400000,0),(5,3,2,2,0,282,6400000,0),(5,4,2,2,0,346,6400000,0),(5,5,2,2,0,410,6400000,0),(5,6,2,2,0,474,6400000,0),(6,1,2,2,0,162,6400000,0),(6,2,2,2,0,226,6400000,0),(6,3,2,2,0,290,6400000,0),(6,4,2,2,0,354,6400000,0),(6,5,2,2,0,418,6400000,0),(6,6,2,2,0,482,6400000,0),(7,1,2,2,1,170,6400000,0),(7,2,2,2,0,234,6400000,0),(7,3,2,2,0,298,6400000,0),(7,4,2,2,0,362,6400000,0),(7,5,2,2,0,426,6400000,0),(7,6,2,2,0,490,6400000,0);
/*!40000 ALTER TABLE `output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmt_alarms`
--

DROP TABLE IF EXISTS `pmt_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmt_alarms` (
  `program_number` int(11) NOT NULL,
  `input` int(10) NOT NULL,
  `alarm_enable` int(11) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rmx_id`,`input`,`program_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmt_alarms`
--

LOCK TABLES `pmt_alarms` WRITE;
/*!40000 ALTER TABLE `pmt_alarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmt_alarms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_data`
--

DROP TABLE IF EXISTS `private_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_data` (
  `id` int(11) NOT NULL,
  `data` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_data`
--

LOCK TABLES `private_data` WRITE;
/*!40000 ALTER TABLE `private_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `private_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psi_si_interval`
--

DROP TABLE IF EXISTS `psi_si_interval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psi_si_interval` (
  `output` int(1) NOT NULL,
  `pat_int` int(6) NOT NULL,
  `sdt_int` int(6) NOT NULL,
  `nit_int` int(6) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`output`,`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psi_si_interval`
--

LOCK TABLES `psi_si_interval` WRITE;
/*!40000 ALTER TABLE `psi_si_interval` DISABLE KEYS */;
INSERT INTO `psi_si_interval` VALUES (0,100,100,500,1),(0,100,100,500,2),(0,100,100,500,3),(0,100,100,500,4),(0,100,100,500,5),(0,100,100,500,6),(1,100,100,500,1),(1,100,100,500,2),(1,100,100,500,3),(1,100,100,500,4),(1,100,100,500,5),(1,100,100,500,6),(2,100,100,500,1),(2,100,100,500,2),(2,100,100,500,3),(2,100,100,500,4),(2,100,100,500,5),(2,100,100,500,6),(3,100,100,500,1),(3,100,100,500,2),(3,100,100,500,3),(3,100,100,500,4),(3,100,100,500,5),(3,100,100,500,6),(4,100,100,500,1),(4,100,100,500,2),(4,100,100,500,3),(4,100,100,500,4),(4,100,100,500,5),(4,100,100,500,6),(5,100,100,500,1),(5,100,100,500,2),(5,100,100,500,3),(5,100,100,500,4),(5,100,100,500,5),(5,100,100,500,6),(6,100,100,500,1),(6,100,100,500,2),(6,100,100,500,3),(6,100,100,500,4),(6,100,100,500,5),(6,100,100,500,6);
/*!40000 ALTER TABLE `psi_si_interval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rf_authorization`
--

DROP TABLE IF EXISTS `rf_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rf_authorization` (
  `rmx_no` int(6) NOT NULL,
  `enable` int(1) NOT NULL,
  PRIMARY KEY (`rmx_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rf_authorization`
--

LOCK TABLES `rf_authorization` WRITE;
/*!40000 ALTER TABLE `rf_authorization` DISABLE KEYS */;
INSERT INTO `rf_authorization` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1);
/*!40000 ALTER TABLE `rf_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmx_mux_out`
--

DROP TABLE IF EXISTS `rmx_mux_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmx_mux_out` (
  `bit` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmx_mux_out`
--

LOCK TABLES `rmx_mux_out` WRITE;
/*!40000 ALTER TABLE `rmx_mux_out` DISABLE KEYS */;
INSERT INTO `rmx_mux_out` VALUES (0,0),(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0);
/*!40000 ALTER TABLE `rmx_mux_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rmx_registers`
--

DROP TABLE IF EXISTS `rmx_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rmx_registers` (
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `cs` int(2) NOT NULL,
  `address` int(12) NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`rmx_id`,`cs`,`address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rmx_registers`
--

LOCK TABLES `rmx_registers` WRITE;
/*!40000 ALTER TABLE `rmx_registers` DISABLE KEYS */;
INSERT INTO `rmx_registers` VALUES (1,0,0,0),(1,18,12,23177216),(1,19,12,6400000),(1,20,12,6400000),(1,21,12,6400000),(1,22,12,6400000),(1,23,12,6400000),(1,24,12,6400000),(1,25,12,6400000),(2,0,0,4),(2,18,12,6400000),(2,19,12,6400000),(2,20,12,6400000),(2,21,12,6400000),(2,22,12,6400000),(2,23,12,6400000),(2,24,12,6400000),(2,25,12,6400000),(3,0,0,1),(3,18,12,6400000),(3,19,12,6400000),(3,20,12,6400000),(3,21,12,6400000),(3,22,12,6400000),(3,23,12,6400000),(3,24,12,6400000),(3,25,12,6400000),(4,0,0,5),(4,18,12,6400000),(4,19,12,6400000),(4,20,12,6400000),(4,21,12,6400000),(4,22,12,6400000),(4,23,12,6400000),(4,24,12,6400000),(4,25,12,6400000),(5,0,0,2),(5,18,12,6400000),(5,19,12,6400000),(5,20,12,6400000),(5,21,12,6400000),(5,22,12,6400000),(5,23,12,6400000),(5,24,12,6400000),(5,25,12,6400000),(6,0,0,6),(6,18,12,6400000),(6,19,12,6400000),(6,20,12,6400000),(6,21,12,6400000),(6,22,12,6400000),(6,23,12,6400000),(6,24,12,6400000),(6,25,12,6400000);
/*!40000 ALTER TABLE `rmx_registers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_providers`
--

DROP TABLE IF EXISTS `service_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_providers` (
  `service_number` int(11) NOT NULL,
  `provider_name` varchar(256) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rmx_id`,`service_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_providers`
--

LOCK TABLES `service_providers` WRITE;
/*!40000 ALTER TABLE `service_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spts_ip_inputs`
--

DROP TABLE IF EXISTS `spts_ip_inputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spts_ip_inputs` (
  `mux_id` int(1) NOT NULL,
  `channel_no` int(2) NOT NULL,
  `ip_address` varchar(11) NOT NULL,
  `port` int(10) NOT NULL,
  `type` int(1) NOT NULL,
  `is_enable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`channel_no`,`mux_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spts_ip_inputs`
--

LOCK TABLES `spts_ip_inputs` WRITE;
/*!40000 ALTER TABLE `spts_ip_inputs` DISABLE KEYS */;
/*!40000 ALTER TABLE `spts_ip_inputs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream_service_map`
--

DROP TABLE IF EXISTS `stream_service_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stream_service_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream_service_map`
--

LOCK TABLES `stream_service_map` WRITE;
/*!40000 ALTER TABLE `stream_service_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `stream_service_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_versions`
--

DROP TABLE IF EXISTS `table_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_versions` (
  `output` int(1) NOT NULL,
  `rmx_id` int(1) NOT NULL DEFAULT '1',
  `pat_ver` int(11) NOT NULL,
  `pat_isenable` int(1) NOT NULL,
  `sdt_ver` int(11) NOT NULL,
  `sdt_isenable` int(1) NOT NULL,
  `nit_ver` int(11) NOT NULL,
  `nit_isenable` int(1) NOT NULL,
  PRIMARY KEY (`output`,`rmx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_versions`
--

LOCK TABLES `table_versions` WRITE;
/*!40000 ALTER TABLE `table_versions` DISABLE KEYS */;
INSERT INTO `table_versions` VALUES (0,1,1,1,1,1,1,1),(0,2,1,1,1,1,1,1),(0,3,1,1,1,1,1,1),(0,4,1,1,1,1,1,1),(0,5,1,1,1,1,1,1),(0,6,1,1,1,1,1,1),(1,1,1,1,1,1,1,1),(1,2,1,1,1,1,1,1),(1,3,1,1,1,1,1,1),(1,4,1,1,1,1,1,1),(1,5,1,1,1,1,1,1),(1,6,1,1,1,1,1,1),(2,1,1,1,1,1,1,1),(2,2,1,1,1,1,1,1),(2,3,1,1,1,1,1,1),(2,4,1,1,1,1,1,1),(2,5,1,1,1,1,1,1),(2,6,1,1,1,1,1,1),(3,1,1,1,1,1,1,1),(3,2,1,1,1,1,1,1),(3,3,1,1,1,1,1,1),(3,4,1,1,1,1,1,1),(3,5,1,1,1,1,1,1),(3,6,1,1,1,1,1,1),(4,1,1,1,1,1,1,1),(4,2,1,1,1,1,1,1),(4,3,1,1,1,1,1,1),(4,4,1,1,1,1,1,1),(4,5,1,1,1,1,1,1),(4,6,1,1,1,1,1,1),(5,1,1,1,1,1,1,1),(5,2,1,1,1,1,1,1),(5,3,1,1,1,1,1,1),(5,4,1,1,1,1,1,1),(5,5,1,1,1,1,1,1),(5,6,1,1,1,1,1,1),(6,1,1,1,1,1,1,1),(6,2,1,1,1,1,1,1),(6,3,1,1,1,1,1,1),(6,4,1,1,1,1,1,1),(6,5,1,1,1,1,1,1),(6,6,1,1,1,1,1,1),(7,1,1,1,1,1,1,1),(7,2,1,1,1,1,1,1),(7,3,1,1,1,1,1,1),(7,4,1,1,1,1,1,1),(7,5,1,1,1,1,1,1),(7,6,1,1,1,1,1,1);
/*!40000 ALTER TABLE `table_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuner_details`
--

DROP TABLE IF EXISTS `tuner_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuner_details` (
  `mxl_id` int(11) NOT NULL,
  `rmx_no` int(11) NOT NULL,
  `demod_id` int(11) NOT NULL,
  `lnb_id` int(11) NOT NULL,
  `dvb_standard` int(11) NOT NULL,
  `frequency` int(11) NOT NULL,
  `symbol_rate` int(11) NOT NULL,
  `modulation` int(11) NOT NULL DEFAULT '0',
  `fec` int(11) NOT NULL DEFAULT '0',
  `rolloff` int(11) NOT NULL DEFAULT '0',
  `pilots` int(11) NOT NULL DEFAULT '2',
  `spectrum` int(11) NOT NULL DEFAULT '0',
  `lo_frequency` int(11) NOT NULL,
  `is_enable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mxl_id`,`rmx_no`,`demod_id`),
  KEY `mxl_id` (`mxl_id`),
  KEY `rmx_no` (`rmx_no`),
  KEY `demode_id` (`demod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuner_details`
--

LOCK TABLES `tuner_details` WRITE;
/*!40000 ALTER TABLE `tuner_details` DISABLE KEYS */;
INSERT INTO `tuner_details` VALUES (1,1,0,0,1,1394000000,13333,0,0,0,2,0,5150,1);
/*!40000 ALTER TABLE `tuner_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-19 16:28:26

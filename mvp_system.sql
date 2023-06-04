-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mvp_system
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `acctID` int(11) NOT NULL AUTO_INCREMENT,
  `acctNo` varchar(50) NOT NULL DEFAULT '',
  `acctName` varchar(50) NOT NULL DEFAULT '',
  `customerID` int(11) NOT NULL,
  `acctType` int(11) NOT NULL,
  `bankID` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `statusID` int(11) NOT NULL,
  `dtCreated` datetime NOT NULL,
  PRIMARY KEY (`acctID`),
  UNIQUE KEY `acctNo` (`acctNo`),
  KEY `bankID` (`bankID`),
  KEY `customerID` (`customerID`),
  KEY `FK_accounts_accounttype` (`acctType`),
  KEY `FK_accounts_status` (`statusID`),
  CONSTRAINT `FK_accounts_accounttype` FOREIGN KEY (`acctType`) REFERENCES `accounttype` (`accountType`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_accounts_status` FOREIGN KEY (`statusID`) REFERENCES `status` (`statusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bankID` FOREIGN KEY (`bankID`) REFERENCES `banks` (`bankID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customerID` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'24242424','Test Customer 1',1,1,3,0,1,'2023-06-04 00:00:00'),(2,'242424224','Test Customer 2',1,1,3,0,1,'2023-06-04 00:00:00'),(3,'2424661224','Test Customer 3',1,1,3,0,3,'2023-06-04 00:00:00');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounttype`
--

DROP TABLE IF EXISTS `accounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounttype` (
  `accountType` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountType`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttype`
--

LOCK TABLES `accounttype` WRITE;
/*!40000 ALTER TABLE `accounttype` DISABLE KEYS */;
INSERT INTO `accounttype` VALUES (1,'Savings Account'),(2,'Checking Account');
/*!40000 ALTER TABLE `accounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banks` (
  `bankID` int(11) NOT NULL AUTO_INCREMENT,
  `bankName` varchar(50) NOT NULL,
  `mnemonic` char(10) NOT NULL,
  PRIMARY KEY (`bankID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'Banco De Oro','BDO'),(2,'Bank of the Philippine Islands','BPI'),(3,'Security Bank','SBC'),(4,'Commerce International Merchant Bankers Berhad','CIMB');
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birthday` date NOT NULL,
  `contactNo` varchar(20) NOT NULL,
  `emailAddress` varchar(30) DEFAULT NULL,
  `Address` varchar(250) NOT NULL,
  `memberSince` datetime NOT NULL,
  `statusID` int(11) NOT NULL,
  KEY `customerID` (`customerID`),
  KEY `FK_customers_status` (`statusID`),
  CONSTRAINT `FK_customers_status` FOREIGN KEY (`statusID`) REFERENCES `status` (`statusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Raymart','Lauigan','Male','2023-06-04','0982xxxxxxxx','email@address.ph','Cainta, Rizal','2023-06-04 00:00:00',1),(2,'Matt','Nagiual','Male','2023-06-04','0982xxxxxxxx','email@address.ph','Cainta, Rizal','2023-06-04 00:00:00',1),(10,'Sam','Arada','Male','2023-06-04','1265271','e@mail.com','Cainta,Rizal','2023-06-04 00:00:00',4),(11,'Sam','Arada','Male','2023-06-04','1265271','e@mail.com','Cainta,Rizal','2023-06-04 00:00:00',4);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referrals` (
  `referralID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `referredBy` int(11) NOT NULL,
  `isCredit` tinyint(4) NOT NULL,
  PRIMARY KEY (`referralID`),
  KEY `referrals_custID` (`customerID`),
  KEY `referrals_referred` (`referredBy`) USING BTREE,
  CONSTRAINT `referrals_custID` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `referrals_referred` FOREIGN KEY (`referredBy`) REFERENCES `customers` (`customerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
INSERT INTO `referrals` VALUES (1,1,2,0),(2,1,2,0),(3,10,2,1),(4,11,10,1);
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `statusID` int(11) NOT NULL AUTO_INCREMENT,
  `statusType` int(11) NOT NULL,
  `Description` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`statusID`),
  KEY `FK_status_statustype` (`statusType`),
  CONSTRAINT `FK_status_statustype` FOREIGN KEY (`statusType`) REFERENCES `statustype` (`statusType`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=123124 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,1,'ACTIVE'),(2,1,'INACTIVE'),(3,1,'BLOCKED'),(4,2,'ACTIVE'),(5,2,'INACTIVE'),(6,2,'HOLD'),(7,3,'ACTIVE'),(8,3,'INACTIVE'),(9,3,'CLOSED');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statustype`
--

DROP TABLE IF EXISTS `statustype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statustype` (
  `statusType` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`statusType`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statustype`
--

LOCK TABLES `statustype` WRITE;
/*!40000 ALTER TABLE `statustype` DISABLE KEYS */;
INSERT INTO `statustype` VALUES (1,'users'),(2,'customers'),(3,'accounts');
/*!40000 ALTER TABLE `statustype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trxlog`
--

DROP TABLE IF EXISTS `trxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trxlog` (
  `trxID` int(11) NOT NULL AUTO_INCREMENT,
  `acctID` int(11) NOT NULL,
  `bankID` int(11) NOT NULL,
  `dtLog` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `isReferral` tinyint(4) NOT NULL,
  `referralID` int(11) DEFAULT NULL,
  PRIMARY KEY (`trxID`),
  KEY `trxlog_acctID` (`acctID`),
  KEY `trxlog_bankID` (`bankID`),
  KEY `trxlog_referralID` (`referralID`),
  CONSTRAINT `trxlog_acctID` FOREIGN KEY (`acctID`) REFERENCES `accounts` (`acctID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trxlog_bankID` FOREIGN KEY (`bankID`) REFERENCES `banks` (`bankID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trxlog_referralID` FOREIGN KEY (`referralID`) REFERENCES `referrals` (`referralID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trxlog`
--

LOCK TABLES `trxlog` WRITE;
/*!40000 ALTER TABLE `trxlog` DISABLE KEYS */;
INSERT INTO `trxlog` VALUES (8,1,2,'2023-06-04 09:22:45',250,1,4),(9,1,2,'2023-06-04 09:23:05',250,0,NULL);
/*!40000 ALTER TABLE `trxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `userpass` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `contactNo` varchar(20) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `statusID` int(11) NOT NULL,
  `dtCreated` datetime NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userName` (`username`) USING BTREE,
  KEY `FK_users_status` (`statusID`),
  CONSTRAINT `FK_users_status` FOREIGN KEY (`statusID`) REFERENCES `status` (`statusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'matttrl','passx1x','matt','lauigan','male','2023-06-04','123123','1231231@gmail.com','Cainta, Rizal',1,'2023-06-04 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mvp_system'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCheckReferralCredit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`coreadm`@`localhost` PROCEDURE `sp_getCheckReferralCredit`(
        IN p_referredBy INT,
        OUT o_count INT
    )
BEGIN
SELECT *
FROM mvp_system.referrals
WHERE
    referredBy = p_referredBy
    AND isCredit = 0;

-- zero (0) Referral fee is pending

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`coreadm`@`localhost` PROCEDURE `sp_getCustomer`()
BEGIN
SELECT *
FROM mvp_system.customers;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getTrxList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`coreadm`@`localhost` PROCEDURE `sp_getTrxList`()
BEGIN
SELECT
    trx.trxID,
    acct.acctName,
    acctype.Description,
    trx.dtLog,
    trx.amount,
    bnk.mnemonic
FROM mvp_system.trxlog trx
    INNER JOIN mvp_system.accounts acct ON acct.acctID = trx.acctID
    INNER JOIN mvp_system.accounttype acctype ON acctype.accountType = acctType
    INNER JOIN banks bnk ON bnk.bankID = acct.bankID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`coreadm`@`localhost` PROCEDURE `sp_insertAccount`(
	IN `p_acctNo` VARCHAR(50),
	IN `p_acctName` VARCHAR(50),
	IN `p_customerID` INT,
	IN `p_acctType` INT,
	IN `p_bankID` INT,
	IN `p_statusID` INT,
	OUT `o_errMsg` VARCHAR(50)
)
BEGIN
SET o_errMsg = '';
	IF EXISTS (SELECT acctNo  
		FROM mvp_system.accounts
		WHERE acctNo = p_acctNo) THEN 
	SET o_errMsg = 996; 
	ELSE 

  INSERT INTO mvp_system.accounts SET
    acctNo = p_acctNo,
    acctName = p_acctName, 
    customerID = p_customerID,
    acctType = p_acctType,
    bankID = p_bankID,
    balance = 0,
    statusID = p_statusID,
    dtCreated = NOW();
    
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`coreadm`@`localhost` PROCEDURE `sp_insertCustomer`(
        IN p_firstName VARCHAR(50),
        IN p_lastName VARCHAR(50),
        IN p_gender VARCHAR(10),
        IN p_Birthday DATE,
        IN p_contactNo VARCHAR(20),
        IN p_email VARCHAR(30),
        IN p_address VARCHAR(250),
        IN p_isReferral TINYINT,
        IN p_referredBy INT,
        OUT o_errMsg VARCHAR(50)
    )
BEGIN DECLARE REFERRED TINYINT DEFAULT 1;

INSERT INTO
    mvp_system.customers
SET
    firstName = p_firstName,
    lastName = p_lastName,
    gender = p_gender,
    birthday = p_Birthday,
    contactNo = p_contactNo,
    emailAddress = p_email,
    address = p_address,
    statusID = 4,
    memberSince = NOW();

SET @lastID = LAST_INSERT_ID();

SELECT @lastID AS lastid;

 IF p_isReferral = REFERRED THEN
 CALL
     mvp_system.sp_insertReferral(@lastID, p_referredBy);

 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertReferral` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`coreadm`@`localhost` PROCEDURE `sp_insertReferral`(
        IN p_referredCust INT,
        IN p_referredBy INT
    )
BEGIN
INSERT INTO
    mvp_system.referrals
SET
    customerID = p_referredCust,
    referredBy = p_referredBy,
    isCredit = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertTransactionLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`coreadm`@`localhost` PROCEDURE `sp_insertTransactionLog`(
        IN p_acctID INT,
        IN p_bankID INT,
        IN p_amount INT,
        IN p_isReferral INT,
        IN p_referralID INT,
        OUT o_errMsg VARCHAR(50)
    )
BEGIN
SET o_errMsg = '';

IF p_isReferral = 1 THEN IF EXISTS (
    SELECT referralID
    FROM mvp_system.trxlog
    WHERE
        referralID = p_referralID
) THEN
SET o_errMsg = 996;

ELSE
INSERT INTO mvp_system.trxlog
SET
    acctID = p_acctID,
    bankID = p_bankID,
    dtlog = NOW(),
    amount = p_amount,
    isReferral = p_isReferral,
    referralID = p_referralID;

UPDATE mvp_system.referrals
SET isCredit = 1
WHERE
    referralID = p_referralID;

END IF;

ELSE
INSERT INTO mvp_system.trxlog
SET
    acctID = p_acctID,
    bankID = p_bankID,
    dtlog = NOW(),
    amount = p_amount,
    isReferral = p_isReferral,
    referralID = p_referralID;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`coreadm`@`localhost` PROCEDURE `sp_insertUsers`(
        IN p_username VARCHAR(20),
        IN p_userpass VARCHAR(50),
        IN p_firstName VARCHAR(50),
        IN p_lastName VARCHAR(50),
        IN p_gender VARCHAR(10),
        IN p_birthday DATE,
        IN p_contactNo VARCHAR(20),
        IN p_email VARCHAR(30),
        IN p_address VARCHAR(250),
        OUT o_errMsg VARCHAR(50)
    )
BEGIN IF EXISTS (
        SELECT username
        FROM mvp_system.users
        WHERE
            username = p_username
    ) THEN
SET o_errMsg = 996;
ELSE
INSERT INTO mvp_system.users
SET
    username = p_username,
    userpass = p_userpass,
    firstName = p_firstName,
    lastName = p_lastName,
    gender = p_gender,
    birthday = p_Birthday,
    contactNo = p_contactNo,
    emailAddress = p_email,
    address = p_address,
    statusID = 1,
    dtCreated = NOW();
END IF;

END ;;
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

-- Dump completed on 2023-06-04 10:24:15

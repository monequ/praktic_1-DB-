﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.689.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 19.12.2024 15:41:24
-- Server version: 5.5.25
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE voenny_okrug;

--
-- Drop table `lichnyy_sostav`
--
DROP TABLE IF EXISTS lichnyy_sostav;

--
-- Drop table `rota`
--
DROP TABLE IF EXISTS rota;

--
-- Drop table `chast`
--
DROP TABLE IF EXISTS chast;

--
-- Drop table `mesto_dislokatsii`
--
DROP TABLE IF EXISTS mesto_dislokatsii;

--
-- Drop table `vid_voysk`
--
DROP TABLE IF EXISTS vid_voysk;

--
-- Set default database
--
USE voenny_okrug;

--
-- Create table `vid_voysk`
--
CREATE TABLE vid_voysk (
  IDType_of_troops INT(11) NOT NULL AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (IDType_of_troops)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `mesto_dislokatsii`
--
CREATE TABLE mesto_dislokatsii (
  IDLocation INT(11) NOT NULL AUTO_INCREMENT,
  Сountry VARCHAR(255) NOT NULL,
  City VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  Occupied_area VARCHAR(255) NOT NULL,
  PRIMARY KEY (IDLocation)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `chast`
--
CREATE TABLE chast (
  IDPart INT(11) NOT NULL AUTO_INCREMENT,
  Number_part VARCHAR(255) NOT NULL,
  IDLocation INT(11) DEFAULT NULL,
  IDType_of_troops INT(11) DEFAULT NULL,
  Number_of_mouths INT(11) NOT NULL,
  PRIMARY KEY (IDPart)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE chast 
  ADD CONSTRAINT chast_ibfk_1 FOREIGN KEY (IDLocation)
    REFERENCES mesto_dislokatsii(IDLocation);

--
-- Create foreign key
--
ALTER TABLE chast 
  ADD CONSTRAINT chast_ibfk_2 FOREIGN KEY (IDType_of_troops)
    REFERENCES vid_voysk(IDType_of_troops);

--
-- Create table `rota`
--
CREATE TABLE rota (
  IDCompany INT(11) NOT NULL AUTO_INCREMENT,
  Name_company VARCHAR(255) NOT NULL,
  Number_of_employees INT(11) NOT NULL,
  IDPart INT(11) DEFAULT NULL,
  PRIMARY KEY (IDCompany)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE rota 
  ADD CONSTRAINT rota_ibfk_1 FOREIGN KEY (IDPart)
    REFERENCES chast(IDPart);

--
-- Create table `lichnyy_sostav`
--
CREATE TABLE lichnyy_sostav (
  IDPersonnel INT(11) NOT NULL AUTO_INCREMENT,
  Surname VARCHAR(255) NOT NULL,
  IDCompany INT(11) DEFAULT NULL,
  Post VARCHAR(255) DEFAULT NULL,
  Year_of_birth INT(11) DEFAULT NULL,
  Year_of_enlistment INT(11) DEFAULT NULL,
  Length_of_service INT(11) DEFAULT NULL,
  Awards TEXT DEFAULT NULL,
  Participation_in_military_events TEXT DEFAULT NULL,
  PRIMARY KEY (IDPersonnel)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE lichnyy_sostav 
  ADD CONSTRAINT lichnyy_sostav_ibfk_1 FOREIGN KEY (IDCompany)
    REFERENCES rota(IDCompany);

-- 
-- Dumping data for table vid_voysk
--
INSERT INTO vid_voysk VALUES
(1, 'Пехота'),
(2, 'Танковые войска'),
(3, 'Артиллерия');

-- 
-- Dumping data for table mesto_dislokatsii
--
INSERT INTO mesto_dislokatsii VALUES
(1, 'Россия', 'Москва', 'Улица Ленина, 1', '15000'),
(2, 'Россия', 'Санкт-Петербург', 'Невский проспект, 2', '12000'),
(3, 'Беларусь', 'Минск', 'Улица Победы, 10', '8000'),
(4, 'Россия', 'Москва', 'Улица Ленина, 1', '15000'),
(5, 'Россия', 'Санкт-Петербург', 'Невский проспект, 2', '12000'),
(6, 'Беларусь', 'Минск', 'Улица Победы, 10', '8000');

-- 
-- Dumping data for table chast
--
INSERT INTO chast VALUES
(1, 'Часть 123', 1, 1, 3),
(2, 'Часть 456', 2, 2, 2),
(3, 'Часть 789', 3, 3, 4);

-- 
-- Dumping data for table rota
--
INSERT INTO rota VALUES
(1, 'Рота 1', 50, 1),
(2, 'Рота 2', 60, 1),
(3, 'Рота 3', 45, 2),
(4, 'Рота 4', 55, 3);

-- 
-- Dumping data for table lichnyy_sostav
--
INSERT INTO lichnyy_sostav VALUES
(1, 'Иванов', 1, 'Сержант', 1990, 2010, 11, 'Орден Мужества', 'Участие в учениях'),
(2, 'Петров', 2, 'Лейтенант', 1988, 2012, 9, 'Медаль За службу', 'Участие в параде'),
(3, 'Сидоров', 3, 'Капитан', 1985, 2008, 14, 'Орден Отечества', 'Участие в миротворческой миссии'),
(4, 'Кузнецов', 4, 'Рядовой', 1995, 2020, 2, NULL, 'Участие в локальных учениях');

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: nhs_group_db
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment_audit_log`
--

DROP TABLE IF EXISTS `appointment_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_audit_log` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `AppointmentID` varchar(50) NOT NULL,
  `OldNotes` text,
  `NewNotes` text,
  `ChangedAt` datetime NOT NULL,
  `ChangedBy` varchar(100) NOT NULL,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_audit_log`
--

LOCK TABLES `appointment_audit_log` WRITE;
/*!40000 ALTER TABLE `appointment_audit_log` DISABLE KEYS */;
INSERT INTO `appointment_audit_log` VALUES (1,'Card250524','CRITICAL UPDATE: Patient switched to low-dose Aspirin.','SYSTEM AUDIT UPDATE: Active verification test.','2026-06-26 13:21:14','root@localhost');
/*!40000 ALTER TABLE `appointment_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_medication`
--

DROP TABLE IF EXISTS `appointment_medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_medication` (
  `appointmentid` varchar(50) NOT NULL,
  `medicationid` varchar(50) NOT NULL,
  PRIMARY KEY (`appointmentid`,`medicationid`),
  KEY `fk_junction_medication` (`medicationid`),
  CONSTRAINT `fk_junction_appointment` FOREIGN KEY (`appointmentid`) REFERENCES `appointments` (`AppointmentID`) ON DELETE CASCADE,
  CONSTRAINT `fk_junction_medication` FOREIGN KEY (`medicationid`) REFERENCES `medications` (`MedicationID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_medication`
--

LOCK TABLES `appointment_medication` WRITE;
/*!40000 ALTER TABLE `appointment_medication` DISABLE KEYS */;
INSERT INTO `appointment_medication` VALUES ('Peds040524','AMO04'),('Card010524','Asp01'),('Card250524','Asp01'),('GP090524','ATOR07'),('Card010524','BTB02'),('Derm050524','IBU05'),('Ortho060524','IBU05'),('Neuro070524','OMEP09'),('GP010524','PCT03'),('Onco080524','PCT03');
/*!40000 ALTER TABLE `appointment_medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `AppointmentID` varchar(50) NOT NULL,
  `PatientID` varchar(255) NOT NULL,
  `DoctorID` varchar(20) NOT NULL,
  `AppointmentDate` date NOT NULL,
  `AppointmentTime` time NOT NULL,
  `Notes` text NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `fk_appt_patient` (`PatientID`),
  KEY `fk_appt_doctor` (`DoctorID`),
  CONSTRAINT `fk_appt_doctor` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`) ON DELETE CASCADE,
  CONSTRAINT `fk_appt_patient` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES ('Card010524','P001','Card1','2024-05-01','10:00:00','Patient showing excellent recovery signs. Lower dose.'),('Card250524','P001','Card1','2024-05-10','11:30:00','SYSTEM AUDIT UPDATE: Active verification test.'),('Derm050524','P004','Derm4','2024-05-05','15:15:00','Skin allergy review'),('GP010524','P002','GP2','2024-05-03','09:00:00','Patient showing excellent recovery signs. Lower dose.'),('GP090524','P008','GP8','2024-05-09','09:30:00','Annual wellness exam'),('Neuro070524','P006','Neuro6','2024-05-07','13:00:00','Migraine follow-up'),('Onco080524','P007','Onco7','2024-05-08','11:00:00','Chemotherapy review'),('Ortho060524','P005','Ortho5','2024-05-06','10:45:00','Post-op knee assessment'),('Peds040524','P003','Peds3','2024-05-04','14:00:00','Routine child checkup'),('Psych100524','P009','Psych9','2024-05-10','16:00:00','Therapy session');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinics`
--

DROP TABLE IF EXISTS `clinics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinics` (
  `ClinicID` varchar(20) NOT NULL,
  `ClinicName` varchar(255) NOT NULL,
  `ClinicAddress` varchar(255) NOT NULL,
  PRIMARY KEY (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinics`
--

LOCK TABLES `clinics` WRITE;
/*!40000 ALTER TABLE `clinics` DISABLE KEYS */;
INSERT INTO `clinics` VALUES ('1','Clinic A','10 Main St'),('10','Clinic J - Valley Audiology','15 Maple Dr, Leicester'),('2','Clinic B','22 River Rd'),('3','Clinic C - North Pediatrics','44 Station Rd, Birmingham'),('4','Clinic D - South Dermatology','88 Church Lane, Bristol'),('5','Clinic E - West Orthopedics','12 High St, Leeds'),('6','Clinic F - East Neurology','55 Park Way, Newcastle'),('7','Clinic G - Central Oncology','77 Oak Ave, Sheffield'),('8','Clinic H - Wellness General','99 Pine Blvd, Liverpool'),('9','Clinic I - Metro Psychiatry','33 Elm Rd, Nottingham');
/*!40000 ALTER TABLE `clinics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `DoctorID` varchar(20) NOT NULL,
  `DoctorName` varchar(255) NOT NULL,
  `DoctorSpecialty` varchar(255) NOT NULL,
  `ClinicID` varchar(20) NOT NULL,
  PRIMARY KEY (`DoctorID`),
  KEY `fk_doctor_clinic` (`ClinicID`),
  CONSTRAINT `fk_doctor_clinic` FOREIGN KEY (`ClinicID`) REFERENCES `clinics` (`ClinicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES ('Audio10','Dr Khan','Audiology','10'),('Card1','Dr Adams','Cardiology','1'),('Derm4','Dr Diaz','Dermatology','4'),('GP2','Dr Brown','General Practice','2'),('GP8','Dr Harris','General Practice','8'),('Neuro6','Dr Foster','Neurology','6'),('Onco7','Dr Green','Oncology','7'),('Ortho5','Dr Evans','Orthopedics','5'),('Peds3','Dr Carter','Pediatrics','3'),('Psych9','Dr Jackson','Psychiatry','9');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `MedicationID` varchar(50) NOT NULL,
  `MedicationName` varchar(255) NOT NULL,
  PRIMARY KEY (`MedicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES ('ALB10','Albuterol'),('AMO04','Amoxicillin'),('Asp01','Aspirin'),('ATOR07','Atorvastatin'),('BTB02','Beta Blocker'),('IBU05','Ibuprofen'),('LOS08','Losartan'),('MET06','Metformin'),('OMEP09','Omeprazole'),('PCT03','Paracetamol');
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `PatientID` varchar(255) NOT NULL,
  `PatientName` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('P001','John Smith','123 Hill Road'),('P002','Mary Jones','456 Lake Avenue'),('P003','David Williams','789 Oak Street, Birmingham'),('P004','Sarah Brown','101 Pine Crescent, Bristol'),('P005','James Taylor','202 Cedar Way, Leeds'),('P006','Patricia Davies','303 Birch Drive, Newcastle'),('P007','Robert Wilson','404 Elm Lane, Sheffield'),('P008','Jennifer Evans','505 Willow Court, Liverpool'),('P009','Michael Thomas','606 Ash Grove, Nottingham'),('P010','Linda Roberts','707 Beech Terrace, Leicester');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-03 13:12:08

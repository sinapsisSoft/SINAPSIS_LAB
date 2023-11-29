-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2023 a las 09:18:34
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `voting_management`
--
CREATE DATABASE IF NOT EXISTS `voting_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `voting_management`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidate`
--

DROP TABLE IF EXISTS `candidate`;
CREATE TABLE IF NOT EXISTS `candidate` (
  `Candidate_id` int(11) NOT NULL AUTO_INCREMENT,
  `Candidate_name` varchar(20) NOT NULL,
  `Candidate_descriptions` varchar(100) NOT NULL,
  `Candidate_photo` varchar(200) NOT NULL,
  `Candidate_slogan` varchar(50) NOT NULL,
  `Candidate_proposals` varchar(200) NOT NULL,
  `Student_id` int(11) NOT NULL,
  PRIMARY KEY (`Candidate_id`),
  KEY `candidate_student` (`Student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `candidate`
--

TRUNCATE TABLE `candidate`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `Course_id` int(11) NOT NULL AUTO_INCREMENT,
  `Course_name` varchar(10) NOT NULL,
  `Course_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `course`
--

TRUNCATE TABLE `course`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_type`
--

DROP TABLE IF EXISTS `document_type`;
CREATE TABLE IF NOT EXISTS `document_type` (
  `Document_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `Document_type_name` varchar(20) NOT NULL,
  `Document_type_description` varchar(100) NOT NULL,
  PRIMARY KEY (`Document_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `document_type`
--

TRUNCATE TABLE `document_type`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elections`
--

DROP TABLE IF EXISTS `elections`;
CREATE TABLE IF NOT EXISTS `elections` (
  `Elections_id` int(11) NOT NULL AUTO_INCREMENT,
  `Elections_date` date NOT NULL,
  `Elections_description` varchar(100) NOT NULL,
  PRIMARY KEY (`Elections_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `elections`
--

TRUNCATE TABLE `elections`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `Role_id` int(11) NOT NULL AUTO_INCREMENT,
  `Role_name` varchar(20) NOT NULL,
  `Role_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `role`
--

TRUNCATE TABLE `role`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `Student_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_name` varchar(20) NOT NULL,
  `Student_document` varchar(20) NOT NULL,
  `Student_email` varchar(100) DEFAULT NULL,
  `Student_cellphone` varchar(10) DEFAULT NULL,
  `Student_address` varchar(100) DEFAULT NULL,
  `Document_type_id` int(11) NOT NULL,
  `Course_id` int(11) NOT NULL,
  `Role_id` int(11) NOT NULL,
  PRIMARY KEY (`Student_id`),
  KEY `student_document_type` (`Document_type_id`),
  KEY `student_course` (`Course_id`),
  KEY `student_role` (`Role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `student`
--

TRUNCATE TABLE `student`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_user` varchar(30) NOT NULL,
  `User_password` varchar(256) NOT NULL,
  `User_status_id` int(11) NOT NULL,
  `Role_id` int(11) NOT NULL,
  PRIMARY KEY (`User_id`),
  KEY `user_status_user` (`User_status_id`),
  KEY `user_status_role` (`Role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `user`
--

TRUNCATE TABLE `user`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_status`
--

DROP TABLE IF EXISTS `user_status`;
CREATE TABLE IF NOT EXISTS `user_status` (
  `User_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_status_name` varchar(20) NOT NULL,
  `User_status_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`User_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `user_status`
--

TRUNCATE TABLE `user_status`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vote`
--

DROP TABLE IF EXISTS `vote`;
CREATE TABLE IF NOT EXISTS `vote` (
  `Vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `Vote_code` varchar(10) NOT NULL,
  `Vote_date` date NOT NULL DEFAULT current_timestamp(),
  `Elections_id` int(11) NOT NULL,
  `Candidate_id` int(11) NOT NULL,
  `Student_id` int(11) NOT NULL,
  PRIMARY KEY (`Vote_id`),
  KEY `vote_student` (`Student_id`),
  KEY `vote_elections` (`Elections_id`),
  KEY `vote_candidate` (`Candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `vote`
--

TRUNCATE TABLE `vote`;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `candidate`
--
ALTER TABLE `candidate`
  ADD CONSTRAINT `candidate_student` FOREIGN KEY (`Student_id`) REFERENCES `student` (`Student_id`);

--
-- Filtros para la tabla `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_course` FOREIGN KEY (`Course_id`) REFERENCES `course` (`Course_id`),
  ADD CONSTRAINT `student_document_type` FOREIGN KEY (`Document_type_id`) REFERENCES `document_type` (`Document_type_id`),
  ADD CONSTRAINT `student_role` FOREIGN KEY (`Role_id`) REFERENCES `role` (`Role_id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_status_role` FOREIGN KEY (`Role_id`) REFERENCES `role` (`Role_id`),
  ADD CONSTRAINT `user_status_user` FOREIGN KEY (`User_status_id`) REFERENCES `user_status` (`User_status_id`);

--
-- Filtros para la tabla `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `vote_candidate` FOREIGN KEY (`Candidate_id`) REFERENCES `candidate` (`Candidate_id`),
  ADD CONSTRAINT `vote_elections` FOREIGN KEY (`Elections_id`) REFERENCES `elections` (`Elections_id`),
  ADD CONSTRAINT `vote_student` FOREIGN KEY (`Student_id`) REFERENCES `student` (`Student_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

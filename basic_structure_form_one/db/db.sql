-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-07-2023 a las 23:55:47
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_project`
--
CREATE DATABASE IF NOT EXISTS `db_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_project`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documenttype_id`
--

DROP TABLE IF EXISTS `documenttype_id`;
CREATE TABLE IF NOT EXISTS `documenttype_id` (
  `DocumentType_id` int(11) NOT NULL AUTO_INCREMENT,
  `DocumentType_name` varchar(60) NOT NULL,
  `DocumentType_descriptions` varchar(80) NOT NULL,
  PRIMARY KEY (`DocumentType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gendertype`
--

DROP TABLE IF EXISTS `gendertype`;
CREATE TABLE IF NOT EXISTS `gendertype` (
  `GenderType_id` int(11) NOT NULL AUTO_INCREMENT,
  `GenderType_name` varchar(60) NOT NULL,
  `GenderType_descriptions` varchar(80) NOT NULL,
  PRIMARY KEY (`GenderType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `Profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `Profile_name` varchar(60) NOT NULL,
  `Profile_email` varchar(80) NOT NULL,
  `Profile_photo` varchar(120) NOT NULL,
  `Profile_cellphone` int(11) NOT NULL,
  `Profile_document` varchar(20) NOT NULL,
  `DocumentType_id` int(11) NOT NULL,
  `GenderType_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Profile_birthdate` date NOT NULL,
  PRIMARY KEY (`Profile_id`),
  KEY `profile_document_type` (`DocumentType_id`),
  KEY `profile_gender_type` (`GenderType_id`),
  KEY `profile_user` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `Status_id` int(11) NOT NULL AUTO_INCREMENT,
  `Status_name` varchar(60) NOT NULL,
  `Status_descriptions` varchar(80) NOT NULL,
  PRIMARY KEY (`Status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`Status_id`, `Status_name`, `Status_descriptions`) VALUES
(1, 'Active', 'Is Active Status '),
(2, 'Bloqueado', 'Esto es un estado bloqueado'),
(3, 'Cancelado', 'Esto es un estado cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_name` varchar(60) NOT NULL,
  `User_password` varchar(80) NOT NULL,
  `Status_id` int(11) NOT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `User_name` (`User_name`),
  KEY `user_status` (`Status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`User_id`, `User_name`, `User_password`, `Status_id`) VALUES
(1, 'dieher@gmail.com', '123456', 1),
(5, 'nombre@gmail.com', '121212121', 1),
(7, 'otro@gmail.com', '32115254574', 1),
(8, 'otro112@gmail.com', '232323', 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_document_type` FOREIGN KEY (`DocumentType_id`) REFERENCES `documenttype_id` (`DocumentType_id`),
  ADD CONSTRAINT `profile_gender_type` FOREIGN KEY (`GenderType_id`) REFERENCES `gendertype` (`GenderType_id`),
  ADD CONSTRAINT `profile_user` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_status` FOREIGN KEY (`Status_id`) REFERENCES `status` (`Status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

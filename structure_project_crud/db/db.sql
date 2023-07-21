-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2023 a las 23:59:30
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

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_select_all_client`$$
CREATE PROCEDURE `sp_select_all_client` ()   BEGIN
SELECT  Client_id,Client_name,Client_identification,Client_email,Client_phone,Client_address,DT.DocumentType_id,ST.Status_id,ST.Status_name, DT.DocumentType_name FROM client CLI
INNER JOIN status ST ON CLI.Status_id=ST.Status_id
INNER JOIN document_type DT ON CLI.DocumentType_id=DT.DocumentType_id;
END$$

DROP PROCEDURE IF EXISTS `sp_select_all_user`$$
CREATE PROCEDURE `sp_select_all_user` ()   BEGIN
SELECT User_id,User_name,User_lastName,DT.DocumentType_name,User_document,User_email,User_cellphone,User_password,GT.GenderType_name,User_birthdate,ST.Status_name FROM user US 
INNER JOIN status ST ON US.Status_id=ST.Status_id
INNER JOIN gendertype GT ON US.GenderType_id=GT.GenderType_id
INNER JOIN document_type DT ON US.DocumentType_id=DT.DocumentType_id;
END$$

DROP PROCEDURE IF EXISTS `sp_select_client_id`$$
CREATE PROCEDURE `sp_select_client_id` (IN `clientId` INT)   BEGIN
SELECT * FROM client WHERE Client_id=clientId;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_id`$$
CREATE PROCEDURE `sp_select_user_id` (IN `userId` INT)   BEGIN
SELECT User_id,User_name,User_lastName,DT.DocumentType_name,User_document,User_email,User_cellphone,User_password,GT.GenderType_name,User_birthdate,ST.Status_name,DT.DocumentType_id,GT.GenderType_id,ST.Status_id,User_user FROM user US 
INNER JOIN status ST ON US.Status_id=ST.Status_id
INNER JOIN gendertype GT ON US.GenderType_id=GT.GenderType_id
INNER JOIN document_type DT ON US.DocumentType_id=DT.DocumentType_id
WHERE User_id=userId;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `Client_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Client_name` varchar(100) NOT NULL,
  `Client_identification` varchar(20) NOT NULL,
  `Client_email` varchar(100) NOT NULL,
  `Client_phone` varchar(10) NOT NULL,
  `Client_address` varchar(100) NOT NULL,
  `DocumentType_id` int(10) NOT NULL,
  `Comp_id` int(10) NOT NULL,
  `Status_id` int(10) NOT NULL,
  `Country_id` int(10) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`Client_id`),
  UNIQUE KEY `Client_identification` (`Client_identification`),
  UNIQUE KEY `Client_email` (`Client_email`),
  KEY `client_document_type` (`DocumentType_id`),
  KEY `client_status` (`Status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `client`
--

TRUNCATE TABLE `client`;
--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`Client_id`, `Client_name`, `Client_identification`, `Client_email`, `Client_phone`, `Client_address`, `DocumentType_id`, `Comp_id`, `Status_id`, `Country_id`, `updated_at`, `created_at`) VALUES
(21, 'Sinapsis ', '901261786', 'info@sinapsist.com.co', '2504567', 'Calle falsa 1234', 3, 0, 2, 0, NULL, '2023-07-21 16:47:34'),
(22, 'Empresa ', '12345678', 'empresa@gmail.com', '12345678', 'callle ', 2, 0, 3, 0, NULL, '2023-07-21 16:50:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_type`
--

DROP TABLE IF EXISTS `document_type`;
CREATE TABLE IF NOT EXISTS `document_type` (
  `DocumentType_id` int(11) NOT NULL AUTO_INCREMENT,
  `DocumentType_name` varchar(60) NOT NULL,
  `DocumentType_descriptions` varchar(80) NOT NULL,
  PRIMARY KEY (`DocumentType_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `document_type`
--

TRUNCATE TABLE `document_type`;
--
-- Volcado de datos para la tabla `document_type`
--

INSERT INTO `document_type` (`DocumentType_id`, `DocumentType_name`, `DocumentType_descriptions`) VALUES
(1, 'CC', 'Cedula'),
(2, 'TI', 'Tarjeta de Identidad '),
(3, 'RC', 'REGISTRO CIVIL'),
(4, 'CE', 'CÉDULA DE EXTRANJERIA');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `gendertype`
--

TRUNCATE TABLE `gendertype`;
--
-- Volcado de datos para la tabla `gendertype`
--

INSERT INTO `gendertype` (`GenderType_id`, `GenderType_name`, `GenderType_descriptions`) VALUES
(1, 'M', 'Masculino'),
(2, 'F', 'Femenino');

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
  PRIMARY KEY (`Profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `profile`
--

TRUNCATE TABLE `profile`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `status`
--

TRUNCATE TABLE `status`;
--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`Status_id`, `Status_name`, `Status_descriptions`) VALUES
(1, 'Active', 'Is Active Status '),
(2, 'Locked', 'Is Locked Status'),
(3, 'Idle', 'Is Idle Status'),
(4, 'Cancelled', 'Is Cancelled Status');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_name` varchar(60) NOT NULL,
  `User_document` varchar(20) NOT NULL,
  `User_email` varchar(100) NOT NULL,
  `User_cellphone` varchar(20) NOT NULL,
  `User_lastName` varchar(60) NOT NULL,
  `User_password` varchar(80) NOT NULL,
  `User_user` varchar(60) NOT NULL,
  `User_birthdate` date NOT NULL DEFAULT current_timestamp(),
  `Status_id` int(11) NOT NULL,
  `DocumentType_id` int(11) NOT NULL,
  `GenderType_id` int(11) NOT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `User_email` (`User_email`),
  KEY `user_document_type` (`DocumentType_id`),
  KEY `user_gender_type` (`GenderType_id`),
  KEY `user_status_type` (`Status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `user`
--

TRUNCATE TABLE `user`;
--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`User_id`, `User_name`, `User_document`, `User_email`, `User_cellphone`, `User_lastName`, `User_password`, `User_user`, `User_birthdate`, `Status_id`, `DocumentType_id`, `GenderType_id`) VALUES
(4, 'juan felipe ', '100472605', 'felipe@gmail.com', '3012528242', 'casallas ', '$2y$10$xIgQXNRHgHd/5A7/kpbX8uUpVMyfdaKDatjSgYcUorESu9fMWrlUa', 'felipe@gmail.com', '2023-07-20', 2, 1, 1),
(6, 'JUAN DIEGO', '1003158260', 'JUANDIEGO@GMAIL.COM', '301252485', 'PERREZ', '$2y$10$HvxC3hxiPuYL0JHQroe4Zu8MkgIkDYYCAt7YWvoMUAvy9R8jljYtm', 'JUANDIEGO@GMAIL.COM', '2000-07-21', 2, 2, 2),
(8, 'DIego', '80857854', 'diegohernando@gmail.com', '3002541785', 'casallas', '$2y$10$wd3yR7eXY4Us0/kNwxziteq6zEnrMZZL3lXzpu4.nWjNuL3ZSPv.G', 'diegohernando@gmail.com', '1986-02-02', 2, 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_document_type` FOREIGN KEY (`DocumentType_id`) REFERENCES `document_type` (`DocumentType_id`),
  ADD CONSTRAINT `client_status` FOREIGN KEY (`Status_id`) REFERENCES `status` (`Status_id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_document_type` FOREIGN KEY (`DocumentType_id`) REFERENCES `document_type` (`DocumentType_id`),
  ADD CONSTRAINT `user_gender_type` FOREIGN KEY (`GenderType_id`) REFERENCES `gendertype` (`GenderType_id`),
  ADD CONSTRAINT `user_status_type` FOREIGN KEY (`Status_id`) REFERENCES `status` (`Status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

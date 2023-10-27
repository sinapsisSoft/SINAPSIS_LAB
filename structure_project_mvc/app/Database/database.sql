-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-10-2023 a las 11:35:37
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
-- Base de datos: `my_project`
--
CREATE DATABASE IF NOT EXISTS `my_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `my_project`;

--
-- Estructura de tabla para la tabla `document_type`
--

DROP TABLE IF EXISTS `document_type`;
CREATE TABLE IF NOT EXISTS `document_type` (
  `document_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_name` varchar(30) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`document_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `document_type`
--

TRUNCATE TABLE `document_type`;
--
-- Volcado de datos para la tabla `document_type`
--

INSERT INTO `document_type` (`document_type_id`, `document_type_name`, `updated_at`, `create_at`) VALUES
(1, 'CC - Cédula ', NULL, '2023-10-23 03:40:33'),
(2, 'TI - Tarjeta de Identidad', NULL, '2023-10-23 03:40:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(20) NOT NULL,
  `module_route` varchar(80) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_name` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `module`
--

TRUNCATE TABLE `module`;
--
-- Volcado de datos para la tabla `module`
--

INSERT INTO `module` (`module_id`, `module_name`, `module_route`, `updated_at`, `create_at`) VALUES
(1, 'home', 'home/show', NULL, '2023-10-19 15:15:39'),
(2, 'user', 'user/show', NULL, '2023-10-19 15:15:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(30) NOT NULL,
  `profile_document` varchar(15) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `profile_phone` varchar(11) NOT NULL,
  `profile_photo` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `profile_document` (`profile_document`),
  KEY `USER_PROFILE_FK` (`user_id`),
  KEY `DOCUMENT_TYPE_PROFILE_FK` (`document_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `profile`
--

TRUNCATE TABLE `profile`;
--
-- Volcado de datos para la tabla `profile`
--

INSERT INTO `profile` (`profile_id`, `profile_name`, `profile_document`, `document_type_id`, `profile_phone`, `profile_photo`, `user_id`, `updated_at`, `create_at`) VALUES
(1, 'Diego', '1000100100', 1, '3001234567', '', 5, NULL, '2023-10-23 03:44:07'),
(2, 'Juan', '1000100101', 2, '3001234567', '', 1, NULL, '2023-10-23 04:46:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `role`
--

TRUNCATE TABLE `role`;
--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `updated_at`, `create_at`) VALUES
(1, 'Administrador', NULL, '2023-10-19 10:02:55'),
(2, 'Cliente', NULL, '2023-10-19 10:02:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_module`
--

DROP TABLE IF EXISTS `role_module`;
CREATE TABLE IF NOT EXISTS `role_module` (
  `role_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`role_module_id`),
  KEY `role_module_role_fk` (`role_id`),
  KEY `role_module_module_fk` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `role_module`
--

TRUNCATE TABLE `role_module`;
--
-- Volcado de datos para la tabla `role_module`
--

INSERT INTO `role_module` (`role_module_id`, `role_id`, `module_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_user` varchar(30) NOT NULL,
  `user_password` varchar(256) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `role_id` int(11) NOT NULL,
  `user_status_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_user` (`user_user`),
  KEY `User_Role_FK` (`role_id`),
  KEY `User_User_Status_FK` (`user_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `user`
--

TRUNCATE TABLE `user`;
--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user_id`, `user_user`, `user_password`, `updated_at`, `create_at`, `role_id`, `user_status_id`) VALUES
(1, 'diego@gmail.com', '$2y$10$DEiOTP8WTMO0abrZRIHbHex8ByB2I97RfrVysetY5yQcm2J1v2oum', '2023-10-24 01:13:39', '2023-10-19 10:09:35', 1, 1),
(3, 'camila@gmail.com', '$2y$10$Ve1nXQSfzsS9i7/dj3hlAusJ/q0/BMpevWl.i4G7v9RVPxtAeVvPe', '2023-10-24 00:55:48', '2023-10-20 10:49:15', 2, 1),
(4, 'diegoh@gmail.com', '$2y$10$DEiOTP8WTMO0abrZRIHbHex8ByB2I97RfrVysetY5yQcm2J1v2oum', NULL, '2023-10-21 07:12:45', 1, 1),
(5, 'diehercasvan@gmail.com', '$2y$10$BUIkiff3RmHX/TW8k84Eb.YhgAmeYyCicH5yGz3B8tl.02li/DsJG', '2023-10-24 00:56:01', '2023-10-21 08:40:00', 2, 1),
(6, 'info@sinapsist.com.co', '$2y$10$9W1LFEJZdExD7oHjog/t0uq4d.oOXyvV5ffYXBKQNBf99gdF1eMwG', NULL, '2023-10-21 08:42:21', 1, 1),
(7, 'info2@sinapsist.com.co', '$2y$10$emg4HQk3c1TPOyg8RJqLbeUUUAkJFrZZqAAXeXY6tnCH.0HDzZsyu', NULL, '2023-10-22 07:47:43', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_status`
--

DROP TABLE IF EXISTS `user_status`;
CREATE TABLE IF NOT EXISTS `user_status` (
  `user_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_status_name` varchar(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`user_status_id`),
  UNIQUE KEY `user_status_name` (`user_status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `user_status`
--

TRUNCATE TABLE `user_status`;
--
-- Volcado de datos para la tabla `user_status`
--

INSERT INTO `user_status` (`user_status_id`, `user_status_name`, `updated_at`, `create_at`) VALUES
(1, 'Activo', NULL, '2023-10-19 10:03:17'),
(2, 'Inactivo', NULL, '2023-10-19 10:03:17'),
(3, 'Bloqueado', NULL, '2023-10-23 03:46:39'),
(4, 'Eliminado', NULL, '2023-10-24 01:13:58');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `DOCUMENT_TYPE_PROFILE_FK` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`document_type_id`),
  ADD CONSTRAINT `USER_PROFILE_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Filtros para la tabla `role_module`
--
ALTER TABLE `role_module`
  ADD CONSTRAINT `ROLE_MODULE_MODULE_FK` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`),
  ADD CONSTRAINT `ROLE_MODULE_ROLE_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `User_Role_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  ADD CONSTRAINT `User_User_Status_FK` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`user_status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

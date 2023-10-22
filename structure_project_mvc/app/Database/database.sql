-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2023 a las 14:06:08
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
-- Estructura de tabla para la tabla `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(20) NOT NULL,
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

INSERT INTO `module` (`module_id`, `module_name`, `updated_at`, `create_at`) VALUES
(1, 'home', NULL, '2023-10-19 15:15:39'),
(2, 'user', NULL, '2023-10-19 15:15:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `role_module`
--

TRUNCATE TABLE `role_module`;
--
-- Volcado de datos para la tabla `role_module`
--

INSERT INTO `role_module` (`role_module_id`, `role_id`, `module_id`) VALUES
(1, 1, 1),
(2, 1, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `user`
--

TRUNCATE TABLE `user`;
--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user_id`, `user_user`, `user_password`, `updated_at`, `create_at`, `role_id`, `user_status_id`) VALUES
(1, 'diego@gmail.com', '$2y$10$DEiOTP8WTMO0abrZRIHbHex8ByB2I97RfrVysetY5yQcm2J1v2oum', NULL, '2023-10-19 10:09:35', 1, 1),
(3, 'camila@gmail.com', '$2y$10$Ve1nXQSfzsS9i7/dj3hlAusJ/q0/BMpevWl.i4G7v9RVPxtAeVvPe', NULL, '2023-10-20 10:49:15', 2, 1),
(4, 'diegoh@gmail.com', '$2y$10$DEiOTP8WTMO0abrZRIHbHex8ByB2I97RfrVysetY5yQcm2J1v2oum', NULL, '2023-10-21 07:12:45', 1, 1),
(5, 'diehercasvan@gmail.com', '$2y$10$BUIkiff3RmHX/TW8k84Eb.YhgAmeYyCicH5yGz3B8tl.02li/DsJG', NULL, '2023-10-21 08:40:00', 2, 2),
(6, 'info@sinapsist.com.co', '$2y$10$9W1LFEJZdExD7oHjog/t0uq4d.oOXyvV5ffYXBKQNBf99gdF1eMwG', NULL, '2023-10-21 08:42:21', 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `user_status`
--

TRUNCATE TABLE `user_status`;
--
-- Volcado de datos para la tabla `user_status`
--

INSERT INTO `user_status` (`user_status_id`, `user_status_name`, `updated_at`, `create_at`) VALUES
(1, 'Activo', NULL, '2023-10-19 10:03:17'),
(2, 'Inactivo', NULL, '2023-10-19 10:03:17');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `role_module`
--
ALTER TABLE `role_module`
  ADD CONSTRAINT `role_module_module_fk` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`),
  ADD CONSTRAINT `role_module_role_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

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

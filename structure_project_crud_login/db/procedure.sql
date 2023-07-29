-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-07-2023 a las 00:44:35
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

DELIMITER $$
--
-- Procedimientos
--
CREATE PROCEDURE `sp_select_all_client` ()   BEGIN
SELECT  Client_id,Client_name,Client_identification,Client_email,Client_phone,Client_address,DT.DocumentType_id,ST.Status_id,ST.Status_name, DT.DocumentType_name FROM client CLI
INNER JOIN status ST ON CLI.Status_id=ST.Status_id
INNER JOIN document_type DT ON CLI.DocumentType_id=DT.DocumentType_id;
END$$

CREATE PROCEDURE `sp_select_all_products` ()   BEGIN
SELECT product_id,product_name,product_descriptions,product_code,product_value,product_img,ST.Status_name,TPRO.TypeProduct_name 
FROM product PRO 
INNER JOIN status ST ON PRO.Status_id=ST.Status_id
INNER JOIN typeproduct TPRO ON PRO.TypeProduct_id=TPRO.TypeProduct_id
WHERE ST.Status_id=1;
END$$

CREATE PROCEDURE `sp_select_all_user` ()   BEGIN
SELECT User_id,User_name,User_lastName,DT.DocumentType_name,User_document,User_email,User_cellphone,SUBSTRING(User_password, 1, 5) AS User_password ,GT.GenderType_name,User_birthdate,ST.Status_name FROM user US 
INNER JOIN status ST ON US.Status_id=ST.Status_id
INNER JOIN gendertype GT ON US.GenderType_id=GT.GenderType_id
INNER JOIN document_type DT ON US.DocumentType_id=DT.DocumentType_id;
END$$

CREATE PROCEDURE `sp_select_client_id` (IN `clientId` INT)   BEGIN
SELECT * FROM client WHERE Client_id=clientId;
END$$

CREATE PROCEDURE `sp_select_user_email` (IN `userEmail` VARCHAR(100))   BEGIN
SELECT User_password,User_id FROM USER WHERE User_email=userEmail AND Status_id=1;END$$

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
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `name_city` varchar(80) NOT NULL,
  `department_id` int(11) NOT NULL,
  `is_capital` tinyint(1) NOT NULL DEFAULT 0,
  `code_city` int(11) NOT NULL,
  PRIMARY KEY (`id_city`),
  KEY `city_department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1105 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id_city`, `name_city`, `department_id`, `is_capital`, `code_city`) VALUES
(1, 'Leticia', 1, 1, 91001),
(2, 'El Encanto', 1, 0, 91263),
(3, 'La Chorrera', 1, 0, 91405),
(4, 'La Pedrera', 1, 0, 91407),
(5, 'Puerto Arica', 1, 0, 91536),
(6, 'Puerto Santander', 1, 0, 91669),
(7, 'Tarapacá', 1, 0, 91798),
(8, 'La Victoria', 1, 0, 15401),
(9, 'Miriti Paraná', 1, 0, 9146),
(10, 'Puerto Alegría', 1, 0, 9153),
(11, 'Puerto Nariño', 1, 0, 9154),
(12, 'Medellín', 2, 1, 5001),
(13, 'Abejorral', 2, 0, 5002),
(14, 'Abriaquí', 2, 0, 5004),
(15, 'Alejandría', 2, 0, 5021),
(16, 'Amalfi', 2, 0, 5031),
(17, 'Andes', 2, 0, 5034),
(18, 'Angelópolis', 2, 0, 5036),
(19, 'Angostura', 2, 0, 5038),
(20, 'Santafé de Antioquia', 2, 0, 5042),
(21, 'Anza', 2, 0, 5044),
(22, 'Apartadó', 2, 0, 5045),
(23, 'Arboletes', 2, 0, 5051),
(24, 'Argelia', 2, 0, 5055),
(25, 'Armenia', 2, 0, 5059),
(26, 'Barbosa', 2, 0, 5079),
(27, 'Belmira', 2, 0, 5086),
(28, 'Bello', 2, 0, 5088),
(29, 'Betania', 2, 0, 5091),
(30, 'Betulia', 2, 0, 5093),
(31, 'Ciudad Bolívar', 2, 0, 5101),
(32, 'Briceño', 2, 0, 5107),
(33, 'Buriticá', 2, 0, 5113),
(34, 'Caicedo', 2, 0, 5125),
(35, 'Caldas', 2, 0, 5129),
(36, 'Campamento', 2, 0, 5134),
(37, 'Cañasgordas', 2, 0, 5138),
(38, 'Caracolí', 2, 0, 5142),
(39, 'Caramanta', 2, 0, 5145),
(40, 'Carepa', 2, 0, 5147),
(41, 'El Carmen de Viboral', 2, 0, 5148),
(42, 'Caucasia', 2, 0, 5154),
(43, 'Chigorodó', 2, 0, 5172),
(44, 'Cocorná', 2, 0, 5197),
(45, 'Concepción', 2, 0, 5206),
(46, 'Concordia', 2, 0, 5209),
(47, 'Copacabana', 2, 0, 5212),
(48, 'Dabeiba', 2, 0, 5234),
(49, 'Don Matías', 2, 0, 5237),
(50, 'Entrerrios', 2, 0, 5264),
(51, 'Envigado', 2, 0, 5266),
(52, 'Fredonia', 2, 0, 5282),
(53, 'Frontino', 2, 0, 5284),
(54, 'Giraldo', 2, 0, 5306),
(55, 'Girardota', 2, 0, 5308),
(56, 'Granada', 2, 0, 25312),
(57, 'Guadalupe', 2, 0, 5315),
(58, 'Guarne', 2, 0, 5318),
(59, 'Guatapé', 2, 0, 5321),
(60, 'Heliconia', 2, 0, 5347),
(61, 'Hispania', 2, 0, 5353),
(62, 'Ituango', 2, 0, 5361),
(63, 'Jardín', 2, 0, 5364),
(64, 'Jericó', 2, 0, 5368),
(65, 'La Ceja', 2, 0, 5376),
(66, 'Liborina', 2, 0, 5411),
(67, 'Maceo', 2, 0, 5425),
(68, 'Montebello', 2, 0, 5467),
(69, 'Murindó', 2, 0, 5475),
(70, 'Nariño', 2, 0, 5483),
(71, 'Nechí', 2, 0, 5495),
(72, 'Olaya', 2, 0, 5501),
(73, 'Peñol', 2, 0, 5541),
(74, 'Peque', 2, 0, 5543),
(75, 'Pueblorrico', 2, 0, 5576),
(76, 'Puerto Berrío', 2, 0, 5579),
(77, 'Puerto Nare', 2, 0, 5585),
(78, 'Puerto Triunfo', 2, 0, 5591),
(79, 'Remedios', 2, 0, 5604),
(80, 'Retiro', 2, 0, 5607),
(81, 'Rionegro', 2, 0, 5615),
(82, 'Sabanalarga', 2, 0, 5628),
(83, 'Sabaneta', 2, 0, 5631),
(84, 'Salgar', 2, 0, 5642),
(85, 'San Andrés de Cuerquía', 2, 0, 5647),
(86, 'San Carlos', 2, 0, 23678),
(87, 'San Francisco', 2, 0, 5652),
(88, 'San Jerónimo', 2, 0, 5656),
(89, 'San José de La Montaña', 2, 0, 5658),
(90, 'San Juan de Urabá', 2, 0, 5659),
(91, 'San Pedro', 2, 0, 5664),
(92, 'San Pedro de Uraba', 2, 0, 5665),
(93, 'San Rafael', 2, 0, 5667),
(94, 'San Vicente', 2, 0, 5674),
(95, 'Santa Bárbara', 2, 0, 5679),
(96, 'Santa Rosa de Osos', 2, 0, 5686),
(97, 'El Santuario', 2, 0, 5697),
(98, 'Segovia', 2, 0, 5736),
(99, 'Sonsón', 2, 0, 5756),
(100, 'Sopetrán', 2, 0, 5761),
(101, 'Támesis', 2, 0, 5789),
(102, 'Tarso', 2, 0, 5792),
(103, 'Titiribí', 2, 0, 5809),
(104, 'Toledo', 2, 0, 5819),
(105, 'Turbo', 2, 0, 5837),
(106, 'Uramita', 2, 0, 5842),
(107, 'Urrao', 2, 0, 5847),
(108, 'Valdivia', 2, 0, 5854),
(109, 'Valparaíso', 2, 0, 5856),
(110, 'Vegachí', 2, 0, 5858),
(111, 'Venecia', 2, 0, 5861),
(112, 'Vigía del Fuerte', 2, 0, 5873),
(113, 'Yalí', 2, 0, 5885),
(114, 'Yarumal', 2, 0, 5887),
(115, 'Yondó', 2, 0, 5893),
(116, 'Zaragoza', 2, 0, 5895),
(117, 'Amagá', 2, 0, 503),
(118, 'Anorí', 2, 0, 504),
(119, 'La Unión', 2, 0, 54),
(120, 'Cáceres', 2, 0, 512),
(121, 'Carolina', 2, 0, 515),
(122, 'Cisneros', 2, 0, 519),
(123, 'Ebéjico', 2, 0, 524),
(124, 'El Bagre', 2, 0, 525),
(125, 'Gómez Plata', 2, 0, 531),
(126, 'Itagui', 2, 0, 536),
(127, 'La Estrella', 2, 0, 538),
(128, 'La Pintada', 2, 0, 539),
(129, 'Marinilla', 2, 0, 544),
(130, 'Mutatá', 2, 0, 548),
(131, 'Necoclí', 2, 0, 549),
(132, 'San Luis', 2, 0, 566),
(133, 'San Roque', 2, 0, 567),
(134, 'Santo Domingo', 2, 0, 569),
(135, 'Tarazá', 2, 0, 579),
(136, 'Yolombó', 2, 0, 589),
(137, 'San Andrés', 4, 1, 68669),
(138, 'Providencia', 4, 0, 52565),
(139, 'Barranquilla', 5, 1, 8001),
(140, 'Baranoa', 5, 0, 8078),
(141, 'Campo de La Cruz', 5, 0, 8137),
(142, 'Candelaria', 5, 0, 8141),
(143, 'Galapa', 5, 0, 8296),
(144, 'Juan de Acosta', 5, 0, 8372),
(145, 'Luruaco', 5, 0, 8421),
(146, 'Malambo', 5, 0, 8433),
(147, 'Manatí', 5, 0, 8436),
(148, 'Piojó', 5, 0, 8549),
(149, 'Polonuevo', 5, 0, 8558),
(150, 'Puerto Colombia', 5, 0, 94884),
(151, 'Repelón', 5, 0, 8606),
(152, 'Sabanagrande', 5, 0, 8634),
(153, 'Sabanalarga', 5, 0, 5628),
(154, 'Santa Lucía', 5, 0, 8675),
(155, 'Santo Tomás', 5, 0, 8685),
(156, 'Soledad', 5, 0, 8758),
(157, 'Tubará', 5, 0, 8832),
(158, 'Usiacurí', 5, 0, 8849),
(159, 'Palmar de Varela', 5, 0, 852),
(160, 'Ponedera', 5, 0, 856),
(161, 'Suan', 5, 0, 877),
(162, 'Bogotá D.C.', 6, 1, 11001),
(163, 'Cartagena', 7, 1, 13001),
(164, 'Achí', 7, 0, 13006),
(165, 'Arenal', 7, 0, 13042),
(166, 'Arjona', 7, 0, 13052),
(167, 'Arroyohondo', 7, 0, 13062),
(168, 'Barranco de Loba', 7, 0, 13074),
(169, 'Cicuco', 7, 0, 13188),
(170, 'Córdoba', 7, 0, 13212),
(171, 'Clemencia', 7, 0, 13222),
(172, 'El Carmen de Bolívar', 7, 0, 13244),
(173, 'El Guamo', 7, 0, 13248),
(174, 'El Peñón', 7, 0, 13268),
(175, 'Mahates', 7, 0, 13433),
(176, 'María la Baja', 7, 0, 13442),
(177, 'Montecristo', 7, 0, 13458),
(178, 'Mompós', 7, 0, 13468),
(179, 'Morales', 7, 0, 13473),
(180, 'Pinillos', 7, 0, 13549),
(181, 'San Estanislao', 7, 0, 13647),
(182, 'San Jacinto', 7, 0, 13654),
(183, 'San Jacinto del Cauca', 7, 0, 13655),
(184, 'San Juan Nepomuceno', 7, 0, 13657),
(185, 'San Martín de Loba', 7, 0, 13667),
(186, 'Santa Catalina', 7, 0, 13673),
(187, 'Santa Rosa', 7, 0, 13683),
(188, 'Santa Rosa del Sur', 7, 0, 13688),
(189, 'Simití', 7, 0, 13744),
(190, 'Turbaco', 7, 0, 13836),
(191, 'Turbaná', 7, 0, 13838),
(192, 'Villanueva', 7, 0, 13873),
(193, 'Zambrano', 7, 0, 13894),
(194, 'Hatillo de Loba', 7, 0, 133),
(195, 'Altos del Rosario', 7, 0, 1303),
(196, 'Río Viejo', 7, 0, 136),
(197, 'Calamar', 7, 0, 1314),
(198, 'Cantagallo', 7, 0, 1316),
(199, 'Magangué', 7, 0, 1343),
(200, 'Margarita', 7, 0, 1344),
(201, 'Norosí', 7, 0, 1349),
(202, 'Regidor', 7, 0, 1358),
(203, 'San Cristóbal', 7, 0, 1362),
(204, 'San Fernando', 7, 0, 1365),
(205, 'San Pablo de Borbur', 7, 0, 15681),
(206, 'Soplaviento', 7, 0, 1376),
(207, 'Talaigua Nuevo', 7, 0, 1378),
(208, 'Tiquisio', 7, 0, 1381),
(209, 'Tunja', 8, 1, 15001),
(210, 'Almeida', 8, 0, 15022),
(211, 'Aquitania', 8, 0, 15047),
(212, 'Arcabuco', 8, 0, 15051),
(213, 'Belén', 8, 0, 52083),
(214, 'Betéitiva', 8, 0, 15092),
(215, 'Boavita', 8, 0, 15097),
(216, 'Boyacá', 8, 0, 15104),
(217, 'Briceño', 8, 0, 5107),
(218, 'Buena Vista', 8, 0, 15109),
(219, 'Busbanzá', 8, 0, 15114),
(220, 'Caldas', 8, 0, 5129),
(221, 'Campohermoso', 8, 0, 15135),
(222, 'Cerinza', 8, 0, 15162),
(223, 'Chinavita', 8, 0, 15172),
(224, 'Chiquinquirá', 8, 0, 15176),
(225, 'Chita', 8, 0, 15183),
(226, 'Chitaraque', 8, 0, 15185),
(227, 'Chivatá', 8, 0, 15187),
(228, 'Ciénega', 8, 0, 15189),
(229, 'Cómbita', 8, 0, 15204),
(230, 'Coper', 8, 0, 15212),
(231, 'Corrales', 8, 0, 15215),
(232, 'Covarachía', 8, 0, 15218),
(233, 'Cubará', 8, 0, 15223),
(234, 'Cucaita', 8, 0, 15224),
(235, 'Cuítiva', 8, 0, 15226),
(236, 'Chíquiza', 8, 0, 15232),
(237, 'Chivor', 8, 0, 15236),
(238, 'Duitama', 8, 0, 15238),
(239, 'El Cocuy', 8, 0, 15244),
(240, 'El Espino', 8, 0, 15248),
(241, 'Firavitoba', 8, 0, 15272),
(242, 'Floresta', 8, 0, 15276),
(243, 'Gachantivá', 8, 0, 15293),
(244, 'Gameza', 8, 0, 15296),
(245, 'Garagoa', 8, 0, 15299),
(246, 'Guacamayas', 8, 0, 15317),
(247, 'Guateque', 8, 0, 15322),
(248, 'Guayatá', 8, 0, 15325),
(249, 'Güicán', 8, 0, 15332),
(250, 'Iza', 8, 0, 15362),
(251, 'Jenesano', 8, 0, 15367),
(252, 'Jericó', 8, 0, 5368),
(253, 'Labranzagrande', 8, 0, 15377),
(254, 'La Victoria', 8, 0, 15401),
(255, 'La Uvita', 8, 0, 15403),
(256, 'Villa de Leyva', 8, 0, 15407),
(257, 'Macanal', 8, 0, 15425),
(258, 'Maripí', 8, 0, 15442),
(259, 'Miraflores', 8, 0, 15455),
(260, 'Mongua', 8, 0, 15464),
(261, 'Monguí', 8, 0, 15466),
(262, 'Moniquirá', 8, 0, 15469),
(263, 'Motavita', 8, 0, 15476),
(264, 'Nobsa', 8, 0, 15491),
(265, 'Nuevo Colón', 8, 0, 15494),
(266, 'Otanche', 8, 0, 15507),
(267, 'Pachavita', 8, 0, 15511),
(268, 'Páez', 8, 0, 15514),
(269, 'Paipa', 8, 0, 15516),
(270, 'Pajarito', 8, 0, 15518),
(271, 'Panqueba', 8, 0, 15522),
(272, 'Pauna', 8, 0, 15531),
(273, 'Paya', 8, 0, 15533),
(274, 'Paz de Río', 8, 0, 15537),
(275, 'Pesca', 8, 0, 15542),
(276, 'Puerto Boyacá', 8, 0, 15572),
(277, 'Ramiriquí', 8, 0, 15599),
(278, 'Rondón', 8, 0, 15621),
(279, 'Saboyá', 8, 0, 15632),
(280, 'Sáchica', 8, 0, 15638),
(281, 'Samacá', 8, 0, 15646),
(282, 'San José de Pare', 8, 0, 15664),
(283, 'San Luis de Gaceno', 8, 0, 85325),
(284, 'San Mateo', 8, 0, 15673),
(285, 'San Miguel de Sema', 8, 0, 15676),
(286, 'San Pablo de Borbur', 8, 0, 15681),
(287, 'Santana', 8, 0, 15686),
(288, 'Santa Rosa de Viterbo', 8, 0, 15693),
(289, 'Santa Sofía', 8, 0, 15696),
(290, 'Sativasur', 8, 0, 15723),
(291, 'Soatá', 8, 0, 15753),
(292, 'Socotá', 8, 0, 15755),
(293, 'Socha', 8, 0, 15757),
(294, 'Sogamoso', 8, 0, 15759),
(295, 'Somondoco', 8, 0, 15761),
(296, 'Sora', 8, 0, 15762),
(297, 'Sotaquirá', 8, 0, 15763),
(298, 'Soracá', 8, 0, 15764),
(299, 'Susacón', 8, 0, 15774),
(300, 'Sutamarchán', 8, 0, 15776),
(301, 'Sutatenza', 8, 0, 15778),
(302, 'Tenza', 8, 0, 15798),
(303, 'Tibaná', 8, 0, 15804),
(304, 'Tibasosa', 8, 0, 15806),
(305, 'Tinjacá', 8, 0, 15808),
(306, 'Toca', 8, 0, 15814),
(307, 'Togüí', 8, 0, 15816),
(308, 'Tota', 8, 0, 15822),
(309, 'Tununguá', 8, 0, 15832),
(310, 'Turmequé', 8, 0, 15835),
(311, 'Tuta', 8, 0, 15837),
(312, 'Tutazá', 8, 0, 15839),
(313, 'Umbita', 8, 0, 15842),
(314, 'Ventaquemada', 8, 0, 15861),
(315, 'Viracachá', 8, 0, 15879),
(316, 'Zetaquira', 8, 0, 15897),
(317, 'Oicatá', 8, 0, 155),
(318, 'Ráquira', 8, 0, 156),
(319, 'Berbeo', 8, 0, 1509),
(320, 'Chiscas', 8, 0, 1518),
(321, 'La Capilla', 8, 0, 1538),
(322, 'Muzo', 8, 0, 1548),
(323, 'Pisba', 8, 0, 1555),
(324, 'Quípama', 8, 0, 1558),
(325, 'San Eduardo', 8, 0, 1566),
(326, 'Santa María', 8, 0, 1569),
(327, 'Sativanorte', 8, 0, 1572),
(328, 'Siachoque', 8, 0, 1574),
(329, 'Tasco', 8, 0, 1579),
(330, 'Tipacoque', 8, 0, 1581),
(331, 'Tópaga', 8, 0, 1582),
(332, 'Manizales', 9, 1, 17001),
(333, 'Aguadas', 9, 0, 17013),
(334, 'Anserma', 9, 0, 17042),
(335, 'Belalcázar', 9, 0, 17088),
(336, 'Chinchiná', 9, 0, 17174),
(337, 'Filadelfia', 9, 0, 17272),
(338, 'La Merced', 9, 0, 17388),
(339, 'Manzanares', 9, 0, 17433),
(340, 'Marmato', 9, 0, 17442),
(341, 'Marquetalia', 9, 0, 17444),
(342, 'Marulanda', 9, 0, 17446),
(343, 'Neira', 9, 0, 17486),
(344, 'Norcasia', 9, 0, 17495),
(345, 'Pácora', 9, 0, 17513),
(346, 'Palestina', 9, 0, 17524),
(347, 'Pensilvania', 9, 0, 17541),
(348, 'Riosucio', 9, 0, 17614),
(349, 'Risaralda', 9, 0, 17616),
(350, 'Salamina', 9, 0, 17653),
(351, 'Samaná', 9, 0, 17662),
(352, 'San José', 9, 0, 17665),
(353, 'Supía', 9, 0, 17777),
(354, 'Victoria', 9, 0, 17867),
(355, 'Villamaría', 9, 0, 17873),
(356, 'Viterbo', 9, 0, 17877),
(357, 'Aranzazu', 9, 0, 1705),
(358, 'La Dorada', 9, 0, 1738),
(359, 'Florencia', 10, 1, 18001),
(360, 'Albania', 10, 0, 18029),
(361, 'Belén de Los Andaquies', 10, 0, 18094),
(362, 'Curillo', 10, 0, 18205),
(363, 'El Doncello', 10, 0, 18247),
(364, 'El Paujil', 10, 0, 18256),
(365, 'Morelia', 10, 0, 18479),
(366, 'Puerto Rico', 10, 0, 18592),
(367, 'San Vicente del Caguán', 10, 0, 18753),
(368, 'Solano', 10, 0, 18756),
(369, 'Solita', 10, 0, 18785),
(370, 'Cartagena del Chairá', 10, 0, 1815),
(371, 'La Montañita', 10, 0, 1841),
(372, 'Milán', 10, 0, 1846),
(373, 'San José del Fragua', 10, 0, 1861),
(374, 'Valparaíso', 10, 0, 5856),
(375, 'Popayán', 12, 1, 19001),
(376, 'Almaguer', 12, 0, 19022),
(377, 'Balboa', 12, 0, 19075),
(378, 'Caldono', 12, 0, 19137),
(379, 'Caloto', 12, 0, 19142),
(380, 'Corinto', 12, 0, 19212),
(381, 'El Tambo', 12, 0, 19256),
(382, 'Guapi', 12, 0, 19318),
(383, 'Inzá', 12, 0, 19355),
(384, 'Jambaló', 12, 0, 19364),
(385, 'La Sierra', 12, 0, 19392),
(386, 'La Vega', 12, 0, 19397),
(387, 'López', 12, 0, 19418),
(388, 'Miranda', 12, 0, 19455),
(389, 'Morales', 12, 0, 13473),
(390, 'Padilla', 12, 0, 19513),
(391, 'Páez', 12, 0, 15514),
(392, 'Patía', 12, 0, 19532),
(393, 'Piamonte', 12, 0, 19533),
(394, 'Piendamó', 12, 0, 19548),
(395, 'Puerto Tejada', 12, 0, 19573),
(396, 'Puracé', 12, 0, 19585),
(397, 'Rosas', 12, 0, 19622),
(398, 'San Sebastián', 12, 0, 19693),
(399, 'Santander de Quilichao', 12, 0, 19698),
(400, 'Santa Rosa', 12, 0, 13683),
(401, 'Silvia', 12, 0, 19743),
(402, 'Sucre', 12, 0, 19785),
(403, 'Timbío', 12, 0, 19807),
(404, 'Timbiquí', 12, 0, 19809),
(405, 'Toribio', 12, 0, 19821),
(406, 'Totoró', 12, 0, 19824),
(407, 'Villa Rica', 12, 0, 19845),
(408, 'Bolívar', 12, 0, 191),
(409, 'Guachené', 12, 0, 193),
(410, 'Argelia', 12, 0, 5055),
(411, 'Buenos Aires', 12, 0, 1911),
(412, 'Cajibío', 12, 0, 1913),
(413, 'Florencia', 12, 0, 18001),
(414, 'Mercaderes', 12, 0, 1945),
(415, 'Sotara', 12, 0, 1976),
(416, 'Suárez', 12, 0, 1978),
(417, 'Valledupar', 13, 1, 20001),
(418, 'Aguachica', 13, 0, 20011),
(419, 'Agustín Codazzi', 13, 0, 20013),
(420, 'Astrea', 13, 0, 20032),
(421, 'Becerril', 13, 0, 20045),
(422, 'Chimichagua', 13, 0, 20175),
(423, 'Chiriguaná', 13, 0, 20178),
(424, 'Curumaní', 13, 0, 20228),
(425, 'El Copey', 13, 0, 20238),
(426, 'Gamarra', 13, 0, 20295),
(427, 'La Gloria', 13, 0, 20383),
(428, 'Manaure', 13, 0, 20443),
(429, 'Pailitas', 13, 0, 20517),
(430, 'Río de Oro', 13, 0, 20614),
(431, 'La Paz', 13, 0, 20621),
(432, 'Tamalameque', 13, 0, 20787),
(433, 'La Jagua de Ibirico', 13, 0, 204),
(434, 'Bosconia', 13, 0, 2006),
(435, 'El Paso', 13, 0, 2025),
(436, 'González', 13, 0, 2031),
(437, 'Pelaya', 13, 0, 2055),
(438, 'Pueblo Bello', 13, 0, 2057),
(439, 'San Alberto', 13, 0, 2071),
(440, 'San Diego', 13, 0, 2075),
(441, 'San Martín', 13, 0, 2077),
(442, 'Quibdó', 14, 1, 27001),
(443, 'Acandí', 14, 0, 27006),
(444, 'Alto Baudo', 14, 0, 27025),
(445, 'Bagadó', 14, 0, 27073),
(446, 'Bahía Solano', 14, 0, 27075),
(447, 'Bajo Baudó', 14, 0, 27077),
(448, 'Belén de Bajira', 14, 0, 27086),
(449, 'Bojaya', 14, 0, 27099),
(450, 'El Cantón del San Pablo', 14, 0, 27135),
(451, 'Condoto', 14, 0, 27205),
(452, 'El Carmen de Atrato', 14, 0, 27245),
(453, 'Istmina', 14, 0, 27361),
(454, 'Juradó', 14, 0, 27372),
(455, 'Lloró', 14, 0, 27413),
(456, 'Medio Atrato', 14, 0, 27425),
(457, 'Nóvita', 14, 0, 27491),
(458, 'Nuquí', 14, 0, 27495),
(459, 'Riosucio', 14, 0, 17614),
(460, 'Sipí', 14, 0, 27745),
(461, 'Tadó', 14, 0, 27787),
(462, 'Atrato', 14, 0, 2705),
(463, 'Río Quito', 14, 0, 276),
(464, 'Unguía', 14, 0, 278),
(465, 'Carmen del Darien', 14, 0, 2715),
(466, 'Cértegui', 14, 0, 2716),
(467, 'El Litoral del San Juan', 14, 0, 2725),
(468, 'Medio Baudó', 14, 0, 2743),
(469, 'Medio San Juan', 14, 0, 2745),
(470, 'Río Iro', 14, 0, 2758),
(471, 'San José del Palmar', 14, 0, 2766),
(472, 'Unión Panamericana', 14, 0, 2781),
(473, 'Montería', 15, 1, 23001),
(474, 'Ayapel', 15, 0, 23068),
(475, 'Buenavista', 15, 0, 23079),
(476, 'Cereté', 15, 0, 23162),
(477, 'Chimá', 15, 0, 23168),
(478, 'Chinú', 15, 0, 23182),
(479, 'Ciénaga de Oro', 15, 0, 23189),
(480, 'Lorica', 15, 0, 23417),
(481, 'Los Córdobas', 15, 0, 23419),
(482, 'Momil', 15, 0, 23464),
(483, 'Montelíbano', 15, 0, 23466),
(484, 'Planeta Rica', 15, 0, 23555),
(485, 'Puerto Escondido', 15, 0, 23574),
(486, 'Purísima', 15, 0, 23586),
(487, 'San Antero', 15, 0, 23672),
(488, 'San Bernardo del Viento', 15, 0, 23675),
(489, 'San Carlos', 15, 0, 23678),
(490, 'San José de Uré', 15, 0, 23682),
(491, 'San Pelayo', 15, 0, 23686),
(492, 'Tierralta', 15, 0, 23807),
(493, 'Tuchín', 15, 0, 23815),
(494, 'Valencia', 15, 0, 23855),
(495, 'Cotorra', 15, 0, 233),
(496, 'Moñitos', 15, 0, 235),
(497, 'Canalete', 15, 0, 2309),
(498, 'La Apartada', 15, 0, 2335),
(499, 'Pueblo Nuevo', 15, 0, 2357),
(500, 'Puerto Libertador', 15, 0, 2358),
(501, 'Sahagún', 15, 0, 2366),
(502, 'San Andrés Sotavento', 15, 0, 2367),
(503, 'Bogotá D.C.', 16, 1, 11001),
(504, 'Albán', 16, 0, 52019),
(505, 'Anapoima', 16, 0, 25035),
(506, 'Arbeláez', 16, 0, 25053),
(507, 'Beltrán', 16, 0, 25086),
(508, 'Bituima', 16, 0, 25095),
(509, 'Bojacá', 16, 0, 25099),
(510, 'Cachipay', 16, 0, 25123),
(511, 'Cajicá', 16, 0, 25126),
(512, 'Caparrapí', 16, 0, 25148),
(513, 'Caqueza', 16, 0, 25151),
(514, 'Carmen de Carupa', 16, 0, 25154),
(515, 'Chaguaní', 16, 0, 25168),
(516, 'Chía', 16, 0, 25175),
(517, 'Chipaque', 16, 0, 25178),
(518, 'Choachí', 16, 0, 25181),
(519, 'Chocontá', 16, 0, 25183),
(520, 'Cota', 16, 0, 25214),
(521, 'Cucunubá', 16, 0, 25224),
(522, 'El Colegio', 16, 0, 25245),
(523, 'El Peñón', 16, 0, 13268),
(524, 'Facatativá', 16, 0, 25269),
(525, 'Fomeque', 16, 0, 25279),
(526, 'Fosca', 16, 0, 25281),
(527, 'Funza', 16, 0, 25286),
(528, 'Fúquene', 16, 0, 25288),
(529, 'Gachala', 16, 0, 25293),
(530, 'Gachancipá', 16, 0, 25295),
(531, 'Gachetá', 16, 0, 25297),
(532, 'Gama', 16, 0, 25299),
(533, 'Girardot', 16, 0, 25307),
(534, 'Granada', 16, 0, 25312),
(535, 'Guachetá', 16, 0, 25317),
(536, 'Guasca', 16, 0, 25322),
(537, 'Guataquí', 16, 0, 25324),
(538, 'Guatavita', 16, 0, 25326),
(539, 'Guayabal de Siquima', 16, 0, 25328),
(540, 'Guayabetal', 16, 0, 25335),
(541, 'Gutiérrez', 16, 0, 25339),
(542, 'Jerusalén', 16, 0, 25368),
(543, 'Junín', 16, 0, 25372),
(544, 'La Calera', 16, 0, 25377),
(545, 'La Mesa', 16, 0, 25386),
(546, 'La Palma', 16, 0, 25394),
(547, 'La Peña', 16, 0, 25398),
(548, 'La Vega', 16, 0, 19397),
(549, 'Lenguazaque', 16, 0, 25407),
(550, 'Macheta', 16, 0, 25426),
(551, 'Manta', 16, 0, 25436),
(552, 'Medina', 16, 0, 25438),
(553, 'Mosquera', 16, 0, 25473),
(554, 'Nariño', 16, 0, 5483),
(555, 'Nemocón', 16, 0, 25486),
(556, 'Nilo', 16, 0, 25488),
(557, 'Nimaima', 16, 0, 25489),
(558, 'Nocaima', 16, 0, 25491),
(559, 'Venecia', 16, 0, 5861),
(560, 'Pacho', 16, 0, 25513),
(561, 'Paime', 16, 0, 25518),
(562, 'Pandi', 16, 0, 25524),
(563, 'Pasca', 16, 0, 25535),
(564, 'Puerto Salgar', 16, 0, 25572),
(565, 'Quebradanegra', 16, 0, 25592),
(566, 'Quetame', 16, 0, 25594),
(567, 'Quipile', 16, 0, 25596),
(568, 'Apulo', 16, 0, 25599),
(569, 'Ricaurte', 16, 0, 25612),
(570, 'San Antonio del Tequendama', 16, 0, 25645),
(571, 'San Bernardo', 16, 0, 25649),
(572, 'San Cayetano', 16, 0, 25653),
(573, 'San Francisco', 16, 0, 5652),
(574, 'San Juan de Río Seco', 16, 0, 25662),
(575, 'Sasaima', 16, 0, 25718),
(576, 'Sesquilé', 16, 0, 25736),
(577, 'Silvania', 16, 0, 25743),
(578, 'Simijaca', 16, 0, 25745),
(579, 'Soacha', 16, 0, 25754),
(580, 'Sopó', 16, 0, 25758),
(581, 'Subachoque', 16, 0, 25769),
(582, 'Suesca', 16, 0, 25772),
(583, 'Supatá', 16, 0, 25777),
(584, 'Susa', 16, 0, 25779),
(585, 'Sutatausa', 16, 0, 25781),
(586, 'Tabio', 16, 0, 25785),
(587, 'Tausa', 16, 0, 25793),
(588, 'Tena', 16, 0, 25797),
(589, 'Tenjo', 16, 0, 25799),
(590, 'Tibacuy', 16, 0, 25805),
(591, 'Tibirita', 16, 0, 25807),
(592, 'Tocaima', 16, 0, 25815),
(593, 'Tocancipá', 16, 0, 25817),
(594, 'Topaipí', 16, 0, 25823),
(595, 'Ubalá', 16, 0, 25839),
(596, 'Ubaque', 16, 0, 25841),
(597, 'Villa de San Diego de Ubate', 16, 0, 25843),
(598, 'Une', 16, 0, 25845),
(599, 'Útica', 16, 0, 25851),
(600, 'Vergara', 16, 0, 25862),
(601, 'Vianí', 16, 0, 25867),
(602, 'Villagómez', 16, 0, 25871),
(603, 'Villapinzón', 16, 0, 25873),
(604, 'Villeta', 16, 0, 25875),
(605, 'Viotá', 16, 0, 25878),
(606, 'Yacopí', 16, 0, 25885),
(607, 'Zipacón', 16, 0, 25898),
(608, 'Zipaquirá', 16, 0, 25899),
(609, 'Cogua', 16, 0, 252),
(610, 'Anolaima', 16, 0, 2504),
(611, 'Cabrera', 16, 0, 2512),
(612, 'El Rosal', 16, 0, 2526),
(613, 'Fusagasugá', 16, 0, 2529),
(614, 'Guaduas', 16, 0, 2532),
(615, 'Madrid', 16, 0, 2543),
(616, 'Paratebueno', 16, 0, 2553),
(617, 'Pulí', 16, 0, 2558),
(618, 'Sibaté', 16, 0, 2574),
(619, 'Inírida', 17, 1, 94001),
(620, 'Barranco Minas', 17, 0, 94343),
(621, 'Mapiripana', 17, 0, 94663),
(622, 'San Felipe', 17, 0, 94883),
(623, 'Puerto Colombia', 17, 0, 94884),
(624, 'La Guadalupe', 17, 0, 94885),
(625, 'Cacahual', 17, 0, 94886),
(626, 'Pana Pana', 17, 0, 94887),
(627, 'Morichal', 17, 0, 94888),
(628, 'San José del Guaviare', 18, 1, 95001),
(629, 'Calamar', 18, 0, 1314),
(630, 'El Retorno', 18, 0, 95025),
(631, 'Miraflores', 18, 0, 15455),
(632, 'Neiva', 19, 1, 41001),
(633, 'Acevedo', 19, 0, 41006),
(634, 'Agrado', 19, 0, 41013),
(635, 'Aipe', 19, 0, 41016),
(636, 'Altamira', 19, 0, 41026),
(637, 'Baraya', 19, 0, 41078),
(638, 'Campoalegre', 19, 0, 41132),
(639, 'Colombia', 19, 0, 41206),
(640, 'Elías', 19, 0, 41244),
(641, 'Garzón', 19, 0, 41298),
(642, 'Gigante', 19, 0, 41306),
(643, 'Guadalupe', 19, 0, 5315),
(644, 'Hobo', 19, 0, 41349),
(645, 'Iquira', 19, 0, 41357),
(646, 'Isnos', 19, 0, 41359),
(647, 'La Argentina', 19, 0, 41378),
(648, 'La Plata', 19, 0, 41396),
(649, 'Nátaga', 19, 0, 41483),
(650, 'Oporapa', 19, 0, 41503),
(651, 'Paicol', 19, 0, 41518),
(652, 'Palermo', 19, 0, 41524),
(653, 'Pital', 19, 0, 41548),
(654, 'Pitalito', 19, 0, 41551),
(655, 'Rivera', 19, 0, 41615),
(656, 'San Agustín', 19, 0, 41668),
(657, 'Santa María', 19, 0, 1569),
(658, 'Tarqui', 19, 0, 41791),
(659, 'Tesalia', 19, 0, 41797),
(660, 'Tello', 19, 0, 41799),
(661, 'Teruel', 19, 0, 41801),
(662, 'Timaná', 19, 0, 41807),
(663, 'Villavieja', 19, 0, 41872),
(664, 'Yaguará', 19, 0, 41885),
(665, 'Algeciras', 19, 0, 4102),
(666, 'Palestina', 19, 0, 17524),
(667, 'Saladoblanco', 19, 0, 4166),
(668, 'Suaza', 19, 0, 4177),
(669, 'Riohacha', 20, 1, 44001),
(670, 'Albania', 20, 0, 44035),
(671, 'Barrancas', 20, 0, 44078),
(672, 'Distracción', 20, 0, 44098),
(673, 'Fonseca', 20, 0, 44279),
(674, 'Hatonuevo', 20, 0, 44378),
(675, 'Uribia', 20, 0, 44847),
(676, 'Urumita', 20, 0, 44855),
(677, 'Villanueva', 20, 0, 13873),
(678, 'Dibula', 20, 0, 4409),
(679, 'El Molino', 20, 0, 4411),
(680, 'La Jagua del Pilar', 20, 0, 4442),
(681, 'Maicao', 20, 0, 4443),
(682, 'Manaure', 20, 0, 20443),
(683, 'San Juan del Cesar', 20, 0, 4465),
(684, 'Santa Marta', 21, 1, 47001),
(685, 'Aracataca', 21, 0, 47053),
(686, 'Ariguaní', 21, 0, 47058),
(687, 'Cerro San Antonio', 21, 0, 47161),
(688, 'Ciénaga', 21, 0, 47189),
(689, 'Concordia', 21, 0, 5209),
(690, 'El Banco', 21, 0, 47245),
(691, 'El Piñon', 21, 0, 47258),
(692, 'El Retén', 21, 0, 47268),
(693, 'Fundación', 21, 0, 47288),
(694, 'Guamal', 21, 0, 47318),
(695, 'Pedraza', 21, 0, 47541),
(696, 'Pijiño del Carmen', 21, 0, 47545),
(697, 'Pivijay', 21, 0, 47551),
(698, 'Plato', 21, 0, 47555),
(699, 'Remolino', 21, 0, 47605),
(700, 'Salamina', 21, 0, 17653),
(701, 'San Sebastián de Buenavista', 21, 0, 47692),
(702, 'San Zenón', 21, 0, 47703),
(703, 'Santa Ana', 21, 0, 47707),
(704, 'Sitionuevo', 21, 0, 47745),
(705, 'Tenerife', 21, 0, 47798),
(706, 'Algarrobo', 21, 0, 4703),
(707, 'Chivolo', 21, 0, 4717),
(708, 'Nueva Granada', 21, 0, 4746),
(709, 'Pueblo Viejo', 21, 0, 4757),
(710, 'Sabanas de San Angel', 21, 0, 4766),
(711, 'Santa Bárbara de Pinto', 21, 0, 4772),
(712, 'Zapayán', 21, 0, 4796),
(713, 'Zona Bananera', 21, 0, 5736),
(714, 'Villavicencio', 22, 1, 50001),
(715, 'Acacias', 22, 0, 50006),
(716, 'Cabuyaro', 22, 0, 50124),
(717, 'Cubarral', 22, 0, 50223),
(718, 'Cumaral', 22, 0, 50226),
(719, 'El Calvario', 22, 0, 50245),
(720, 'El Castillo', 22, 0, 50251),
(721, 'Fuente de Oro', 22, 0, 50287),
(722, 'Granada', 22, 0, 25312),
(723, 'Guamal', 22, 0, 47318),
(724, 'Mapiripán', 22, 0, 50325),
(725, 'Puerto Gaitán', 22, 0, 50568),
(726, 'Puerto López', 22, 0, 50573),
(727, 'Puerto Lleras', 22, 0, 50577),
(728, 'Restrepo', 22, 0, 50606),
(729, 'San Juan de Arama', 22, 0, 50683),
(730, 'San Juanito', 22, 0, 50686),
(731, 'San Martín', 22, 0, 2077),
(732, 'Vista Hermosa', 22, 0, 50711),
(733, 'Barranca de Upía', 22, 0, 5011),
(734, 'Castilla la Nueva', 22, 0, 5015),
(735, 'El Dorado', 22, 0, 5027),
(736, 'Mesetas', 22, 0, 5033),
(737, 'La Macarena', 22, 0, 5035),
(738, 'Uribe', 22, 0, 5037),
(739, 'Lejanías', 22, 0, 504),
(740, 'Puerto Concordia', 22, 0, 5045),
(741, 'Puerto Rico', 22, 0, 18592),
(742, 'San Carlos de Guaroa', 22, 0, 5068),
(743, 'Pasto', 23, 1, 52001),
(744, 'Albán', 23, 0, 25019),
(745, 'Aldana', 23, 0, 52022),
(746, 'Ancuyá', 23, 0, 52036),
(747, 'Arboleda', 23, 0, 52051),
(748, 'Barbacoas', 23, 0, 52079),
(749, 'Belén', 23, 0, 52083),
(750, 'Colón', 23, 0, 52203),
(751, 'Consaca', 23, 0, 52207),
(752, 'Córdoba', 23, 0, 13212),
(753, 'Cuaspud', 23, 0, 52224),
(754, 'Cumbal', 23, 0, 52227),
(755, 'Cumbitara', 23, 0, 52233),
(756, 'El Peñol', 23, 0, 52254),
(757, 'El Rosario', 23, 0, 52256),
(758, 'El Tablón de Gómez', 23, 0, 52258),
(759, 'Funes', 23, 0, 52287),
(760, 'Guachucal', 23, 0, 52317),
(761, 'Gualmatán', 23, 0, 52323),
(762, 'Iles', 23, 0, 52352),
(763, 'Imués', 23, 0, 52354),
(764, 'Ipiales', 23, 0, 52356),
(765, 'La Cruz', 23, 0, 52378),
(766, 'La Florida', 23, 0, 52381),
(767, 'La Llanada', 23, 0, 52385),
(768, 'La Unión', 23, 0, 54),
(769, 'Leiva', 23, 0, 52405),
(770, 'Linares', 23, 0, 52411),
(771, 'Los Andes', 23, 0, 52418),
(772, 'Magüí', 23, 0, 52427),
(773, 'Mallama', 23, 0, 52435),
(774, 'Mosquera', 23, 0, 25473),
(775, 'Ospina', 23, 0, 52506),
(776, 'Providencia', 23, 0, 52565),
(777, 'Puerres', 23, 0, 52573),
(778, 'Pupiales', 23, 0, 52585),
(779, 'Ricaurte', 23, 0, 25612),
(780, 'Roberto Payán', 23, 0, 52621),
(781, 'Samaniego', 23, 0, 52678),
(782, 'Sandoná', 23, 0, 52683),
(783, 'San Bernardo', 23, 0, 25649),
(784, 'San Lorenzo', 23, 0, 52687),
(785, 'San Pablo', 23, 0, 52693),
(786, 'San Pedro de Cartago', 23, 0, 52694),
(787, 'Santa Bárbara', 23, 0, 5679),
(788, 'Santacruz', 23, 0, 52699),
(789, 'Taminango', 23, 0, 52786),
(790, 'Tangua', 23, 0, 52788),
(791, 'San Andrés de Tumaco', 23, 0, 52835),
(792, 'Túquerres', 23, 0, 52838),
(793, 'Yacuanquer', 23, 0, 52885),
(794, 'Buesaco', 23, 0, 5211),
(795, 'Contadero', 23, 0, 5221),
(796, 'Chachagüí', 23, 0, 5224),
(797, 'El Charco', 23, 0, 5225),
(798, 'El Tambo', 23, 0, 19256),
(799, 'Guaitarilla', 23, 0, 5232),
(800, 'La Tola', 23, 0, 5239),
(801, 'Nariño', 23, 0, 5483),
(802, 'Olaya Herrera', 23, 0, 5249),
(803, 'Francisco Pizarro', 23, 0, 5252),
(804, 'Policarpa', 23, 0, 5254),
(805, 'Potosí', 23, 0, 5256),
(806, 'Sapuyes', 23, 0, 5272),
(807, 'Cúcuta', 24, 1, 54001),
(808, 'Abrego', 24, 0, 54003),
(809, 'Arboledas', 24, 0, 54051),
(810, 'Bochalema', 24, 0, 54099),
(811, 'Bucarasica', 24, 0, 54109),
(812, 'Cácota', 24, 0, 54125),
(813, 'Cachirá', 24, 0, 54128),
(814, 'Chinácota', 24, 0, 54172),
(815, 'Chitagá', 24, 0, 54174),
(816, 'Convención', 24, 0, 54206),
(817, 'Cucutilla', 24, 0, 54223),
(818, 'Durania', 24, 0, 54239),
(819, 'El Carmen', 24, 0, 54245),
(820, 'El Zulia', 24, 0, 54261),
(821, 'Gramalote', 24, 0, 54313),
(822, 'Hacarí', 24, 0, 54344),
(823, 'Herrán', 24, 0, 54347),
(824, 'Labateca', 24, 0, 54377),
(825, 'La Esperanza', 24, 0, 54385),
(826, 'La Playa', 24, 0, 54398),
(827, 'Los Patios', 24, 0, 54405),
(828, 'Lourdes', 24, 0, 54418),
(829, 'Ocaña', 24, 0, 54498),
(830, 'Pamplona', 24, 0, 54518),
(831, 'Puerto Santander', 24, 0, 91669),
(832, 'Ragonvalia', 24, 0, 54599),
(833, 'San Cayetano', 24, 0, 25653),
(834, 'Silos', 24, 0, 54743),
(835, 'Villa Caro', 24, 0, 54871),
(836, 'Villa del Rosario', 24, 0, 54874),
(837, 'El Tarra', 24, 0, 5425),
(838, 'Mutiscua', 24, 0, 5448),
(839, 'Pamplonita', 24, 0, 5452),
(840, 'Salazar', 24, 0, 5466),
(841, 'San Calixto', 24, 0, 5467),
(842, 'Santiago', 24, 0, 8676),
(843, 'Sardinata', 24, 0, 5472),
(844, 'Teorama', 24, 0, 548),
(845, 'Tibú', 24, 0, 5481),
(846, 'Toledo', 24, 0, 5819),
(847, 'Mocoa', 25, 1, 86001),
(848, 'Colón', 25, 0, 52203),
(849, 'Puerto Asís', 25, 0, 86568),
(850, 'Puerto Caicedo', 25, 0, 86569),
(851, 'Puerto Guzmán', 25, 0, 86571),
(852, 'Leguízamo', 25, 0, 86573),
(853, 'Sibundoy', 25, 0, 86749),
(854, 'San Francisco', 25, 0, 5652),
(855, 'San Miguel', 25, 0, 68686),
(856, 'Valle de Guamez', 25, 0, 86865),
(857, 'Villagarzón', 25, 0, 86885),
(858, 'Orito', 25, 0, 8632),
(859, 'Santiago', 25, 0, 8676),
(860, 'Armenia', 26, 1, 5059),
(861, 'Buenavista', 26, 0, 23079),
(862, 'Córdoba', 26, 0, 13212),
(863, 'Filandia', 26, 0, 63272),
(864, 'Génova', 26, 0, 63302),
(865, 'La Tebaida', 26, 0, 63401),
(866, 'Pijao', 26, 0, 63548),
(867, 'Quimbaya', 26, 0, 63594),
(868, 'Calarcá', 26, 0, 6313),
(869, 'Circasia', 26, 0, 6319),
(870, 'Montenegro', 26, 0, 6347),
(871, 'Salento', 26, 0, 6369),
(872, 'Pereira', 27, 1, 66001),
(873, 'Apía', 27, 0, 66045),
(874, 'Balboa', 27, 0, 19075),
(875, 'Belén de Umbría', 27, 0, 66088),
(876, 'Guática', 27, 0, 66318),
(877, 'La Celia', 27, 0, 66383),
(878, 'Mistrató', 27, 0, 66456),
(879, 'Pueblo Rico', 27, 0, 66572),
(880, 'Quinchía', 27, 0, 66594),
(881, 'Santa Rosa de Cabal', 27, 0, 66682),
(882, 'Santuario', 27, 0, 66687),
(883, 'Dosquebradas', 27, 0, 6617),
(884, 'La Virginia', 27, 0, 664),
(885, 'Marsella', 27, 0, 6644),
(886, 'Bucaramanga', 28, 1, 68001),
(887, 'Aguada', 28, 0, 68013),
(888, 'Aratoca', 28, 0, 68051),
(889, 'Barbosa', 28, 0, 5079),
(890, 'Barichara', 28, 0, 68079),
(891, 'Barrancabermeja', 28, 0, 68081),
(892, 'Betulia', 28, 0, 5093),
(893, 'Bolívar', 28, 0, 191),
(894, 'Cabrera', 28, 0, 2512),
(895, 'California', 28, 0, 68132),
(896, 'Capitanejo', 28, 0, 68147),
(897, 'Carcasí', 28, 0, 68152),
(898, 'Cerrito', 28, 0, 68162),
(899, 'Charalá', 28, 0, 68167),
(900, 'Charta', 28, 0, 68169),
(901, 'Chimá', 28, 0, 23168),
(902, 'Chipatá', 28, 0, 68179),
(903, 'Concepción', 28, 0, 5206),
(904, 'Confines', 28, 0, 68209),
(905, 'Contratación', 28, 0, 68211),
(906, 'Coromoro', 28, 0, 68217),
(907, 'Curití', 28, 0, 68229),
(908, 'El Carmen de Chucurí', 28, 0, 68235),
(909, 'El Guacamayo', 28, 0, 68245),
(910, 'El Playón', 28, 0, 68255),
(911, 'Encino', 28, 0, 68264),
(912, 'Enciso', 28, 0, 68266),
(913, 'Florián', 28, 0, 68271),
(914, 'Floridablanca', 28, 0, 68276),
(915, 'Galán', 28, 0, 68296),
(916, 'Gambita', 28, 0, 68298),
(917, 'Girón', 28, 0, 68307),
(918, 'Guaca', 28, 0, 68318),
(919, 'Guapotá', 28, 0, 68322),
(920, 'Guavatá', 28, 0, 68324),
(921, 'Güepsa', 28, 0, 68327),
(922, 'Hato', 28, 0, 68344),
(923, 'Jesús María', 28, 0, 68368),
(924, 'La Belleza', 28, 0, 68377),
(925, 'Landázuri', 28, 0, 68385),
(926, 'La Paz', 28, 0, 20621),
(927, 'Lebríja', 28, 0, 68406),
(928, 'Los Santos', 28, 0, 68418),
(929, 'Macaravita', 28, 0, 68425),
(930, 'Málaga', 28, 0, 68432),
(931, 'Matanza', 28, 0, 68444),
(932, 'Mogotes', 28, 0, 68464),
(933, 'Molagavita', 28, 0, 68468),
(934, 'Ocamonte', 28, 0, 68498),
(935, 'Onzaga', 28, 0, 68502),
(936, 'Palmar', 28, 0, 68522),
(937, 'Palmas del Socorro', 28, 0, 68524),
(938, 'Páramo', 28, 0, 68533),
(939, 'Piedecuesta', 28, 0, 68547),
(940, 'Pinchote', 28, 0, 68549),
(941, 'Puente Nacional', 28, 0, 68572),
(942, 'Puerto Parra', 28, 0, 68573),
(943, 'Puerto Wilches', 28, 0, 68575),
(944, 'Rionegro', 28, 0, 5615),
(945, 'Sabana de Torres', 28, 0, 68655),
(946, 'San Andrés', 28, 0, 68669),
(947, 'San Benito', 28, 0, 68673),
(948, 'San Gil', 28, 0, 68679),
(949, 'San Joaquín', 28, 0, 68682),
(950, 'San José de Miranda', 28, 0, 68684),
(951, 'San Miguel', 28, 0, 68686),
(952, 'San Vicente de Chucurí', 28, 0, 68689),
(953, 'Santa Bárbara', 28, 0, 5679),
(954, 'Simacota', 28, 0, 68745),
(955, 'Socorro', 28, 0, 68755),
(956, 'Sucre', 28, 0, 19785),
(957, 'Valle de San José', 28, 0, 68855),
(958, 'Vélez', 28, 0, 68861),
(959, 'Vetas', 28, 0, 68867),
(960, 'Villanueva', 28, 0, 13873),
(961, 'Zapatoca', 28, 0, 68895),
(962, 'Albania', 28, 0, 44035),
(963, 'Cepitá', 28, 0, 6816),
(964, 'Cimitarra', 28, 0, 6819),
(965, 'El Peñón', 28, 0, 13268),
(966, 'Guadalupe', 28, 0, 5315),
(967, 'Jordán', 28, 0, 6837),
(968, 'Oiba', 28, 0, 685),
(969, 'Santa Helena del Opón', 28, 0, 6872),
(970, 'Suaita', 28, 0, 6877),
(971, 'Suratá', 28, 0, 6878),
(972, 'Tona', 28, 0, 6882),
(973, 'Sincelejo', 29, 1, 70001),
(974, 'Caimito', 29, 0, 70124),
(975, 'Coloso', 29, 0, 70204),
(976, 'Corozal', 29, 0, 70215),
(977, 'Coveñas', 29, 0, 70221),
(978, 'El Roble', 29, 0, 70233),
(979, 'Galeras', 29, 0, 70235),
(980, 'Guaranda', 29, 0, 70265),
(981, 'Los Palmitos', 29, 0, 70418),
(982, 'Majagual', 29, 0, 70429),
(983, 'Morroa', 29, 0, 70473),
(984, 'Ovejas', 29, 0, 70508),
(985, 'Palmito', 29, 0, 70523),
(986, 'San Benito Abad', 29, 0, 70678),
(987, 'San Juan de Betulia', 29, 0, 70702),
(988, 'San Marcos', 29, 0, 70708),
(989, 'San Onofre', 29, 0, 70713),
(990, 'San Pedro', 29, 0, 5664),
(991, 'San Luis de Sincé', 29, 0, 70742),
(992, 'Sucre', 29, 0, 19785),
(993, 'Tolú Viejo', 29, 0, 70823),
(994, 'Buenavista', 29, 0, 23079),
(995, 'Chalán', 29, 0, 7023),
(996, 'La Unión', 29, 0, 54),
(997, 'Sampués', 29, 0, 7067),
(998, 'Santiago de Tolú', 29, 0, 7082),
(999, 'Ibagué', 30, 1, 73001),
(1000, 'Alpujarra', 30, 0, 73024),
(1001, 'Alvarado', 30, 0, 73026),
(1002, 'Anzoátegui', 30, 0, 73043),
(1003, 'Armero', 30, 0, 73055),
(1004, 'Ataco', 30, 0, 73067),
(1005, 'Cajamarca', 30, 0, 73124),
(1006, 'Carmen de Apicala', 30, 0, 73148),
(1007, 'Casabianca', 30, 0, 73152),
(1008, 'Chaparral', 30, 0, 73168),
(1009, 'Coyaima', 30, 0, 73217),
(1010, 'Cunday', 30, 0, 73226),
(1011, 'Dolores', 30, 0, 73236),
(1012, 'Espinal', 30, 0, 73268),
(1013, 'Flandes', 30, 0, 73275),
(1014, 'Fresno', 30, 0, 73283),
(1015, 'Guamo', 30, 0, 73319),
(1016, 'Herveo', 30, 0, 73347),
(1017, 'Honda', 30, 0, 73349),
(1018, 'Icononzo', 30, 0, 73352),
(1019, 'Lérida', 30, 0, 73408),
(1020, 'Líbano', 30, 0, 73411),
(1021, 'Mariquita', 30, 0, 73443),
(1022, 'Melgar', 30, 0, 73449),
(1023, 'Murillo', 30, 0, 73461),
(1024, 'Natagaima', 30, 0, 73483),
(1025, 'Ortega', 30, 0, 73504),
(1026, 'Piedras', 30, 0, 73547),
(1027, 'Planadas', 30, 0, 73555),
(1028, 'Prado', 30, 0, 73563),
(1029, 'Purificación', 30, 0, 73585),
(1030, 'Rio Blanco', 30, 0, 73616),
(1031, 'Roncesvalles', 30, 0, 73622),
(1032, 'Rovira', 30, 0, 73624),
(1033, 'Saldaña', 30, 0, 73671),
(1034, 'San Antonio', 30, 0, 73675),
(1035, 'San Luis', 30, 0, 566),
(1036, 'Santa Isabel', 30, 0, 73686),
(1037, 'Valle de San Juan', 30, 0, 73854),
(1038, 'Venadillo', 30, 0, 73861),
(1039, 'Villarrica', 30, 0, 73873),
(1040, 'Ambalema', 30, 0, 7303),
(1041, 'Coello', 30, 0, 732),
(1042, 'Falan', 30, 0, 7327),
(1043, 'Palocabildo', 30, 0, 7352),
(1044, 'Suárez', 30, 0, 1978),
(1045, 'Villahermosa', 30, 0, 7387),
(1046, 'Cali', 31, 1, 76001),
(1047, 'Andalucía', 31, 0, 76036),
(1048, 'Ansermanuevo', 31, 0, 76041),
(1049, 'Argelia', 31, 0, 5055),
(1050, 'Buenaventura', 31, 0, 76109),
(1051, 'Guadalajara de Buga', 31, 0, 76111),
(1052, 'Bugalagrande', 31, 0, 76113),
(1053, 'Caicedonia', 31, 0, 76122),
(1054, 'Calima', 31, 0, 76126),
(1055, 'Cartago', 31, 0, 76147),
(1056, 'Dagua', 31, 0, 76233),
(1057, 'El Águila', 31, 0, 76243),
(1058, 'El Cairo', 31, 0, 76246),
(1059, 'El Cerrito', 31, 0, 76248),
(1060, 'Florida', 31, 0, 76275),
(1061, 'Ginebra', 31, 0, 76306),
(1062, 'Guacarí', 31, 0, 76318),
(1063, 'Jamundí', 31, 0, 76364),
(1064, 'La Cumbre', 31, 0, 76377),
(1065, 'La Victoria', 31, 0, 15401),
(1066, 'Obando', 31, 0, 76497),
(1067, 'Pradera', 31, 0, 76563),
(1068, 'Restrepo', 31, 0, 50606),
(1069, 'Riofrío', 31, 0, 76616),
(1070, 'Roldanillo', 31, 0, 76622),
(1071, 'Sevilla', 31, 0, 76736),
(1072, 'Toro', 31, 0, 76823),
(1073, 'Trujillo', 31, 0, 76828),
(1074, 'Tuluá', 31, 0, 76834),
(1075, 'Ulloa', 31, 0, 76845),
(1076, 'Versalles', 31, 0, 76863),
(1077, 'Vijes', 31, 0, 76869),
(1078, 'Yumbo', 31, 0, 76892),
(1079, 'Zarzal', 31, 0, 76895),
(1080, 'Alcalá', 31, 0, 7602),
(1081, 'Bolívar', 31, 0, 191),
(1082, 'Candelaria', 31, 0, 8141),
(1083, 'El Dovio', 31, 0, 7625),
(1084, 'La Unión', 31, 0, 54),
(1085, 'Palmira', 31, 0, 7652),
(1086, 'San Pedro', 31, 0, 5664),
(1087, 'Yotoco', 31, 0, 7689),
(1088, 'Mitú', 32, 1, 97001),
(1089, 'Carurú', 32, 0, 97161),
(1090, 'Pacoa', 32, 0, 97511),
(1091, 'Taraira', 32, 0, 97666),
(1092, 'Papunahua', 32, 0, 97777),
(1093, 'Yavaraté', 32, 0, 97889),
(1094, 'Puerto Carreño', 33, 1, 99001),
(1095, 'La Primavera', 33, 0, 99524),
(1096, 'Santa Rosalía', 33, 0, 99624),
(1097, 'Cumaribo', 33, 0, 99773),
(1098, 'Arauca', 3, 1, 81001),
(1099, 'Arauquita', 3, 0, 81065),
(1100, 'Puerto Rondón', 3, 0, 81591),
(1101, 'Saravena', 3, 0, 81736),
(1102, 'Tame', 3, 0, 81794),
(1103, 'Cravo Norte', 3, 0, 8122),
(1104, 'Yopal', 11, 1, 85001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

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
  KEY `client_status` (`Status_id`),
  KEY `client_country` (`Country_id`),
  KEY `client_company` (`Comp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`Client_id`, `Client_name`, `Client_identification`, `Client_email`, `Client_phone`, `Client_address`, `DocumentType_id`, `Comp_id`, `Status_id`, `Country_id`, `updated_at`, `created_at`) VALUES
(23, 'Diego Casallas', '80854412', 'cliente@gmail.com', '7800412', 'Calle Falsa 123', 5, 1, 1, 1, NULL, '2023-07-22 06:20:23'),
(24, 'Juan ', '100457842', 'juan@gmail.com', '3012824759', 'Calle 124', 2, 1, 1, 1, NULL, '2023-07-22 06:45:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `Comp_id` int(11) NOT NULL AUTO_INCREMENT,
  `Comp_name` varchar(50) NOT NULL,
  `Comp_description` varchar(200) NOT NULL,
  `Comp_email` varchar(100) NOT NULL,
  PRIMARY KEY (`Comp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`Comp_id`, `Comp_name`, `Comp_description`, `Comp_email`) VALUES
(1, 'Sinapsis Technologies', 'Empresa de desarrollo de soluciones tecnológica ', 'info@sinapsist.com.co');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `Country_id` int(10) NOT NULL AUTO_INCREMENT,
  `Country_name` varchar(20) NOT NULL,
  `Country_symbol` varchar(10) NOT NULL,
  PRIMARY KEY (`Country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `country`
--

INSERT INTO `country` (`Country_id`, `Country_name`, `Country_symbol`) VALUES
(1, 'Colombia', 'CO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`department_id`),
  KEY `department_region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `region_id`) VALUES
(1, 'Amazonas', 3),
(2, 'Antioquia', 4),
(3, 'Arauca', 6),
(4, 'Archipiélago de San Andrés, Providencia y Santa Catalina', 1),
(5, 'Atlántico', 1),
(6, 'Bogotá D.C.', 2),
(7, 'Bolívar', 1),
(8, 'Boyacá', 2),
(9, 'Caldas', 4),
(10, 'Caquetá', 3),
(11, 'Casanare', 6),
(12, 'Cauca', 5),
(13, 'Cesar', 1),
(14, 'Chocó', 5),
(15, 'Córdoba', 1),
(16, 'Cundinamarca', 2),
(17, 'Guainía', 6),
(18, 'Guaviare', 6),
(19, 'Huila', 3),
(20, 'La Guajira', 1),
(21, 'Magdalena', 1),
(22, 'Meta', 6),
(23, 'Nariño', 5),
(24, 'Norte de Santander', 2),
(25, 'Putumayo', 3),
(26, 'Quindío', 4),
(27, 'Risaralda', 4),
(28, 'Santander', 2),
(29, 'Sucre', 1),
(30, 'Tolima', 3),
(31, 'Valle del Cauca', 5),
(32, 'Vaupés', 3),
(33, 'Vichada', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_type`
--

CREATE TABLE IF NOT EXISTS `document_type` (
  `DocumentType_id` int(11) NOT NULL AUTO_INCREMENT,
  `DocumentType_name` varchar(60) NOT NULL,
  `DocumentType_descriptions` varchar(80) NOT NULL,
  PRIMARY KEY (`DocumentType_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `document_type`
--

INSERT INTO `document_type` (`DocumentType_id`, `DocumentType_name`, `DocumentType_descriptions`) VALUES
(1, 'CC', 'Cédula'),
(2, 'TI', 'Tarjeta de Identidad '),
(3, 'RC', 'Registro Civil '),
(4, 'CE', 'Cédula de Extranjeria '),
(5, 'NIT', 'Número de identidad tributaria ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gendertype`
--

CREATE TABLE IF NOT EXISTS `gendertype` (
  `GenderType_id` int(11) NOT NULL AUTO_INCREMENT,
  `GenderType_name` varchar(60) NOT NULL,
  `GenderType_descriptions` varchar(80) NOT NULL,
  PRIMARY KEY (`GenderType_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gendertype`
--

INSERT INTO `gendertype` (`GenderType_id`, `GenderType_name`, `GenderType_descriptions`) VALUES
(1, 'M', 'Masculino'),
(2, 'F', 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `Product_id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_name` varchar(50) NOT NULL,
  `Product_descriptions` varchar(200) NOT NULL,
  `Product_code` varchar(10) NOT NULL,
  `Product_value` varchar(10) NOT NULL,
  `Product_img` varchar(400) NOT NULL,
  `Status_id` int(11) NOT NULL,
  `TypeProduct_id` int(11) NOT NULL,
  PRIMARY KEY (`Product_id`),
  KEY `product_status` (`Status_id`),
  KEY `product_type_product` (`TypeProduct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`Product_id`, `Product_name`, `Product_descriptions`, `Product_code`, `Product_value`, `Product_img`, `Status_id`, `TypeProduct_id`) VALUES
(5, 'Computador ', '\r\nComputador .....', 'CO_001', '45000', 'https://www.alkosto.com/medias/196786419003-001-1400Wx1400H?context=bWFzdGVyfGltYWdlc3wzMzU3MDZ8aW1hZ2UvanBlZ3xhR00yTDJneFlTOHhNelEyTkRnMk1ESXlPVFkyTWk4eE9UWTNPRFkwTVRrd01ETmZNREF4WHpFME1EQlhlREUwTURCSXwxYmFmMDQ0NmRkNWRlZTJiMTFjYzk2OTVjNjU3OTQzZmU2ZmNmZGQ2Y2NlY2ZlY2VhNDg5MmVlZTczYjAxODIy', 1, 1),
(6, 'Computador 1', 'Computador 1...', 'CO_002', '45000', 'https://www.alkosto.com/medias/196786419003-001-1400Wx1400H?context=bWFzdGVyfGltYWdlc3wzMzU3MDZ8aW1hZ2UvanBlZ3xhR00yTDJneFlTOHhNelEyTkRnMk1ESXlPVFkyTWk4eE9UWTNPRFkwTVRrd01ETmZNREF4WHpFME1EQlhlREUwTURCSXwxYmFmMDQ0NmRkNWRlZTJiMTFjYzk2OTVjNjU3OTQzZmU2ZmNmZGQ2Y2NlY2ZlY2VhNDg5MmVlZTczYjAxODIy', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(255) NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`region_id`, `region_name`) VALUES
(1, 'Región Caribe'),
(2, 'Región Centro Oriente'),
(3, 'Región Centro Sur'),
(4, 'Región Eje Cafetero - Antioquia'),
(5, 'Región Pacifico'),
(6, 'Región Llano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `Status_id` int(11) NOT NULL AUTO_INCREMENT,
  `Status_name` varchar(60) NOT NULL,
  `Status_descriptions` varchar(80) NOT NULL,
  PRIMARY KEY (`Status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

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
-- Estructura de tabla para la tabla `typeproduct`
--

CREATE TABLE IF NOT EXISTS `typeproduct` (
  `TypeProduct_id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeProduct_name` varchar(20) NOT NULL,
  `TypeProduct_descriptions` varchar(50) NOT NULL,
  PRIMARY KEY (`TypeProduct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `typeproduct`
--

INSERT INTO `typeproduct` (`TypeProduct_id`, `TypeProduct_name`, `TypeProduct_descriptions`) VALUES
(1, 'Construction', 'Construction'),
(2, 'Home', 'Home'),
(3, 'Technology', 'Technology');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`User_id`, `User_name`, `User_document`, `User_email`, `User_cellphone`, `User_lastName`, `User_password`, `User_user`, `User_birthdate`, `Status_id`, `DocumentType_id`, `GenderType_id`) VALUES
(1, 'juan felipe ', '100472605', 'felipe@gmail.com', '3012528242', 'casallas ', '$2y$10$xIgQXNRHgHd/5A7/kpbX8uUpVMyfdaKDatjSgYcUorESu9fMWrlUa', 'felipe@gmail.com', '2023-07-20', 1, 1, 1),
(2, 'DIego', '80857854', 'diegohernando@gmail.com', '3002541785', 'casallas', '$2y$10$wd3yR7eXY4Us0/kNwxziteq6zEnrMZZL3lXzpu4.nWjNuL3ZSPv.G', 'diegohernando@gmail.com', '1986-02-02', 1, 1, 1),
(3, 'Daniela ', '1021987452', 'daniela123@gmail.com', '3158565830', 'Villalba ', '$2y$10$SjLQu2msRedOGUDdv.qemuAKjelSBABt4uNSsvM0sPlXt.miy2qD.', 'Daniela123@gmail.com', '0008-05-15', 1, 1, 1),
(4, 'Diego', '805414141', 'diegocasallas@gmail.com', '3012528745', 'casallas', '$2y$10$.5rTQzxzdmn.K7G6TtDZTOgt/LO3Rr3y5RoZJIkNqazYbus1HAa8S', 'diegocasallas@gmail.com', '2023-07-28', 1, 1, 1),
(13, 'Carlos', '10312528414', 'carlos@gmail.com', '3002514785', 'Rodriguez', '$2y$10$FiAGm0gOhNRmeEOpXqjKmO.mULReLwJygX.7VfvwpiqMXx8aS2lsi', 'carlos@gmail.com', '2023-07-29', 1, 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_company ` FOREIGN KEY (`Comp_id`) REFERENCES `company` (`Comp_id`),
  ADD CONSTRAINT `client_country` FOREIGN KEY (`Country_id`) REFERENCES `country` (`Country_id`),
  ADD CONSTRAINT `client_document_type` FOREIGN KEY (`DocumentType_id`) REFERENCES `document_type` (`DocumentType_id`),
  ADD CONSTRAINT `client_status` FOREIGN KEY (`Status_id`) REFERENCES `status` (`Status_id`);

--
-- Filtros para la tabla `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_status` FOREIGN KEY (`Status_id`) REFERENCES `status` (`Status_id`),
  ADD CONSTRAINT `product_type_product` FOREIGN KEY (`TypeProduct_id`) REFERENCES `typeproduct` (`TypeProduct_id`);

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

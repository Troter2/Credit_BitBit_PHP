-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.18-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bitbit
CREATE DATABASE IF NOT EXISTS `bitbit` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bitbit`;

-- Volcando estructura para tabla bitbit.consultes
CREATE TABLE IF NOT EXISTS `consultes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_consulta` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `assumpte` varchar(100) NOT NULL,
  `contingut` longtext NOT NULL,
  `date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`id`),
  KEY `id_consulta` (`id_consulta`),
  CONSTRAINT `id_consulta` FOREIGN KEY (`id_consulta`) REFERENCES `tipus_consulta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.consultes: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `consultes` DISABLE KEYS */;
INSERT INTO `consultes` (`id`, `id_consulta`, `nom`, `email`, `assumpte`, `contingut`, `date`) VALUES
	(1, 0, 'Miquel', 'miquel@hotmail.com', 'El meu ordinador no funciona correctament', 'El meu ordinador no funciona correctament i no se per que', '2021-05-04'),
	(2, 2, 'Pep', 'sample@gmail.com', 'Mi ordenador hace pitidos', 'Mi ordenador hace pitidos', '2021-05-04'),
	(3, 2, 'Bruno', 'bruno@gmail.com', 'Mi ordenador hace mucho ruido', 'Hace dias que mi ordenador hace mucho ruido, creo que es por el ventilador', '2021-05-05'),
	(4, 0, 'Joel', 'SoyJoel@gmail.com', 'Mi ordenador falla', 'Hace unos dias que me falla el ordenador y no se por que.', '2021-05-21'),
	(5, 0, 'Manolo', 'ManoloPerales@gmail.com', 'Mi ordenador se apaga solo.', 'El otro dia intente jugar al cyberounk y mi ordenador se apagó', '2021-05-21'),
	(6, 2, 'Miriam', 'iesEducatiu@gmail.com', 'Quisiera solicitar una reunion', 'Quisiera solicitar una reunion para solicitar una reparacion de multiples ordenadores de nuestro centro educativo.', '2021-05-21');
/*!40000 ALTER TABLE `consultes` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.datos_about
CREATE TABLE IF NOT EXISTS `datos_about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` year(4) NOT NULL,
  `titol` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.datos_about: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `datos_about` DISABLE KEYS */;
INSERT INTO `datos_about` (`id`, `date`, `titol`, `content`) VALUES
	(1, '2008', 'Creació de la empresa', 'Creació de la nostra empresa. Al igual que altres empreses varem començar en un petit garatge.'),
	(2, '2012', 'Canvi d\'oficina', 'Ens varem traslladar al viver de empreses situat al costat del centra educatiu Caparrella.'),
	(3, '2015', 'Contracte amb la generalitat', 'Aquest any va ser molt important, ja que a partir de un contracte amb la generalitat, ens va coneixer i ficar en contacte amb nosaltres moltes persones y entitats que estaben interesades.'),
	(4, '2018', 'Donació de ordinadors per part de l\'Hospital Arnau', 'L\'Hospital Arnau de Vilanova de Lleida donarà pròximament al Pont Solidari de Banc de Recursos 150 ordinadors que ja no s\'utilitzaven perquè puguin ser reaprofitats per entitats socials i ONG necessitades.'),
	(5, '2019', 'Projecte de mooding', 'Inici de realització de projectes de modding a petició del client.');
/*!40000 ALTER TABLE `datos_about` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.documents_tasques
CREATE TABLE IF NOT EXISTS `documents_tasques` (
  `id_document` int(11) NOT NULL AUTO_INCREMENT,
  `id_tasca` int(11) unsigned NOT NULL,
  `image` text NOT NULL,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`id_document`),
  KEY `FK_documents_tasques_tasques` (`id_tasca`),
  CONSTRAINT `FK_documents_tasques_tasques` FOREIGN KEY (`id_tasca`) REFERENCES `tasques` (`id_tasca`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.documents_tasques: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `documents_tasques` DISABLE KEYS */;
INSERT INTO `documents_tasques` (`id_document`, `id_tasca`, `image`, `path`) VALUES
	(1, 5, '932400f517048a6832036e1db69f2963.PNG', 'assets/uploads/incidencies/6'),
	(2, 6, 'ecf4a80c8cdc04aac1423ee4633951ab.PNG', 'assets/uploads/incidencies/1'),
	(3, 8, '3d48be4f2f7d54b1a3aff148042248a3.PNG', 'assets/uploads/incidencies/1'),
	(8, 4, 'c08c19c61bedac0c5966c815e7425d78.jpg', 'assets/uploads/incidencies/1'),
	(9, 4, '0728b19799860297d82fdfd3ae6d8f09.jpg', 'assets/uploads/incidencies/1');
/*!40000 ALTER TABLE `documents_tasques` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.group-news
CREATE TABLE IF NOT EXISTS `group-news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.group-news: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `group-news` DISABLE KEYS */;
/*!40000 ALTER TABLE `group-news` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.groups: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `name`, `description`) VALUES
	(1, 'admin', 'Administrator'),
	(2, 'gestor', 'Gestor'),
	(3, 'tecnic', 'Tecnic'),
	(4, 'user', 'Usuari Generic');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.incidencies
CREATE TABLE IF NOT EXISTS `incidencies` (
  `id_inci` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_estat` int(10) unsigned NOT NULL DEFAULT 0,
  `id_user_propietari` int(10) unsigned DEFAULT NULL,
  `nom_propietari` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `numero_serie` varchar(50) NOT NULL,
  `tlf` varchar(50) NOT NULL,
  `desc_averia` longtext NOT NULL,
  `diagnosis_prev` longtext NOT NULL,
  `uuid` varchar(50) NOT NULL DEFAULT '',
  `entry_date` date NOT NULL DEFAULT curdate(),
  `entry_hour` time NOT NULL DEFAULT curtime(),
  `out_date` date DEFAULT NULL,
  `out_hour` time DEFAULT NULL,
  PRIMARY KEY (`id_inci`),
  KEY `FK_status` (`id_estat`),
  KEY `FK_user` (`id_user_propietari`),
  CONSTRAINT `FK_incidencies_status` FOREIGN KEY (`id_estat`) REFERENCES `status` (`id_estatus`),
  CONSTRAINT `FK_user` FOREIGN KEY (`id_user_propietari`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.incidencies: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `incidencies` DISABLE KEYS */;
INSERT INTO `incidencies` (`id_inci`, `id_estat`, `id_user_propietari`, `nom_propietari`, `marca`, `model`, `numero_serie`, `tlf`, `desc_averia`, `diagnosis_prev`, `uuid`, `entry_date`, `entry_hour`, `out_date`, `out_hour`) VALUES
	(1, 2, 21, 'Josep', 'ACER', 'Aspire TC', '7738234823649', '630487456', '<p>\n	S\'apaga de manera sobtada</p>\n', '<p>Podria ser la font d\'alimentacio</p>', 'd7a39daf641b4679a87c2b6a691ef1ce', '2021-05-19', '00:00:00', '2021-05-11', NULL),
	(6, 2, 21, 'Manolo', 'LENOVO', 'ThinkCentre M90t Tower', '2342063496525', '601845878', '<p>\n	S\'apaga de manera sobtada</p>\n', '<p>Podria ser la font d\'alimentacio</p>', '1243', '2021-05-17', '00:00:00', '2021-05-02', NULL),
	(8, 1, 21, 'Edgar', 'ASUS', 'ASUS S425MC', '3894232342345', '660854258', '<p>\n	L\'ordinador fa sorolls</p>\n', '<p>\n	Podria ser el ventilador</p>\n', '12345', '2021-05-17', '00:00:00', '2021-05-08', NULL),
	(17, 1, 21, 'Sofia', 'HP', 'Omen X', '7564320524479', '660456889', '<p>\n	L\'ordinador s\'apaga al jugar al Cyberpunk</p>\n', '<p>\n	Podria ser la grafica</p>\n', 'a2de7ff3c713430cb17c95782ea06203', '2021-05-10', '00:00:00', NULL, NULL),
	(18, 1, 21, 'Adria', 'LENOVO', 'ThinkCentre M80t Tower', '7856235235768', '630789563', '<p>\n	L\'ordinador fa soroll</p>\n', '<p>\n	Podria ser el ventilador</p>\n', '5b850d8b39e545129986f8afb1128be0', '2021-05-10', '00:00:00', NULL, NULL),
	(19, 1, 21, 'Sergi', 'ACER', 'Aspire XC', '1939283541934', '660455745', '<p>\n	S\'apaga de manera sobtada</p>\n', '<p>Podria ser la font d\'alimentacio</p>', 'b949b7131d3a49c3bb1e767f01d5281a', '2021-05-11', '00:00:00', NULL, NULL),
	(20, 1, 21, 'Joel', 'HP', 'HP Spectre', '93728567928589', '601845648', '<p>\n	L\'ordinador fa sorolls</p>\n', '<p>\n	Podria ser el ventilador</p>\n', '9533382c95ee42d391a8e57a6594284e', '2021-05-11', '00:00:00', NULL, NULL),
	(21, 1, 21, 'Laura', 'LENOVO', 'ThinkCentre M70t Tower', '21867492589123', '601846548', '<p>\n	L\'ordinador fa sorolls</p>\n', '<p>\n	Podria ser el ventilador</p>\n', 'd6a39daf641b4679a87c2b6a691ef1ce', '2021-05-11', '00:00:00', NULL, NULL),
	(22, 1, 21, 'Victor', 'ACER', 'Nitro 50', '67834659823572', '630456886', '<p>\n	L\'ordinador s\'apaga al jugar al Cyberpunk</p>\n', '<p>\n	Podria ser la grafica</p>\n', '5402b14d62f54cc087f62490e5fb28a8', '2021-05-11', '00:00:00', NULL, NULL),
	(23, 1, 21, 'Pau', 'ACER', 'Aspire TC', '89434734598892', '630456886', '<p>\n	S\'apaga de manera sobtada</p>\n', '<p>Podria ser la font d\'alimentacio</p>', 'b00cf224c3b04e69b309cc93a463e242', '2021-05-11', '00:00:00', NULL, NULL),
	(24, 1, 21, 'Marc', 'LENOVO', 'ThinkCentre M90t Tower', '23459234078290', '601894568', '<p>\n	L\'ordinador fa sorolls</p>\n', '<p>\n	Podria ser el ventilador</p>\n', '8571bf8c5a594ae5a1bc8a1d27665c7a', '2021-05-11', '00:00:00', NULL, NULL),
	(27, 2, 21, 'Irene', 'HP', '15s-eq1076ns', '789789789', '325496', '\n	La pantalla parpadeja depenent de la posicio de la pantalla\n', '\n	Possible mala conexio del cable de la pantalla\n', '8417d0bc4f254fdab83647be7164bc78', '2021-05-24', '16:32:39', NULL, NULL),
	(29, 1, 21, 'Laura', 'LENOVO', 'ThinkCentre M70t Tower', '21867492589123', '601846548', '<p>\n	L\'ordinador fa sorolls</p>\n', '<p>\n	Podria ser el ventilador</p>\n', 'd6a39daf641b4679a87c2b6a691ef1ce', '2021-05-11', '00:00:00', NULL, NULL),
	(30, 1, 21, 'Laura', 'LENOVO', 'ThinkCentre M70t Tower', '21867492589123', '601846548', '<p>\n	L\'ordinador fa sorolls</p>\n', '<p>\n	Podria ser el ventilador</p>\n', 'd6a39daf641b4679a87c2b6a691ef1ce', '2021-05-11', '00:00:00', NULL, NULL),
	(31, 1, 21, 'Laura', 'LENOVO', 'ThinkCentre M70t Tower', '21867492589123', '601846548', '<p>\n	L\'ordinador fa sorolls</p>\n', '<p>\n	Podria ser el ventilador</p>\n', 'd6a39daf641b4679a87c2b6a691ef1ce', '2021-05-11', '00:00:00', NULL, NULL),
	(32, 1, 21, 'Laura', 'LENOVO', 'ThinkCentre M70t Tower', '21867492589123', '601846548', '<p>\n	L\'ordinador fa sorolls</p>\n', '<p>\n	Podria ser el ventilador</p>\n', 'd6a39daf641b4679a87c2b6a691ef1ce', '2021-05-11', '00:00:00', NULL, NULL),
	(33, 1, 21, 'Laura', 'LENOVO', 'ThinkCentre M70t Tower', '21867492589123', '601846548', '<p>\n	L\'ordinador fa sorolls</p>\n', '<p>\n	Podria ser el ventilador</p>\n', 'd6a39daf641b4679a87c2b6a691ef1ce', '2021-05-11', '00:00:00', NULL, NULL),
	(34, 1, 21, 'Laura', 'LENOVO', 'ThinkCentre M70t Tower', '21867492589123', '601846548', '<p>\n	L\'ordinador fa sorolls</p>\n', '<p>\n	Podria ser el ventilador</p>\n', 'd6a39daf641b4679a87c2b6a691ef1ce', '2021-05-11', '00:00:00', NULL, NULL);
/*!40000 ALTER TABLE `incidencies` ENABLE KEYS */;

-- Volcando estructura para vista bitbit.inci_user_app
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `inci_user_app` (
	`id_inci` INT(10) UNSIGNED NOT NULL,
	`desc` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`id_user_propietari` INT(10) UNSIGNED NULL,
	`nom_propietari` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`marca` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`model` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`numero_serie` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`tlf` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`desc_averia` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`diagnosis_prev` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`entry_date` DATE NOT NULL,
	`out_date` DATE NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla bitbit.login_attempts
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.login_attempts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;

-- Volcando estructura para vista bitbit.mail_username
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `mail_username` (
	`id_msg` INT(11) NOT NULL,
	`from` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`to` INT(11) UNSIGNED NOT NULL,
	`about` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`content` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para tabla bitbit.materials
CREATE TABLE IF NOT EXISTS `materials` (
  `id_mat` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL DEFAULT '0',
  `descri` longtext NOT NULL,
  `num_serie` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_mat`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.materials: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` (`id_mat`, `nom`, `descri`, `num_serie`, `amount`) VALUES
	(7, 'RAM Crucial de 16 gb a 3200mhz', '\n	RAM Crucial de 16 gb a 3200mhz\n', '64645646468416Z', 25),
	(8, 'Intel Core i9-9900K 3.6 Ghz', '\n	S&oacute;lo compatible con sus placas base basadas en chipset de la serie 300, el procesador&nbsp;Intel Core i9-9900K&nbsp;3.6 GHz Eight-Core LGA 1151 est&aacute; dise&ntilde;ado para juegos, creaci&oacute;n y productividad.\n\n	Tiene una velocidad de reloj base de 3.6 GHz y viene con caracter&iacute;sticas como la compatibilidad con Intel Optane Memory, el cifrado AES-NI, la tecnolog&iacute;a Intel vPro, Intel TXT, la Protecci&oacute;n de dispositivos Intel con Boot Guard, la tecnolog&iacute;a de virtualizaci&oacute;n Intel VT-d para E / S dirigida y la tecnolog&iacute;a Intel Hyper-Threading para tareas m&uacute;ltiples de 16 v&iacute;as.\n', 'BX806849900K', 10),
	(9, 'MSI Mpg Z390 Gaming Plus', '\n	La placa gaming MSI Mpg Z390 Gaming Plus tiene socket Intel 1151 y soporta procesadores Intel de 8&ordf; y 9&ordf; generaci&oacute;n.\n', '911-7B51-007', 50),
	(10, 'Samsung 870 QVO SSD 1TB SATA3', '\n	El&nbsp;870 QVO&nbsp;es lo &uacute;ltimo de la segunda generaci&oacute;n de&nbsp;Samsung. El SSD QLC es el tipo de SSD de mayor capacidad, ya que proporciona hasta 8 TB de almacenamiento. Este disco, ofrece opciones incre&iacute;bles para los usuarios que quieren aumentar la memoria de su PC o port&aacute;til hasta el m&aacute;ximo disponible en el mercado, y sin comprometer el rendimiento.\n', 'MZ-77Q1T0BW', 25),
	(11, 'MSI MPG A650GF 650W 80 Plus Gold Modular', '\n	Font d&#39;alimentaci&oacute;\n', '823678821218', 20),
	(12, 'Samsung 870 EVO SSD 2.5" 500GB SATA3', '\n	Disc dur\n', '879812374908', 50),
	(13, 'Kingston A400 SSD 480GB', '\n	Disc dur SSD\n', '8976123412', 42),
	(14, 'Gigabyte GeForce GT 1030 Low Profile D4 2GB GDDR4', '\n	Tatgeta grafica\n', '987635912', 36),
	(15, 'Kingston HyperX Fury Black DDR4 3200Mhz PC-25600 1', '\n	Memoria RAM\n', '123970613267-B', 27),
	(16, 'Creative Sound Blaster Audigy FX PCI Express', '\n	Targeta d&#39;&agrave;udio\n', 'XA-21930470912', 26),
	(17, 'Nfortec Lynx Cristal Templado USB 3.0 RGB Negra', '\n	Caixa PC\n', 'PA-9172346812213', 17),
	(18, 'Cooler Master Hyper 212 Black Edition', '\n	Ventilador/Disipador\n', '7823941324', 41),
	(19, 'Digitus Adaptador Alimentación Molex/SATA 15cm', '\n	Cables interns\n', '789243912-IS', 58);
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.mat_inci
CREATE TABLE IF NOT EXISTS `mat_inci` (
  `id_mat_inci` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_mat` int(11) unsigned DEFAULT NULL,
  `id_inci` int(11) unsigned DEFAULT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_mat_inci`),
  KEY `FK_mat` (`id_mat`),
  KEY `FK_inci` (`id_inci`) USING BTREE,
  CONSTRAINT `FK_mat` FOREIGN KEY (`id_mat`) REFERENCES `materials` (`id_mat`),
  CONSTRAINT `FK_mat_inci_incidencies` FOREIGN KEY (`id_inci`) REFERENCES `incidencies` (`id_inci`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.mat_inci: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mat_inci` DISABLE KEYS */;
INSERT INTO `mat_inci` (`id_mat_inci`, `id_mat`, `id_inci`, `amount`) VALUES
	(1, 9, 1, 1),
	(2, 9, 6, 1);
/*!40000 ALTER TABLE `mat_inci` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id_msg` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) unsigned NOT NULL,
  `to` int(11) unsigned NOT NULL,
  `about` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `send_date` date NOT NULL,
  `send_hour` time NOT NULL,
  `recive_date` date DEFAULT NULL,
  `recive_hour` time DEFAULT NULL,
  PRIMARY KEY (`id_msg`),
  KEY `FK_messages_users` (`from`),
  KEY `FK_messages_users_2` (`to`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.messages: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id_msg`, `from`, `to`, `about`, `content`, `send_date`, `send_hour`, `recive_date`, `recive_hour`) VALUES
	(57, 21, 22, 'test', '\n	test\n', '2021-06-04', '11:51:21', '2021-06-21', '12:25:47'),
	(58, 21, 22, 'test', '\n	test\n', '2021-06-04', '11:51:41', '2021-06-07', '12:25:47'),
	(59, 21, 22, 'tea', '\n	tea\n', '2021-06-04', '11:52:16', '2021-06-21', '12:25:47'),
	(60, 21, 22, 'test', '\n	test\n', '2021-06-04', '11:52:58', NULL, NULL),
	(61, 21, 21, 'test', '\n	teste\n', '2021-06-04', '11:53:13', NULL, NULL),
	(62, 19, 21, 'test', '\n	12213131231231231231231\n', '2021-06-04', '11:53:54', NULL, NULL),
	(63, 21, 19, 'test', '\n	123123123123\n', '2021-06-04', '11:56:19', '2021-06-05', '13:43:49'),
	(64, 21, 21, '23123123132', 'test bruno', '2021-06-10', '16:33:08', NULL, NULL),
	(65, 19, 21, 'test masgoret', 'test', '2021-06-11', '16:00:18', NULL, NULL),
	(66, 19, 19, 'tesst masgoret', '1234', '2021-06-11', '16:00:37', NULL, NULL),
	(67, 19, 21, 'test masgoret', 'test', '2021-06-11', '16:00:18', NULL, NULL),
	(68, 19, 21, 'test masgoret', 'test', '2021-06-11', '16:00:18', NULL, NULL),
	(69, 19, 21, 'test masgoret', 'test', '2021-06-11', '16:00:18', '2021-06-11', NULL),
	(70, 19, 21, 'test masgoret', 'test', '2021-06-11', '16:00:18', NULL, NULL),
	(71, 19, 21, 'test masgoret', 'test', '2021-06-11', '16:00:18', NULL, NULL),
	(72, 19, 21, 'test masgoret', 'test', '2021-06-11', '16:00:18', NULL, NULL),
	(73, 19, 21, 'test masgoret', 'test', '2021-06-11', '16:00:18', NULL, NULL),
	(74, 19, 21, 'test masgoret', 'test', '2021-06-11', '16:00:18', NULL, NULL),
	(75, 19, 21, 'test masgoret', 'test', '2021-06-11', '16:00:18', NULL, NULL),
	(86, 21, 22, 'test', '\n	teste\n', '2021-06-04', '11:53:13', NULL, NULL),
	(87, 21, 21, 'test', '\n	teste\n', '2021-06-04', '11:53:13', NULL, NULL),
	(88, 21, 21, 'test', '\n	teste\n', '2021-06-04', '11:53:13', NULL, NULL),
	(89, 21, 21, 'test', '\n	teste\n', '2021-06-04', '11:53:13', NULL, NULL),
	(90, 21, 21, 'test', '\n	teste\n', '2021-06-04', '11:53:13', NULL, NULL);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.news: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`id`, `title`, `content`, `image`, `date`) VALUES
	(19, 'AMD patenta la tecnología FidelityFX, pero no como tú piensa', '\n	\n		No hay duda que el DLSS se ha convertido en uno de los valores diferenciales a favor de NVIDIA, dado que esta t&eacute;cnica de super resoluci&oacute;n a trav&eacute;s de inteligencia artificial permite conseguir mayores resoluciones de las im&aacute;genes. Lo cual es gracias a la implementaci&oacute;n de los Tensor Cores y AMD podr&iacute;a tener su propia implementaci&oacute;n seg&uacute;n una patente.\n\n\n	\n		Antes de nada hemos de aclarar que se trata de una patente incompleta, ya que no es posible por el momento acceder a las im&aacute;genes que la acompa&ntilde;an y que resultan esenciales para la total comprensi&oacute;n de la misma. Hay que recordar que una patente describe primero los componentes de una tecnolog&iacute;a o servicio, para luego explicar su funcionamiento a trav&eacute;s de la relaci&oacute;n entre componentes. Lo cual hace a trav&eacute;s de referencias numeradas a los dibujos de la misma.\n	\n		Por lo que esperamos una versi&oacute;n completa de la patente de AMD para poder tratarla con m&aacute;s detalle.\n\n\n	&nbsp;\n', '397e8-captura.png', '2021-05-18'),
	(20, 'NVIDIA lanza nuevos drivers para Days Gone y sus GPUs RTX 30', '\n	\n		\n			Que exista una nueva actualizaci&oacute;n de los drivers gr&aacute;ficos de NVIDIA no nos resulta una sorpresa, ya que siempre que sale un juego puntero en PC y/o el lanzamiento de una de sus nuevas tarjetas gr&aacute;ficas NVIDIA aprovecha para actualizarlos. Esta vez se trata de la versi&oacute;n 466.47 WHQL de los drivers de NVIDIA, incluye los perfiles para el reci&eacute;n lanzado Days Gone y las tarjeta gr&aacute;ficas RTX 30 LHR.\n	\n	\n		\n			El nuevo driver de NVIDIA est&aacute; optimizado para uno de los mejores juegos de PlayStation de los &uacute;ltimos a&ntilde;os,&nbsp;Days Gone, el cual recomendamos desde aqu&iacute; jugar, ya que es una de las mejores experiencias en videojuegos de los &uacute;ltimos a&ntilde;os.\n	\n\n\n	&nbsp;\n', 'adc37-captura.png', '2021-05-19'),
	(21, 'Filtran la NVIDIA RTX 3090 Ti, ¿real o fake? Todo sobre esta nueva GPU', '\n	\n		Con todas las NVIDIA RTX 30, desde la RTX 3050 a la RTX 3080 recibiendo una versi&oacute;n Ti para este a&ntilde;o excepto la RTX 3090, ya nos parec&iacute;a extra&ntilde;o que la tarjeta gr&aacute;fica tope de gama de NVIDIA no tuviese su versi&oacute;n Ti. Pues bien, parece ser que s&iacute; que vamos a ver una NVIDIA RTX 3090 Ti, algo que en el fondo no nos deber&iacute;a sorprender ya que hab&iacute;an indicios de ello.\n\n\n	\n		Hace unos meses en HardZone publicamos un art&iacute;culo en el que hablamos de los motivos por los cuales pensamos que una&nbsp;RTX 3090 Ti&nbsp;podr&iacute;a ser posible, pero en las &uacute;ltimas horas ha aparecido una noticia que le a&ntilde;ade m&aacute;s validez a nuestras predicciones sobre la existencia de una RTX 30 m&aacute;s potente.\n\n\n	&nbsp;\n', '0686d-captura.png', '2021-05-20'),
	(22, 'El precio de las NVIDIA RTX 30 se dispara: hasta el triple de su MSRP', '\n	\n		A estas alturas todos somos conscientes de que la&nbsp;escasez de componentes&nbsp;est&aacute; provocando que apenas veamos&nbsp;tarjetas gr&aacute;ficas&nbsp;en los estantes de las tiendas, y que el precio de &eacute;stas en el mercado de segunda mano se haya disparado. Lo que no esper&aacute;bamos ver es la situaci&oacute;n que vivimos ahora, en la que especialmente las&nbsp;NVIDIA RTX 30 Series&nbsp;llegan a costar el&nbsp;triple de su MSRP&nbsp;incluso compr&aacute;ndolas directamente en tiendas de Europa.\n\n\n	\n		Parece que todo el mundo se est&aacute; aprovechando de los&nbsp;problemas de suministro de GPUs, pero debido a una mayor demanda en comparaci&oacute;n con la oferta de AMD, los precios de las GPUs NVIDIA RTX 30 Series se ha disparado mucho m&aacute;s en comparaci&oacute;n. Las AMD Radeon RX 6000 han sido escasas en t&eacute;rminos de suministro, pero siempre ha habido &laquo;algo&raquo; de stock desde el principio. Podemos ver a trav&eacute;s de las cifras de ventas que NVIDIA ha podido enviar m&aacute;s GPUs RTX 30 que AMD sus gr&aacute;ficas RDNA 2 y, a pesar de ello, el&nbsp;precio de las GPUs de NVIDIA&nbsp;es el que se ha disparado ahora hasta el triple de lo que deber&iacute;an costar.\n\n\n	&nbsp;\n', 'e991d-captura.png', '2021-05-21'),
	(23, 'Así es Navi 24 «Beige Goby», la pequeña de las GPU RX 6000 de AMD', '\n	\n		La familia de GPUs Navi 2x, basadas en la arquitectura RDNA 2 de AMD, va a tener un cuarto integrante, el cual se va a situar en la parte m&aacute;s baja de toda la gama. Su nombre en clave es Beige Goby aunque tambi&eacute;n es conocida como Navi 24 y en las &uacute;ltimas horas hemos podido saber sus especificaciones.\n\n\n	\n		Existe un mercado dentro de los ordenadores port&aacute;tiles para GPUs dedicadas de gama baja, dicho mercado no requiere las potentes tarjetas gr&aacute;ficas para gaming, pero se ven limitados por las GPUs integradas que suelen integrar los SoCs para PC. A dicho mercado es donde va dirigido Beige Goby o Navi 24, la peque&ntilde;a de las RDNA 2 de AMD, que bien podr&iacute;a aparecer bajo el nombre comercial de AMD Radeon RX 6400.\n	\n		Beige Goby, la m&aacute;s modesta de las RX 6000\n	\n		\n			\n				\n					Oh interesting, Beige Goby appears to be Navi24.\n					It just has 1 SDMA engine, usually dGPUs have 2, 16MiB Infinity Cache/Last Level Cache.\n					128KiB L1$ is shared under 4 WGPs/8CUs.\n					1MB L2$.\n					1 Shader Engine with 2 Shader Arrays would only result in 8WGPs/16 CUs = 1024 Shader Cores.&nbsp;https://t.co/zJ9cbAexis\n				\n					&mdash; Locuza (@Locuza_)&nbsp;May 12, 2021\n			\n		\n	\n	\n		&nbsp;\n	\n		Hace unos d&iacute;as apareci&oacute; en los drivers para Linux de las GPUs de AMD la menci&oacute;n de una nueva GPU bajo el&nbsp;nombre en clave &laquo;Beige Goby&raquo;, la cual se ha confirmado que corresponde a&nbsp;Navi 24, la menos potente de las RX 6000 o RDNA 2 de AMD. No olvidemos que la nomenclatura de las GPUs de AMD va m&aacute;s potente a menos potente en lo que a la relaci&oacute;n con la numeraci&oacute;n se refiere.\n\n\n	&nbsp;\n', '30890-captura.png', '2021-05-22'),
	(24, '¡Por fin! Estas son las primeras fotos de las GPUs Intel Arctic Sound', '\n	\n		Xe-HP&nbsp;ha sido uno de los productos con los que&nbsp;Intel&nbsp;m&aacute;s ha &laquo;coqueteado&raquo; en los &uacute;ltimos a&ntilde;os. El propio Raja Koduri lleva trabajando en las GPUs Xe-HP desde hace bastante tiempo, pero hasta la fecha no hab&iacute;amos escuchado nada sobre la posible fecha de lanzamiento de estos productos, ni tampoco sobre los detalles de su arquitectura en s&iacute; o sus especificaciones. Esto va a cambiar y ahora vamos a poder aprender mucho m&aacute;s sobre las pr&oacute;ximas GPUs&nbsp;Intel Arctic Sound, porque se han publicado las primeras&nbsp;im&aacute;genes reales&nbsp;de los productos ya terminados.\n\n\n	\n		Se ha revelado que la arquitectura gr&aacute;fica Intel Xe-HP tiene m&aacute;s unidades de ejecuci&oacute;n de las que se inform&oacute; al principio; a diferencia de Xe-LP, que se ha implementado en las iGPU de Tiger Lake y en las DG1 y que tienen hasta 96 EUs, las Intel Xe-HP cuentan con hasta 512 EU. Ya sabemos que habr&aacute; al menos tres variantes: 1T, 2T y 4T, y los tres modelos enumerados han sido ahora confirmados con im&aacute;genes reales e incluso especificaciones t&eacute;cnicas.\n	\n		Intel Arctic Sound 1T y 2T al descubierto\n	\n		Intel Arctic Sound 1T&nbsp;se refiere a una configuraci&oacute;n de un tile y que cuenta con 512 EU, pero este modelo tiene una parte del silicio gr&aacute;fico deshabilitado, y concretamente este modelo cuenta con 384 EUs habilitadas. Si asumimos que la arquitectura Xe sigue el mismo principio que las generaciones anteriores, entonces podr&iacute;amos decir que este modelo tiene 3.072 Shader (ALUs, n&uacute;cleos o como quieran llamarlos al final).\n\n\n	&nbsp;\n', 'c0b6e-captura.png', '2021-05-18'),
	(25, 'AMD cumpliría su amenaza: este sería el rendimiento de sus nuevas GPU', '\n	\n		Que AMD va a lanzar una gama Radeon RX 7000 no es ning&uacute;n secreto, tampoco lo es el hecho que RDNA 3 est&eacute; en desarrollo y ser&aacute; la arquitectura en la que se basar&aacute;n dichas tarjetas gr&aacute;ficas. Aunque a&uacute;n falta un a&ntilde;o para que AMD lance RDNA 3, ya empiezan a salir rumores de rendimiento de tarjetas como la RX 7900 XT. &iquest;Ser&aacute; esta vez la definitiva para AMD?\n\n\n	\n		RDNA 2 ha sido una arquitectura ganadora para AMD, no solo por el hecho de que sus GPUs tienen un muy buen rendimiento para los juegos de PC, sino porque le ha permitido a AMD entrar en los&nbsp;SoC de las consolas de nueva generaci&oacute;n. Pero la competencia es feroz, especialmente teniendo a NVIDIA delante y los del Radeon Technology Group no se pueden dormir en los laureles.\n\n\n	&nbsp;\n', 'a8bb7-captura.png', '2021-05-19'),
	(26, '¿Tiene mejor rendimiento una GPU por tener más TFLOPs que otra?', '\n	\n		Los fabricantes de GPU se han acostumbrado a hablar de la potencia de c&aacute;lculo de las unidades shader de sus GPU. Sean NVIDIA, AMD, Intel o cualquier otro. Pero los TFLOPS no son todo lo que mide la potencia de una GPU y se trata m&aacute;s bien de una m&eacute;trica de marketing. Os explicamos los motivos.\n\n\n	\n		Algo que se ha convertido en una costumbre es vender las tarjetas gr&aacute;ficas a trav&eacute;s de la cantidad de TFLOPS te&oacute;ricos que pueden realizar. Una m&eacute;trica la cual puede tener sentido para comparar modelos dentro de una misma arquitectura, pero que no sirve para medir de manera precisa arquitecturas anteriores e incluso de otras marcas.\n	\n		&iquest;Qu&eacute; miden los TFLOPS de una GPU?&nbsp;\n	\n		&nbsp;\n	\n		El t&eacute;rmino FLOPS significa Floating (point) Operations Per Second, lo que traducido al espa&ntilde;ol es Operaciones en punto flotante por segundo. Por lo que se trata de una tasa de velocidad, ya que esta medida respecto al tiempo.\n	\n		&iquest;Pero que es una operaci&oacute;n? Muchos la suelen confundir con instrucci&oacute;n cuando no es lo mismo. Una instrucci&oacute;n completa ha de seguir el ciclo de instrucci&oacute;n y por tanto necesita pasar por todo el ciclo de instrucci&oacute;n para completarse. Una operaci&oacute;n en cambio es lo que hace una unidad de ejecuci&oacute;n en cada ciclo, independientemente de si se completa una instrucci&oacute;n o no.\n	\n		Cuando nos dan la tasa de FLOPS lo hacen teniendo en cuenta condiciones completamente irreales si tenemos en cuenta si tenemos en cuenta como se ejecuta un programa, las cuales son las siguientes:\n	\n		\n			Se basan en repetir de manera incesante la instrucci&oacute;n m&aacute;s r&aacute;pida de ejecutar en n&uacute;mero de ciclos y la que saca m&aacute;s operaciones por ciclo de reloj, la llamada FMA donde se realiza una suma de dos n&uacute;meros y se multiplica por un tercero. Lo cual no ocurre en ning&uacute;n programa, incluidos los programas shader.\n		\n			Los datos no siempre se encuentran en los registros de la Unidad Shader o Compute Unit, lo que fuerza en la realidad a retrasar dicha instrucci&oacute;n y adelantar otras.\n		\n			No todas las instrucciones requieren la misma cantidad de ciclos de reloj para ejecutarse.\n		\n			Supone que todas las unidades shader est&aacute;n ocupadas y trabajando, por lo que no existen burbujas y tiempos muertos.\n	\n\n\n	&nbsp;\n', 'bb2dc-captura.png', '2021-05-20'),
	(27, 'Así sería la nueva GPU gaming TOP de NVIDIA, RTX 3090 Ti, con ¿48 GB?', '\n	Hace tan solo unos d&iacute;as NVIDIA lanz&oacute; el comunicado oficial sobre sus nuevas tarjetas gr&aacute;ficas y como tal, el mercado de la miner&iacute;a con GPUs va a ser muy mermado de aqu&iacute; en adelante por las restricciones impuestas por hardware y software. Pero la compa&ntilde;&iacute;a no dio ni un solo detalle de una GPU que muchos esperan y que de momento solo es un rumor: la RTX 3090 Ti, &iquest;qu&eacute; hay de esta gr&aacute;fica y qu&eacute; se espera de ella?\n\n	&nbsp;\n\n	Hay mucho rumor suelto, mucha filtraci&oacute;n que, de momento, no tiene ning&uacute;n argumento m&iacute;nimamente v&aacute;lido. Pero es que el hermetismo est&aacute; siendo bastante abrupto en esta ocasi&oacute;n y, por ejemplo, podemos decir algo similar de otros modelos de los cuales hemos hablado en el pasado y que de momento no son una realidad, aunque ya s&iacute; hay cosas tangibles. La RTX 3080 Ti y RTX 3070 Ti est&aacute;n a la vuelta de la esquina y sabemos mucho sobre ellas, pero &iquest;c&oacute;mo ser&aacute; la RTX 3090 Ti?\n\n	&nbsp;\n', '500c6-noticia.png', '2021-05-24');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

-- Volcando estructura para vista bitbit.qrynomusuari
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `qrynomusuari` (
	`id` INT(11) UNSIGNED NOT NULL,
	`username` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`group_id` MEDIUMINT(8) UNSIGNED NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla bitbit.status
CREATE TABLE IF NOT EXISTS `status` (
  `id_estatus` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.status: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`id_estatus`, `desc`) VALUES
	(1, 'En espera'),
	(2, 'Reparant'),
	(3, 'Finalitzat'),
	(4, 'A la espera de material');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.tasques
CREATE TABLE IF NOT EXISTS `tasques` (
  `id_tasca` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) unsigned NOT NULL,
  `id_inci` int(11) unsigned NOT NULL,
  `desc` longtext NOT NULL,
  `accions` longtext DEFAULT NULL,
  `start_date` date NOT NULL DEFAULT curdate(),
  `start_hour` time DEFAULT curtime(),
  `end_date` date DEFAULT NULL,
  `end_hour` time DEFAULT NULL,
  `canvas` longtext DEFAULT NULL,
  PRIMARY KEY (`id_tasca`),
  KEY `id_user` (`id_user`),
  KEY `id_inci` (`id_inci`),
  CONSTRAINT `FK_tasques_inci` FOREIGN KEY (`id_inci`) REFERENCES `incidencies` (`id_inci`) ON DELETE CASCADE,
  CONSTRAINT `FK_tasques_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.tasques: ~46 rows (aproximadamente)
/*!40000 ALTER TABLE `tasques` DISABLE KEYS */;
INSERT INTO `tasques` (`id_tasca`, `id_user`, `id_inci`, `desc`, `accions`, `start_date`, `start_hour`, `end_date`, `end_hour`, `canvas`) VALUES
	(4, 19, 1, '\n	Cambiar font d&#39;alimentaci&oacute;\n\n	&nbsp;\n', '', '2021-05-07', '21:59:09', NULL, NULL, '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'),
	(5, 19, 6, '<p>\n	Cambiar font d\'alimentació</p>\n<p>\n	&nbsp;</p>\n', '', '2021-05-07', '21:59:09', NULL, NULL, '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'),
	(6, 19, 1, '<p>\n	Cambiar la RAM</p>\n<p>\n	&nbsp;</p>\n', '', '2021-05-18', '21:59:09', NULL, NULL, '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'),
	(8, 19, 1, '<p>\n	Cambiar GPU</p>\n<p>\n	&nbsp;</p>\n', '<p>S\'ha modificat la GPU</p>', '2021-05-18', '21:59:09', NULL, NULL, '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'),
	(9, 19, 1, '<p>\n	Cambiar ventilació</p>\n<p>\n	&nbsp;</p>\n', NULL, '2021-05-18', '21:59:09', NULL, NULL, NULL),
	(20, 19, 1, '<p>\n	Cambiar procesador</p>\n<p>\n	&nbsp;</p>\n', NULL, '2021-05-10', '21:59:09', NULL, NULL, NULL),
	(21, 19, 1, '<p>\n	Ampliar memoria</p>\n<p>\n	&nbsp;</p>\n', '', '2021-05-14', NULL, NULL, NULL, ''),
	(35, 19, 27, '\n	El client es queixa de que la pantalla parpadeja depenent de la posicio en la que esta, es te que comprovar que el cable fins la pantalla estigui ben conectat\n', '<p>S\'ha desmontat el portatil per a veure la situacio del cable, el cable no feia bona conexio, s\'han fet algunes proves, la pantalla ja no parpadeja.</p>', '2021-05-24', '16:33:22', NULL, NULL, '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'),
	(36, 19, 27, '\n	test\n', NULL, '2021-06-10', '16:49:46', NULL, NULL, NULL),
	(37, 19, 27, '\n	test\n', NULL, '2021-06-10', '16:50:25', NULL, NULL, NULL),
	(38, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(39, 19, 20, '\n	tetetet\n', NULL, '2021-06-10', '16:53:10', NULL, NULL, NULL),
	(40, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(41, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(42, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(43, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(44, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(45, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(46, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(47, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(48, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(49, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(50, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(51, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(52, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(53, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(54, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(55, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(56, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(57, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(58, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(59, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(60, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(61, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(62, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(63, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(64, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(65, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(66, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(67, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(68, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(69, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(70, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(71, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(72, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL),
	(73, 19, 27, '\n	tetete\n', NULL, '2021-06-10', '16:52:47', NULL, NULL, NULL);
/*!40000 ALTER TABLE `tasques` ENABLE KEYS */;

-- Volcando estructura para vista bitbit.tasques_tecnic
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `tasques_tecnic` (
	`id_tasca` INT(11) UNSIGNED NOT NULL,
	`status` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`id_inci` INT(11) UNSIGNED NOT NULL,
	`id_user` INT(11) UNSIGNED NOT NULL,
	`desc` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`accions` LONGTEXT NULL COLLATE 'utf8mb4_general_ci',
	`start_date` DATE NOT NULL,
	`end_date` DATE NULL,
	`canvas` LONGTEXT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista bitbit.tasques_tecnic_app
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `tasques_tecnic_app` (
	`id_tasca` INT(11) UNSIGNED NOT NULL,
	`status` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`id_inci` INT(11) UNSIGNED NOT NULL,
	`id_user` INT(11) UNSIGNED NOT NULL,
	`desc` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`accions` LONGTEXT NULL COLLATE 'utf8mb4_general_ci',
	`start_date` DATE NOT NULL,
	`end_date` DATE NULL,
	`canvas` LONGTEXT NULL COLLATE 'utf8mb4_general_ci',
	`marca` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para tabla bitbit.tipus_consulta
CREATE TABLE IF NOT EXISTS `tipus_consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consulta` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.tipus_consulta: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipus_consulta` DISABLE KEYS */;
INSERT INTO `tipus_consulta` (`id`, `consulta`) VALUES
	(0, 'Solicitar nova reparació'),
	(1, 'Problemes amb la visualització del stat de reparació'),
	(2, 'Solicitar una reunió');
/*!40000 ALTER TABLE `tipus_consulta` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.tokens
CREATE TABLE IF NOT EXISTS `tokens` (
  `tokenid` varchar(36) NOT NULL,
  `subject` varchar(36) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`tokenid`,`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.tokens: ~23 rows (aproximadamente)
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` (`tokenid`, `subject`, `expiration`) VALUES
	('01055d27-3337-512f-b312-6fe34418ee26', 'secure.jwt.daw.local', 1623445337),
	('0505c3d7-2f87-5b45-b4c7-7f0ffa73acff', 'secure.jwt.daw.local', 1623445247),
	('07b5e0cd-c8ba-5dac-b972-62a978f1d122', 'secure.jwt.daw.local', 1623445252),
	('0ac9d2ba-6e9f-51cb-b72d-3f721a47d02c', 'secure.jwt.daw.local', 1623445335),
	('1098ad3a-38f5-5d9c-bc3d-db86fcfce3be', 'secure.jwt.daw.local', 1623445187),
	('10a4b7d3-e507-5665-afcb-ec39f1318890', 'secure.jwt.daw.local', 1623445246),
	('18d4bee5-3de7-5978-9d74-c8c253ff5b7c', 'secure.jwt.daw.local', 1623445191),
	('1a92d784-5bf1-5223-a057-9d308e7b8f51', 'secure.jwt.daw.local', 1623445303),
	('22db631c-e311-56cd-9944-69ef51727381', 'secure.jwt.daw.local', 1623445189),
	('37c8eed4-1e73-583c-98e8-085530ae7f54', 'secure.jwt.daw.local', 1623445251),
	('439da3b3-0681-5ddd-ae40-388db8d85c67', 'secure.jwt.daw.local', 1623445188),
	('6076d75b-15ff-54d0-a4c5-7c881d1caaaa', 'secure.jwt.daw.local', 1623445246),
	('670bf283-0398-5a48-abe1-d98b9c683eac', 'secure.jwt.daw.local', 1623445245),
	('6d4aec67-8483-5087-96a6-21f6631f6f43', 'secure.jwt.daw.local', 1623445243),
	('84d17cf5-84f2-5924-a9bf-b25e7731cbb9', 'secure.jwt.daw.local', 1623445302),
	('b4fe1048-49bb-5a34-ac53-10a9964b9469', 'secure.jwt.daw.local', 1623445333),
	('ba91bbe7-c371-5e03-97d2-5442647d5ba7', 'secure.jwt.daw.local', 1623445249),
	('bf16c3cf-3f0f-5b17-8a58-723332d1675c', 'secure.jwt.daw.local', 1623445354),
	('c4b36598-1af9-576a-ac65-5ddf6dfef42e', 'secure.jwt.daw.local', 1623445355),
	('c7f5672f-df0f-5c0d-91b2-d818a788fa2e', 'secure.jwt.daw.local', 1623445250),
	('cc9a0c3f-3ca5-538c-858b-1e2ea46a118b', 'secure.jwt.daw.local', 1623445244),
	('d01059aa-b056-5d8b-8e0e-c3701a0a6da1', 'secure.jwt.daw.local', 1623445338),
	('ee6cacd5-35ac-5fe0-b7fc-eb9b68bdd9b9', 'secure.jwt.daw.local', 1623445190),
	('f2867583-08b1-585b-92ef-1acfdc32aa2a', 'secure.jwt.daw.local', 1623445248);
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_email` (`email`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  UNIQUE KEY `uc_remember_selector` (`remember_selector`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.users: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `city`) VALUES
	(19, '::1', 'tecnic', '$2y$10$TC/JcRgl4OlgQWe8bfecTOIvsj5dVjtdaiptLApFFzk9z3yOJdbNi', 'tecnic@tecnic.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620814433, 1623442909, 1, 'tecnic', 'tecnic', '', NULL, 'test'),
	(20, '::1', 'admin', '$2y$10$kkhDR3aKoCUqxIUGPmI/cOk1aOFzSrUM6xd75oVY8VqoxLTkdRgrS', 'admin@admin.comm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620814495, 1622914720, 1, 'admin', 'admin', 'admin', NULL, 'admin'),
	(21, '::1', 'user', '$2y$10$6CYfjRdPmKkOZ3292WEMcugoWK13xFd6az2VW2Wr3heUm1jvkowW.', 'user@user.commm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620814520, 1623444490, 1, 'user', 'user', 'user', '', 'user'),
	(22, '::1', 'gestor', '$2y$10$9g65AByvczLx.4fK6ebFeej5/VcTHEjP3hndeSkFJin758YDf0kiy', 'gestor@gestor.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620814555, 1623336567, 1, 'gestor', 'gestor', 'gestor', NULL, 'gesto');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.users_groups
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.users_groups: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
	(9, 19, 3),
	(10, 20, 1),
	(11, 21, 4),
	(12, 22, 2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;

-- Volcando estructura para vista bitbit.inci_user_app
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `inci_user_app`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `inci_user_app` AS SELECT incidencies.id_inci,status.`desc`,incidencies.id_user_propietari, incidencies.nom_propietari, incidencies.marca, incidencies.model, incidencies.numero_serie, incidencies.tlf, incidencies.desc_averia,incidencies.diagnosis_prev, incidencies.entry_date,incidencies.out_date FROM incidencies INNER JOIN status ON incidencies.id_estat = status.id_estatus ;

-- Volcando estructura para vista bitbit.mail_username
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `mail_username`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `mail_username` AS SELECT messages.id_msg,users.username AS `from`,messages.`to`,messages.about,messages.content  FROM messages INNER JOIN users
ON messages.from = users.id ;

-- Volcando estructura para vista bitbit.qrynomusuari
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `qrynomusuari`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `qrynomusuari` AS SELECT users.id, users.username ,users_groups.group_id FROM users INNER JOIN users_groups ON users.id = users_groups.user_id WHERE group_id!=4 ;

-- Volcando estructura para vista bitbit.tasques_tecnic
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `tasques_tecnic`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `tasques_tecnic` AS SELECT id_tasca,status.`desc` 'status', tasques.id_inci, id_user, tasques.`desc`, accions,start_date, end_date, canvas FROM tasques INNER JOIN incidencies ON tasques.id_inci=incidencies.id_inci INNER JOIN status ON incidencies.id_estat=status.id_estatus ;

-- Volcando estructura para vista bitbit.tasques_tecnic_app
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `tasques_tecnic_app`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `tasques_tecnic_app` AS SELECT id_tasca,status.`desc` 'status', tasques.id_inci, id_user, tasques.`desc`, accions, tasques.start_date,  tasques.end_date, canvas, incidencies.marca FROM tasques INNER JOIN incidencies ON tasques.id_inci=incidencies.id_inci INNER JOIN status ON incidencies.id_estat=status.id_estatus ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.consultes: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `consultes` DISABLE KEYS */;
INSERT INTO `consultes` (`id`, `id_consulta`, `nom`, `email`, `assumpte`, `contingut`, `date`) VALUES
	(1, 0, 'nom', 'mail', 'topic', 'contiin', '2021-05-04'),
	(2, 2, 'sample', 'sample@sample.com', 'sample ', 'sampleee', '2021-05-04'),
	(3, 2, 'bruno', 'bruno@bruno.com', 'helo', 'asd', '2021-05-05');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.documents_tasques: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `documents_tasques` DISABLE KEYS */;
INSERT INTO `documents_tasques` (`id_document`, `id_tasca`, `image`, `path`) VALUES
	(1, 4, '33698aa64c68452511dc13909adeeb9b.png', ''),
	(2, 4, 'fdbb9e073f8ccbf6471f3a415a26d7e8.gif', ''),
	(3, 4, '5bb878849da758dfb6fa9da6715f08d3.jpg', 'assets/test/uploads/incidencies/1'),
	(4, 4, '14396338e01acd39002fa8fe7f673ae1.jpg', 'assets/test/uploads/incidencies/1'),
	(5, 4, '2c3b676449e06cfe170db3a05d13f6d0.jpg', 'assets/test/uploads/incidencies/1');
/*!40000 ALTER TABLE `documents_tasques` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.incidencies: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `incidencies` DISABLE KEYS */;
INSERT INTO `incidencies` (`id_inci`, `id_estat`, `id_user_propietari`, `nom_propietari`, `marca`, `model`, `numero_serie`, `tlf`, `desc_averia`, `diagnosis_prev`, `uuid`, `entry_date`, `entry_hour`, `out_date`, `out_hour`) VALUES
	(1, 1, 15, 'asd', 'XIAOMI', 'model test', '123423411424', 'asd', '<p>\n	&nbsp;SHAH SDASH KJSH DKAH AKSH AKSDHJ AKDHJ AKSJDH ASKDH JASKD HSKJ DHASDK HJK JASKHJDKJHDKJASHDKAJSH&nbsp; HJKAS HD SAD AD AD&nbsp; DA D D ASDA DA D&nbsp; SDASDADFAS F SDFSD FSD FF SA FSD FSA FSAD FSF SD FS FSDF SD FSDF S SDFS ADFSD FS DFS DFS DFS DFSD FS DFS DFS FDSDF S</p>\n', '', 'd7a39daf641b4679a87c2b6a691ef1ce', '2021-05-19', '00:00:00', '2021-05-11', NULL),
	(6, 1, 15, 'etafd', 'LENOVO', 'model test', '1241243324', 'as198723', '<p>\n	ajshdkjfsh</p>\n', '<p>\n	akjhdakjsh</p>\n', '', '2021-05-17', '00:00:00', '2021-05-02', NULL),
	(8, 1, 15, '1234', 'ASUS', 'model test', '312412433124', '1234', '<p>\n	123</p>\n', '<p>\n	123</p>\n', '', '2021-05-17', '00:00:00', '2021-05-08', NULL),
	(17, 1, 15, 'Sergi', 'HP', 'model test', '2142144245343543', '564564', '<p>\n	ASD AFASF&nbsp;</p>\n', '<p>\n	ASD SAADS&nbsp;</p>\n', 'a2de7ff3c713430cb17c95782ea06203', '2021-05-10', '00:00:00', NULL, NULL),
	(18, 1, 15, '123', '123', 'model test', '123', '123', '<p>\n	123</p>\n', '<p>\n	13</p>\n', '5b850d8b39e545129986f8afb1128be0', '2021-05-10', '00:00:00', NULL, NULL),
	(19, 1, 15, 'TEST', 'ACER', 'NITRO 5', 'JAISUDFASLJKH FKH F', '1235465343', '<p>\n	12354864645</p>\n', '<p>\n	123A5D6564AS65 456DA4&nbsp;</p>\n', 'b949b7131d3a49c3bb1e767f01d5281a', '2021-05-11', '00:00:00', NULL, NULL),
	(20, 1, 18, 'JOEL', 'PATATA', 'FRITA', '123KJH31', '1325324', '<p>\n	123414HJKGK4JH12G3JH</p>\n', '<p>\n	12JH34G12JKH</p>\n', '9533382c95ee42d391a8e57a6594284e', '2021-05-11', '00:00:00', NULL, NULL),
	(21, 1, 15, 'jkashf ', 'jskdhf a', 'kjhsa dkfj ', 'jkh', 'kj hkjh', '<p>\n	kjhsdfkjhasfkjh</p>\n', '<p>\n	lksjhadfkjhaf&nbsp;</p>\n', 'd6a39daf641b4679a87c2b6a691ef1ce', '2021-05-11', '00:00:00', NULL, NULL),
	(22, 1, 15, 'dasd', 'asdasd', 'asdad', 'asdasdasd', 'asdasd', '<p>\n	asd</p>\n', '<p>\n	asd</p>\n', '5402b14d62f54cc087f62490e5fb28a8', '2021-05-11', '00:00:00', NULL, NULL),
	(23, 1, 18, 'asd', 'asd', 'asd', 'asd', 'asd', '<p>\n	asd</p>\n', '<p>\n	asd</p>\n', 'b00cf224c3b04e69b309cc93a463e242', '2021-05-11', '00:00:00', NULL, NULL),
	(24, 1, 18, 'asdasd a', 'asd ', ' asd', 'as d', 'as das d', '<p>\n	asd asd</p>\n', '<p>\n	as dasd&nbsp;</p>\n', '8571bf8c5a594ae5a1bc8a1d27665c7a', '2021-05-11', '00:00:00', NULL, NULL);
/*!40000 ALTER TABLE `incidencies` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.login_attempts
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.login_attempts: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
	(17, '::1', 'sergi', 1621274376),
	(18, '::1', 'administrador', 1621274378),
	(19, '::1', 'test', 1621343756),
	(21, '::1', 'test', 1621345229),
	(22, '::1', 'test', 1621345233);
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.materials
CREATE TABLE IF NOT EXISTS `materials` (
  `id_mat` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL DEFAULT '0',
  `descri` longtext NOT NULL,
  `num_serie` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_mat`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.materials: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` (`id_mat`, `nom`, `descri`, `num_serie`, `amount`) VALUES
	(2, 'RAM CRUCIAL 16 GB 3200Mhz ', 'RAM CRUCIAL 16 GB 3200Mhz ', '65464321654', 20),
	(3, 'RAM CRUCIAL 8 GB 3200Mhz ', 'RAM CRUCIAL 8 GB 3200Mhz ', '2342352', 20),
	(4, 'RAM CRUCIAL 16 GB 4200Mhz ', 'RAM CRUCIAL 16 GB 4200Mhz ', '4564564345', 20),
	(5, 'RAM CRUCIAL 8 GB 4200Mhz ', 'RAM CRUCIAL 8 GB 4200Mhz ', '6546432165412414', 20),
	(6, 'i9 9900k', 'i9 9900k', '4352', 20);
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
  CONSTRAINT `FK_mat_inci_incidencies` FOREIGN KEY (`id_inci`) REFERENCES `incidencies` (`id_inci`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.mat_inci: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `mat_inci` DISABLE KEYS */;
INSERT INTO `mat_inci` (`id_mat_inci`, `id_mat`, `id_inci`, `amount`) VALUES
	(1, 2, 1, 1),
	(2, 2, 1, 1),
	(3, 6, 1, 1),
	(4, 2, 1, NULL),
	(5, 2, 1, NULL),
	(6, 4, 1, NULL),
	(7, NULL, 1, NULL),
	(8, 4, 1, NULL),
	(9, 2, 1, 1),
	(10, 2, 1, 1),
	(11, NULL, 1, 0),
	(12, 2, 1, 1),
	(13, 4, 1, 1),
	(14, 4, 1, 1),
	(15, 4, 1, 1),
	(16, 2, 1, 1),
	(17, 2, 1, 1),
	(18, NULL, 1, 0),
	(19, 2, 1, 1),
	(20, 4, 6, 1);
/*!40000 ALTER TABLE `mat_inci` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id_msg` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(100) CHARACTER SET utf8 NOT NULL,
  `to` varchar(50) CHARACTER SET utf8 NOT NULL,
  `about` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `send_date` date NOT NULL,
  `send_hour` time NOT NULL,
  `recive_date` date DEFAULT NULL,
  `recive_hour` time DEFAULT NULL,
  PRIMARY KEY (`id_msg`),
  KEY `FK_messages_users` (`from`),
  KEY `FK_messages_users_2` (`to`),
  CONSTRAINT `FK_messages_users` FOREIGN KEY (`from`) REFERENCES `users` (`username`),
  CONSTRAINT `FK_messages_users_2` FOREIGN KEY (`to`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.messages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.news: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`id`, `title`, `content`, `image`, `date`) VALUES
	(10, 'Noticia 1', '<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue sem sed hendrerit gravida. Nunc dictum arcu at nisl hendrerit interdum et porta arcu. Integer viverra interdum egestas. Sed vitae rhoncus turpis. Vestibulum nec magna felis. Suspendisse sit amet malesuada nibh. Sed nunc metus, scelerisque non diam eu, tempus tincidunt nulla. Maecenas convallis convallis velit, in commodo nunc suscipit nec.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Quisque placerat suscipit augue a finibus. Morbi odio urna, maximus a gravida non, semper efficitur risus. Nulla facilisi. Nullam id fringilla dui. Aenean tempor lorem finibus, vehicula erat pretium, mollis erat. Vestibulum non iaculis sapien. Quisque id maximus arcu. Morbi blandit risus at lorem cursus posuere. Suspendisse semper tortor orci.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Pellentesque interdum pretium neque quis semper. Morbi non velit non odio tincidunt condimentum vitae ut odio. Quisque metus est, pulvinar eu convallis sit amet, dictum quis velit. Nunc luctus accumsan ipsum, non placerat enim accumsan nec. Nullam accumsan convallis nulla, vel porttitor dolor vehicula non. Nunc non rhoncus mi. Vestibulum tincidunt, nunc vel molestie suscipit, orci justo blandit sem, a malesuada neque dolor a risus.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Donec viverra finibus pellentesque. Vestibulum turpis diam, sagittis vel ante aliquam, placerat tristique sapien. Suspendisse a quam dolor. Donec posuere nec neque pretium luctus. Aliquam vel ex vestibulum, scelerisque nunc sit amet, efficitur lorem. Vestibulum sit amet tempor purus. Phasellus quis ornare magna. In sed cursus ante. Morbi vitae elementum urna.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Vivamus maximus nulla eu nulla volutpat euismod. Quisque varius aliquam nunc sed maximus. Proin pretium, arcu sed cursus sodales, mauris orci porttitor sapien, in tincidunt est ante vel mi. Fusce tristique malesuada viverra. Ut auctor at magna lacinia consequat. Aliquam luctus ut enim non ullamcorper. Maecenas vitae suscipit odio. Pellentesque vel tincidunt ex. Etiam dolor mi, porta tempor tempor ac, tempus sed tellus. Morbi nec laoreet tortor, in bibendum lacus. Donec vitae ante sit amet ante efficitur varius.</p>\n', '8e5cb-cpa-school-test.png', '2021-05-04'),
	(11, 'Noticia 2', '<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue sem sed hendrerit gravida. Nunc dictum arcu at nisl hendrerit interdum et porta arcu. Integer viverra interdum egestas. Sed vitae rhoncus turpis. Vestibulum nec magna felis. Suspendisse sit amet malesuada nibh. Sed nunc metus, scelerisque non diam eu, tempus tincidunt nulla. Maecenas convallis convallis velit, in commodo nunc suscipit nec.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Quisque placerat suscipit augue a finibus. Morbi odio urna, maximus a gravida non, semper efficitur risus. Nulla facilisi. Nullam id fringilla dui. Aenean tempor lorem finibus, vehicula erat pretium, mollis erat. Vestibulum non iaculis sapien. Quisque id maximus arcu. Morbi blandit risus at lorem cursus posuere. Suspendisse semper tortor orci.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Pellentesque interdum pretium neque quis semper. Morbi non velit non odio tincidunt condimentum vitae ut odio. Quisque metus est, pulvinar eu convallis sit amet, dictum quis velit. Nunc luctus accumsan ipsum, non placerat enim accumsan nec. Nullam accumsan convallis nulla, vel porttitor dolor vehicula non. Nunc non rhoncus mi. Vestibulum tincidunt, nunc vel molestie suscipit, orci justo blandit sem, a malesuada neque dolor a risus.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Donec viverra finibus pellentesque. Vestibulum turpis diam, sagittis vel ante aliquam, placerat tristique sapien. Suspendisse a quam dolor. Donec posuere nec neque pretium luctus. Aliquam vel ex vestibulum, scelerisque nunc sit amet, efficitur lorem. Vestibulum sit amet tempor purus. Phasellus quis ornare magna. In sed cursus ante. Morbi vitae elementum urna.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Vivamus maximus nulla eu nulla volutpat euismod. Quisque varius aliquam nunc sed maximus. Proin pretium, arcu sed cursus sodales, mauris orci porttitor sapien, in tincidunt est ante vel mi. Fusce tristique malesuada viverra. Ut auctor at magna lacinia consequat. Aliquam luctus ut enim non ullamcorper. Maecenas vitae suscipit odio. Pellentesque vel tincidunt ex. Etiam dolor mi, porta tempor tempor ac, tempus sed tellus. Morbi nec laoreet tortor, in bibendum lacus. Donec vitae ante sit amet ante efficitur varius.</p>\n', '552b3-cpa-school-test.png', '2021-05-04'),
	(12, 'Noticia 3', '<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue sem sed hendrerit gravida. Nunc dictum arcu at nisl hendrerit interdum et porta arcu. Integer viverra interdum egestas. Sed vitae rhoncus turpis. Vestibulum nec magna felis. Suspendisse sit amet malesuada nibh. Sed nunc metus, scelerisque non diam eu, tempus tincidunt nulla. Maecenas convallis convallis velit, in commodo nunc suscipit nec.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Quisque placerat suscipit augue a finibus. Morbi odio urna, maximus a gravida non, semper efficitur risus. Nulla facilisi. Nullam id fringilla dui. Aenean tempor lorem finibus, vehicula erat pretium, mollis erat. Vestibulum non iaculis sapien. Quisque id maximus arcu. Morbi blandit risus at lorem cursus posuere. Suspendisse semper tortor orci.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Pellentesque interdum pretium neque quis semper. Morbi non velit non odio tincidunt condimentum vitae ut odio. Quisque metus est, pulvinar eu convallis sit amet, dictum quis velit. Nunc luctus accumsan ipsum, non placerat enim accumsan nec. Nullam accumsan convallis nulla, vel porttitor dolor vehicula non. Nunc non rhoncus mi. Vestibulum tincidunt, nunc vel molestie suscipit, orci justo blandit sem, a malesuada neque dolor a risus.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Donec viverra finibus pellentesque. Vestibulum turpis diam, sagittis vel ante aliquam, placerat tristique sapien. Suspendisse a quam dolor. Donec posuere nec neque pretium luctus. Aliquam vel ex vestibulum, scelerisque nunc sit amet, efficitur lorem. Vestibulum sit amet tempor purus. Phasellus quis ornare magna. In sed cursus ante. Morbi vitae elementum urna.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Vivamus maximus nulla eu nulla volutpat euismod. Quisque varius aliquam nunc sed maximus. Proin pretium, arcu sed cursus sodales, mauris orci porttitor sapien, in tincidunt est ante vel mi. Fusce tristique malesuada viverra. Ut auctor at magna lacinia consequat. Aliquam luctus ut enim non ullamcorper. Maecenas vitae suscipit odio. Pellentesque vel tincidunt ex. Etiam dolor mi, porta tempor tempor ac, tempus sed tellus. Morbi nec laoreet tortor, in bibendum lacus. Donec vitae ante sit amet ante efficitur varius.</p>\n', '921cd-cpa-school-test.png', '2021-05-04'),
	(13, 'Noticia 4', '<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue sem sed hendrerit gravida. Nunc dictum arcu at nisl hendrerit interdum et porta arcu. Integer viverra interdum egestas. Sed vitae rhoncus turpis. Vestibulum nec magna felis. Suspendisse sit amet malesuada nibh. Sed nunc metus, scelerisque non diam eu, tempus tincidunt nulla. Maecenas convallis convallis velit, in commodo nunc suscipit nec.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Quisque placerat suscipit augue a finibus. Morbi odio urna, maximus a gravida non, semper efficitur risus. Nulla facilisi. Nullam id fringilla dui. Aenean tempor lorem finibus, vehicula erat pretium, mollis erat. Vestibulum non iaculis sapien. Quisque id maximus arcu. Morbi blandit risus at lorem cursus posuere. Suspendisse semper tortor orci.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Pellentesque interdum pretium neque quis semper. Morbi non velit non odio tincidunt condimentum vitae ut odio. Quisque metus est, pulvinar eu convallis sit amet, dictum quis velit. Nunc luctus accumsan ipsum, non placerat enim accumsan nec. Nullam accumsan convallis nulla, vel porttitor dolor vehicula non. Nunc non rhoncus mi. Vestibulum tincidunt, nunc vel molestie suscipit, orci justo blandit sem, a malesuada neque dolor a risus.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Donec viverra finibus pellentesque. Vestibulum turpis diam, sagittis vel ante aliquam, placerat tristique sapien. Suspendisse a quam dolor. Donec posuere nec neque pretium luctus. Aliquam vel ex vestibulum, scelerisque nunc sit amet, efficitur lorem. Vestibulum sit amet tempor purus. Phasellus quis ornare magna. In sed cursus ante. Morbi vitae elementum urna.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Vivamus maximus nulla eu nulla volutpat euismod. Quisque varius aliquam nunc sed maximus. Proin pretium, arcu sed cursus sodales, mauris orci porttitor sapien, in tincidunt est ante vel mi. Fusce tristique malesuada viverra. Ut auctor at magna lacinia consequat. Aliquam luctus ut enim non ullamcorper. Maecenas vitae suscipit odio. Pellentesque vel tincidunt ex. Etiam dolor mi, porta tempor tempor ac, tempus sed tellus. Morbi nec laoreet tortor, in bibendum lacus. Donec vitae ante sit amet ante efficitur varius.</p>\n', 'f088c-cpa-school-test.png', '2021-05-04'),
	(14, 'Noticia 5', '<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue sem sed hendrerit gravida. Nunc dictum arcu at nisl hendrerit interdum et porta arcu. Integer viverra interdum egestas. Sed vitae rhoncus turpis. Vestibulum nec magna felis. Suspendisse sit amet malesuada nibh. Sed nunc metus, scelerisque non diam eu, tempus tincidunt nulla. Maecenas convallis convallis velit, in commodo nunc suscipit nec.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Quisque placerat suscipit augue a finibus. Morbi odio urna, maximus a gravida non, semper efficitur risus. Nulla facilisi. Nullam id fringilla dui. Aenean tempor lorem finibus, vehicula erat pretium, mollis erat. Vestibulum non iaculis sapien. Quisque id maximus arcu. Morbi blandit risus at lorem cursus posuere. Suspendisse semper tortor orci.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Pellentesque interdum pretium neque quis semper. Morbi non velit non odio tincidunt condimentum vitae ut odio. Quisque metus est, pulvinar eu convallis sit amet, dictum quis velit. Nunc luctus accumsan ipsum, non placerat enim accumsan nec. Nullam accumsan convallis nulla, vel porttitor dolor vehicula non. Nunc non rhoncus mi. Vestibulum tincidunt, nunc vel molestie suscipit, orci justo blandit sem, a malesuada neque dolor a risus.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Donec viverra finibus pellentesque. Vestibulum turpis diam, sagittis vel ante aliquam, placerat tristique sapien. Suspendisse a quam dolor. Donec posuere nec neque pretium luctus. Aliquam vel ex vestibulum, scelerisque nunc sit amet, efficitur lorem. Vestibulum sit amet tempor purus. Phasellus quis ornare magna. In sed cursus ante. Morbi vitae elementum urna.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Vivamus maximus nulla eu nulla volutpat euismod. Quisque varius aliquam nunc sed maximus. Proin pretium, arcu sed cursus sodales, mauris orci porttitor sapien, in tincidunt est ante vel mi. Fusce tristique malesuada viverra. Ut auctor at magna lacinia consequat. Aliquam luctus ut enim non ullamcorper. Maecenas vitae suscipit odio. Pellentesque vel tincidunt ex. Etiam dolor mi, porta tempor tempor ac, tempus sed tellus. Morbi nec laoreet tortor, in bibendum lacus. Donec vitae ante sit amet ante efficitur varius.</p>\n', '0a9e9-cpa-school-test.png', '2021-05-04'),
	(15, 'Noticia 6', '<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue sem sed hendrerit gravida. Nunc dictum arcu at nisl hendrerit interdum et porta arcu. Integer viverra interdum egestas. Sed vitae rhoncus turpis. Vestibulum nec magna felis. Suspendisse sit amet malesuada nibh. Sed nunc metus, scelerisque non diam eu, tempus tincidunt nulla. Maecenas convallis convallis velit, in commodo nunc suscipit nec.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Quisque placerat suscipit augue a finibus. Morbi odio urna, maximus a gravida non, semper efficitur risus. Nulla facilisi. Nullam id fringilla dui. Aenean tempor lorem finibus, vehicula erat pretium, mollis erat. Vestibulum non iaculis sapien. Quisque id maximus arcu. Morbi blandit risus at lorem cursus posuere. Suspendisse semper tortor orci.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Pellentesque interdum pretium neque quis semper. Morbi non velit non odio tincidunt condimentum vitae ut odio. Quisque metus est, pulvinar eu convallis sit amet, dictum quis velit. Nunc luctus accumsan ipsum, non placerat enim accumsan nec. Nullam accumsan convallis nulla, vel porttitor dolor vehicula non. Nunc non rhoncus mi. Vestibulum tincidunt, nunc vel molestie suscipit, orci justo blandit sem, a malesuada neque dolor a risus.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Donec viverra finibus pellentesque. Vestibulum turpis diam, sagittis vel ante aliquam, placerat tristique sapien. Suspendisse a quam dolor. Donec posuere nec neque pretium luctus. Aliquam vel ex vestibulum, scelerisque nunc sit amet, efficitur lorem. Vestibulum sit amet tempor purus. Phasellus quis ornare magna. In sed cursus ante. Morbi vitae elementum urna.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: ">\n	Vivamus maximus nulla eu nulla volutpat euismod. Quisque varius aliquam nunc sed maximus. Proin pretium, arcu sed cursus sodales, mauris orci porttitor sapien, in tincidunt est ante vel mi. Fusce tristique malesuada viverra. Ut auctor at magna lacinia consequat. Aliquam luctus ut enim non ullamcorper. Maecenas vitae suscipit odio. Pellentesque vel tincidunt ex. Etiam dolor mi, porta tempor tempor ac, tempus sed tellus. Morbi nec laoreet tortor, in bibendum lacus. Donec vitae ante sit amet ante efficitur varius.</p>\n', '20ead-cpa-school-test.png', '2021-05-04'),
	(16, 'Noticia 7', '<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue sem sed hendrerit gravida. Nunc dictum arcu at nisl hendrerit interdum et porta arcu. Integer viverra interdum egestas. Sed vitae rhoncus turpis. Vestibulum nec magna felis. Suspendisse sit amet malesuada nibh. Sed nunc metus, scelerisque non diam eu, tempus tincidunt nulla. Maecenas convallis convallis velit, in commodo nunc suscipit nec.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">\n	Quisque placerat suscipit augue a finibus. Morbi odio urna, maximus a gravida non, semper efficitur risus. Nulla facilisi. Nullam id fringilla dui. Aenean tempor lorem finibus, vehicula erat pretium, mollis erat. Vestibulum non iaculis sapien. Quisque id maximus arcu. Morbi blandit risus at lorem cursus posuere. Suspendisse semper tortor orci.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">\n	Pellentesque interdum pretium neque quis semper. Morbi non velit non odio tincidunt condimentum vitae ut odio. Quisque metus est, pulvinar eu convallis sit amet, dictum quis velit. Nunc luctus accumsan ipsum, non placerat enim accumsan nec. Nullam accumsan convallis nulla, vel porttitor dolor vehicula non. Nunc non rhoncus mi. Vestibulum tincidunt, nunc vel molestie suscipit, orci justo blandit sem, a malesuada neque dolor a risus.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">\n	Donec viverra finibus pellentesque. Vestibulum turpis diam, sagittis vel ante aliquam, placerat tristique sapien. Suspendisse a quam dolor. Donec posuere nec neque pretium luctus. Aliquam vel ex vestibulum, scelerisque nunc sit amet, efficitur lorem. Vestibulum sit amet tempor purus. Phasellus quis ornare magna. In sed cursus ante. Morbi vitae elementum urna.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">\n	Vivamus maximus nulla eu nulla volutpat euismod. Quisque varius aliquam nunc sed maximus. Proin pretium, arcu sed cursus sodales, mauris orci porttitor sapien, in tincidunt est ante vel mi. Fusce tristique malesuada viverra. Ut auctor at magna lacinia consequat. Aliquam luctus ut enim non ullamcorper. Maecenas vitae suscipit odio. Pellentesque vel tincidunt ex. Etiam dolor mi, porta tempor tempor ac, tempus sed tellus. Morbi nec laoreet tortor, in bibendum lacus. Donec vitae ante sit amet ante efficitur varius.</p>\n', '63c71-cpa-school-test.png', '2021-05-04'),
	(17, 'Noticia 8', '<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue sem sed hendrerit gravida. Nunc dictum arcu at nisl hendrerit interdum et porta arcu. Integer viverra interdum egestas. Sed vitae rhoncus turpis. Vestibulum nec magna felis. Suspendisse sit amet malesuada nibh. Sed nunc metus, scelerisque non diam eu, tempus tincidunt nulla. Maecenas convallis convallis velit, in commodo nunc suscipit nec.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">\n	Quisque placerat suscipit augue a finibus. Morbi odio urna, maximus a gravida non, semper efficitur risus. Nulla facilisi. Nullam id fringilla dui. Aenean tempor lorem finibus, vehicula erat pretium, mollis erat. Vestibulum non iaculis sapien. Quisque id maximus arcu. Morbi blandit risus at lorem cursus posuere. Suspendisse semper tortor orci.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">\n	Pellentesque interdum pretium neque quis semper. Morbi non velit non odio tincidunt condimentum vitae ut odio. Quisque metus est, pulvinar eu convallis sit amet, dictum quis velit. Nunc luctus accumsan ipsum, non placerat enim accumsan nec. Nullam accumsan convallis nulla, vel porttitor dolor vehicula non. Nunc non rhoncus mi. Vestibulum tincidunt, nunc vel molestie suscipit, orci justo blandit sem, a malesuada neque dolor a risus.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">\n	Donec viverra finibus pellentesque. Vestibulum turpis diam, sagittis vel ante aliquam, placerat tristique sapien. Suspendisse a quam dolor. Donec posuere nec neque pretium luctus. Aliquam vel ex vestibulum, scelerisque nunc sit amet, efficitur lorem. Vestibulum sit amet tempor purus. Phasellus quis ornare magna. In sed cursus ante. Morbi vitae elementum urna.</p>\n<p font-size:="" open="" style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">\n	Vivamus maximus nulla eu nulla volutpat euismod. Quisque varius aliquam nunc sed maximus. Proin pretium, arcu sed cursus sodales, mauris orci porttitor sapien, in tincidunt est ante vel mi. Fusce tristique malesuada viverra. Ut auctor at magna lacinia consequat. Aliquam luctus ut enim non ullamcorper. Maecenas vitae suscipit odio. Pellentesque vel tincidunt ex. Etiam dolor mi, porta tempor tempor ac, tempus sed tellus. Morbi nec laoreet tortor, in bibendum lacus. Donec vitae ante sit amet ante efficitur varius.</p>\n', 'bce94-cpa-school-test.png', '2021-05-04'),
	(18, 'Noticia 34', '<p>\n	asdd</p>\n', '9338a-not-a-robot.png', '2021-05-06');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

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
  CONSTRAINT `FK_tasques_inci` FOREIGN KEY (`id_inci`) REFERENCES `incidencies` (`id_inci`),
  CONSTRAINT `FK_tasques_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.tasques: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `tasques` DISABLE KEYS */;
INSERT INTO `tasques` (`id_tasca`, `id_user`, `id_inci`, `desc`, `accions`, `start_date`, `start_hour`, `end_date`, `end_hour`, `canvas`) VALUES
	(4, 19, 1, '<p>\n	EXEMPLE DESCRIPCIO</p>\n<p>\n	&nbsp;</p>\n', '', '2021-05-07', '21:59:09', NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAArwAAAEsCAYAAAAhNGCdAAAQuUlEQVR4Xu3WQREAAAgCQelf2h43awMWH+wcAQIECBAgQIAAgbDAwtlEI0CAAAECBAgQIHAGrycgQIAAAQIECBBICxi86XqFI0CAAAECBAgQMHj9AAECBAgQIECAQFrA4E3XKxwBAgQIECBAgIDB6wcIECBAgAABAgTSAgZvul7hCBAgQIAAAQIEDF4/QIAAAQIECBAgkBYweNP1CkeAAAECBAgQIGDw+gECBAgQIECAAIG0gMGbrlc4AgQIECBAgAABg9cPECBAgAABAgQIpAUM3nS9whEgQIAAAQIECBi8foAAAQIECBAgQCAtYPCm6xWOAAECBAgQIEDA4PUDBAgQIECAAAECaQGDN12vcAQIECBAgAABAgavHyBAgAABAgQIEEgLGLzpeoUjQIAAAQIECBAweP0AAQIECBAgQIBAWsDgTdcrHAECBAgQIECAgMHrBwgQIECAAAECBNICBm+6XuEIECBAgAABAgQMXj9AgAABAgQIECCQFjB40/UKR4AAAQIECBAgYPD6AQIECBAgQIAAgbSAwZuuVzgCBAgQIECAAAGD1w8QIECAAAECBAikBQzedL3CESBAgAABAgQIGLx+gAABAgQIECBAIC1g8KbrFY4AAQIECBAgQMDg9QMECBAgQIAAAQJpAYM3Xa9wBAgQIECAAAECBq8fIECAAAECBAgQSAsYvOl6hSNAgAABAgQIEDB4/QABAgQIECBAgEBawOBN1yscAQIECBAgQICAwesHCBAgQIAAAQIE0gIGb7pe4QgQIECAAAECBAxeP0CAAAECBAgQIJAWMHjT9QpHgAABAgQIECBg8PoBAgQIECBAgACBtIDBm65XOAIECBAgQIAAAYPXDxAgQIAAAQIECKQFDN50vcIRIECAAAECBAgYvH6AAAECBAgQIEAgLWDwpusVjgABAgQIECBAwOD1AwQIECBAgAABAmkBgzddr3AECBAgQIAAAQIGrx8gQIAAAQIECBBICxi86XqFI0CAAAECBAgQMHj9AAECBAgQIECAQFrA4E3XKxwBAgQIECBAgIDB6wcIECBAgAABAgTSAgZvul7hCBAgQIAAAQIEDF4/QIAAAQIECBAgkBYweNP1CkeAAAECBAgQIGDw+gECBAgQIECAAIG0gMGbrlc4AgQIECBAgAABg9cPECBAgAABAgQIpAUM3nS9whEgQIAAAQIECBi8foAAAQIECBAgQCAtYPCm6xWOAAECBAgQIEDA4PUDBAgQIECAAAECaQGDN12vcAQIECBAgAABAgavHyBAgAABAgQIEEgLGLzpeoUjQIAAAQIECBAweP0AAQIECBAgQIBAWsDgTdcrHAECBAgQIECAgMHrBwgQIECAAAECBNICBm+6XuEIECBAgAABAgQMXj9AgAABAgQIECCQFjB40/UKR4AAAQIECBAgYPD6AQIECBAgQIAAgbSAwZuuVzgCBAgQIECAAAGD1w8QIECAAAECBAikBQzedL3CESBAgAABAgQIGLx+gAABAgQIECBAIC1g8KbrFY4AAQIECBAgQMDg9QMECBAgQIAAAQJpAYM3Xa9wBAgQIECAAAECBq8fIECAAAECBAgQSAsYvOl6hSNAgAABAgQIEDB4/QABAgQIECBAgEBawOBN1yscAQIECBAgQICAwesHCBAgQIAAAQIE0gIGb7pe4QgQIECAAAECBAxeP0CAAAECBAgQIJAWMHjT9QpHgAABAgQIECBg8PoBAgQIECBAgACBtIDBm65XOAIECBAgQIAAAYPXDxAgQIAAAQIECKQFDN50vcIRIECAAAECBAgYvH6AAAECBAgQIEAgLWDwpusVjgABAgQIECBAwOD1AwQIECBAgAABAmkBgzddr3AECBAgQIAAAQIGrx8gQIAAAQIECBBICxi86XqFI0CAAAECBAgQMHj9AAECBAgQIECAQFrA4E3XKxwBAgQIECBAgIDB6wcIECBAgAABAgTSAgZvul7hCBAgQIAAAQIEDF4/QIAAAQIECBAgkBYweNP1CkeAAAECBAgQIGDw+gECBAgQIECAAIG0gMGbrlc4AgQIECBAgAABg9cPECBAgAABAgQIpAUM3nS9whEgQIAAAQIECBi8foAAAQIECBAgQCAtYPCm6xWOAAECBAgQIEDA4PUDBAgQIECAAAECaQGDN12vcAQIECBAgAABAgavHyBAgAABAgQIEEgLGLzpeoUjQIAAAQIECBAweP0AAQIECBAgQIBAWsDgTdcrHAECBAgQIECAgMHrBwgQIECAAAECBNICBm+6XuEIECBAgAABAgQMXj9AgAABAgQIECCQFjB40/UKR4AAAQIECBAgYPD6AQIECBAgQIAAgbSAwZuuVzgCBAgQIECAAAGD1w8QIECAAAECBAikBQzedL3CESBAgAABAgQIGLx+gAABAgQIECBAIC1g8KbrFY4AAQIECBAgQMDg9QMECBAgQIAAAQJpAYM3Xa9wBAgQIECAAAECBq8fIECAAAECBAgQSAsYvOl6hSNAgAABAgQIEDB4/QABAgQIECBAgEBawOBN1yscAQIECBAgQICAwesHCBAgQIAAAQIE0gIGb7pe4QgQIECAAAECBAxeP0CAAAECBAgQIJAWMHjT9QpHgAABAgQIECBg8PoBAgQIECBAgACBtIDBm65XOAIECBAgQIAAAYPXDxAgQIAAAQIECKQFDN50vcIRIECAAAECBAgYvH6AAAECBAgQIEAgLWDwpusVjgABAgQIECBAwOD1AwQIECBAgAABAmkBgzddr3AECBAgQIAAAQIGrx8gQIAAAQIECBBICxi86XqFI0CAAAECBAgQMHj9AAECBAgQIECAQFrA4E3XKxwBAgQIECBAgIDB6wcIECBAgAABAgTSAgZvul7hCBAgQIAAAQIEDF4/QIAAAQIECBAgkBYweNP1CkeAAAECBAgQIGDw+gECBAgQIECAAIG0gMGbrlc4AgQIECBAgAABg9cPECBAgAABAgQIpAUM3nS9whEgQIAAAQIECBi8foAAAQIECBAgQCAtYPCm6xWOAAECBAgQIEDA4PUDBAgQIECAAAECaQGDN12vcAQIECBAgAABAgavHyBAgAABAgQIEEgLGLzpeoUjQIAAAQIECBAweP0AAQIECBAgQIBAWsDgTdcrHAECBAgQIECAgMHrBwgQIECAAAECBNICBm+6XuEIECBAgAABAgQMXj9AgAABAgQIECCQFjB40/UKR4AAAQIECBAgYPD6AQIECBAgQIAAgbSAwZuuVzgCBAgQIECAAAGD1w8QIECAAAECBAikBQzedL3CESBAgAABAgQIGLx+gAABAgQIECBAIC1g8KbrFY4AAQIECBAgQMDg9QMECBAgQIAAAQJpAYM3Xa9wBAgQIECAAAECBq8fIECAAAECBAgQSAsYvOl6hSNAgAABAgQIEDB4/QABAgQIECBAgEBawOBN1yscAQIECBAgQICAwesHCBAgQIAAAQIE0gIGb7pe4QgQIECAAAECBAxeP0CAAAECBAgQIJAWMHjT9QpHgAABAgQIECBg8PoBAgQIECBAgACBtIDBm65XOAIECBAgQIAAAYPXDxAgQIAAAQIECKQFDN50vcIRIECAAAECBAgYvH6AAAECBAgQIEAgLWDwpusVjgABAgQIECBAwOD1AwQIECBAgAABAmkBgzddr3AECBAgQIAAAQIGrx8gQIAAAQIECBBICxi86XqFI0CAAAECBAgQMHj9AAECBAgQIECAQFrA4E3XKxwBAgQIECBAgIDB6wcIECBAgAABAgTSAgZvul7hCBAgQIAAAQIEDF4/QIAAAQIECBAgkBYweNP1CkeAAAECBAgQIGDw+gECBAgQIECAAIG0gMGbrlc4AgQIECBAgAABg9cPECBAgAABAgQIpAUM3nS9whEgQIAAAQIECBi8foAAAQIECBAgQCAtYPCm6xWOAAECBAgQIEDA4PUDBAgQIECAAAECaQGDN12vcAQIECBAgAABAgavHyBAgAABAgQIEEgLGLzpeoUjQIAAAQIECBAweP0AAQIECBAgQIBAWsDgTdcrHAECBAgQIECAgMHrBwgQIECAAAECBNICBm+6XuEIECBAgAABAgQMXj9AgAABAgQIECCQFjB40/UKR4AAAQIECBAgYPD6AQIECBAgQIAAgbSAwZuuVzgCBAgQIECAAAGD1w8QIECAAAECBAikBQzedL3CESBAgAABAgQIGLx+gAABAgQIECBAIC1g8KbrFY4AAQIECBAgQMDg9QMECBAgQIAAAQJpAYM3Xa9wBAgQIECAAAECBq8fIECAAAECBAgQSAsYvOl6hSNAgAABAgQIEDB4/QABAgQIECBAgEBawOBN1yscAQIECBAgQICAwesHCBAgQIAAAQIE0gIGb7pe4QgQIECAAAECBAxeP0CAAAECBAgQIJAWMHjT9QpHgAABAgQIECBg8PoBAgQIECBAgACBtIDBm65XOAIECBAgQIAAAYPXDxAgQIAAAQIECKQFDN50vcIRIECAAAECBAgYvH6AAAECBAgQIEAgLWDwpusVjgABAgQIECBAwOD1AwQIECBAgAABAmkBgzddr3AECBAgQIAAAQIGrx8gQIAAAQIECBBICxi86XqFI0CAAAECBAgQMHj9AAECBAgQIECAQFrA4E3XKxwBAgQIECBAgIDB6wcIECBAgAABAgTSAgZvul7hCBAgQIAAAQIEDF4/QIAAAQIECBAgkBYweNP1CkeAAAECBAgQIGDw+gECBAgQIECAAIG0gMGbrlc4AgQIECBAgAABg9cPECBAgAABAgQIpAUM3nS9whEgQIAAAQIECBi8foAAAQIECBAgQCAtYPCm6xWOAAECBAgQIEDA4PUDBAgQIECAAAECaQGDN12vcAQIECBAgAABAgavHyBAgAABAgQIEEgLGLzpeoUjQIAAAQIECBAweP0AAQIECBAgQIBAWsDgTdcrHAECBAgQIECAgMHrBwgQIECAAAECBNICBm+6XuEIECBAgAABAgQMXj9AgAABAgQIECCQFjB40/UKR4AAAQIECBAgYPD6AQIECBAgQIAAgbSAwZuuVzgCBAgQIECAAAGD1w8QIECAAAECBAikBQzedL3CESBAgAABAgQIGLx+gAABAgQIECBAIC1g8KbrFY4AAQIECBAgQMDg9QMECBAgQIAAAQJpAYM3Xa9wBAgQIECAAAECBq8fIECAAAECBAgQSAsYvOl6hSNAgAABAgQIEDB4/QABAgQIECBAgEBawOBN1yscAQIECBAgQICAwesHCBAgQIAAAQIE0gIGb7pe4QgQIECAAAECBAxeP0CAAAECBAgQIJAWMHjT9QpHgAABAgQIECBg8PoBAgQIECBAgACBtIDBm65XOAIECBAgQIAAAYPXDxAgQIAAAQIECKQFDN50vcIRIECAAAECBAgYvH6AAAECBAgQIEAgLWDwpusVjgABAgQIECBAwOD1AwQIECBAgAABAmkBgzddr3AECBAgQIAAAQIGrx8gQIAAAQIECBBICxi86XqFI0CAAAECBAgQMHj9AAECBAgQIECAQFrA4E3XKxwBAgQIECBAgIDB6wcIECBAgAABAgTSAgZvul7hCBAgQIAAAQIEDF4/QIAAAQIECBAgkBYweNP1CkeAAAECBAgQIGDw+gECBAgQIECAAIG0gMGbrlc4AgQIECBAgACBB/i0AS3kXFFDAAAAAElFTkSuQmCC'),
	(5, 19, 6, '<p>\n	estreno</p>\n', NULL, '2021-05-07', '21:59:09', NULL, NULL, NULL),
	(6, 19, 1, '<p>\n	ASD</p>\n', NULL, '2021-05-18', '21:59:09', NULL, NULL, NULL),
	(8, 2, 1, '<p>\n	asd</p>\n', NULL, '2021-05-18', '21:59:09', NULL, NULL, NULL),
	(9, 2, 1, '<p>\n	asd</p>\n', NULL, '2021-05-18', '21:59:09', NULL, NULL, NULL),
	(20, 3, 1, '<p>\n	test</p>\n', NULL, '2021-05-10', '21:59:09', NULL, NULL, NULL),
	(21, 4, 1, '<p>\n	sdf asdf wdaf asd fs</p>\n', NULL, '2021-05-14', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tasques` ENABLE KEYS */;

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

-- Volcando datos para la tabla bitbit.tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
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

-- Volcando datos para la tabla bitbit.users: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `city`) VALUES
	(1, '127.0.0.1', 'administrator', '$2y$10$gpGtuiacEw4AbP8tgx7Z2exNOoiP/IgW24vJZWZXIQrEQMG7HJQ4q', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1619291859, 1, 'Admin', 'istrator', 'ADMIN', '123456789', 'test'),
	(2, '::1', 'test', '$2y$10$QzY/nmSkBpNuDnampfG9ZOJv9Q0gxye.YFH60Aguc3.vzVp5siRtq', 'test@test.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1619291471, 1620856568, 1, 'Admin', 'Admin', NULL, NULL, 'test'),
	(3, '::1', 'usuari1', '$2y$10$WPxZ5HrQVjPhbSwXbyQ54.4Q6COstkQR0x/r0UKteL1xbf.qjXPUG', 'usuari1@usuari1.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1619296588, 1619296636, 1, 'usuari 1', 'test', '', NULL, 'test'),
	(4, '::1', 'estudillo', '$2y$10$0eV9d2OXh01UTkThhnDeuOebo8/n81svDd2p5ukn0J3qNMVBTLMqK', 'estudillo@estudillo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1619297343, 1619297359, 1, 'Noel', 'Estudillo', 'BOBO S.L.', NULL, 'test'),
	(5, '::1', 'test2', '$2y$10$uMzrdZjHVb8Veom7HXsdLODpBK5Ffvf16bGxQZLa6rdLykSvDAfcy', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620311820, 1620765946, 1, '1234', '1234', '1234', NULL, 'test'),
	(15, '::1', 'test4', '$2y$10$X1.HVIEW1kLFMt9bak9wLOSI8ZRDizs7m5RuQfTyyOprpsB54shw2', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620324221, 1620814368, 1, '1234', '1234', '123', NULL, 'test'),
	(18, '::1', 'test6', '$2y$10$aA33Lpa3zLcJEkn50Owaw.ZJdIBtN6snitBZZMUKdIhGHyM2v1gSS', '1234567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620325894, 1621010868, 1, '1234567', '1234567', '1234567', NULL, 'test'),
	(19, '::1', 'tecnic', '$2y$10$SlsYyAADqjHBf0K81nc/1ORtCfOyP4Xv/8xEsP.yNO.WeHgBrU5pG', 'tecnic@tecnic.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620814433, 1621351758, 1, 'tecnic', 'tecnic', '', NULL, 'test'),
	(20, '::1', 'admin', '$2y$10$kkhDR3aKoCUqxIUGPmI/cOk1aOFzSrUM6xd75oVY8VqoxLTkdRgrS', 'admin@admin.comm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620814495, 1621350695, 1, 'admin', 'admin', 'admin', NULL, 'admin'),
	(21, '::1', 'user', '$2y$10$6CYfjRdPmKkOZ3292WEMcugoWK13xFd6az2VW2Wr3heUm1jvkowW.', 'user@user.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620814520, 1621010852, 1, 'user', 'user', 'user', NULL, 'user'),
	(22, '::1', 'gestor', '$2y$10$9g65AByvczLx.4fK6ebFeej5/VcTHEjP3hndeSkFJin758YDf0kiy', 'gestor@gestor.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620814555, 1621010963, 1, 'gestor', 'gestor', 'gestor', NULL, 'gesto');
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

-- Volcando datos para la tabla bitbit.users_groups: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
	(1, 1, 1),
	(3, 2, 1),
	(4, 3, 4),
	(5, 4, 2),
	(6, 5, 2),
	(7, 15, 4),
	(8, 18, 4),
	(9, 19, 3),
	(10, 20, 1),
	(11, 21, 4),
	(12, 22, 2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

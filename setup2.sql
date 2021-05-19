-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.14-MariaDB - mariadb.org binary distribution
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

-- Volcando datos para la tabla bitbit.documents_tasques: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `documents_tasques` DISABLE KEYS */;
INSERT INTO `documents_tasques` (`id_document`, `id_tasca`, `image`, `path`) VALUES
	(1, 4, '33698aa64c68452511dc13909adeeb9b.png', 'assets/uploads/incidencies/1'),
	(2, 4, 'fdbb9e073f8ccbf6471f3a415a26d7e8.gif', 'assets/uploads/incidencies/1'),
	(3, 4, '5bb878849da758dfb6fa9da6715f08d3.jpg', 'assets/uploads/incidencies/1'),
	(4, 4, '14396338e01acd39002fa8fe7f673ae1.jpg', 'assets/uploads/incidencies/1'),
	(5, 4, '2c3b676449e06cfe170db3a05d13f6d0.jpg', 'assets/uploads/incidencies/1');
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
	(6, 1, 15, 'etafd', 'LENOVO', 'model test', '1241243324', 'as198723', '<p>\n	ajshdkjfsh</p>\n', '<p>\n	akjhdakjsh</p>\n', '1243', '2021-05-17', '00:00:00', '2021-05-02', NULL),
	(8, 1, 15, '1234', 'ASUS', 'model test', '312412433124', '1234', '<p>\n	123</p>\n', '<p>\n	123</p>\n', '12345', '2021-05-17', '00:00:00', '2021-05-08', NULL),
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.login_attempts: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
	(27, '::1', 'tecnic4', 1621438206);
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
  CONSTRAINT `FK_tasques_inci` FOREIGN KEY (`id_inci`) REFERENCES `incidencies` (`id_inci`),
  CONSTRAINT `FK_tasques_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.tasques: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `tasques` DISABLE KEYS */;
INSERT INTO `tasques` (`id_tasca`, `id_user`, `id_inci`, `desc`, `accions`, `start_date`, `start_hour`, `end_date`, `end_hour`, `canvas`) VALUES
	(4, 19, 1, '<p>\n	EXEMPLE DESCRIPCIO</p>\n<p>\n	&nbsp;</p>\n', '', '2021-05-07', '21:59:09', NULL, NULL, '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'),
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
	(15, '::1', 'test4', '$2y$10$X1.HVIEW1kLFMt9bak9wLOSI8ZRDizs7m5RuQfTyyOprpsB54shw2', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620324221, 1621455998, 1, '1234', '1234', '123', NULL, 'test'),
	(18, '::1', 'test6', '$2y$10$aA33Lpa3zLcJEkn50Owaw.ZJdIBtN6snitBZZMUKdIhGHyM2v1gSS', '1234567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620325894, 1621361296, 1, '1234567', '1234567', '1234567', NULL, 'test'),
	(19, '::1', 'tecnic', '$2y$10$SlsYyAADqjHBf0K81nc/1ORtCfOyP4Xv/8xEsP.yNO.WeHgBrU5pG', 'tecnic@tecnic.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620814433, 1621438069, 1, 'tecnic', 'tecnic', '', NULL, 'test'),
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

-- Volcando estructura para vista bitbit.qrynomusuari
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `qrynomusuari`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `qrynomusuari` AS SELECT users.id, users.username ,users_groups.group_id FROM users INNER JOIN users_groups ON users.id = users_groups.user_id WHERE group_id!=4 ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

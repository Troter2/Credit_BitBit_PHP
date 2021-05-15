-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.17-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
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
  `contingut` varchar(150) NOT NULL,
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

-- Volcando datos para la tabla bitbit.datos_about: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `datos_about` DISABLE KEYS */;
INSERT INTO `datos_about` (`id`, `date`, `titol`, `content`) VALUES
	(1, '2021', 'asd asd asd ', 'as dasdas dasd'),
	(2, '2021', 'asd asd asd ', 'as dasdas dasd'),
	(3, '2021', 'asd asd asd ', 'as dasdas dasd'),
	(4, '2021', 'asd asd asd ', 'as dasdas dasd'),
	(5, '2021', 'asd asd asd ', 'as dasdas dasd');
/*!40000 ALTER TABLE `datos_about` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.documents_tasques
CREATE TABLE IF NOT EXISTS `documents_tasques` (
  `id_document` int(11) NOT NULL AUTO_INCREMENT,
  `id_tasca` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL,
  PRIMARY KEY (`id_document`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.documents_tasques: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `documents_tasques` DISABLE KEYS */;
INSERT INTO `documents_tasques` (`id_document`, `id_tasca`, `image`) VALUES
	(1, 4, '33698aa64c68452511dc13909adeeb9b.png'),
	(2, 4, 'fdbb9e073f8ccbf6471f3a415a26d7e8.gif');
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
  CONSTRAINT `FK_user` FOREIGN KEY (`id_user_propietari`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.incidencies: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `incidencies` DISABLE KEYS */;
INSERT INTO `incidencies` (`id_inci`, `id_estat`, `id_user_propietari`, `nom_propietari`, `marca`, `model`, `numero_serie`, `tlf`, `desc_averia`, `diagnosis_prev`, `uuid`, `entry_date`, `entry_hour`, `out_date`, `out_hour`) VALUES
	(1, 3, 15, 'asd', 'XIAOMI', 'model test', '123423411424', 'asd', '<p>\n	&nbsp;SHAH SDASH KJSH DKAH AKSH AKSDHJ AKDHJ AKSJDH ASKDH JASKD HSKJ DHASDK HJK JASKHJDKJHDKJASHDKAJSH&nbsp; HJKAS HD SAD AD AD&nbsp; DA D D ASDA DA D&nbsp; SDASDADFAS F SDFSD FSD FF SA FSD FSA FSAD FSF SD FS FSDF SD FSDF S SDFS ADFSD FS DFS DFS DFS DFSD FS DFS DFS FDSDF S</p>\n', '', 'd7a39daf641b4679a87c2b6a691ef1ce', '2021-05-19', '00:00:00', '2021-05-11', NULL),
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.login_attempts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
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
  CONSTRAINT `FK_mat` FOREIGN KEY (`id_mat`) REFERENCES `materials` (`id_mat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  `from` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `about` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `send_date` date NOT NULL,
  `send_hour` time NOT NULL,
  `recive_date` date DEFAULT NULL,
  `recive_hour` time DEFAULT NULL,
  PRIMARY KEY (`id_msg`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.messages: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id_msg`, `from`, `to`, `about`, `content`, `send_date`, `send_hour`, `recive_date`, `recive_hour`) VALUES
	(4, 'test', 'administrator', 'prova missatge', 'shfjksldhfksljdhflksjahdfljksadf', '2021-04-23', '00:00:00', '2021-04-24', '16:43:08'),
	(5, 'test', 'administrator', 'prova missatge', 'shfjksldhfksljdhflksjahdfljksadf', '2021-04-23', '12:23:32', '2021-04-24', '16:43:16'),
	(11, 'administrator', 'administrator', 'test amb from', 'laksjd', '2021-04-23', '21:23:36', '2021-04-24', '16:49:49'),
	(12, 'administrator', 'administrator', 'test', 'añksjdalksdj', '2021-04-23', '21:34:34', '2021-04-24', '16:38:13'),
	(13, 'administrator', 'administrator', 'test long message', 'test', '2021-04-24', '13:29:05', '2021-04-24', '16:49:52'),
	(14, 'administrator', 'administrator', 'test long', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel massa a mauris ornare scelerisque. Maecenas facilisis et nisl mattis suscipit. Pellentesque iaculis cursus ullamcorper. Nullam dignissim non libero at molestie. Quisque ut facilisis ex. Nulla volutpat justo mauris, nec ullamcorper ex ultrices vitae. Praesent ullamcorper lobortis nibh eget porttitor. Phasellus elementum tortor turpis, et cursus nunc suscipit quis. Suspendisse pellentesque lobortis lobortis. Morbi cursus iaculis odio a iaculis. Nunc et quam mattis, gravida dui quis, eleifend arcu. Sed eleifend, sem ac fringilla tincidunt, magna lorem accumsan nisi, a posuere nisi ante vitae magna. Suspendisse potenti. Cras dapibus tincidunt tincidunt. Mauris quis ligula posuere, tempus leo quis, sollicitudin diam. Nam odio elit, semper at porta ornare, efficitur a orci.\r\n\r\nUt vehicula vulputate malesuada. Maecenas vitae nisl et augue sagittis sollicitudin. Vestibulum ultricies ante sit amet tincidunt euismod. Fusce scelerisque est erat, vitae mattis ante dignissim a. Sed laoreet dictum egestas. Morbi leo neque, mattis ut pretium et, imperdiet nec ex. Sed cursus rutrum metus vitae gravida. Morbi eu ullamcorper neque, vitae porttitor lectus. Praesent condimentum mollis efficitur. Pellentesque sit amet nisi tempus enim pulvinar facilisis.\r\n\r\nDonec elementum arcu id ex fringilla rhoncus id fermentum ante. Nulla scelerisque elit enim, nec condimentum massa fermentum nec. Sed pharetra ullamcorper metus. Nulla placerat orci non nibh commodo auctor. Ut pretium vehicula ex non porttitor. Proin pharetra, nibh ut aliquet lobortis, turpis nisl finibus risus, sed facilisis nulla odio nec leo. Maecenas laoreet leo id ligula sodales feugiat. In id sapien magna. Fusce a risus vel nisl interdum rutrum. Fusce convallis, magna et gravida placerat, neque metus dapibus lacus, quis sagittis lectus nisl ut tortor. Cras non justo lacinia, aliquet neque quis, ullamcorper eros. Ut feugiat sem quis nibh euismod, at consequat nisi euismod. Vivamus et pellentesque urna. Sed sed nibh sed turpis pulvinar condimentum.\r\n\r\nIn hac habitasse platea dictumst. Cras convallis libero sed eros dignissim suscipit ut nec turpis. Mauris convallis, sapien blandit imperdiet pulvinar, dui neque posuere leo, a tincidunt eros felis eget ex. Pellentesque interdum aliquam faucibus. Nullam euismod, sem sed auctor sollicitudin, augue erat aliquet mauris, ut maximus libero purus et purus. Vestibulum elementum orci augue, at consequat odio tristique a. Cras vitae enim purus. Ut pharetra lacinia quam, nec dictum lorem fringilla sed. Nunc laoreet lectus eu purus rutrum suscipit. Sed vitae condimentum dui. Nunc ultrices, enim nec consequat porta, nunc lorem aliquam est, eu auctor felis nibh eget magna. Praesent commodo, sapien eu placerat fringilla, orci orci posuere tellus, sit amet elementum lorem nisl ut ligula. Integer egestas tristique leo ut volutpat. Mauris elementum tortor quis tellus scelerisque, condimentum commodo neque imperdiet. Mauris vel facilisis urna. Donec dolor sapien, tempor nec pulvinar vel, mollis et elit.', '2021-04-24', '13:34:05', '2021-04-24', '16:49:53'),
	(15, 'dvsk.jb', 'administrator', 'sdkczxbfjf', 'dvsk.jb', '2021-04-24', '21:00:42', '2021-04-24', '21:00:50'),
	(16, 'heloo', 'administrator', 'test nou usuari', 'heloo', '2021-04-24', '21:12:09', '2021-04-24', '21:12:25'),
	(17, 'test', 'administrator', 'test 1234', 'asd', '2021-04-24', '21:17:27', '2021-04-24', '21:17:43'),
	(18, 'administrator', 'test', 'prova primer mail', 'test alksjd', '2021-04-24', '21:18:11', '2021-04-24', '21:18:22'),
	(19, 'estudillo', 'test', 'Missatge de estudillo', 'hljkasdf.jbk asdjksdjk hfsdkljhf aksljdh fkj', '2021-04-24', '22:49:42', '2021-04-24', '22:50:02'),
	(20, 'test', 'test', 'sad', 'dasd', '2021-05-03', '17:16:24', '2021-05-04', '20:13:03'),
	(21, 'test', 'test', 'aaaa', 'eeeeee', '2021-05-04', '17:24:15', '2021-05-04', '20:13:01'),
	(22, 'test', 'sample', 'sample', 'sample', '2021-05-04', '18:30:08', NULL, NULL);
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

-- Volcando estructura para tabla bitbit.status_historial
CREATE TABLE IF NOT EXISTS `status_historial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inci` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `finish` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.status_historial: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `status_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_historial` ENABLE KEYS */;

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

-- Volcando datos para la tabla bitbit.tasques: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tasques` DISABLE KEYS */;
INSERT INTO `tasques` (`id_tasca`, `id_user`, `id_inci`, `desc`, `accions`, `start_date`, `start_hour`, `end_date`, `end_hour`, `canvas`) VALUES
	(4, 19, 1, '<p>\n	EXEMPLE DESCRIPCIO</p>\n<p>\n	&nbsp;</p>\n', '', '2021-05-07', '21:59:09', NULL, NULL, '[removed]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'),
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

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
	(19, '::1', 'tecnic', '$2y$10$SlsYyAADqjHBf0K81nc/1ORtCfOyP4Xv/8xEsP.yNO.WeHgBrU5pG', 'tecnic@tecnic.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620814433, 1621085626, 1, 'tecnic', 'tecnic', '', NULL, 'test'),
	(20, '::1', 'admin', '$2y$10$kkhDR3aKoCUqxIUGPmI/cOk1aOFzSrUM6xd75oVY8VqoxLTkdRgrS', 'admin@admin.comm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620814495, 1621096265, 1, 'admin', 'admin', 'admin', NULL, 'admin'),
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

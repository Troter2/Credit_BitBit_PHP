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
  `entry_date` date NOT NULL,
  `out_date` date DEFAULT NULL,
  `uuid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_inci`),
  KEY `FK_status` (`id_estat`),
  KEY `FK_user` (`id_user_propietari`),
  CONSTRAINT `FK_user` FOREIGN KEY (`id_user_propietari`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.incidencies: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `incidencies` DISABLE KEYS */;
INSERT INTO `incidencies` (`id_inci`, `id_estat`, `id_user_propietari`, `nom_propietari`, `marca`, `model`, `numero_serie`, `tlf`, `desc_averia`, `diagnosis_prev`, `entry_date`, `out_date`, `uuid`) VALUES
	(1, 1, 1, 'asd', 'XIAOMI', 'model test', '123423411424', 'asd', '<p>\n	&nbsp;SHAH SDASH KJSH DKAH AKSH AKSDHJ AKDHJ AKSJDH ASKDH JASKD HSKJ DHASDK HJK JASKHJDKJHDKJASHDKAJSH&nbsp; HJKAS HD SAD AD AD&nbsp; DA D D ASDA DA D&nbsp; SDASDADFAS F SDFSD FSD FF SA FSD FSA FSAD FSF SD FS FSDF SD FSDF S SDFS ADFSD FS DFS DFS DFS DFSD FS DFS DFS FDSDF S</p>\n', '', '2021-05-19', '2021-05-11', ''),
	(6, 1, 2, 'etafd', 'LENOVO', 'model test', '1241243324', 'as198723', '<p>\n	ajshdkjfsh</p>\n', '<p>\n	akjhdakjsh</p>\n', '2021-05-17', '2021-05-02', ''),
	(8, 1, 2, '1234', 'ASUS', 'model test', '312412433124', '1234', '<p>\n	123</p>\n', '<p>\n	123</p>\n', '2021-05-17', '2021-05-08', ''),
	(17, 1, 15, 'Sergi', 'HP', 'model test', '2142144245343543', '564564', '<p>\n	ASD AFASF&nbsp;</p>\n', '<p>\n	ASD SAADS&nbsp;</p>\n', '2021-05-10', NULL, 'a2de7ff3c713430cb17c95782ea06203'),
	(18, 1, 2, '123', '123', 'model test', '123', '123', '<p>\n	123</p>\n', '<p>\n	13</p>\n', '2021-05-10', NULL, '5b850d8b39e545129986f8afb1128be0'),
	(19, 1, 15, 'TEST', 'ACER', 'NITRO 5', 'JAISUDFASLJKH FKH F', '1235465343', '<p>\n	12354864645</p>\n', '<p>\n	123A5D6564AS65 456DA4&nbsp;</p>\n', '2021-05-11', NULL, 'b949b7131d3a49c3bb1e767f01d5281a'),
	(20, 1, 15, 'JOEL', 'PATATA', 'FRITA', '123KJH31', '1325324', '<p>\n	123414HJKGK4JH12G3JH</p>\n', '<p>\n	12JH34G12JKH</p>\n', '2021-05-11', NULL, '9533382c95ee42d391a8e57a6594284e'),
	(21, 1, 15, 'jkashf ', 'jskdhf a', 'kjhsa dkfj ', 'jkh', 'kj hkjh', '<p>\n	kjhsdfkjhasfkjh</p>\n', '<p>\n	lksjhadfkjhaf&nbsp;</p>\n', '2021-05-11', NULL, 'd6a39daf641b4679a87c2b6a691ef1ce');
/*!40000 ALTER TABLE `incidencies` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.login_attempts
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.login_attempts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.materials
CREATE TABLE IF NOT EXISTS `materials` (
  `id_mat` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL DEFAULT '0',
  `desc` longtext NOT NULL,
  `num_serie` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_mat`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.materials: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.mat_inci
CREATE TABLE IF NOT EXISTS `mat_inci` (
  `id_mat_inci` int(11) unsigned NOT NULL,
  `id_mat` int(11) unsigned NOT NULL,
  `id_inci` int(11) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_mat_inci`),
  KEY `FK_mat` (`id_mat`),
  KEY `FK_inci` (`id_inci`),
  CONSTRAINT `FK_inci` FOREIGN KEY (`id_inci`) REFERENCES `incidencies` (`id_inci`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mat` FOREIGN KEY (`id_mat`) REFERENCES `materials` (`id_mat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.mat_inci: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mat_inci` DISABLE KEYS */;
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

-- Volcando estructura para tabla bitbit.tasques
CREATE TABLE IF NOT EXISTS `tasques` (
  `id_tasca` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) unsigned NOT NULL,
  `id_inci` int(11) unsigned NOT NULL,
  `desc` longtext NOT NULL,
  `start_date` date NOT NULL DEFAULT curdate(),
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id_tasca`),
  KEY `id_user` (`id_user`),
  KEY `id_inci` (`id_inci`),
  CONSTRAINT `FK_tasques_inci` FOREIGN KEY (`id_inci`) REFERENCES `incidencies` (`id_inci`),
  CONSTRAINT `FK_tasques_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.tasques: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tasques` DISABLE KEYS */;
INSERT INTO `tasques` (`id_tasca`, `id_user`, `id_inci`, `desc`, `start_date`, `end_date`) VALUES
	(4, 3, 1, '<p>\n	felicitats campeon a currar GOS</p>\n', '2021-05-07', NULL),
	(5, 18, 6, '<p>\n	estreno</p>\n', '2021-05-07', NULL),
	(6, 2, 1, '<p>\n	ASD</p>\n', '2021-05-18', NULL),
	(8, 2, 1, '<p>\n	asd</p>\n', '2021-05-18', NULL),
	(9, 2, 1, '<p>\n	asd</p>\n', '2021-05-18', NULL),
	(20, 3, 1, '<p>\n	test</p>\n', '2021-05-10', NULL);
/*!40000 ALTER TABLE `tasques` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.tipus_consulta
CREATE TABLE IF NOT EXISTS `tipus_consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consulta` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.tipus_consulta: ~0 rows (aproximadamente)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_email` (`email`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  UNIQUE KEY `uc_remember_selector` (`remember_selector`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
	(1, '127.0.0.1', 'administrator', '$2y$10$gpGtuiacEw4AbP8tgx7Z2exNOoiP/IgW24vJZWZXIQrEQMG7HJQ4q', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1619291859, 1, 'Admin', 'istrator', 'ADMIN', '123456789'),
	(2, '::1', 'test', '$2y$10$0Bp.39JsZLy9Y9y/J2p86.72F0E.fQI8uMgJ8w9uaqVLgrcBSDHXy', 'test@test.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1619291471, 1620725734, 1, '', '', '', NULL),
	(3, '::1', 'usuari1', '$2y$10$WPxZ5HrQVjPhbSwXbyQ54.4Q6COstkQR0x/r0UKteL1xbf.qjXPUG', 'usuari1@usuari1.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1619296588, 1619296636, 1, 'usuari 1', 'test', '', NULL),
	(4, '::1', 'estudillo', '$2y$10$0eV9d2OXh01UTkThhnDeuOebo8/n81svDd2p5ukn0J3qNMVBTLMqK', 'estudillo@estudillo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1619297343, 1619297359, 1, 'Noel', 'Estudillo', 'BOBO S.L.', NULL),
	(5, '::1', 'test2', '$2y$10$uMzrdZjHVb8Veom7HXsdLODpBK5Ffvf16bGxQZLa6rdLykSvDAfcy', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620311820, 1620662888, 1, '1234', '1234', '1234', NULL),
	(15, '::1', 'test4', '$2y$10$X1.HVIEW1kLFMt9bak9wLOSI8ZRDizs7m5RuQfTyyOprpsB54shw2', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620324221, 1620725693, 1, '1234', '1234', '123', NULL),
	(18, '::1', 'test6', '$2y$10$aA33Lpa3zLcJEkn50Owaw.ZJdIBtN6snitBZZMUKdIhGHyM2v1gSS', '1234567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1620325894, 1620325894, 1, '1234567', '1234567', '1234567', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.users_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1),
	(4, 3, 4),
	(5, 4, 2),
	(6, 5, 2),
	(7, 15, 4),
	(8, 18, 4);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

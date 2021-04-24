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

-- Volcando estructura para tabla bitbit.captcha
CREATE TABLE IF NOT EXISTS `captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.captcha: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.groups: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `name`, `description`) VALUES
	(1, 'admin', 'Administrator'),
	(2, 'members', 'General User');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.login_attempts
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.login_attempts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.messages: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id_msg`, `from`, `to`, `about`, `content`, `send_date`, `send_hour`, `recive_date`, `recive_hour`) VALUES
	(4, 'test', 'administrator', 'prova missatge', 'shfjksldhfksljdhflksjahdfljksadf', '2021-04-23', '00:00:00', NULL, NULL),
	(5, 'test', 'administrator', 'prova missatge', 'shfjksldhfksljdhflksjahdfljksadf', '2021-04-23', '00:00:00', NULL, NULL),
	(11, 'administrator', 'administrator', 'test amb from', 'laksjd', '2021-04-23', '21:23:36', NULL, NULL),
	(12, 'administrator', 'administrator', 'test', 'añksjdalksdj', '2021-04-23', '21:34:34', NULL, NULL),
	(13, 'administrator', 'administrator', 'test long message', 'test', '2021-04-24', '13:29:05', NULL, NULL),
	(14, 'administrator', 'administrator', 'test long', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel massa a mauris ornare scelerisque. Maecenas facilisis et nisl mattis suscipit. Pellentesque iaculis cursus ullamcorper. Nullam dignissim non libero at molestie. Quisque ut facilisis ex. Nulla volutpat justo mauris, nec ullamcorper ex ultrices vitae. Praesent ullamcorper lobortis nibh eget porttitor. Phasellus elementum tortor turpis, et cursus nunc suscipit quis. Suspendisse pellentesque lobortis lobortis. Morbi cursus iaculis odio a iaculis. Nunc et quam mattis, gravida dui quis, eleifend arcu. Sed eleifend, sem ac fringilla tincidunt, magna lorem accumsan nisi, a posuere nisi ante vitae magna. Suspendisse potenti. Cras dapibus tincidunt tincidunt. Mauris quis ligula posuere, tempus leo quis, sollicitudin diam. Nam odio elit, semper at porta ornare, efficitur a orci.\r\n\r\nUt vehicula vulputate malesuada. Maecenas vitae nisl et augue sagittis sollicitudin. Vestibulum ultricies ante sit amet tincidunt euismod. Fusce scelerisque est erat, vitae mattis ante dignissim a. Sed laoreet dictum egestas. Morbi leo neque, mattis ut pretium et, imperdiet nec ex. Sed cursus rutrum metus vitae gravida. Morbi eu ullamcorper neque, vitae porttitor lectus. Praesent condimentum mollis efficitur. Pellentesque sit amet nisi tempus enim pulvinar facilisis.\r\n\r\nDonec elementum arcu id ex fringilla rhoncus id fermentum ante. Nulla scelerisque elit enim, nec condimentum massa fermentum nec. Sed pharetra ullamcorper metus. Nulla placerat orci non nibh commodo auctor. Ut pretium vehicula ex non porttitor. Proin pharetra, nibh ut aliquet lobortis, turpis nisl finibus risus, sed facilisis nulla odio nec leo. Maecenas laoreet leo id ligula sodales feugiat. In id sapien magna. Fusce a risus vel nisl interdum rutrum. Fusce convallis, magna et gravida placerat, neque metus dapibus lacus, quis sagittis lectus nisl ut tortor. Cras non justo lacinia, aliquet neque quis, ullamcorper eros. Ut feugiat sem quis nibh euismod, at consequat nisi euismod. Vivamus et pellentesque urna. Sed sed nibh sed turpis pulvinar condimentum.\r\n\r\nIn hac habitasse platea dictumst. Cras convallis libero sed eros dignissim suscipit ut nec turpis. Mauris convallis, sapien blandit imperdiet pulvinar, dui neque posuere leo, a tincidunt eros felis eget ex. Pellentesque interdum aliquam faucibus. Nullam euismod, sem sed auctor sollicitudin, augue erat aliquet mauris, ut maximus libero purus et purus. Vestibulum elementum orci augue, at consequat odio tristique a. Cras vitae enim purus. Ut pharetra lacinia quam, nec dictum lorem fringilla sed. Nunc laoreet lectus eu purus rutrum suscipit. Sed vitae condimentum dui. Nunc ultrices, enim nec consequat porta, nunc lorem aliquam est, eu auctor felis nibh eget magna. Praesent commodo, sapien eu placerat fringilla, orci orci posuere tellus, sit amet elementum lorem nisl ut ligula. Integer egestas tristique leo ut volutpat. Mauris elementum tortor quis tellus scelerisque, condimentum commodo neque imperdiet. Mauris vel facilisis urna. Donec dolor sapien, tempor nec pulvinar vel, mollis et elit.', '2021-04-24', '13:34:05', NULL, NULL);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
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
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_email` (`email`),
  UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  UNIQUE KEY `uc_remember_selector` (`remember_selector`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.users: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
	(1, '127.0.0.1', 'administrator', '$2y$10$gpGtuiacEw4AbP8tgx7Z2exNOoiP/IgW24vJZWZXIQrEQMG7HJQ4q', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1619273464, 1, 'Admin', 'istrator', 'ADMIN', '123456789');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bitbit.users_groups: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
	(1, 1, 1),
	(2, 1, 2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;

-- Volcando estructura para tabla bitbit.usuaris
CREATE TABLE IF NOT EXISTS `usuaris` (
  `username` varchar(50) DEFAULT NULL,
  `userpass` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bitbit.usuaris: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuaris` DISABLE KEYS */;
INSERT INTO `usuaris` (`username`, `userpass`) VALUES
	('test', '$2y$10$ROFP9uDvSfiT2N80F7xCke4eyPT3RF2oxErOVJtoIzgwht8fQCR3G');
/*!40000 ALTER TABLE `usuaris` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

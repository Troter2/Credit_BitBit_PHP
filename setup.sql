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


-- Volcando estructura de base de datos para bd_ci
CREATE DATABASE IF NOT EXISTS `bd_ci` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bd_ci`;

-- Volcando estructura para tabla bd_ci.captcha
CREATE TABLE IF NOT EXISTS `captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_ci.captcha: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `captcha` DISABLE KEYS */;
INSERT INTO `captcha` (`captcha_id`, `captcha_time`, `ip_address`, `word`) VALUES
	(47, 1616001248, '::1', 'X0aUTccB'),
	(48, 1616001261, '::1', 'WsU3tVDx'),
	(49, 1616001382, '::1', 'R0HlbTng'),
	(50, 1616001616, '::1', 'a8Xk8OW7'),
	(51, 1616001649, '::1', '700LljTR'),
	(52, 1616001666, '::1', 'Iv6hVcFO'),
	(53, 1616001691, '::1', 'zJEO5OIS'),
	(54, 1616001710, '::1', 'mS0loWce'),
	(55, 1616001718, '::1', 'KBDS4ZCe'),
	(56, 1616001931, '::1', 'xAmrdlL7'),
	(57, 1616001978, '::1', 'FwuO7rSq'),
	(58, 1616002086, '::1', 'JSx3jaGc'),
	(59, 1616002150, '::1', 'PhYCm8I7'),
	(60, 1616002167, '::1', 'a15R6Yrn'),
	(61, 1616002866, '::1', 'ngPgXsBT'),
	(62, 1616002899, '::1', 'hcstkiXP'),
	(63, 1616002913, '::1', 'zdiGyT9B'),
	(64, 1616002924, '::1', 'zD3mv0F3'),
	(65, 1616002956, '::1', '0X6oMQeu'),
	(66, 1616167169, '::1', 'tonEqWD5'),
	(67, 1616167184, '::1', 'gY3G207p');
/*!40000 ALTER TABLE `captcha` ENABLE KEYS */;

-- Volcando estructura para tabla bd_ci.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `text` text NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_ci.news: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`id`, `title`, `slug`, `text`, `date`) VALUES
	(55, 'test', 'test-1231-03-12', 'prova alskjdsjkdfhskajjfhsklfhskjfhskjfhksjdfhksjhfaskdjjdf', '1231-03-12'),
	(56, 'sdafsdfsaf', 'sdafsdfsaf-1311-03-12', 'fsdfsfasfsafsfdgdfshdsg', '1311-03-12'),
	(57, 'sfsadfas', 'sfsadfas-0042-03-21', '2341124312', '0042-03-21'),
	(58, '2431234', '2431234-0412-03-12', '24123124234', '0412-03-12'),
	(59, '12341242134', '12341242134-3321-04-12', '123432414', '3321-04-12'),
	(60, '2341234324', '2341234324-4124-03-12', '31242313243243125564536', '4124-03-12'),
	(61, '5675467', '5675467-3423-12-12', '123432414', '3423-12-12');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

-- Volcando estructura para tabla bd_ci.usuaris
CREATE TABLE IF NOT EXISTS `usuaris` (
  `username` varchar(50) DEFAULT NULL,
  `userpass` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_ci.usuaris: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `usuaris` DISABLE KEYS */;
INSERT INTO `usuaris` (`username`, `userpass`) VALUES
	('test', '$2y$10$ROFP9uDvSfiT2N80F7xCke4eyPT3RF2oxErOVJtoIzgwht8fQCR3G');
/*!40000 ALTER TABLE `usuaris` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

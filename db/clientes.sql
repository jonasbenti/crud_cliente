/*
SQLyog Enterprise v12.13 (64 bit)
MySQL - 5.7.28 : Database - cad_clientes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cad_clientes` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `cad_clientes`;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(90) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `cpf` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `telefone` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cliente` */

insert  into `cliente`(`id`,`nome_completo`,`email`,`cpf`,`telefone`) values (2,'CLIENTE2','cliente2@cliente.com','00000000002','47000000002'),(3,'CLIENTE3 teste','cliente3@cliente.com','33333333333','47000000003'),(4,'CLIENTE4','cliente4@cliente.com','00000000004','47000000004'),(6,'CLIENTE6 2020','cliente6@cliente.com','6666666666','47999999996');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `data_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `descricao_antes` text CHARACTER SET utf8 COMMENT 'mostra o registro antes da alteração/exclusão',
  `descricao_depois` text CHARACTER SET utf8 COMMENT 'mostra o registro após a exclusão',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `log` */

insert  into `log`(`id`,`acao`,`data_hora`,`descricao_antes`,`descricao_depois`) values (1,'delete','2020-08-02 13:56:17','id: 5, Nome: CLIENTE5, email: cliente5@cliente.com, cpf: 00000000005, telefone: 47000000005.','id: 5 excluido com sucesso!'),(2,'update','2020-08-02 13:56:39','id: 6, Nome: CLIENTE6, email: cliente6@cliente.com, cpf: 00000000006, telefone: 47000000006.','id: 6, Nome: CLIENTE6 2020, email: cliente6@cliente.com, cpf: 6666666666, telefone: 47999999996.'),(3,'delete','2020-08-02 13:57:24','id: 1, Nome: CLIENTE1, email: cliente1@cliente.com, cpf: 00000000001, telefone: 47000000001.','id: 1 excluido com sucesso!'),(4,'update','2020-08-02 13:58:17','id: 3, Nome: CLIENTE3, email: cliente3@cliente.com, cpf: 00000000003, telefone: 47000000003.','id: 3, Nome: CLIENTE3 teste, email: cliente3@cliente.com, cpf: 33333333333, telefone: 47000000003.');

/* Trigger structure for table `cliente` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_altera_cliente` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_altera_cliente` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
    	INSERT INTO cad_clientes.log 
	(acao, data_hora, descricao_antes, descricao_depois)
	VALUES
	('update', now(), 
	CONCAT('id: ', OLD.id, ', Nome: ', OLD.nome_completo, ', email: ', OLD.email, ', cpf: ', OLD.cpf, ', telefone: ', OLD.telefone, '.'),
	concat('id: ', NEW.id, ', Nome: ', NEW.nome_completo, ', email: ', NEW.email, ', cpf: ', NEW.cpf, ', telefone: ', new.telefone, '.')
	 );
    END */$$


DELIMITER ;

/* Trigger structure for table `cliente` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_deleta_cliente` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_deleta_cliente` AFTER DELETE ON `cliente` FOR EACH ROW BEGIN
    	INSERT INTO cad_clientes.log 
	(acao, data_hora, descricao_antes, descricao_depois)
	VALUES
	('delete', NOW(), 
	CONCAT('id: ', OLD.id, ', Nome: ', OLD.nome_completo, ', email: ', OLD.email, ', cpf: ', OLD.cpf, ', telefone: ', OLD.telefone, '.'),
	CONCAT('id: ', OLD.id, ' excluido com sucesso!')
	 );
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

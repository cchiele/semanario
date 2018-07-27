-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.1.65-community - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- Copiando dados para a tabela semanario.tblusu: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tblusu` DISABLE KEYS */;
INSERT INTO `tblusu` (`usucod`, `usulogin`, `ususenha`, `usunome`, `usuativo`) VALUES
	(1, 'admin', 'C4CA4238A0B923820DCC509A6F75849B', 'ADMINISTRADOR', 1),
	(2, 'deise', '202CB962AC59075B964B07152D234B70', 'DEISE COLEONE PINTO', 1),
	(3, 'josi', '202CB962AC59075B964B07152D234B70', 'JOSI DIDONE', 1),
	(4, 'patricia', '202CB962AC59075B964B07152D234B70', 'PATRICIA SOARES', 1),
	(5, 'claudio', '202CB962AC59075B964B07152D234B70', 'CLAUDIOMIRO ROMANINI', 1),
	(6, 'raquel', '202CB962AC59075B964B07152D234B70', 'RAQUEL FERREIRA CORREA', 1);
/*!40000 ALTER TABLE `tblusu` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

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
-- Copiando dados para a tabela semanario.tblads: ~60 rows (aproximadamente)
/*!40000 ALTER TABLE `tblads` DISABLE KEYS */;
INSERT INTO `tblads` (`adscod`, `adsordem`, `adsnivel`, `adspermiss`, `adsdescrpermiss`, `adscodtab`) VALUES
	(1, 10, 0, NULL, 'Cadastros', NULL),
	(2, 20, 1, NULL, 'Assinantes', NULL),
	(3, 30, 2, 'consultar', 'Consultar Assinantes', 1),
	(4, 40, 2, 'incluir', 'Incluir Assinante', NULL),
	(5, 50, 2, 'alterar', 'Alterar Assinante', NULL),
	(6, 60, 2, 'excluir', 'Excluir Assinante', NULL),
	(7, 70, 1, NULL, 'Zonas', NULL),
	(8, 80, 2, 'consultar', 'Consultar', 1),
	(9, 90, 2, 'incluir', 'Incluir', NULL),
	(10, 100, 2, 'alterar', 'Alterar', NULL),
	(11, 110, 2, 'excluir', 'Excluir', NULL),
	(12, 120, 1, NULL, 'Vendedores', NULL),
	(13, 130, 2, 'consultar', 'Consultar', 1),
	(14, 140, 2, 'incluir', 'Incluir', NULL),
	(15, 150, 2, 'alterar', 'Alterar', NULL),
	(16, 160, 2, 'excluir', 'Excluir', NULL),
	(17, 170, 1, NULL, 'Grupos de Vendedores', NULL),
	(18, 180, 2, 'consultar', 'Consultar', 1),
	(19, 190, 2, 'incluir', 'Incluir', NULL),
	(20, 200, 2, 'alterar', 'Alterar', NULL),
	(21, 210, 2, 'excluir', 'Excluir', NULL),
	(22, 220, 1, NULL, 'Cobradores', NULL),
	(23, 230, 2, 'consultar', 'Consultar', 1),
	(24, 240, 2, 'incluir', 'Incluir', NULL),
	(25, 250, 2, 'alterar', 'Alterar', NULL),
	(26, 260, 2, 'excluir', 'Excluir', NULL),
	(27, 270, 1, NULL, 'CEPs', NULL),
	(28, 280, 2, 'consultar', 'Consultar', 1),
	(29, 290, 2, 'incluir', 'Incluir', NULL),
	(30, 300, 2, 'alterar', 'Alterar', NULL),
	(31, 310, 2, 'excluir', 'Excluir', NULL),
	(38, 380, 0, NULL, 'Relatórios', NULL),
	(39, 390, 1, 'relat_baixas', 'Baixas', 38),
	(41, 410, 1, 'relat_etiquetas', 'Etiquetas', 38),
	(43, 430, 1, 'relat_ass_cancel', 'Assinaturas Canceladas', 38),
	(45, 450, 1, 'relat_ass_pendentes', 'Assinaturas Pendentes', 38),
	(47, 470, 1, 'relat_recibos', 'Recibos', 38),
	(53, 530, 0, NULL, 'Administração', NULL),
	(54, 540, 1, NULL, 'Cadastro de Empresa', NULL),
	(55, 550, 2, 'consultar', 'Consultar', 53),
	(56, 560, 2, 'alterar', 'Alterar', NULL),
	(58, 580, 1, NULL, 'Cadastro de Usuários', NULL),
	(59, 590, 2, 'consultar', 'Consultar', 53),
	(60, 600, 2, 'incluir', 'Incluir', NULL),
	(61, 610, 2, 'alterar', 'Alterar', NULL),
	(62, 620, 2, 'excluir', 'Excluir', NULL),
	(63, 630, 1, NULL, 'Alteração de Senha', NULL),
	(64, 640, 2, 'alterar_senha_permitir', 'Permitir', 53),
	(65, 111, 1, NULL, 'Ruas das Zonas', NULL),
	(66, 112, 2, 'consultar', 'Consultar', 1),
	(67, 113, 2, 'incluir', 'Incluir', NULL),
	(68, 114, 2, 'alterar', 'Alterar', NULL),
	(69, 115, 2, 'excluir', 'Excluir', NULL),
	(70, 61, 2, 'incluir_assinatura', 'Incluir Assinaturas', NULL),
	(71, 62, 2, 'alterar_assinatura', 'Alterar Assinatura', NULL),
	(72, 63, 2, 'excluir_assinatura', 'Excluir Assinatura', NULL),
	(73, 64, 2, 'incluir_baixa', 'Incluir Baixa Pagamento', NULL),
	(74, 65, 2, 'alterar_baixa', 'Alterar Baixa Pagamento', NULL),
	(75, 66, 2, 'excluir_baixa', 'Excluir Baixa Pagamento', NULL),
	(76, 67, 2, 'renovacao_auto', 'Renovação automática', 1);
/*!40000 ALTER TABLE `tblads` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

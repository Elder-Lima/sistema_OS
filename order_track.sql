-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Fev-2024 às 01:58
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `order_track`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `ID_ADM` int(5) NOT NULL,
  `NOME_ADM` varchar(100) NOT NULL,
  `SOBRENOME_ADM` varchar(150) NOT NULL,
  `EMAIL_ADM` varchar(350) NOT NULL,
  `USUARIO_ADM` varchar(200) NOT NULL,
  `SENHA_ADM` varchar(200) NOT NULL,
  `IMAGEM_ADM` longblob DEFAULT NULL,
  `RECUPERAR_SENHA` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `alteracao_ordem`
--

CREATE TABLE `alteracao_ordem` (
  `ID_AO` int(5) NOT NULL,
  `DATA_ALTERACAO` datetime DEFAULT NULL,
  `ALTERACAO` varchar(300) DEFAULT NULL,
  `FK_ORDEM` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `ID_FUNCIONARIO` int(5) NOT NULL,
  `NOME_FUNCIONARIO` varchar(100) NOT NULL,
  `SOBRENOME_FUNCIONARIO` varchar(200) NOT NULL,
  `USUARIO_FUNCIONARIO` varchar(200) DEFAULT NULL,
  `SENHA_FUNCIONARIO` varchar(250) DEFAULT NULL,
  `IMAGEM_FUNCIONARIO` longblob DEFAULT NULL,
  `STATUS_FUNCIONARIO` enum('ATIVO','INATIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico_ordem`
--

CREATE TABLE `historico_ordem` (
  `ID_HISTORICO` int(5) NOT NULL,
  `DATA_FINALIZACAO` datetime DEFAULT NULL,
  `TEMPO_ATENDIMENTO` datetime DEFAULT NULL,
  `NOTAS` varchar(500) DEFAULT NULL,
  `DATA_EXECUCAO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem`
--

CREATE TABLE `ordem` (
  `ID_ORDEM` int(5) NOT NULL,
  `SERVICO` varchar(200) DEFAULT NULL,
  `ITEM` varchar(200) DEFAULT NULL,
  `LOCALIZACAO` varchar(200) DEFAULT NULL,
  `PRAZO` date DEFAULT NULL,
  `PRIORIDADE` varchar(200) DEFAULT NULL,
  `STATUS` enum('PENDENTE','EM ANDAMENTO','CONCLUIDO','CANCELADO') DEFAULT NULL,
  `NUMERO_OS` varchar(10) DEFAULT NULL,
  `FOTO` longblob DEFAULT NULL,
  `CRIADO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rel`
--

CREATE TABLE `rel` (
  `ID_REL` int(5) NOT NULL,
  `FK_FUNCIONARIO` int(5) DEFAULT NULL,
  `FK_ORDEM` int(5) DEFAULT NULL,
  `FK_HISTORICO` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorio_funcionarios`
--

CREATE TABLE `relatorio_funcionarios` (
  `ID_RELATORIO` int(5) NOT NULL,
  `FK_FUNCIONARIO` int(5) DEFAULT NULL,
  `DATA_ATUALIZACAO` datetime DEFAULT NULL,
  `ORDENS_ATENDIDAS` int(5) DEFAULT NULL,
  `ORDENS_ABERTAS` int(5) DEFAULT NULL,
  `ORDENS_CONCLUIDA` varchar(10) DEFAULT NULL,
  `ORDENS_CANCELADAS` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`ID_ADM`);

--
-- Índices para tabela `alteracao_ordem`
--
ALTER TABLE `alteracao_ordem`
  ADD PRIMARY KEY (`ID_AO`),
  ADD KEY `FK_ORDEM` (`FK_ORDEM`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`ID_FUNCIONARIO`);

--
-- Índices para tabela `historico_ordem`
--
ALTER TABLE `historico_ordem`
  ADD PRIMARY KEY (`ID_HISTORICO`);

--
-- Índices para tabela `ordem`
--
ALTER TABLE `ordem`
  ADD PRIMARY KEY (`ID_ORDEM`);

--
-- Índices para tabela `rel`
--
ALTER TABLE `rel`
  ADD PRIMARY KEY (`ID_REL`),
  ADD KEY `FK_FUNCIONARIO` (`FK_FUNCIONARIO`),
  ADD KEY `FK_ORDEM` (`FK_ORDEM`),
  ADD KEY `FK_HISTORICO` (`FK_HISTORICO`);

--
-- Índices para tabela `relatorio_funcionarios`
--
ALTER TABLE `relatorio_funcionarios`
  ADD PRIMARY KEY (`ID_RELATORIO`),
  ADD KEY `FK_FUNCIONARIO` (`FK_FUNCIONARIO`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `ID_ADM` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `alteracao_ordem`
--
ALTER TABLE `alteracao_ordem`
  MODIFY `ID_AO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `ID_FUNCIONARIO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historico_ordem`
--
ALTER TABLE `historico_ordem`
  MODIFY `ID_HISTORICO` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ordem`
--
ALTER TABLE `ordem`
  MODIFY `ID_ORDEM` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rel`
--
ALTER TABLE `rel`
  MODIFY `ID_REL` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `relatorio_funcionarios`
--
ALTER TABLE `relatorio_funcionarios`
  MODIFY `ID_RELATORIO` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alteracao_ordem`
--
ALTER TABLE `alteracao_ordem`
  ADD CONSTRAINT `alteracao_ordem_ibfk_1` FOREIGN KEY (`FK_ORDEM`) REFERENCES `ordem` (`ID_ORDEM`);

--
-- Limitadores para a tabela `rel`
--
ALTER TABLE `rel`
  ADD CONSTRAINT `rel_ibfk_1` FOREIGN KEY (`FK_FUNCIONARIO`) REFERENCES `funcionarios` (`ID_FUNCIONARIO`),
  ADD CONSTRAINT `rel_ibfk_2` FOREIGN KEY (`FK_ORDEM`) REFERENCES `ordem` (`ID_ORDEM`),
  ADD CONSTRAINT `rel_ibfk_3` FOREIGN KEY (`FK_HISTORICO`) REFERENCES `historico_ordem` (`ID_HISTORICO`);

--
-- Limitadores para a tabela `relatorio_funcionarios`
--
ALTER TABLE `relatorio_funcionarios`
  ADD CONSTRAINT `relatorio_funcionarios_ibfk_1` FOREIGN KEY (`FK_FUNCIONARIO`) REFERENCES `funcionarios` (`ID_FUNCIONARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

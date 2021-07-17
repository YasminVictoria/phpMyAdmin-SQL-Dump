-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Jul-2021 às 23:55
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_equipe1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `Id_aluno` int(10) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Sobrenome` varchar(60) DEFAULT NULL,
  `Idade` int(3) DEFAULT NULL,
  `Sexo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`Id_aluno`, `Nome`, `Sobrenome`, `Idade`, `Sexo`) VALUES
(1, 'Paula', 'Silvia', 20, 'Feminino'),
(2, 'Yasmin', 'Benicio', 19, 'Feminino'),
(3, 'Gabriel', 'Hais', 19, 'Masculino'),
(4, 'Andreia', 'Lima', 17, 'Feminino'),
(5, 'Andressa', 'Oliveira', 18, 'Feminino'),
(6, 'Alice', 'Benko', 18, 'Feminino'),
(7, 'Betriz', 'Almeida', 19, 'Feminino'),
(8, 'Geovanna', 'Lim', 17, 'Feminino'),
(9, 'Luane', 'Oliveira', 17, 'Feminino'),
(10, 'Thaina', 'Vieira', 20, 'Feminino');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `id_contato` int(10) NOT NULL,
  `contato1` varchar(11) DEFAULT NULL,
  `contato2` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `Id_chave` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`id_contato`, `contato1`, `contato2`, `email`, `Id_chave`) VALUES
(1, '2147483647', '2147483647', 'paula@gmail.com', 1),
(2, '99191919222', '99176498122', 'email@gmail.com', 2),
(3, '99191919333', '99176498133', 'email3@gmail.com', 3),
(4, '99191919444', '99176498144', '4444@gmail.com', 4),
(5, '19919191955', '99176498155', 'email5@gmail.com', 5),
(6, '99191919166', '99176498126', 'ana6@gmail.com', 6),
(7, '99191919177', '99176498177', 'linda@gmail.com', 7),
(8, '99188819191', '99176498188', 'email8@gmail.com', 8),
(9, '99199919191', '99176498199', 'email9@gmail.com', 9),
(10, '99191919110', '19107649812', 'eu10@gmail.com', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `Id_livro` int(11) NOT NULL,
  `Nome_livro` varchar(50) DEFAULT NULL,
  `Preco_normal` decimal(10,2) DEFAULT NULL,
  `Preco_desconto` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`Id_livro`, `Nome_livro`, `Preco_normal`, `Preco_desconto`) VALUES
(2, 'JS', '500.00', '495.00'),
(3, 'CSS', '200.00', '198.00');

--
-- Acionadores `livro`
--
DELIMITER $$
CREATE TRIGGER `trigger_esconto` BEFORE INSERT ON `livro` FOR EACH ROW SET NEW.preco_desconto = (NEW.preco_normal * 0.99)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materias`
--

CREATE TABLE `materias` (
  `Id_materias` int(10) NOT NULL,
  `carga_horaria` int(3) DEFAULT NULL,
  `id_chave_materia` int(10) NOT NULL,
  `nome_materia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `materias`
--

INSERT INTO `materias` (`Id_materias`, `carga_horaria`, `id_chave_materia`, `nome_materia`) VALUES
(1, 12, 0, NULL),
(2, 12, 2, 'sql'),
(3, 12, 3, 'programação'),
(4, 12, 4, 'programação'),
(5, 12, 5, 'sql');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`Id_aluno`);

--
-- Índices para tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`id_contato`),
  ADD KEY `Id_chave` (`Id_chave`);

--
-- Índices para tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`Id_livro`);

--
-- Índices para tabela `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`Id_materias`),
  ADD KEY `id_chave_materia` (`id_chave_materia`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `Id_aluno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `id_contato` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `Id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `materias`
--
ALTER TABLE `materias`
  MODIFY `Id_materias` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

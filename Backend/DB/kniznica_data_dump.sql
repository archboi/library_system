-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2021 at 03:48 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kniznica`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id_branch` int(11) NOT NULL,
  `branch_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kniha`
--

CREATE TABLE `kniha` (
  `id_kniha` int(11) NOT NULL,
  `id_template` int(11) NOT NULL,
  `id_branch` int(255) NOT NULL,
  `umiestnenie_knihy` varchar(255) NOT NULL,
  `dostupnost` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kniha`
--

INSERT INTO `kniha` (`id_kniha`, `id_template`, `id_branch`, `umiestnenie_knihy`, `dostupnost`) VALUES
(3, 1, 1, '4A1', 1),
(4, 1, 1, '4A2', 1),
(5, 2, 1, '3A1', 1),
(6, 3, 2, '1B2', 1),
(7, 3, 1, '1B2', 1),
(8, 4, 1, '5A3', 1),
(9, 5, 1, '2C4', 1),
(10, 6, 1, '6B1', 1),
(11, 7, 3, '3C4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kniha_template`
--

CREATE TABLE `kniha_template` (
  `id_template` int(11) NOT NULL,
  `nazov` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `rok_vydania` year(4) DEFAULT NULL,
  `vydavatelsvo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kniha_template`
--

INSERT INTO `kniha_template` (`id_template`, `nazov`, `autor`, `rok_vydania`, `vydavatelsvo`) VALUES
(1, 'Lord of the Rings: Fellowship of the ring', 'John Ronald Reuel Tolkien', 1954, ''),
(2, 'Robot Dreams', 'Isaac Asimov', 1986, ''),
(3, 'wizard of earthsea', 'Ursula K. Le Guinová', 1986, ''),
(4, 'Kde raky spievajú', 'Delia Owens', 2019, ''),
(5, 'Witcher The last wish', 'Andrzej Sapowski', 1993, ''),
(6, 'Color out of space', 'Howard Phillips Lovecraft', 1927, ''),
(7, 'Conan of Cimmeria', 'Robert E. Howard', 1969, '');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `id_librarian` int(11) NOT NULL,
  `id_branch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`id_librarian`, `id_branch`) VALUES
(1, 1),
(2, 3),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `osoba`
--

CREATE TABLE `osoba` (
  `meno` varchar(255) DEFAULT NULL,
  `priezvisko` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel_cislo` varchar(255) DEFAULT NULL,
  `id_zakaznik` int(255) DEFAULT NULL,
  `id_librarian` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `osoba`
--

INSERT INTO `osoba` (`meno`, `priezvisko`, `email`, `tel_cislo`, `id_zakaznik`, `id_librarian`) VALUES
('juraj', 'Majdak', 'juraj@daah.com', '0909', NULL, 1),
('Filip', 'Lesik', 'Filip@daah.com', '0908', NULL, 2),
('Benjamin', 'Tej', '...@daah.com', '008', NULL, 3),
('daah', 'inamata', 'daah@daah.com', '0909', 49, NULL),
('Peter', 'Korba', 'Peto@daah.com', '0905', 50, NULL),
('Kabrian', 'Inamata', 'kabri@daah.com', '+420907', 51, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `poskodenie`
--

CREATE TABLE `poskodenie` (
  `poskodenie` varchar(255) NOT NULL,
  `id_kniha` int(11) NOT NULL,
  `id_zakaznik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poskodenie`
--

INSERT INTO `poskodenie` (`poskodenie`, `id_kniha`, `id_zakaznik`) VALUES
('nadtrhnuta strana 42', 1, 49),
('strana 1-22 poliata kavaou', 2, 50),
('nadtrhnuta 55 strana', 1, 50),
('rozjebana', 3, 50);

-- --------------------------------------------------------

--
-- Table structure for table `vypozicane_knihy`
--

CREATE TABLE `vypozicane_knihy` (
  `id_kniha` int(11) NOT NULL,
  `id_zakaznik` int(11) NOT NULL,
  `datum_vypozicania` date NOT NULL,
  `datum_vratenia` date DEFAULT NULL,
  `datum_terminu_vratenia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vypozicane_knihy`
--

INSERT INTO `vypozicane_knihy` (`id_kniha`, `id_zakaznik`, `datum_vypozicania`, `datum_vratenia`, `datum_terminu_vratenia`) VALUES
(1, 1, '2021-11-23', NULL, '2021-11-23'),
(1, 1, '2021-11-23', NULL, '2021-12-23'),
(3, 1, '2021-11-23', NULL, '2021-11-23'),
(1, 49, '2021-11-23', NULL, '2021-12-23'),
(3, 49, '2021-11-23', NULL, '2021-12-23'),
(5, 49, '2021-11-23', NULL, '2021-12-23'),
(7, 49, '2021-11-23', NULL, '2021-12-23'),
(3, 50, '2021-11-23', NULL, '2021-12-23'),
(11, 50, '2021-11-23', '2021-11-23', '2021-12-23'),
(11, 51, '2021-11-23', '2021-11-23', '2021-12-23');

-- --------------------------------------------------------

--
-- Table structure for table `zakaznik`
--

CREATE TABLE `zakaznik` (
  `id_zakaznik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zakaznik`
--

INSERT INTO `zakaznik` (`id_zakaznik`) VALUES
(49),
(50),
(51);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id_branch`);

--
-- Indexes for table `kniha`
--
ALTER TABLE `kniha`
  ADD PRIMARY KEY (`id_kniha`),
  ADD KEY `kniha_fk0` (`id_template`);

--
-- Indexes for table `kniha_template`
--
ALTER TABLE `kniha_template`
  ADD PRIMARY KEY (`id_template`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`id_librarian`);

--
-- Indexes for table `osoba`
--
ALTER TABLE `osoba`
  ADD KEY `osoba_fk1` (`id_librarian`),
  ADD KEY `osoba_fk0` (`id_zakaznik`);

--
-- Indexes for table `zakaznik`
--
ALTER TABLE `zakaznik`
  ADD PRIMARY KEY (`id_zakaznik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kniha`
--
ALTER TABLE `kniha`
  MODIFY `id_kniha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kniha_template`
--
ALTER TABLE `kniha_template`
  MODIFY `id_template` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
  MODIFY `id_librarian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zakaznik`
--
ALTER TABLE `zakaznik`
  MODIFY `id_zakaznik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kniha`
--
ALTER TABLE `kniha`
  ADD CONSTRAINT `kniha_fk0` FOREIGN KEY (`id_template`) REFERENCES `kniha_template` (`id_template`) ON UPDATE CASCADE;

--
-- Constraints for table `osoba`
--
ALTER TABLE `osoba`
  ADD CONSTRAINT `osoba_fk1` FOREIGN KEY (`id_librarian`) REFERENCES `librarian` (`id_librarian`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

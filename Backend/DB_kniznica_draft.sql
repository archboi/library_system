-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2021 at 10:37 AM
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
  `branch` varchar(255) NOT NULL,
  `umiestnenie_knihy` varchar(255) NOT NULL,
  `dostupnost` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kniha_template`
--

CREATE TABLE `kniha_template` (
  `id_template` int(11) NOT NULL,
  `nazov` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `rok_vydania` date NOT NULL,
  `vydavatelsvo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `id_librarian` int(11) NOT NULL,
  `id_branch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `osoba`
--

CREATE TABLE `osoba` (
  `meno` varchar(255) NOT NULL,
  `priezvisko` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel_cislo` varchar(255) NOT NULL,
  `id_zakaznik` int(255) NOT NULL,
  `id_librarian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `poskodenie`
--

CREATE TABLE `poskodenie` (
  `poskodenie` varchar(255) NOT NULL,
  `id_kniha` int(11) NOT NULL,
  `id_zakaznik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `zakaznik`
--

CREATE TABLE `zakaznik` (
  `id_zakaznik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD PRIMARY KEY (`id_librarian`),
  ADD KEY `librarian_fk0` (`id_branch`);

--
-- Indexes for table `osoba`
--
ALTER TABLE `osoba`
  ADD KEY `osoba_fk0` (`id_zakaznik`),
  ADD KEY `osoba_fk1` (`id_librarian`);

--
-- Indexes for table `poskodenie`
--
ALTER TABLE `poskodenie`
  ADD KEY `poskodenie_fk0` (`id_kniha`),
  ADD KEY `poskodenie_fk1` (`id_zakaznik`);

--
-- Indexes for table `vypozicane_knihy`
--
ALTER TABLE `vypozicane_knihy`
  ADD KEY `vypozicane_knihy_fk0` (`id_kniha`),
  ADD KEY `vypozicane_knihy_fk1` (`id_zakaznik`);

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
  MODIFY `id_kniha` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kniha_template`
--
ALTER TABLE `kniha_template`
  MODIFY `id_template` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
  MODIFY `id_librarian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zakaznik`
--
ALTER TABLE `zakaznik`
  MODIFY `id_zakaznik` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kniha`
--
ALTER TABLE `kniha`
  ADD CONSTRAINT `kniha_fk0` FOREIGN KEY (`id_template`) REFERENCES `kniha_template` (`id_template`);

--
-- Constraints for table `librarian`
--
ALTER TABLE `librarian`
  ADD CONSTRAINT `librarian_fk0` FOREIGN KEY (`id_branch`) REFERENCES `branches` (`id_branch`);

--
-- Constraints for table `osoba`
--
ALTER TABLE `osoba`
  ADD CONSTRAINT `osoba_fk0` FOREIGN KEY (`id_zakaznik`) REFERENCES `zakaznik` (`id_zakaznik`),
  ADD CONSTRAINT `osoba_fk1` FOREIGN KEY (`id_librarian`) REFERENCES `librarian` (`id_librarian`);

--
-- Constraints for table `poskodenie`
--
ALTER TABLE `poskodenie`
  ADD CONSTRAINT `poskodenie_fk0` FOREIGN KEY (`id_kniha`) REFERENCES `kniha` (`id_kniha`),
  ADD CONSTRAINT `poskodenie_fk1` FOREIGN KEY (`id_zakaznik`) REFERENCES `zakaznik` (`id_zakaznik`);

--
-- Constraints for table `vypozicane_knihy`
--
ALTER TABLE `vypozicane_knihy`
  ADD CONSTRAINT `vypozicane_knihy_fk0` FOREIGN KEY (`id_kniha`) REFERENCES `kniha` (`id_kniha`),
  ADD CONSTRAINT `vypozicane_knihy_fk1` FOREIGN KEY (`id_zakaznik`) REFERENCES `zakaznik` (`id_zakaznik`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 09, 2013 at 09:33 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `ankieta_kwestionariusz`
--

CREATE TABLE IF NOT EXISTS `ankieta_kwestionariusz` (
  `id_ankieta_kwestionariusz` int(11) NOT NULL,
  `id_goscie` int(11) NOT NULL,
  `id_ankieta_zestaw` int(11) NOT NULL,
  `data_wypelnienia` datetime DEFAULT NULL,
  PRIMARY KEY (`id_ankieta_kwestionariusz`),
  KEY `id_ankieta_zestaw_idx` (`id_ankieta_zestaw`),
  KEY `id_goscie_idx` (`id_goscie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ankieta_odp`
--

CREATE TABLE IF NOT EXISTS `ankieta_odp` (
  `id_ankieta_odp` int(11) NOT NULL,
  `id_goscie` int(11) NOT NULL,
  `id_ankieta_pyt` int(11) NOT NULL,
  `wartosc` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `tekst` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id_ankieta_odp`),
  KEY `id_ankieta_pyt_idx` (`id_ankieta_pyt`),
  KEY `id_goscie_idx` (`id_goscie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ankieta_pyt`
--

CREATE TABLE IF NOT EXISTS `ankieta_pyt` (
  `id_ankieta_pyt` int(11) NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `id_ankieta_zestaw` int(11) NOT NULL,
  PRIMARY KEY (`id_ankieta_pyt`),
  KEY `id_ankieta_zestaw_idx` (`id_ankieta_zestaw`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ankieta_zestaw`
--

CREATE TABLE IF NOT EXISTS `ankieta_zestaw` (
  `id_ankieta_zestaw` int(11) NOT NULL,
  `tytul` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `opis` mediumtext COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_ankieta_zestaw`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beta_test_mail`
--

CREATE TABLE IF NOT EXISTS `beta_test_mail` (
  `id_beta_test_mail` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `data` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `ip` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_beta_test_mail`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=51 ;

--
-- Dumping data for table `beta_test_mail`
--

INSERT INTO `beta_test_mail` (`id_beta_test_mail`, `mail`, `data`, `status`, `ip`) VALUES
(11, 'marcinek@stelmaszczuki.pl', '2013-03-22 13:36:33', 1, '192.168.0.30'),
(12, 'marta@stelmaszczuk.pl', '2013-03-27 12:50:20', 1, '::1'),
(50, 'a@a.pl', '2013-05-09 13:08:02', 1, '::1');

-- --------------------------------------------------------

--
-- Table structure for table `goscie`
--

CREATE TABLE IF NOT EXISTS `goscie` (
  `id_goscie` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(12) COLLATE utf8_polish_ci NOT NULL,
  `mail` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `kod_pocztowy` varchar(5) COLLATE utf8_polish_ci DEFAULT NULL,
  `ulica` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `miasto` varchar(65) COLLATE utf8_polish_ci DEFAULT NULL,
  `id_typy_dokumentow` int(11) DEFAULT NULL,
  `nr_dokumentu` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id_goscie`),
  KEY `id_typy_dokumentow_idx` (`id_typy_dokumentow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kategorie_proste_strony`
--

CREATE TABLE IF NOT EXISTS `kategorie_proste_strony` (
  `id_kategorie` int(11) NOT NULL AUTO_INCREMENT,
  `tytul` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `skrot_tresci` mediumtext COLLATE utf8_polish_ci,
  `tresc` longtext COLLATE utf8_polish_ci NOT NULL,
  `data_utworzenia` datetime NOT NULL,
  `kolejnosc` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `id_pracownicy` int(11) NOT NULL,
  PRIMARY KEY (`id_kategorie`),
  KEY `id_pracownicy_idx` (`id_pracownicy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `klasa_pokoju`
--

CREATE TABLE IF NOT EXISTS `klasa_pokoju` (
  `id_klasa_pokoju` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `cena` int(11) NOT NULL,
  PRIMARY KEY (`id_klasa_pokoju`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `klasa_pokoju`
--

INSERT INTO `klasa_pokoju` (`id_klasa_pokoju`, `nazwa`, `opis`, `cena`) VALUES
(19, 'ccc', 'aaaa', 12),
(22, 'new', 'onew', 11),
(23, 'qwerty', 'opisqwerty', 123);

-- --------------------------------------------------------

--
-- Table structure for table `numery`
--

CREATE TABLE IF NOT EXISTS `numery` (
  `id_numery` int(11) NOT NULL,
  `numer` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_numery`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oferta`
--

CREATE TABLE IF NOT EXISTS `oferta` (
  `id_oferta` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `cena` int(11) NOT NULL,
  PRIMARY KEY (`id_oferta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pokoje`
--

CREATE TABLE IF NOT EXISTS `pokoje` (
  `id_pokoje` int(11) NOT NULL AUTO_INCREMENT,
  `id_klasa_pokoju` int(11) NOT NULL,
  `id_numery` int(11) NOT NULL,
  PRIMARY KEY (`id_pokoje`),
  KEY `id_klasa_pokoju_idx` (`id_klasa_pokoju`),
  KEY `id_numery_idx` (`id_numery`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `pozycje_platnosci`
--

CREATE TABLE IF NOT EXISTS `pozycje_platnosci` (
  `id_pozycje_platnosci` int(11) NOT NULL AUTO_INCREMENT,
  `id_rezerwacje` int(11) NOT NULL,
  `id_oferta` int(11) NOT NULL,
  `id_klasa_pokoju` int(11) NOT NULL,
  `krotnosc` int(11) NOT NULL,
  `wartosc` int(11) NOT NULL,
  `status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id_pozycje_platnosci`),
  KEY `id_oferta_idx` (`id_oferta`),
  KEY `id_rezerwacje_idx` (`id_rezerwacje`),
  KEY `id_klasa_pokoju_idx` (`id_klasa_pokoju`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pracownicy`
--

CREATE TABLE IF NOT EXISTS `pracownicy` (
  `id_pracownicy` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id_pracownicy`),
  KEY `id_role_idx` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `proste_strony`
--

CREATE TABLE IF NOT EXISTS `proste_strony` (
  `id_strony_proste` int(11) NOT NULL AUTO_INCREMENT,
  `tytul` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `id_kategorie` int(11) DEFAULT NULL,
  `skrot_tresci` mediumtext COLLATE utf8_polish_ci,
  `tresc` longtext COLLATE utf8_polish_ci NOT NULL,
  `data_utworzenia` datetime NOT NULL,
  `kolejnosc` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `id_pracownicy` int(11) NOT NULL,
  `tytul_en` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `skrot_tresci_en` mediumtext COLLATE utf8_polish_ci,
  `tresc_en` longtext COLLATE utf8_polish_ci,
  PRIMARY KEY (`id_strony_proste`),
  KEY `id_kategorie_idx` (`id_kategorie`),
  KEY `id_pracownicy_idx` (`id_pracownicy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rezerwacje`
--

CREATE TABLE IF NOT EXISTS `rezerwacje` (
  `id_rezerwacje` int(11) NOT NULL AUTO_INCREMENT,
  `id_statusy` int(11) NOT NULL,
  `data` date NOT NULL,
  `id_goscie` int(11) NOT NULL,
  `id_pokoje` int(11) NOT NULL,
  `nr_pobytu_goscia` int(11) NOT NULL,
  PRIMARY KEY (`id_rezerwacje`),
  KEY `id_goscie_idx` (`id_goscie`),
  KEY `id_pokoje_idx` (`id_pokoje`),
  KEY `id_statusy_idx` (`id_statusy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `opis` tinytext COLLATE utf8_polish_ci,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_uprawnienia`
--

CREATE TABLE IF NOT EXISTS `role_has_uprawnienia` (
  `role_id_role` int(11) NOT NULL,
  `uprawnienia_id_uprawnienia` int(11) NOT NULL,
  PRIMARY KEY (`role_id_role`,`uprawnienia_id_uprawnienia`),
  KEY `fk_role_has_uprawnienia_uprawnienia1_idx` (`uprawnienia_id_uprawnienia`),
  KEY `fk_role_has_uprawnienia_role1_idx` (`role_id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statusy`
--

CREATE TABLE IF NOT EXISTS `statusy` (
  `id_statusy` int(11) NOT NULL,
  `nazwa` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `opis` tinytext COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_statusy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typy_dokumentow`
--

CREATE TABLE IF NOT EXISTS `typy_dokumentow` (
  `id_typy_dokumentow` int(11) NOT NULL,
  `nazwa` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_typy_dokumentow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uprawnienia`
--

CREATE TABLE IF NOT EXISTS `uprawnienia` (
  `id_uprawnienia` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `opis` tinytext COLLATE utf8_polish_ci,
  PRIMARY KEY (`id_uprawnienia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wiadomosci`
--

CREATE TABLE IF NOT EXISTS `wiadomosci` (
  `id_wiadomosci` int(11) NOT NULL AUTO_INCREMENT,
  `id_pracownicy` int(11) NOT NULL,
  `id_goscie` int(11) NOT NULL,
  `temat` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id_wiadomosci`),
  KEY `id_pracownicy_idx` (`id_pracownicy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wiadomosci_has_goscie`
--

CREATE TABLE IF NOT EXISTS `wiadomosci_has_goscie` (
  `wiadomosci_id_wiadomosci` int(11) NOT NULL,
  `goscie_id_goscie` int(11) NOT NULL,
  PRIMARY KEY (`wiadomosci_id_wiadomosci`,`goscie_id_goscie`),
  KEY `fk_wiadomosci_has_goscie_goscie1_idx` (`goscie_id_goscie`),
  KEY `fk_wiadomosci_has_goscie_wiadomosci1_idx` (`wiadomosci_id_wiadomosci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ankieta_kwestionariusz`
--
ALTER TABLE `ankieta_kwestionariusz`
  ADD CONSTRAINT `id_ankieta_zestaw2` FOREIGN KEY (`id_ankieta_zestaw`) REFERENCES `ankieta_zestaw` (`id_ankieta_zestaw`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_goscie2` FOREIGN KEY (`id_goscie`) REFERENCES `goscie` (`id_goscie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ankieta_odp`
--
ALTER TABLE `ankieta_odp`
  ADD CONSTRAINT `id_ankieta_pyt` FOREIGN KEY (`id_ankieta_pyt`) REFERENCES `ankieta_pyt` (`id_ankieta_pyt`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_goscie3` FOREIGN KEY (`id_goscie`) REFERENCES `goscie` (`id_goscie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ankieta_pyt`
--
ALTER TABLE `ankieta_pyt`
  ADD CONSTRAINT `id_ankieta_zestaw` FOREIGN KEY (`id_ankieta_zestaw`) REFERENCES `ankieta_zestaw` (`id_ankieta_zestaw`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `goscie`
--
ALTER TABLE `goscie`
  ADD CONSTRAINT `id_typy_dokumentow` FOREIGN KEY (`id_typy_dokumentow`) REFERENCES `typy_dokumentow` (`id_typy_dokumentow`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kategorie_proste_strony`
--
ALTER TABLE `kategorie_proste_strony`
  ADD CONSTRAINT `id_pracownicy2` FOREIGN KEY (`id_pracownicy`) REFERENCES `pracownicy` (`id_pracownicy`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pokoje`
--
ALTER TABLE `pokoje`
  ADD CONSTRAINT `id_klasa_pokoju3` FOREIGN KEY (`id_klasa_pokoju`) REFERENCES `klasa_pokoju` (`id_klasa_pokoju`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_numery` FOREIGN KEY (`id_numery`) REFERENCES `numery` (`id_numery`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pozycje_platnosci`
--
ALTER TABLE `pozycje_platnosci`
  ADD CONSTRAINT `id_klasa_pokoju2` FOREIGN KEY (`id_klasa_pokoju`) REFERENCES `klasa_pokoju` (`id_klasa_pokoju`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_oferta` FOREIGN KEY (`id_oferta`) REFERENCES `oferta` (`id_oferta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_rezerwacje` FOREIGN KEY (`id_rezerwacje`) REFERENCES `rezerwacje` (`id_rezerwacje`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `id_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `proste_strony`
--
ALTER TABLE `proste_strony`
  ADD CONSTRAINT `id_kategorie` FOREIGN KEY (`id_kategorie`) REFERENCES `kategorie_proste_strony` (`id_kategorie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_pracownicy3` FOREIGN KEY (`id_pracownicy`) REFERENCES `pracownicy` (`id_pracownicy`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD CONSTRAINT `id_goscie` FOREIGN KEY (`id_goscie`) REFERENCES `goscie` (`id_goscie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_pokoje` FOREIGN KEY (`id_pokoje`) REFERENCES `pokoje` (`id_pokoje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_statusy` FOREIGN KEY (`id_statusy`) REFERENCES `statusy` (`id_statusy`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role_has_uprawnienia`
--
ALTER TABLE `role_has_uprawnienia`
  ADD CONSTRAINT `fk_role_has_uprawnienia_role1` FOREIGN KEY (`role_id_role`) REFERENCES `role` (`id_role`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_role_has_uprawnienia_uprawnienia1` FOREIGN KEY (`uprawnienia_id_uprawnienia`) REFERENCES `uprawnienia` (`id_uprawnienia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `wiadomosci`
--
ALTER TABLE `wiadomosci`
  ADD CONSTRAINT `id_pracownicy` FOREIGN KEY (`id_pracownicy`) REFERENCES `pracownicy` (`id_pracownicy`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `wiadomosci_has_goscie`
--
ALTER TABLE `wiadomosci_has_goscie`
  ADD CONSTRAINT `fk_wiadomosci_has_goscie_goscie1` FOREIGN KEY (`goscie_id_goscie`) REFERENCES `goscie` (`id_goscie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_wiadomosci_has_goscie_wiadomosci1` FOREIGN KEY (`wiadomosci_id_wiadomosci`) REFERENCES `wiadomosci` (`id_wiadomosci`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

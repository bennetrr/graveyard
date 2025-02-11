-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 30. Mai 2021 um 12:36
-- Server-Version: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- PHP-Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `website`
--
CREATE DATABASE IF NOT EXISTS `website` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `website`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `404link`
--
-- Erstellt am: 08. Sep 2020 um 14:25
--

CREATE TABLE `404link` (
  `localAdress` varchar(30) NOT NULL,
  `redirectAdress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `downloads`
--
-- Erstellt am: 08. Nov 2020 um 12:27
--

CREATE TABLE `downloads` (
  `name` text NOT NULL,
  `fullname` text NOT NULL,
  `ersteller` text NOT NULL,
  `version` text NOT NULL,
  `os` text NOT NULL,
  `file_url` varchar(100) NOT NULL,
  `copyright_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `404link`
--
ALTER TABLE `404link`
  ADD UNIQUE KEY `localAdress` (`localAdress`);

--
-- Indizes für die Tabelle `downloads`
--
ALTER TABLE `downloads`
  ADD UNIQUE KEY `file_url` (`file_url`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

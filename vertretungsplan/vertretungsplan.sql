-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 30. Mai 2021 um 12:35
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
-- Datenbank: `vertretungsplan`
--
CREATE DATABASE IF NOT EXISTS `vertretungsplan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vertretungsplan`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `info_heute`
--
-- Erstellt am: 10. Okt 2020 um 15:22
--

CREATE TABLE `info_heute` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `info_morgen`
--
-- Erstellt am: 10. Okt 2020 um 15:22
--

CREATE TABLE `info_morgen` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `plan_heute`
--
-- Erstellt am: 10. Okt 2020 um 15:22
--

CREATE TABLE `plan_heute` (
  `id` int(11) NOT NULL,
  `klasse` text NOT NULL,
  `stufe` int(11) NOT NULL,
  `stunde` text NOT NULL,
  `lehrer` text NOT NULL,
  `fach` text NOT NULL,
  `infotext` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `plan_morgen`
--
-- Erstellt am: 10. Okt 2020 um 15:22
--

CREATE TABLE `plan_morgen` (
  `id` int(11) NOT NULL,
  `klasse` text NOT NULL,
  `stufe` int(11) NOT NULL,
  `stunde` text NOT NULL,
  `lehrer` text NOT NULL,
  `fach` text NOT NULL,
  `infotext` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--
-- Erstellt am: 11. Okt 2020 um 10:10
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `passwd` mediumtext NOT NULL,
  `sysuser` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `stufe` int(11) NOT NULL,
  `rechte` mediumtext NOT NULL,
  `loggedin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `info_heute`
--
ALTER TABLE `info_heute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indizes für die Tabelle `info_morgen`
--
ALTER TABLE `info_morgen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `plan_heute`
--
ALTER TABLE `plan_heute`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `plan_morgen`
--
ALTER TABLE `plan_morgen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `info_heute`
--
ALTER TABLE `info_heute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `info_morgen`
--
ALTER TABLE `info_morgen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `plan_heute`
--
ALTER TABLE `plan_heute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `plan_morgen`
--
ALTER TABLE `plan_morgen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

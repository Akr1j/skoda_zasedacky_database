-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 22. kvě 2019, 16:44
-- Verze serveru: 10.1.40-MariaDB
-- Verze PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `room_database`
--
CREATE DATABASE IF NOT EXISTS `room_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci;
USE `room_database`;

-- --------------------------------------------------------

--
-- Struktura tabulky `defects`
--

CREATE TABLE `defects` (
  `id` int(11) NOT NULL,
  `room_name` varchar(11) COLLATE utf8_czech_ci NOT NULL,
  `fault_name` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `defect_utility` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `date_fault` date NOT NULL,
  `email` varchar(60) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `defects`
--

INSERT INTO `defects` (`id`, `room_name`, `fault_name`, `defect_utility`, `description`, `date_fault`, `email`) VALUES
(2, 'M10-01', 'Testovací chyba', '', 'Popis testovací chyby', '2019-05-23', ''),
(10, 'M10-01', 'Testovací Chyba', 'chair', 'Popis testovací chyby', '2019-05-22', 'undefined');

-- --------------------------------------------------------

--
-- Struktura tabulky `occupied`
--

CREATE TABLE `occupied` (
  `id` int(11) NOT NULL,
  `room_name` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `reservation_name` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `occupied_date` date NOT NULL,
  `occupied_from` time NOT NULL,
  `occupied_to` time NOT NULL,
  `submitter` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `occupied`
--

INSERT INTO `occupied` (`id`, `room_name`, `reservation_name`, `occupied_date`, `occupied_from`, `occupied_to`, `submitter`, `description`) VALUES
(4, 'M10-01', 'Test Reservation', '2019-05-21', '15:00:00', '17:00:00', 'Jan Nykl', 'Testovací rezervace');

-- --------------------------------------------------------

--
-- Struktura tabulky `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_name` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `chair` int(60) NOT NULL,
  `tv` tinyint(1) NOT NULL,
  `solid_door` tinyint(1) NOT NULL,
  `speaker` tinyint(1) NOT NULL,
  `dataprojector` tinyint(1) NOT NULL,
  `whiteboard` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `rooms`
--

INSERT INTO `rooms` (`id`, `room_name`, `contact`, `description`, `chair`, `tv`, `solid_door`, `speaker`, `dataprojector`, `whiteboard`) VALUES
(1, 'M10-01', 'dana.subrtova@skoda-auto.cz', '', 5, 1, 0, 0, 0, 1),
(2, 'M10-02', 'dana.subrtova@skoda-auto.cz', '', 5, 1, 0, 0, 0, 1),
(3, 'M10-03', 'dana.subrtova@skoda-auto.cz', '', 3, 1, 0, 0, 0, 1),
(4, 'M10-04', 'dana.subrtova@skoda-auto.cz', '', 5, 1, 0, 0, 0, 1);

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `defects`
--
ALTER TABLE `defects`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `occupied`
--
ALTER TABLE `occupied`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `defects`
--
ALTER TABLE `defects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `occupied`
--
ALTER TABLE `occupied`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

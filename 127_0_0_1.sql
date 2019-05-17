-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pát 17. kvě 2019, 09:51
-- Verze serveru: 10.1.38-MariaDB
-- Verze PHP: 7.3.2

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
  `id_room` int(11) NOT NULL,
  `fault` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `date_fault` date NOT NULL,
  `date_repair` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `occupied`
--

CREATE TABLE `occupied` (
  `id_room` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `occupied_date` date NOT NULL,
  `occupied_from` time NOT NULL,
  `occupied_to` time NOT NULL,
  `submitter` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `occupied`
--

INSERT INTO `occupied` (`id_room`, `name`, `occupied_date`, `occupied_from`, `occupied_to`, `submitter`, `description`) VALUES
(1, '', '2019-05-14', '14:28:00', '17:00:00', 'Jiří Janďourek', ''),
(2, '', '2019-05-14', '10:25:00', '14:00:00', 'Jan Nykl', '');

-- --------------------------------------------------------

--
-- Struktura tabulky `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_czech_ci NOT NULL,
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

INSERT INTO `rooms` (`id`, `name`, `contact`, `chair`, `tv`, `solid_door`, `speaker`, `dataprojector`, `whiteboard`) VALUES
(0, 'TestRoom', '', 0, 1, 0, 0, 0, 0),
(1, 'Velka místnost', 'Nykl jan', 10, 1, 1, 1, 1, 1),
(5, 'Malá místnost', 'Jiří Janďourek', 2, 0, 0, 0, 0, 0),
(64, 'Malá zasedačka', 'Martin.Novotny@skoda-auto.cz', 5, 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(5, 'Jiří Janďourek', 'jirkajandourek@seznam.cz', '123456789'),
(6, 'Jan Nykl', 'nykl.jan@gmail.com', '987654321');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `rooms`
--
ALTER TABLE `rooms`
  ADD UNIQUE KEY `id` (`id`);

--
-- Klíče pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

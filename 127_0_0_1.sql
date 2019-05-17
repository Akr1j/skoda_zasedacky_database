-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pát 17. kvě 2019, 14:37
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
  `id_room` int(11) NOT NULL,
  `fault` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `descriptio` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `date_fault` date NOT NULL,
  `date_repair` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `occupied`
--

CREATE TABLE `occupied` (
  `special_id` int(11) NOT NULL,
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

INSERT INTO `occupied` (`special_id`, `id_room`, `name`, `occupied_date`, `occupied_from`, `occupied_to`, `submitter`, `description`) VALUES
(3, 1, 'Test reservation', '2019-05-14', '13:00:00', '14:00:00', 'Jiří Janďourek', 'Testovací rezarvace');

-- --------------------------------------------------------

--
-- Struktura tabulky `rooms`
--

CREATE TABLE `rooms` (
  `special_id` int(11) NOT NULL,
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

INSERT INTO `rooms` (`special_id`, `id`, `name`, `contact`, `chair`, `tv`, `solid_door`, `speaker`, `dataprojector`, `whiteboard`) VALUES
(1, 0, 'TestRoom', '', 0, 1, 0, 0, 0, 0),
(2, 1, 'Velka místnost', 'Nykl jan', 10, 1, 1, 1, 1, 1),
(3, 5, 'Malá místnost', 'Jiří Janďourek', 2, 0, 0, 0, 0, 0),
(4, 64, 'Malá zasedačka', 'Martin.Novotny@skoda-auto.cz', 5, 1, 0, 0, 0, 1),
(5, 1, 'M10 1.P-1', 'dana.subrtova@skoda-auto.cz', 5, 1, 0, 0, 1, 1),
(6, 2, 'M10 1.P-2', 'dana.subrtova@skoda-auto.cz', 5, 1, 0, 0, 1, 1),
(7, 3, 'M10 1.P-3', 'dana.subrtova@skoda-auto.cz', 3, 1, 0, 0, 1, 1),
(8, 4, 'M10 1.P-4', 'dana.subrtova@skoda-auto.cz', 5, 1, 0, 0, 1, 1);

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
-- Klíče pro tabulku `occupied`
--
ALTER TABLE `occupied`
  ADD PRIMARY KEY (`special_id`);

--
-- Klíče pro tabulku `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`special_id`);

--
-- Klíče pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `occupied`
--
ALTER TABLE `occupied`
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `rooms`
--
ALTER TABLE `rooms`
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

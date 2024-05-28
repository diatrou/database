-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 19 Μάη 2024 στις 15:27:42
-- Έκδοση διακομιστή: 10.4.32-MariaDB
-- Έκδοση PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `company`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `department`
--

CREATE TABLE `department` (
  `depid` int(11) NOT NULL,
  `depname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `department`
--

INSERT INTO `department` (`depid`, `depname`) VALUES
(1, 'ΛΟΓΙΣΤΗΡΙΟ'),
(2, 'ΠΩΛΗΣΕΙΣ'),
(3, 'ΜΗΧΑΝΟΓΡΑΦΗΣΗ');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `employee`
--

CREATE TABLE `employee` (
  `empid` int(11) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(40) NOT NULL,
  `id` char(8) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `depid` int(11) NOT NULL,
  `salary` float UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `employee`
--

INSERT INTO `employee` (`empid`, `firstname`, `lastname`, `id`, `birthdate`, `gender`, `depid`, `salary`) VALUES
(1, 'ΝΙΚΟΣ', 'ΣΤΑΜΟΣ', 'ΑΧ120130', '1996-02-04', 'Α', 1, 1200),
(2, 'ΜΑΝΟΣ', 'ΣΤΑΜΟΣ', 'ΑΒ190380', '1991-02-12', 'Α', 1, 1100),
(3, 'ΑΝΝΑ', 'ΣΤΑΜΙΟΥ', 'ΑΝ400500', '1992-11-13', 'Γ', 2, 900),
(4, 'ΑΝΤΩΝΗΣ', 'ΒΕΡΓΟΣ', 'ΣΣ300400', '1992-03-05', 'Α', 2, 800),
(5, 'ΜΑΡΙΑ', 'ΒΑΣΙΛΕΙΟΥ', 'ΡΡ450460', '1995-10-11', 'Γ', 3, 850),
(6, 'ΜΑΙΡΗ', 'ΒΟΓΛΗ', 'ΑΝ400600', '1995-11-11', 'Γ', 3, 1300),
(7, 'ΜΑΡΚΟΣ', 'ΒΑΣΙΛΙΚΟΣ', 'ΤΤ345456', '1970-12-13', 'Α', 1, 750),
(8, 'ΕΛΙ', 'ΒΕΡΓΟΥ', 'ΡΤ123456', '1990-10-02', 'Γ', 1, 1300);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `employment`
--

CREATE TABLE `employment` (
  `empid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  `hours` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `employment`
--

INSERT INTO `employment` (`empid`, `taskid`, `hours`) VALUES
(1, 1, 150),
(1, 2, 230),
(2, 2, 260),
(3, 2, 180),
(3, 3, 300),
(4, 2, 280),
(4, 3, 190),
(5, 1, 320),
(6, 3, 320),
(7, 1, 120),
(7, 2, 260),
(7, 3, 320);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `task`
--

CREATE TABLE `task` (
  `taskid` int(11) NOT NULL,
  `taskname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `task`
--

INSERT INTO `task` (`taskid`, `taskname`) VALUES
(1, 'ΜΗΧΑΝΟΓΡΑΦΗΣΗ ΕΤΑΙΡΙΑΣ'),
(2, 'ΚΑΤΑΣΚΕΥΗ ΚΤΗΡΙΩΝ'),
(3, 'ΠΩΛΗΣΕΙΣ ΠΡΟΪΟΝΤΩΝ');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`depid`);

--
-- Ευρετήρια για πίνακα `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empid`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `depid` (`depid`);

--
-- Ευρετήρια για πίνακα `employment`
--
ALTER TABLE `employment`
  ADD PRIMARY KEY (`empid`,`taskid`),
  ADD KEY `taskid` (`taskid`);

--
-- Ευρετήρια για πίνακα `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`taskid`);

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`depid`) REFERENCES `department` (`depid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `employment`
--
ALTER TABLE `employment`
  ADD CONSTRAINT `employment_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employee` (`empid`),
  ADD CONSTRAINT `employment_ibfk_2` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2023 at 10:41 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `archer2`
--

-- --------------------------------------------------------

--
-- Table structure for table `archer`
--

CREATE TABLE `archer` (
  `ARCHER_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `AGE` int(11) NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `EQUIPMENT_ID` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `archer`
--

INSERT INTO `archer` (`ARCHER_ID`, `NAME`, `AGE`, `GENDER`, `EQUIPMENT_ID`) VALUES
(1, 'Lura', 25, 'Female', 1),
(2, 'Rick', 32, 'Male', 2),
(3, 'Sam', 28, 'Male', 1),
(4, 'Curren', 30, 'Male', 3),
(5, 'Bill Gates', 65, 'Male', 4),
(6, 'John Smith', 25, 'Male', 1),
(7, 'John Smith', 25, 'Male', 1);

-- --------------------------------------------------------

--
-- Table structure for table `club_championship`
--

CREATE TABLE `club_championship` (
  `CLUB_CHAMPIONSHIP_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `club_championship`
--

INSERT INTO `club_championship` (`CLUB_CHAMPIONSHIP_ID`, `NAME`) VALUES
(1, 'Australian Open Championship'),
(2, 'National Indoor Archery Championship'),
(3, 'Queensland Archery Championships'),
(4, 'New South Wales State Archery Championships'),
(5, 'Victoria Archery Classic');

-- --------------------------------------------------------

--
-- Table structure for table `competition`
--

CREATE TABLE `competition` (
  `COMPETITIONID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DATE` date NOT NULL,
  `LOCATION` varchar(100) NOT NULL,
  `CLUBCHAMPIONSHIP_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competition`
--

INSERT INTO `competition` (`COMPETITIONID`, `NAME`, `DATE`, `LOCATION`, `CLUBCHAMPIONSHIP_ID`) VALUES
(1, 'Australian Open', '2023-06-15', 'Sydney', 1),
(2, 'National Indoor Championships', '2023-07-20', 'Melbourne', 1),
(3, 'Queensland State Championships', '2023-08-05', 'Brisbane', 3),
(4, 'New South Wales State Championships', '2023-09-10', 'Sydney', 4),
(5, 'Victoria Archery Classic', '2023-10-15', 'Melbourne', 5),
(6, 'Competition Heavy', '2023-06-15', 'Sydney', 1),
(7, 'Competition Heavy', '2023-06-15', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `distance`
--

CREATE TABLE `distance` (
  `DISTANCE_ID` int(11) NOT NULL,
  `DISTANCE_VALUE` int(11) NOT NULL,
  `ENDS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `distance`
--

INSERT INTO `distance` (`DISTANCE_ID`, `DISTANCE_VALUE`, `ENDS`) VALUES
(1, 20, 6),
(2, 30, 6),
(3, 40, 6),
(4, 50, 6),
(5, 60, 6),
(6, 70, 6),
(7, 90, 6);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `EQUIPMENT_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`EQUIPMENT_ID`, `NAME`) VALUES
(1, 'Recurve'),
(2, 'Compound'),
(3, 'Recurve Barebow'),
(4, 'Compound Barebow'),
(5, 'Longbow');

-- --------------------------------------------------------

--
-- Table structure for table `equivalent_round`
--

CREATE TABLE `equivalent_round` (
  `equivalent_round_id` int(11) NOT NULL,
  `round_id` int(11) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `equivalent_round`
--

INSERT INTO `equivalent_round` (`equivalent_round_id`, `round_id`, `valid_from`, `valid_to`) VALUES
(1, 1, '2022-01-01', '2022-12-31'),
(2, 2, '2022-01-01', '2022-12-31'),
(3, 3, '2023-01-01', '2023-12-31'),
(4, 1, '2022-01-01', '2022-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `rangetable`
--

CREATE TABLE `rangetable` (
  `range_id` int(11) NOT NULL,
  `round_id` int(11) NOT NULL,
  `distance_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rangetable`
--

INSERT INTO `rangetable` (`range_id`, `round_id`, `distance_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `round`
--

CREATE TABLE `round` (
  `ROUND_ID` int(11) NOT NULL,
  `COMPETITION_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `TOTAL_ENDS` int(11) NOT NULL,
  `DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `round`
--

INSERT INTO `round` (`ROUND_ID`, `COMPETITION_ID`, `NAME`, `TOTAL_ENDS`, `DATE`) VALUES
(1, 1, 'Round 1', 6, '2023-05-01'),
(2, 1, 'Round 2', 6, '2023-05-08'),
(3, 2, 'Qualification Round', 6, '2023-06-15'),
(4, 2, 'Final Round', 6, '2023-06-16'),
(5, 1, 'Round A', 6, '2023-05-01'),
(6, 1, 'Round A', 0, '2023-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `SCORE_ID` int(11) NOT NULL,
  `ARCHER_ID` int(11) DEFAULT NULL,
  `ROUND_ID` int(11) DEFAULT NULL,
  `COMPETITION_ID` int(11) DEFAULT NULL,
  `EQUIPMENT_ID` int(11) DEFAULT NULL,
  `RANGE_ID` int(11) NOT NULL,
  `DATE` date NOT NULL,
  `TIME` time NOT NULL,
  `END_NUMBER` int(11) NOT NULL,
  `ARROW_SCORE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`SCORE_ID`, `ARCHER_ID`, `ROUND_ID`, `COMPETITION_ID`, `EQUIPMENT_ID`, `RANGE_ID`, `DATE`, `TIME`, `END_NUMBER`, `ARROW_SCORE`) VALUES
(1, 1, 1, 1, 1, 1, '2023-05-01', '09:30:00', 1, 8),
(2, 2, 1, 1, 1, 1, '2023-05-01', '09:30:00', 1, 7),
(3, 3, 1, 1, 1, 1, '2023-05-01', '09:30:00', 1, 9),
(4, 1, 1, 1, 2, 1, '2023-05-01', '10:00:00', 5, 8),
(5, 1, 1, 1, 1, 1, '2023-05-05', '09:30:00', 4, 9),
(6, 1, 1, 1, 1, 1, '2023-05-01', '09:30:00', 1, 8),
(7, 1, 1, NULL, 1, 2, '2023-05-05', '09:30:00', 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `target`
--

CREATE TABLE `target` (
  `TARGET_ID` int(11) NOT NULL,
  `DISTANCE_ID` int(11) DEFAULT NULL,
  `TARGET_FACE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `target`
--

INSERT INTO `target` (`TARGET_ID`, `DISTANCE_ID`, `TARGET_FACE_ID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `target_face`
--

CREATE TABLE `target_face` (
  `TARGET_FACE_ID` int(11) NOT NULL,
  `SIZE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `target_face`
--

INSERT INTO `target_face` (`TARGET_FACE_ID`, `SIZE`) VALUES
(1, 80),
(2, 120);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archer`
--
ALTER TABLE `archer`
  ADD PRIMARY KEY (`ARCHER_ID`),
  ADD KEY `FK_ARCHER_EQUIPMENT` (`EQUIPMENT_ID`),
  ADD KEY `idx_archer_archer_id` (`ARCHER_ID`);

--
-- Indexes for table `club_championship`
--
ALTER TABLE `club_championship`
  ADD PRIMARY KEY (`CLUB_CHAMPIONSHIP_ID`);

--
-- Indexes for table `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`COMPETITIONID`),
  ADD KEY `CLUBCHAMPIONSHIP_ID` (`CLUBCHAMPIONSHIP_ID`);

--
-- Indexes for table `distance`
--
ALTER TABLE `distance`
  ADD PRIMARY KEY (`DISTANCE_ID`),
  ADD KEY `idx_distance_id` (`DISTANCE_ID`),
  ADD KEY `idx_distance_filter` (`DISTANCE_ID`,`DISTANCE_VALUE`,`ENDS`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`EQUIPMENT_ID`);

--
-- Indexes for table `equivalent_round`
--
ALTER TABLE `equivalent_round`
  ADD PRIMARY KEY (`equivalent_round_id`),
  ADD KEY `round_id` (`round_id`);

--
-- Indexes for table `rangetable`
--
ALTER TABLE `rangetable`
  ADD PRIMARY KEY (`range_id`),
  ADD KEY `distance_id` (`distance_id`),
  ADD KEY `idx_rangetable_round_distance` (`round_id`,`distance_id`);

--
-- Indexes for table `round`
--
ALTER TABLE `round`
  ADD PRIMARY KEY (`ROUND_ID`),
  ADD KEY `idx_round_id` (`ROUND_ID`),
  ADD KEY `idx_round_competition` (`COMPETITION_ID`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`SCORE_ID`),
  ADD KEY `FK_SCORE_EQUIPMENT` (`EQUIPMENT_ID`),
  ADD KEY `FK_SCORE_RANGE` (`RANGE_ID`),
  ADD KEY `FK_SCORE_COMPETITION` (`COMPETITION_ID`),
  ADD KEY `idx_score_round_arrow_archer` (`ROUND_ID`,`ARROW_SCORE`,`ARCHER_ID`),
  ADD KEY `idx_score_filter_sort` (`ARCHER_ID`,`ROUND_ID`,`DATE`,`ARROW_SCORE`),
  ADD KEY `idx_score_filter` (`ROUND_ID`,`ARCHER_ID`,`ARROW_SCORE`),
  ADD KEY `idx_score_round_archer_arrow` (`ROUND_ID`,`ARCHER_ID`,`ARROW_SCORE`),
  ADD KEY `idx_score_archer_round_arrow` (`ARCHER_ID`,`ROUND_ID`,`ARROW_SCORE`);

--
-- Indexes for table `target`
--
ALTER TABLE `target`
  ADD PRIMARY KEY (`TARGET_ID`),
  ADD KEY `FK_TARGET_TARGET_FACE` (`TARGET_FACE_ID`),
  ADD KEY `idx_target_distance_face` (`DISTANCE_ID`,`TARGET_FACE_ID`);

--
-- Indexes for table `target_face`
--
ALTER TABLE `target_face`
  ADD PRIMARY KEY (`TARGET_FACE_ID`),
  ADD KEY `idx_target_face_id` (`TARGET_FACE_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archer`
--
ALTER TABLE `archer`
  MODIFY `ARCHER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `club_championship`
--
ALTER TABLE `club_championship`
  MODIFY `CLUB_CHAMPIONSHIP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `competition`
--
ALTER TABLE `competition`
  MODIFY `COMPETITIONID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `distance`
--
ALTER TABLE `distance`
  MODIFY `DISTANCE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `EQUIPMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `equivalent_round`
--
ALTER TABLE `equivalent_round`
  MODIFY `equivalent_round_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rangetable`
--
ALTER TABLE `rangetable`
  MODIFY `range_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `round`
--
ALTER TABLE `round`
  MODIFY `ROUND_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `SCORE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `target`
--
ALTER TABLE `target`
  MODIFY `TARGET_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `target_face`
--
ALTER TABLE `target_face`
  MODIFY `TARGET_FACE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `archer`
--
ALTER TABLE `archer`
  ADD CONSTRAINT `FK_ARCHER_EQUIPMENT` FOREIGN KEY (`EQUIPMENT_ID`) REFERENCES `equipment` (`EQUIPMENT_ID`);

--
-- Constraints for table `competition`
--
ALTER TABLE `competition`
  ADD CONSTRAINT `competition_ibfk_1` FOREIGN KEY (`CLUBCHAMPIONSHIP_ID`) REFERENCES `club_championship` (`CLUB_CHAMPIONSHIP_ID`);

--
-- Constraints for table `equivalent_round`
--
ALTER TABLE `equivalent_round`
  ADD CONSTRAINT `equivalent_round_ibfk_1` FOREIGN KEY (`round_id`) REFERENCES `round` (`ROUND_ID`);

--
-- Constraints for table `rangetable`
--
ALTER TABLE `rangetable`
  ADD CONSTRAINT `rangetable_ibfk_1` FOREIGN KEY (`round_id`) REFERENCES `round` (`ROUND_ID`),
  ADD CONSTRAINT `rangetable_ibfk_2` FOREIGN KEY (`distance_id`) REFERENCES `distance` (`DISTANCE_ID`);

--
-- Constraints for table `round`
--
ALTER TABLE `round`
  ADD CONSTRAINT `round_ibfk_1` FOREIGN KEY (`COMPETITION_ID`) REFERENCES `competition` (`COMPETITIONID`);

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `FK_SCORE_ARCHER` FOREIGN KEY (`ARCHER_ID`) REFERENCES `archer` (`ARCHER_ID`),
  ADD CONSTRAINT `FK_SCORE_COMPETITION` FOREIGN KEY (`COMPETITION_ID`) REFERENCES `competition` (`COMPETITIONID`),
  ADD CONSTRAINT `FK_SCORE_EQUIPMENT` FOREIGN KEY (`EQUIPMENT_ID`) REFERENCES `equipment` (`EQUIPMENT_ID`),
  ADD CONSTRAINT `FK_SCORE_RANGE` FOREIGN KEY (`RANGE_ID`) REFERENCES `rangetable` (`range_id`),
  ADD CONSTRAINT `FK_SCORE_ROUND` FOREIGN KEY (`ROUND_ID`) REFERENCES `round` (`ROUND_ID`);

--
-- Constraints for table `target`
--
ALTER TABLE `target`
  ADD CONSTRAINT `FK_TARGET_DISTANCE` FOREIGN KEY (`DISTANCE_ID`) REFERENCES `distance` (`DISTANCE_ID`),
  ADD CONSTRAINT `FK_TARGET_TARGET_FACE` FOREIGN KEY (`TARGET_FACE_ID`) REFERENCES `target_face` (`TARGET_FACE_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2025 at 03:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ekstrakurikuler_imam`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_siswa` ()   BEGIN
    SELECT NIS, nama_siswa, kode_jurusan FROM siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `stored_produce` ()   BEGIN

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ambil_ekskul`
--

CREATE TABLE `ambil_ekskul` (
  `NIS` varchar(8) NOT NULL,
  `kode_ekskul` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambil_ekskul`
--

INSERT INTO `ambil_ekskul` (`NIS`, `kode_ekskul`) VALUES
('12132011', 'E0702'),
('12132020', 'E0401'),
('12132032', 'E0305'),
('12132041', 'E0602'),
('12132057', 'E0101'),
('12132066', 'E0101'),
('12132074', 'E0305');

-- --------------------------------------------------------

--
-- Table structure for table `ekskul`
--

CREATE TABLE `ekskul` (
  `kode_ekskul` varchar(8) NOT NULL,
  `nama_ekskul` varchar(30) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `kode_guru` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ekskul`
--

INSERT INTO `ekskul` (`kode_ekskul`, `nama_ekskul`, `hari`, `kode_guru`) VALUES
('E0101', 'Basket', 'Senin', '31'),
('E0203', 'Voli', 'Rabu', '05'),
('E0305', 'Pramuka', 'Jumat', '28'),
('E0401', 'Karya Ilmiah Remaja', 'Senin', '12'),
('E0504', 'Leadership', 'Kamis', '34'),
('E0602', 'Badminton', 'Selasa', '34'),
('E0702', 'Palang Merah Remaja', 'Selasa', '25');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `kode_guru` varchar(8) NOT NULL,
  `nama_guru` varchar(30) DEFAULT NULL,
  `alamat_guru` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`kode_guru`, `nama_guru`, `alamat_guru`) VALUES
('05', 'Suranto', 'Salatiga'),
('12', 'Jauhari', 'Semarang'),
('19', 'Sofyan', 'Semarang'),
('25', 'Nur Hayati', 'Kudus'),
('28', 'Rahmadi', 'Demak'),
('31', 'Bambang', 'Semarang'),
('34', 'Agus', 'Semarang');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` varchar(8) NOT NULL,
  `nama_jurusan` varchar(30) DEFAULT NULL,
  `kode_guru` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`, `kode_guru`) VALUES
('MM', 'Multimedia', '12'),
('RL', 'Rekayasa Lunak', '05'),
('TJ', 'Teknik Jaringan', '19');

-- --------------------------------------------------------

--
-- Stand-in structure for view `jurusan_mm`
-- (See below for the actual view)
--
CREATE TABLE `jurusan_mm` (
`nama_siswa` varchar(30)
,`NIS` varchar(8)
,`jenis_kelamin` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `jurusan_rpl`
-- (See below for the actual view)
--
CREATE TABLE `jurusan_rpl` (
`nama_siswa` varchar(30)
,`NIS` varchar(8)
,`jenis_kelamin` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `jurusan_tj`
-- (See below for the actual view)
--
CREATE TABLE `jurusan_tj` (
`nama_siswa` varchar(30)
,`NIS` varchar(8)
,`jenis_kelamin` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `kepala_jurusan`
-- (See below for the actual view)
--
CREATE TABLE `kepala_jurusan` (
`nama_guru` varchar(30)
,`nama_jurusan` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `NIS` varchar(8) NOT NULL,
  `nama_siswa` varchar(30) DEFAULT NULL,
  `jenis_kelamin` varchar(1) DEFAULT NULL,
  `kode_jurusan` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`NIS`, `nama_siswa`, `jenis_kelamin`, `kode_jurusan`) VALUES
('12132011', 'Bella', 'P', 'RL'),
('12132020', 'Desi', 'P', 'MM'),
('12132032', 'Ismail', 'L', 'RL'),
('12132041', 'Mahmud', 'L', 'TJ'),
('12132057', 'Rini', 'P', 'TJ'),
('12132066', 'Tono', 'L', 'MM'),
('12132074', 'Widodo', 'L', 'RL');

-- --------------------------------------------------------

--
-- Structure for view `jurusan_mm`
--
DROP TABLE IF EXISTS `jurusan_mm`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jurusan_mm`  AS SELECT `siswa`.`nama_siswa` AS `nama_siswa`, `siswa`.`NIS` AS `NIS`, `siswa`.`jenis_kelamin` AS `jenis_kelamin` FROM (`siswa` join `jurusan` on(`siswa`.`kode_jurusan` = `jurusan`.`kode_jurusan`)) WHERE `siswa`.`kode_jurusan` = 'MM' ;

-- --------------------------------------------------------

--
-- Structure for view `jurusan_rpl`
--
DROP TABLE IF EXISTS `jurusan_rpl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jurusan_rpl`  AS SELECT `siswa`.`nama_siswa` AS `nama_siswa`, `siswa`.`NIS` AS `NIS`, `siswa`.`jenis_kelamin` AS `jenis_kelamin` FROM (`siswa` join `jurusan` on(`siswa`.`kode_jurusan` = `jurusan`.`kode_jurusan`)) WHERE `siswa`.`kode_jurusan` = 'RL' ;

-- --------------------------------------------------------

--
-- Structure for view `jurusan_tj`
--
DROP TABLE IF EXISTS `jurusan_tj`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jurusan_tj`  AS SELECT `siswa`.`nama_siswa` AS `nama_siswa`, `siswa`.`NIS` AS `NIS`, `siswa`.`jenis_kelamin` AS `jenis_kelamin` FROM (`siswa` join `jurusan` on(`siswa`.`kode_jurusan` = `jurusan`.`kode_jurusan`)) WHERE `siswa`.`kode_jurusan` = 'TJ' ;

-- --------------------------------------------------------

--
-- Structure for view `kepala_jurusan`
--
DROP TABLE IF EXISTS `kepala_jurusan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kepala_jurusan`  AS SELECT `g`.`nama_guru` AS `nama_guru`, `j`.`nama_jurusan` AS `nama_jurusan` FROM (`jurusan` `j` join `guru` `g` on(`j`.`kode_guru` = `g`.`kode_guru`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambil_ekskul`
--
ALTER TABLE `ambil_ekskul`
  ADD PRIMARY KEY (`NIS`,`kode_ekskul`),
  ADD KEY `kode_ekskul` (`kode_ekskul`);

--
-- Indexes for table `ekskul`
--
ALTER TABLE `ekskul`
  ADD PRIMARY KEY (`kode_ekskul`),
  ADD KEY `kode_guru` (`kode_guru`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`kode_guru`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`),
  ADD KEY `kode_guru` (`kode_guru`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`NIS`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ambil_ekskul`
--
ALTER TABLE `ambil_ekskul`
  ADD CONSTRAINT `ambil_ekskul_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`),
  ADD CONSTRAINT `ambil_ekskul_ibfk_2` FOREIGN KEY (`kode_ekskul`) REFERENCES `ekskul` (`kode_ekskul`);

--
-- Constraints for table `ekskul`
--
ALTER TABLE `ekskul`
  ADD CONSTRAINT `ekskul_ibfk_1` FOREIGN KEY (`kode_guru`) REFERENCES `guru` (`kode_guru`);

--
-- Constraints for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`kode_guru`) REFERENCES `guru` (`kode_guru`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

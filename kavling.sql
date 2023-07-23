-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2023 at 09:31 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kavling`
--

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `distributor_id` int(11) NOT NULL,
  `nama_distributor` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `tlp` char(12) DEFAULT NULL,
  `kota` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`distributor_id`, `nama_distributor`, `alamat`, `tlp`, `kota`) VALUES
(1, 'Semen Tiga Roda', 'Jl. Sudirman No. 20', '081234882304', 'Jakarta'),
(2, 'PT Citra Sukma', 'Jl. Taman Katapang No.14', '082347892345', 'Bandung'),
(3, 'Tekad Makmur', 'Jl. Indah Raya No. 23', '082279812965', 'Bandung'),
(4, 'Findo Karya Utama', 'Jl Mandar Perum Bappenas No.7', '082385342953', 'Bekasi'),
(5, 'PT Pava Mandiri', 'Jl Gading Serpong Boulovard No.10', '081344259856', 'Tangerang Selatan');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_cash`
--

CREATE TABLE `pembayaran_cash` (
  `transaksi_id` int(11) NOT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL,
  `pembeli_id` int(11) DEFAULT NULL,
  `rumah_id` int(11) DEFAULT NULL,
  `distributor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran_cash`
--

INSERT INTO `pembayaran_cash` (`transaksi_id`, `tanggal_transaksi`, `total_bayar`, `pembeli_id`, `rumah_id`, `distributor_id`) VALUES
(1, '2022-01-10', 300000000, 2, 2, 4),
(2, '2022-03-17', 200000000, 9, 1, 2),
(3, '2022-07-02', 400000000, 4, 3, 1),
(4, '2022-05-30', 600000000, 7, 5, 3),
(5, '2022-10-12', 500000000, 6, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_kredit`
--

CREATE TABLE `pembayaran_kredit` (
  `transaksi_id` int(11) NOT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `pembeli_id` int(11) DEFAULT NULL,
  `rumah_id` int(11) DEFAULT NULL,
  `distributor_id` int(11) DEFAULT NULL,
  `jumlah_angsuran` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran_kredit`
--

INSERT INTO `pembayaran_kredit` (`transaksi_id`, `tanggal_transaksi`, `pembeli_id`, `rumah_id`, `distributor_id`, `jumlah_angsuran`) VALUES
(1, '2022-10-21', 8, 4, 3, 150000000),
(2, '2022-05-06', 10, 1, 1, 50000000),
(3, '2022-02-13', 5, 5, 5, 250000000),
(4, '2022-06-25', 3, 2, 2, 75000000),
(5, '2022-12-09', 1, 3, 4, 120000000);

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `pembeli_id` int(11) NOT NULL,
  `nama_pembeli` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `tlp` char(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`pembeli_id`, `nama_pembeli`, `alamat`, `email`, `tlp`) VALUES
(1, 'Sabrina Haryanti', 'Jl. Kalimas Baru No.2', 'sabrina@gmail.com', '082236017630'),
(2, 'Cakrabirawa Hidayanto', 'Jl. Tanah Rendah No.3', 'hidayat@gmail.com', '082137220178'),
(3, 'Karma Mahendra', 'Jl. Tunjung No.13', 'mahendra@gmail.com', '082156884965'),
(4, 'Daniswara Sitompul', 'Jl. Citandui No.4', 'swara@gmail.com', '083156880935'),
(5, 'Calista Andriani', 'Jl. Wijaya Timur Raya No.11', 'andriani@gmail.com', '082172788583'),
(6, 'Rini Andriani', 'Jl. Jend Gatot Subroto 289', 'rini@gmail.com', '082291001365'),
(7, 'Widya Permata', 'Jl. Imam Bonjol 80', 'widya@gmail.com', '082131661894'),
(8, 'Taswir Latupono', 'Jl. Merdeka 866', 'taswir@gmail.com', '083871115127'),
(9, 'Tina Handayani', 'Jl. Pasar Baru', 'handayani@gmail.com', '082157119295'),
(10, 'Rudi Anwar', 'Jl. Asia Afrika 90', 'anwar@gmail.com', '082242339098');

-- --------------------------------------------------------

--
-- Table structure for table `rumah`
--

CREATE TABLE `rumah` (
  `rumah_id` int(11) NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `harga_cash` int(11) DEFAULT NULL,
  `harga_kredit` int(11) DEFAULT NULL,
  `luas_rumah` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rumah`
--

INSERT INTO `rumah` (`rumah_id`, `alamat`, `harga_cash`, `harga_kredit`, `luas_rumah`) VALUES
(1, 'Jl. Bukit Raya', 200000000, 50000000, 'LT:30m2 LB:30m2'),
(2, 'Jl. Jatisari', 300000000, 75000000, 'LT:72m2 LB:40m2'),
(3, 'Jl. Singaraja', 400000000, 120000000, 'LT:84m2 LB:45m2'),
(4, 'Jl. Dharmawangsa', 500000000, 150000000, 'LT:96m2 LB:60m2'),
(5, 'Jl. Bima', 600000000, 250000000, 'LT:121m2 LB:65m2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`distributor_id`);

--
-- Indexes for table `pembayaran_cash`
--
ALTER TABLE `pembayaran_cash`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `pembeli_id` (`pembeli_id`),
  ADD KEY `rumah_id` (`rumah_id`),
  ADD KEY `distributor_id` (`distributor_id`);

--
-- Indexes for table `pembayaran_kredit`
--
ALTER TABLE `pembayaran_kredit`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `pembeli_id` (`pembeli_id`),
  ADD KEY `rumah_id` (`rumah_id`),
  ADD KEY `distributor_id` (`distributor_id`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`pembeli_id`);

--
-- Indexes for table `rumah`
--
ALTER TABLE `rumah`
  ADD PRIMARY KEY (`rumah_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `distributor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembayaran_cash`
--
ALTER TABLE `pembayaran_cash`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembayaran_kredit`
--
ALTER TABLE `pembayaran_kredit`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `pembeli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `rumah`
--
ALTER TABLE `rumah`
  MODIFY `rumah_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran_cash`
--
ALTER TABLE `pembayaran_cash`
  ADD CONSTRAINT `pembayaran_cash_ibfk_1` FOREIGN KEY (`pembeli_id`) REFERENCES `pembeli` (`pembeli_id`),
  ADD CONSTRAINT `pembayaran_cash_ibfk_2` FOREIGN KEY (`rumah_id`) REFERENCES `rumah` (`rumah_id`),
  ADD CONSTRAINT `pembayaran_cash_ibfk_3` FOREIGN KEY (`distributor_id`) REFERENCES `distributor` (`distributor_id`);

--
-- Constraints for table `pembayaran_kredit`
--
ALTER TABLE `pembayaran_kredit`
  ADD CONSTRAINT `pembayaran_kredit_ibfk_1` FOREIGN KEY (`pembeli_id`) REFERENCES `pembeli` (`pembeli_id`),
  ADD CONSTRAINT `pembayaran_kredit_ibfk_2` FOREIGN KEY (`rumah_id`) REFERENCES `rumah` (`rumah_id`),
  ADD CONSTRAINT `pembayaran_kredit_ibfk_3` FOREIGN KEY (`distributor_id`) REFERENCES `distributor` (`distributor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

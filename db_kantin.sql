-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 14 Feb 2019 pada 09.13
-- Versi Server: 10.1.22-MariaDB
-- PHP Version: 7.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kantin`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `query_total`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `query_total` (
`jumlah` decimal(65,0)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_laporan`
--

CREATE TABLE `tb_laporan` (
  `kd_laporan` int(11) NOT NULL,
  `untung_rugi` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pasok`
--

CREATE TABLE `tb_pasok` (
  `kd_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `jumlah` int(100) DEFAULT NULL,
  `harga_jual` int(100) DEFAULT NULL,
  `pemasok` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pasok`
--

INSERT INTO `tb_pasok` (`kd_barang`, `nama_barang`, `jumlah`, `harga_jual`, `pemasok`) VALUES
(1, 'Donat', 50, 1000, 'Robbi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `kd_transaksi` int(11) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `jumlah_sisa` int(100) DEFAULT NULL,
  `jumlah_terjual` int(100) DEFAULT NULL,
  `harga_jual` int(100) DEFAULT NULL,
  `subtotal` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur untuk view `query_total`
--
DROP TABLE IF EXISTS `query_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `query_total`  AS  select sum(`tb_transaksi`.`subtotal`) AS `jumlah` from `tb_transaksi` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_laporan`
--
ALTER TABLE `tb_laporan`
  ADD PRIMARY KEY (`kd_laporan`);

--
-- Indexes for table `tb_pasok`
--
ALTER TABLE `tb_pasok`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`kd_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_laporan`
--
ALTER TABLE `tb_laporan`
  MODIFY `kd_laporan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_pasok`
--
ALTER TABLE `tb_pasok`
  MODIFY `kd_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `kd_transaksi` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

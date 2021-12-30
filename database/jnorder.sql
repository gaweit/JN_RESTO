-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2021 at 03:33 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jnorder`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) UNSIGNED NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `status`) VALUES
(2, 'appertizer', '1'),
(3, 'dessert', '1'),
(4, 'makanan', '1');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) UNSIGNED NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `total` int(10) NOT NULL,
  `gambar` text NOT NULL,
  `expired` int(10) NOT NULL,
  `id_pelanggan` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logpesanan`
--

CREATE TABLE `logpesanan` (
  `id_logpesanan` int(11) UNSIGNED NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `total` int(10) NOT NULL,
  `id_pesanan` varchar(11) NOT NULL,
  `id_pelanggan` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1','2','3') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(8, '2021-10-12-170133', 'App\\Database\\Migrations\\Admin', 'default', 'App', 1634606784, 1),
(9, '2021-10-12-170443', 'App\\Database\\Migrations\\Pelanggan', 'default', 'App', 1634606784, 1),
(10, '2021-10-12-170459', 'App\\Database\\Migrations\\Pesanan', 'default', 'App', 1634606784, 1),
(11, '2021-10-12-170538', 'App\\Database\\Migrations\\Keranjang', 'default', 'App', 1634606784, 1),
(12, '2021-10-12-170550', 'App\\Database\\Migrations\\LogPesanan', 'default', 'App', 1634606784, 1),
(13, '2021-10-12-170603', 'App\\Database\\Migrations\\Produk', 'default', 'App', 1634606784, 1),
(14, '2021-10-12-170634', 'App\\Database\\Migrations\\Kategori', 'default', 'App', 1634606784, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_telp` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `no_telp`, `email`, `password`, `status`) VALUES
(1, 'aji', '08355', 'firlana89@gmail.com', 'aji', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` varchar(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `total_bayar` varchar(10) NOT NULL,
  `id_pelanggan` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1','2','3') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) UNSIGNED NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` text NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga`, `deskripsi`, `gambar`, `kategori`, `status`) VALUES
(9, 'kopi manis', 8000, 'tg', '1640520134_37da7c8dbcdf3e7f1b55.png', 'dessert', '1'),
(10, 'nasi goreng', 10000, 'asdasd', '1640520227_b7e076f161dc4fff7385.png', 'makanan', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `keranjang_id_pelanggan_foreign` (`id_pelanggan`);

--
-- Indexes for table `logpesanan`
--
ALTER TABLE `logpesanan`
  ADD PRIMARY KEY (`id_logpesanan`),
  ADD KEY `logpesanan_id_pesanan_foreign` (`id_pesanan`),
  ADD KEY `logpesanan_id_pelanggan_foreign` (`id_pelanggan`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `pesanan_id_pelanggan_foreign` (`id_pelanggan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logpesanan`
--
ALTER TABLE `logpesanan`
  MODIFY `id_logpesanan` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logpesanan`
--
ALTER TABLE `logpesanan`
  ADD CONSTRAINT `logpesanan_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `logpesanan_id_pesanan_foreign` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

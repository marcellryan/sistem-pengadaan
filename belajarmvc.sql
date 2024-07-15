-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2024 at 06:55 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajarmvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `po_detail`
--

CREATE TABLE `po_detail` (
  `po_detil_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `product_supplier_id` int(11) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `po_detail`
--

INSERT INTO `po_detail` (`po_detil_id`, `po_id`, `product_supplier_id`, `harga`, `qty`, `status`, `date_created`) VALUES
(1, 1, 1, '50000', 10, 'Pending', '2024-07-09'),
(2, 2, 2, '45000', 20, 'Completed', '2024-07-09'),
(3, 3, 3, '60000', 15, 'Pending', '2024-07-09'),
(4, 4, 4, '70000', 5, 'Cancelled', '2024-07-09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `status` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `nama`, `satuan`, `status`, `created_at`) VALUES
(1, 'Paracetamol', '100 botol', 'Obat penurun panas', '2024-07-09'),
(2, 'Tolak Angin', '100 sachet', 'Obat masuk angin', '2024-07-09'),
(3, 'Betadine', '50 botol', 'Larutan antiseptik', '2024-07-09'),
(4, 'Amoxicillin', '201 tablet', 'Antibiotik', '2024-07-09'),
(5, 'OBH', '123', 'Obat Batuk', '2024-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

CREATE TABLE `product_supplier` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_supplier`
--

INSERT INTO `product_supplier` (`id`, `supplier_id`, `product_id`, `harga`, `date_created`) VALUES
(1, 1, 1, '50000', '2024-07-09'),
(2, 2, 2, '45000', '2024-07-09'),
(3, 1, 3, '60000', '2024-07-09'),
(4, 3, 4, '70000', '2024-07-09'),
(5, 1, 2, '10000', '0000-00-00'),
(6, 2, 1, '12000', '0000-00-00'),
(7, 5, 1, '11000', '0000-00-00'),
(8, 5, 2, '9000', '0000-00-00'),
(9, 5, 3, '15000', '0000-00-00'),
(10, 5, 4, '14000', '0000-00-00'),
(11, 1, 5, '15000', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `po_id` int(11) NOT NULL,
  `po_number` int(11) NOT NULL,
  `request_number` int(11) NOT NULL,
  `product_supplier_id` int(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `po_date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`po_id`, `po_number`, `request_number`, `product_supplier_id`, `harga`, `po_date`, `status`, `date_created`) VALUES
(1, 1001, 5001, 1, 50000, '2024-07-10', 'Pending', '2024-07-09'),
(2, 1002, 5002, 2, 45000, '2024-07-11', 'Completed', '2024-07-09'),
(3, 1003, 5003, 3, 60000, '2024-07-12', 'Pending', '2024-07-09'),
(4, 1004, 5004, 4, 70000, '2024-07-13', 'Cancelled', '2024-07-09');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `nama_supplier` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `nama_supplier`, `status`, `created_at`) VALUES
(1, 'ABC Corporation', '1234 Elm Street, Springfield', '2024-07-09'),
(2, 'XYZ Industries', '5678 Oak Avenue, Shelbyville', '2024-07-09'),
(3, 'Global Suppliers Ltd.', '9101 Maple Road, Ogdenville', '2024-07-09'),
(4, 'Pt.Indo Gudang ', 'bla bla bla', '2024-07-14'),
(5, 'Indomaret', 'Jl. Karawaci Baru', '2024-07-13');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(1, 'Andre', 'Andre@umb.ac.id', 'default.jpg', '1234', 2, 1, 123456),
(7, 'adnan', 'adnanhamdhany28@gmail.com', 'default.jpg', '$2y$10$8UoFo9D0su3jAAdwG1XjdOAKyBpZCGLsmoMxl.sEtNHLhzzZ3HDta', 1, 1, 1719839434),
(8, 'adnan1', 'adnanhamdhany@gmail.com', 'default.jpg', '$2y$10$CRJBJaK/BbLOzI/yJZShJetoGNYcM6ST23r6s5O0nZnibJguY3g5i', 2, 1, 1719840415),
(9, 'adnan2', 'adnanhamdhany2@gmail.com', 'default.jpg', '$2y$10$yvtwwbb4grhu4tFu0yhSruugA4LtUBMX2VkjWY5PvDUgbNNzzdGPS', 2, 1, 1719903607);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'ADMIN'),
(2, 'USER'),
(3, 'MENU');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 3, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(4, 3, 'Submenu Management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(5, 2, 'Request Barang', 'barang', 'fas fa-fw fa-box', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `po_detail`
--
ALTER TABLE `po_detail`
  ADD PRIMARY KEY (`po_detil_id`),
  ADD UNIQUE KEY `po_id` (`po_id`),
  ADD KEY `product_supplier_id` (`product_supplier_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`po_id`),
  ADD KEY `product_supplier_id` (`product_supplier_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `po_detail`
--
ALTER TABLE `po_detail`
  MODIFY `po_detil_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_supplier`
--
ALTER TABLE `product_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `po_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `po_detail`
--
ALTER TABLE `po_detail`
  ADD CONSTRAINT `po_detail_ibfk_1` FOREIGN KEY (`product_supplier_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `po_detail_ibfk_2` FOREIGN KEY (`po_id`) REFERENCES `purchase_order` (`po_id`),
  ADD CONSTRAINT `po_detail_ibfk_3` FOREIGN KEY (`product_supplier_id`) REFERENCES `product_supplier` (`id`);

--
-- Constraints for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD CONSTRAINT `product_supplier_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_supplier_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`product_supplier_id`) REFERENCES `product_supplier` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

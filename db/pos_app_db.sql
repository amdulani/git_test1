-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2020 at 08:43 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cfg_language`
--

CREATE TABLE `cfg_language` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_ts` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cfg_language`
--

INSERT INTO `cfg_language` (`id`, `name`, `created_ts`, `updated_at`, `updated_by`, `comment`) VALUES
(1, 'Sinhala', '2020-06-01 15:21:12', '2020-06-01 09:52:05', 9, NULL),
(2, 'English', '2020-06-01 15:21:12', '2020-06-01 09:52:05', 9, NULL),
(3, 'Tamil', '2020-06-01 15:22:11', '2020-06-01 09:52:37', 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cfg_role`
--

CREATE TABLE `cfg_role` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table holding all the distribution lines of the project';

--
-- Dumping data for table `cfg_role`
--

INSERT INTO `cfg_role` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Customer', '2020-06-01 10:15:34', '2020-06-01 10:15:34', 9, ''),
(2, 'Shop owner', '2020-06-01 10:15:34', '2020-06-01 10:15:34', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `cfg_stock_para`
--

CREATE TABLE `cfg_stock_para` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table holding all the distribution lines of the project';

--
-- Dumping data for table `cfg_stock_para`
--

INSERT INTO `cfg_stock_para` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Expiration date', '2020-06-06 09:58:06', '2020-06-06 09:58:06', 9, ''),
(2, 'Quantity', '2020-06-06 09:58:20', '2020-06-06 09:58:20', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `cfg_stock_status`
--

CREATE TABLE `cfg_stock_status` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table holding all the distribution lines of the project';

--
-- Dumping data for table `cfg_stock_status`
--

INSERT INTO `cfg_stock_status` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Available', '2020-06-01 10:13:25', '2020-06-01 10:13:25', 9, ''),
(2, 'Not Available', '2020-06-01 10:13:25', '2020-06-01 10:13:25', 9, ''),
(3, 'Expired', '2020-06-01 13:52:46', '2020-06-06 10:24:32', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `cfg_unit`
--

CREATE TABLE `cfg_unit` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table holding all the distribution lines of the project';

--
-- Dumping data for table `cfg_unit`
--

INSERT INTO `cfg_unit` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Parcel', '2019-06-15 13:21:08', '2020-06-01 10:17:13', 9, ''),
(2, 'Kg', '2019-06-15 13:21:08', '2020-06-01 10:17:13', 9, ''),
(4, 'Item', '2019-06-15 13:21:46', '2020-06-01 10:17:13', 9, ''),
(5, 'Liter', '2019-06-15 13:21:46', '2020-06-01 10:17:13', 9, ''),
(6, 'Box', '2019-06-15 13:21:46', '2020-06-01 10:17:13', 9, ''),
(7, 'Packert', '2020-06-01 14:40:56', '2020-06-01 14:40:56', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `cfg_user_action`
--

CREATE TABLE `cfg_user_action` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_ts` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cfg_user_action`
--

INSERT INTO `cfg_user_action` (`id`, `name`, `created_ts`, `updated_at`, `updated_by`, `comment`) VALUES
(1, 'Ordered', '2020-06-01 15:48:52', '2020-06-01 10:19:53', 9, NULL),
(2, 'Purchased', '2020-06-01 15:48:52', '2020-06-01 10:19:53', 9, NULL),
(3, 'Returned', '2020-06-01 19:25:39', '2020-06-01 13:55:39', 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cfg_user_para`
--

CREATE TABLE `cfg_user_para` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table holding all the distribution lines of the project';

--
-- Dumping data for table `cfg_user_para`
--

INSERT INTO `cfg_user_para` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Mobile', '2019-06-15 13:21:08', '2020-06-01 13:58:56', 9, 'Mobile'),
(2, 'Email', '2019-06-15 13:21:08', '2020-06-01 13:58:56', 9, 'Email'),
(3, 'Address', '2019-06-15 13:21:08', '2020-06-01 13:58:56', 9, 'Physical Address'),
(4, 'Picture', '2020-06-01 14:22:20', '2020-06-01 14:22:20', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Vegetable', '2020-06-01 10:23:07', '2020-06-01 10:23:07', 9, ''),
(2, 'Fruit', '2020-06-01 10:23:07', '2020-06-01 10:23:07', 9, ''),
(3, 'Biscuit', '2020-06-01 14:25:29', '2020-06-01 14:25:29', 9, ''),
(4, 'Cake', '2020-06-01 14:25:29', '2020-06-01 14:25:29', 9, ''),
(5, 'Ice cream', '2020-06-01 14:26:52', '2020-06-01 14:26:52', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `user` smallint(5) UNSIGNED NOT NULL,
  `pass` varchar(255) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id`, `user`, `pass`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 7, '1', '2020-06-01 16:38:00', '2020-06-01 16:38:00', 9, ''),
(2, 5, 'acf8064ffca120824efb9ce72f448a4a6fdc87da', '2020-06-01 16:38:00', '2020-06-04 15:15:54', 9, ''),
(3, 4, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '2020-06-01 16:38:00', '2020-06-04 15:14:52', 9, ''),
(4, 6, '1', '2020-06-01 16:38:00', '2020-06-01 16:38:00', 9, ''),
(5, 3, '1', '2020-06-01 16:38:00', '2020-06-01 16:38:00', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `barcode_num` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `retail_unit_price` double UNSIGNED NOT NULL,
  `cost_unit_price` double UNSIGNED NOT NULL,
  `picture` varchar(1000) DEFAULT NULL,
  `unit` tinyint(3) UNSIGNED NOT NULL,
  `category` smallint(5) UNSIGNED NOT NULL,
  `unit_amount` float UNSIGNED NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `barcode_num`, `name`, `retail_unit_price`, `cost_unit_price`, `picture`, `unit`, `category`, `unit_amount`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, '07350053850019', 'Munchee Ringo', 25, 20, 'https://www.meenaclick.com/back_end/assets/product_images/5c8f3cbb314cd.jpg', 7, 3, 1, '2020-06-01 14:42:17', '2020-06-08 10:23:52', 9, ''),
(2, '07350053850026', 'Munchee Hawaiian Cookies', 90, 80, 'https://www.kapruka.com/shops/specialGifts/productImages//1456731553015_GroceryN0106MuncheeHawaiianCookies.jpg', 7, 3, 1, '2020-06-01 14:48:09', '2020-06-08 10:23:52', 9, ''),
(3, '07350053850033', 'Carrots', 35, 30, 'https://www.jessicagavin.com/wp-content/uploads/2019/02/carrots-7-1200.jpg', 2, 1, 1, '2020-06-01 14:50:45', '2020-06-08 10:23:52', 9, ''),
(4, 'GTIN-13: 07350053850019', 'Munchee Milk Shortcake', 80, 60, 'https://cdn.catchme.lk/products/2477/800-munchee-milk-shortcake-biscuit-200g-15857302777622.jpg', 7, 3, 1, '2020-06-01 14:52:40', '2020-06-08 10:23:52', 9, ''),
(5, 'GTIN-14: 27350053850013', 'Beets', 45, 40, 'https://globalfoodworld.life/wp-content/uploads/2020/05/beets.jpg', 2, 1, 1, '2020-06-01 14:55:22', '2020-06-08 10:23:52', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_session`
--

CREATE TABLE `tbl_session` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `user` smallint(5) UNSIGNED NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_session`
--

INSERT INTO `tbl_session` (`id`, `user`, `session_id`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(4, 4, 'ccgsmii941shj44qr4i940d5uo', '2019-06-15 08:16:09', '2020-01-03 19:25:15', 1, ''),
(6, 5, 'd2erjr9r5e2gm6328a5q10teqo', '2019-06-15 08:16:09', '2020-06-01 16:40:35', 1, ''),
(43, 5, 'jslcsa8ghu1lq0p6a4tji1mn5n', '2020-06-04 15:26:38', '2020-06-04 15:26:38', 5, ''),
(44, 5, 'jslcsa8ghu1lq0p6a4tji1mn5n', '2020-06-04 16:00:05', '2020-06-04 16:00:05', 5, ''),
(45, 5, 'jslcsa8ghu1lq0p6a4tji1mn5n', '2020-06-04 16:00:11', '2020-06-04 16:00:11', 5, ''),
(46, 5, 'cg9b3jcbhh2ae2t3eqbpo49g1n', '2020-06-04 16:00:55', '2020-06-04 16:00:55', 5, ''),
(47, 5, 'cg9b3jcbhh2ae2t3eqbpo49g1n', '2020-06-04 16:02:12', '2020-06-04 16:02:12', 5, ''),
(48, 5, 'cg9b3jcbhh2ae2t3eqbpo49g1n', '2020-06-04 16:08:52', '2020-06-04 16:08:52', 5, ''),
(49, 5, 'cg9b3jcbhh2ae2t3eqbpo49g1n', '2020-06-04 16:08:55', '2020-06-04 16:08:55', 5, ''),
(50, 5, 'cg9b3jcbhh2ae2t3eqbpo49g1n', '2020-06-04 16:09:17', '2020-06-04 16:09:17', 5, ''),
(51, 5, 'cg9b3jcbhh2ae2t3eqbpo49g1n', '2020-06-04 16:13:18', '2020-06-04 16:13:18', 5, ''),
(52, 5, 'cg9b3jcbhh2ae2t3eqbpo49g1n', '2020-06-07 17:04:17', '2020-06-07 17:04:17', 5, ''),
(53, 5, 'cg9b3jcbhh2ae2t3eqbpo49g1n', '2020-06-07 17:05:27', '2020-06-07 17:05:27', 5, ''),
(54, 5, 'cg9b3jcbhh2ae2t3eqbpo49g1n', '2020-06-07 17:08:23', '2020-06-07 17:08:23', 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock`
--

CREATE TABLE `tbl_stock` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `batch_num` varchar(255) NOT NULL,
  `product` smallint(5) UNSIGNED NOT NULL,
  `location` smallint(5) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_stock`
--

INSERT INTO `tbl_stock` (`id`, `batch_num`, `product`, `location`, `status`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'ITEM/2020/06/03/0001', 1, 1, 1, '2020-06-03 14:58:44', '2020-06-06 10:46:41', 9, ''),
(2, 'ITEM/2020/06/03/0002', 2, 2, 1, '2020-06-03 14:59:35', '2020-06-06 10:48:01', 9, ''),
(4, 'ITEM/2020/06/03/0003', 1, 1, 1, '2020-06-03 15:02:14', '2020-06-06 10:48:01', 9, ''),
(5, 'ITEM/2020/06/03/0004', 5, 4, 2, '2020-06-03 15:02:40', '2020-06-06 10:48:01', 9, ''),
(6, 'ITEM/2020/06/06/0005', 3, 5, 1, '2020-06-06 10:21:37', '2020-06-06 10:48:01', 9, ''),
(7, 'ITEM/2020/06/06/0006', 4, 6, 2, '2020-06-06 12:49:26', '2020-06-06 12:49:51', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock_para`
--

CREATE TABLE `tbl_stock_para` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `stock_id` smallint(5) UNSIGNED NOT NULL,
  `para` tinyint(3) UNSIGNED NOT NULL,
  `val` varchar(1023) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_stock_para`
--

INSERT INTO `tbl_stock_para` (`id`, `stock_id`, `para`, `val`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 1, 1, '2020-06-11', '2020-06-06 10:15:01', '2020-06-06 10:15:01', 9, ''),
(2, 1, 2, '10', '2020-06-06 10:15:01', '2020-06-06 10:15:01', 9, ''),
(3, 4, 1, '2020-06-17', '2020-06-06 10:18:07', '2020-06-06 10:20:17', 9, NULL),
(4, 4, 2, '30', '2020-06-06 10:18:07', '2020-06-06 10:20:17', 9, NULL),
(5, 2, 2, '40', '2020-06-06 10:19:14', '2020-06-06 10:20:38', 9, NULL),
(6, 5, 2, '10', '2020-06-06 10:19:26', '2020-06-06 10:19:26', 9, NULL),
(7, 6, 1, '2020-07-15', '2020-06-06 10:22:26', '2020-06-06 10:22:37', 9, NULL),
(8, 6, 2, '20', '2020-06-06 10:22:26', '2020-06-06 10:22:26', 9, NULL),
(9, 7, 2, '6', '2020-06-06 12:50:51', '2020-06-06 12:50:51', 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store_location`
--

CREATE TABLE `tbl_store_location` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `number` varchar(50) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_store_location`
--

INSERT INTO `tbl_store_location` (`id`, `number`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'BIS-0001', '2020-06-01 14:42:58', '2020-06-01 14:42:58', 9, ''),
(2, 'BIS-0002', '2020-06-01 14:43:30', '2020-06-01 14:43:41', 9, ''),
(3, 'VEG-0005', '2020-06-01 14:49:30', '2020-06-01 14:49:30', 9, ''),
(4, 'VEG-0004', '2020-06-01 14:54:16', '2020-06-01 14:54:16', 9, ''),
(5, 'VEG-00001', '2020-06-01 14:54:16', '2020-06-01 14:54:16', 9, ''),
(6, 'BIS-0003', '2020-06-05 16:16:38', '2020-06-05 16:16:38', 9, ''),
(7, 'BIS-0005', '2020-06-08 15:10:13', '2020-06-08 15:10:13', 9, ''),
(8, '7', '2020-06-09 06:30:17', '2020-06-09 06:30:17', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`id`, `name`, `address`, `contact`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Ceylon Biscuits Limited (CBL)', '', '', '2020-06-02 04:58:08', '2020-06-02 04:59:06', 9, ''),
(2, 'S.K.Liyanapathirana Vegetable Suppliers', '', '', '2020-06-02 05:02:06', '2020-06-02 05:02:06', 9, ''),
(3, 'K.M.Nirmal  Fruite  Supplier', '', '', '2020-06-02 05:04:19', '2020-06-02 05:04:19', 9, ''),
(4, 'D.P.Gamage ', '', '', '2020-06-02 05:07:27', '2020-06-02 05:07:27', 9, ''),
(5, 'Abeysekera Suppliers', '', '', '2020-06-02 05:08:52', '2020-06-02 05:08:52', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier_product`
--

CREATE TABLE `tbl_supplier_product` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `supplier` smallint(5) UNSIGNED NOT NULL,
  `product` smallint(5) UNSIGNED NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_supplier_product`
--

INSERT INTO `tbl_supplier_product` (`id`, `supplier`, `product`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 1, 1, '2020-06-02 05:11:33', '2020-06-02 05:11:33', 9, ''),
(2, 1, 2, '2020-06-02 05:30:57', '2020-06-02 05:30:57', 9, ''),
(3, 2, 3, '2020-06-02 05:59:27', '2020-06-02 05:59:27', 9, ''),
(4, 1, 4, '2020-06-02 06:00:03', '2020-06-02 06:00:03', 9, ''),
(5, 4, 5, '2020-06-02 06:00:19', '2020-06-02 06:00:19', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Sumith Gamage', '2019-06-15 08:16:09', '2020-06-01 09:56:44', 9, ''),
(2, 'Nuwan Wickramasinha', '2019-06-15 08:16:09', '2020-06-01 09:56:44', 9, ''),
(3, 'Nimesh Madushka', '2019-06-15 08:16:09', '2020-06-01 09:56:44', 9, ''),
(4, 'Jeevahasan', '2019-06-15 08:16:09', '2020-06-01 09:56:44', 9, ''),
(5, 'Gihan Darshana', '2019-08-15 13:00:00', '2020-06-01 09:56:44', 9, ''),
(6, 'Lakshika Swarnamali', '2019-08-15 13:00:00', '2020-06-01 09:56:44', 9, ''),
(7, 'Asha Sulaiman', '2019-08-15 13:00:00', '2020-06-01 09:56:44', 9, ''),
(8, 'WG Sampath Kokila', '2019-06-15 02:46:09', '2020-06-01 09:56:44', 9, ''),
(9, 'Sasiru Ayeshka', '2020-05-28 07:47:31', '2020-05-28 07:48:06', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_para`
--

CREATE TABLE `tbl_user_para` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `user` smallint(5) UNSIGNED NOT NULL,
  `para` tinyint(3) UNSIGNED NOT NULL,
  `val` varchar(255) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_para`
--

INSERT INTO `tbl_user_para` (`id`, `user`, `para`, `val`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 1, 1, '94773785550', '2019-06-15 08:16:09', '2020-06-01 13:22:31', 9, ''),
(2, 2, 1, '94716269437', '2019-06-15 08:16:09', '2020-06-01 13:22:31', 9, ''),
(4, 3, 1, '94761597930', '2019-06-15 08:16:09', '2020-06-01 13:22:31', 9, ''),
(6, 4, 1, '0773835227', '2019-06-15 08:16:09', '2020-06-01 13:22:31', 9, ''),
(16, 5, 1, '0772324508', '2019-08-15 13:00:00', '2020-06-01 13:22:31', 9, ''),
(17, 6, 1, '0772324508', '2019-08-15 13:00:00', '2020-06-01 13:22:31', 9, ''),
(18, 7, 1, '0772324508', '2019-08-15 13:00:00', '2020-06-01 13:22:31', 9, ''),
(32, 1, 2, 'sumith@aasait.com', '2019-06-15 08:16:09', '2020-06-01 13:22:31', 9, ''),
(33, 2, 2, 'nuwan@aasait.com', '2019-06-15 08:16:09', '2020-06-01 13:22:31', 9, ''),
(35, 3, 2, 'nimesh@aasait.com', '2019-06-15 08:16:09', '2020-06-01 13:22:31', 9, ''),
(37, 4, 2, 'jeevahasanm@gmail.com', '2019-06-15 08:16:09', '2020-06-01 13:22:31', 9, ''),
(47, 5, 2, 'gdkadawathage@gmail.com', '2019-08-15 13:00:00', '2020-06-01 13:22:31', 9, ''),
(48, 6, 2, 'swarnamalial@gmail.com', '2019-08-15 13:00:00', '2020-06-01 13:22:31', 9, ''),
(49, 7, 2, 'ash15.sulaiman@gmail.com', '2019-08-15 13:00:00', '2020-06-01 13:22:31', 9, ''),
(94, 8, 2, 'kokilawgs@gmail.com', '2020-01-03 21:59:48', '2020-06-01 13:22:31', 9, ''),
(95, 8, 1, '+94 77 317 3911', '2020-01-03 21:59:48', '2020-06-01 13:22:31', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_product`
--

CREATE TABLE `tbl_user_product` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `user` smallint(5) UNSIGNED NOT NULL,
  `product` smallint(5) UNSIGNED NOT NULL,
  `created_ts` datetime NOT NULL,
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user_product`
--

INSERT INTO `tbl_user_product` (`id`, `user`, `product`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 7, 1, '2020-06-01 21:58:00', '2020-06-01 16:28:25', 9, NULL),
(2, 5, 6, '2020-06-01 21:59:58', '2020-06-01 16:29:58', 9, NULL),
(3, 6, 7, '2020-06-01 22:01:38', '2020-06-01 16:32:08', 9, NULL),
(4, 4, 8, '2020-06-01 22:01:38', '2020-06-01 16:31:38', 9, NULL),
(5, 2, 10, '2020-05-25 22:12:48', '2020-06-01 16:31:38', 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_role`
--

CREATE TABLE `tbl_user_role` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `user` smallint(5) UNSIGNED NOT NULL,
  `role` tinyint(3) UNSIGNED NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_role`
--

INSERT INTO `tbl_user_role` (`id`, `user`, `role`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 7, 1, '2020-06-01 15:24:05', '2020-06-01 15:24:05', 9, ''),
(2, 5, 2, '2020-06-01 15:24:05', '2020-06-04 14:32:11', 9, ''),
(3, 6, 1, '2020-06-01 15:24:05', '2020-06-01 15:24:05', 9, ''),
(4, 2, 2, '2020-06-01 15:24:05', '2020-06-01 15:24:05', 9, ''),
(5, 8, 1, '2020-06-01 15:24:05', '2020-06-01 15:24:05', 9, ''),
(6, 4, 2, '2020-06-04 14:26:39', '2020-06-04 14:26:39', NULL, '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_stock_details`
-- (See below for the actual view)
--
CREATE TABLE `view_stock_details` (
`stock_id` smallint(5) unsigned
,`product_id` smallint(5) unsigned
,`batch_num` varchar(255)
,`product_name` varchar(50)
,`store_location` varchar(50)
,`expire_date` varchar(1023)
,`quantity` varchar(1023)
,`stock_status` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `view_stock_details`
--
DROP TABLE IF EXISTS `view_stock_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_stock_details`  AS  select `ts`.`id` AS `stock_id`,`tp`.`id` AS `product_id`,`ts`.`batch_num` AS `batch_num`,`tp`.`name` AS `product_name`,`tsl`.`number` AS `store_location`,`tsp`.`val` AS `expire_date`,`tsp1`.`val` AS `quantity`,`css`.`name` AS `stock_status` from ((((`tbl_product` `tp` join `tbl_store_location` `tsl`) join `cfg_stock_status` `css`) join (`tbl_stock` `ts` left join `tbl_stock_para` `tsp` on(`ts`.`id` = `tsp`.`stock_id` and `tsp`.`para` = 1))) join (`tbl_stock` `ts1` left join `tbl_stock_para` `tsp1` on(`ts1`.`id` = `tsp1`.`stock_id` and `tsp1`.`para` = 2))) where `ts`.`location` = `tsl`.`id` and `ts`.`status` = `css`.`id` and `ts`.`id` = `ts1`.`id` and `tp`.`id` = `ts`.`product` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cfg_language`
--
ALTER TABLE `cfg_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cfg_language_updated_by` (`updated_by`);

--
-- Indexes for table `cfg_role`
--
ALTER TABLE `cfg_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_role_name` (`name`) USING BTREE,
  ADD KEY `index_role` (`created_ts`,`updated_ts`) USING BTREE,
  ADD KEY `fk_cfg_role_updated_by` (`updated_by`);

--
-- Indexes for table `cfg_stock_para`
--
ALTER TABLE `cfg_stock_para`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cfg_stock_para` (`name`) USING BTREE,
  ADD KEY `index_cfg_stock_para` (`updated_by`) USING BTREE;

--
-- Indexes for table `cfg_stock_status`
--
ALTER TABLE `cfg_stock_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cfg_login_para` (`name`) USING BTREE,
  ADD KEY `index_cfg_login_para` (`updated_by`) USING BTREE;

--
-- Indexes for table `cfg_unit`
--
ALTER TABLE `cfg_unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cfg_institute_para` (`name`) USING BTREE,
  ADD KEY `index_cfg_institute_para` (`updated_by`) USING BTREE;

--
-- Indexes for table `cfg_user_action`
--
ALTER TABLE `cfg_user_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cfg_language_updated_by` (`updated_by`);

--
-- Indexes for table `cfg_user_para`
--
ALTER TABLE `cfg_user_para`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_tbl_user_para` (`name`) USING BTREE,
  ADD KEY `fk_role_updated_by` (`updated_by`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tbl_institute` (`name`),
  ADD KEY `index_tbl_institute` (`updated_by`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tbl_login_updated_by` (`updated_by`),
  ADD KEY `index_tbl_login` (`user`) USING BTREE;

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tbl_product` (`barcode_num`,`name`) USING BTREE,
  ADD KEY `fk_tbl_product_unit` (`unit`),
  ADD KEY `fk_tbl_product_category` (`category`),
  ADD KEY `fk_tbl_product_updated_by` (`updated_by`),
  ADD KEY `index_tbl_product` (`barcode_num`,`name`,`category`) USING BTREE;

--
-- Indexes for table `tbl_session`
--
ALTER TABLE `tbl_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_tbl_session` (`user`,`session_id`,`updated_by`) USING BTREE,
  ADD KEY `fk_tbl_session_updated_by` (`updated_by`);

--
-- Indexes for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tbl_stock` (`batch_num`),
  ADD KEY `fk_tbl_stock_location` (`location`),
  ADD KEY `fk_tbl_stock_product` (`product`),
  ADD KEY `fk_tbl_stock_status` (`status`),
  ADD KEY `fk_tbl_stock_updated_by` (`updated_by`);

--
-- Indexes for table `tbl_stock_para`
--
ALTER TABLE `tbl_stock_para`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_tbl_product_para` (`para`,`stock_id`,`updated_by`),
  ADD KEY `fk_tbl_stock_para_stock` (`stock_id`),
  ADD KEY `fk_tbl_stock_para_updated_by` (`updated_by`);

--
-- Indexes for table `tbl_store_location`
--
ALTER TABLE `tbl_store_location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tbl_store_location` (`number`) USING BTREE,
  ADD KEY `index_tbl_store_location` (`updated_by`) USING BTREE;

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tbl_supplier` (`name`) USING BTREE,
  ADD KEY `index_tbl_supplier` (`updated_by`) USING BTREE;

--
-- Indexes for table `tbl_supplier_product`
--
ALTER TABLE `tbl_supplier_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_tbl_supplier_product` (`updated_by`) USING BTREE,
  ADD KEY `fk_tbl_supplier_product_supplier` (`supplier`),
  ADD KEY `fk_tbl_supplier_product_product` (`product`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tbl_user_updated_by` (`updated_by`);

--
-- Indexes for table `tbl_user_para`
--
ALTER TABLE `tbl_user_para`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tbl_user_para` (`user`,`para`) USING BTREE,
  ADD KEY `index_tbl_user_para` (`updated_by`,`val`) USING BTREE,
  ADD KEY `fk_tbl_user_para_para` (`para`);

--
-- Indexes for table `tbl_user_product`
--
ALTER TABLE `tbl_user_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tbl_user_product_user` (`user`),
  ADD KEY `fk_tbl_user_product_product` (`product`),
  ADD KEY `fk_tbl_user_product_updated_by` (`updated_by`);

--
-- Indexes for table `tbl_user_role`
--
ALTER TABLE `tbl_user_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tbl_user_role` (`user`,`role`) USING BTREE,
  ADD KEY `index_tbl_user_role` (`updated_by`),
  ADD KEY `fk_tbl_user_role_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cfg_language`
--
ALTER TABLE `cfg_language`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cfg_role`
--
ALTER TABLE `cfg_role`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cfg_stock_para`
--
ALTER TABLE `cfg_stock_para`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cfg_stock_status`
--
ALTER TABLE `cfg_stock_status`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cfg_unit`
--
ALTER TABLE `cfg_unit`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cfg_user_action`
--
ALTER TABLE `cfg_user_action`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cfg_user_para`
--
ALTER TABLE `cfg_user_para`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_session`
--
ALTER TABLE `tbl_session`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_stock_para`
--
ALTER TABLE `tbl_stock_para`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_store_location`
--
ALTER TABLE `tbl_store_location`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_supplier_product`
--
ALTER TABLE `tbl_supplier_product`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tbl_user_para`
--
ALTER TABLE `tbl_user_para`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `tbl_user_product`
--
ALTER TABLE `tbl_user_product`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_user_role`
--
ALTER TABLE `tbl_user_role`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cfg_role`
--
ALTER TABLE `cfg_role`
  ADD CONSTRAINT `fk_cfg_role_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cfg_stock_para`
--
ALTER TABLE `cfg_stock_para`
  ADD CONSTRAINT `fk_cfg_stock_para` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cfg_stock_status`
--
ALTER TABLE `cfg_stock_status`
  ADD CONSTRAINT `fk_cfg_product_status_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cfg_unit`
--
ALTER TABLE `cfg_unit`
  ADD CONSTRAINT `fk_cfg_unit_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cfg_user_action`
--
ALTER TABLE `cfg_user_action`
  ADD CONSTRAINT `fk_cfg_user_action_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cfg_user_para`
--
ALTER TABLE `cfg_user_para`
  ADD CONSTRAINT `tbl_user_para_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD CONSTRAINT `fk_tbl_category_ubdated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `fk_tbl_login_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_tbl_login_user` FOREIGN KEY (`user`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `fk_tbl_product_category` FOREIGN KEY (`category`) REFERENCES `tbl_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_product_unit` FOREIGN KEY (`unit`) REFERENCES `cfg_unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_product_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_session`
--
ALTER TABLE `tbl_session`
  ADD CONSTRAINT `fk_tbl_session_login` FOREIGN KEY (`user`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_session_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  ADD CONSTRAINT `fk_tbl_stock_location` FOREIGN KEY (`location`) REFERENCES `tbl_store_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_stock_product` FOREIGN KEY (`product`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_stock_status` FOREIGN KEY (`status`) REFERENCES `cfg_stock_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_stock_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_stock_para`
--
ALTER TABLE `tbl_stock_para`
  ADD CONSTRAINT `fk_tbl_stock_para_para` FOREIGN KEY (`para`) REFERENCES `cfg_stock_para` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_stock_para_stock` FOREIGN KEY (`stock_id`) REFERENCES `tbl_stock` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_stock_para_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_store_location`
--
ALTER TABLE `tbl_store_location`
  ADD CONSTRAINT `fk_tbl_store_location_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD CONSTRAINT `fk_tbl_supplier_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_supplier_product`
--
ALTER TABLE `tbl_supplier_product`
  ADD CONSTRAINT `fk_tbl_supplier_product_product` FOREIGN KEY (`product`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_supplier_product_supplier` FOREIGN KEY (`supplier`) REFERENCES `tbl_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_supplier_product_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `fk_tbl_language_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_user_para`
--
ALTER TABLE `tbl_user_para`
  ADD CONSTRAINT `fk_tbl_user_para_para` FOREIGN KEY (`para`) REFERENCES `cfg_user_para` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_user_para_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_tbl_user_para_user` FOREIGN KEY (`user`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_user_product`
--
ALTER TABLE `tbl_user_product`
  ADD CONSTRAINT `fk_tbl_user_product_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_tbl_user_product_user` FOREIGN KEY (`user`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_user_role`
--
ALTER TABLE `tbl_user_role`
  ADD CONSTRAINT `fk_tbl_user_role_role` FOREIGN KEY (`role`) REFERENCES `cfg_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_user_role_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_tbl_user_role_user` FOREIGN KEY (`user`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

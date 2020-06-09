-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2020 at 01:58 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_app`
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
(1, 'Sinhala', '2020-06-01 15:21:12', '2020-06-02 11:24:15', 45, NULL),
(2, 'English', '2020-06-01 15:21:12', '2020-06-02 11:24:27', 45, NULL),
(3, 'Tamil', '2020-06-01 15:22:11', '2020-06-02 11:24:36', 45, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cfg_login_para`
--

CREATE TABLE `cfg_login_para` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table holding all the distribution lines of the project';

--
-- Dumping data for table `cfg_login_para`
--

INSERT INTO `cfg_login_para` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'ID', '2019-06-15 13:21:08', '2020-06-02 11:24:51', 45, 'Login ID/Username'),
(2, 'Pass', '2019-06-15 13:21:08', '2020-06-02 11:25:03', 45, 'Password');

-- --------------------------------------------------------

--
-- Table structure for table `cfg_login_type`
--

CREATE TABLE `cfg_login_type` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table holding all the distribution lines of the project';

--
-- Dumping data for table `cfg_login_type`
--

INSERT INTO `cfg_login_type` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Password', '2019-06-15 13:21:08', '2020-06-02 11:25:18', 45, 'Username/Password'),
(2, 'Google', '2019-06-15 13:21:08', '2020-06-02 11:25:26', 45, 'Google Authentication'),
(3, 'FB', '2019-06-15 13:21:46', '2020-06-02 11:25:35', 45, 'Facebook'),
(4, 'Device', '2019-06-15 13:21:46', '2020-06-02 11:25:44', 45, 'Using Registered Device ID');

-- --------------------------------------------------------

--
-- Table structure for table `cfg_product_para`
--

CREATE TABLE `cfg_product_para` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table holding all the distribution lines of the project';

--
-- Dumping data for table `cfg_product_para`
--

INSERT INTO `cfg_product_para` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Manufacture date', '2020-06-01 10:05:19', '2020-06-02 11:25:56', 45, ''),
(2, 'Expiration date', '2020-06-01 10:05:19', '2020-06-02 11:26:03', 45, ''),
(3, 'Quantity', '2020-06-01 10:08:58', '2020-06-02 11:26:12', 45, ''),
(4, 'Price', '2020-06-01 10:08:58', '2020-06-02 11:26:19', 45, ''),
(5, 'Discount', '2020-06-01 13:15:04', '2020-06-02 11:26:27', 45, ''),
(6, 'Picture', '2020-06-01 14:27:13', '2020-06-02 11:26:35', 45, '');

-- --------------------------------------------------------

--
-- Table structure for table `cfg_product_status`
--

CREATE TABLE `cfg_product_status` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table holding all the distribution lines of the project';

--
-- Dumping data for table `cfg_product_status`
--

INSERT INTO `cfg_product_status` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Available', '2020-06-01 10:13:25', '2020-06-02 11:26:59', 45, ''),
(2, 'Not Available', '2020-06-01 10:13:25', '2020-06-02 11:27:08', 45, ''),
(3, 'Return', '2020-06-01 13:52:46', '2020-06-02 11:27:16', 45, '');

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
(1, 'Customer', '2020-06-01 10:15:34', '2020-06-02 11:27:30', 45, ''),
(2, 'Shop owner', '2020-06-01 10:15:34', '2020-06-02 11:27:37', 45, '');

-- --------------------------------------------------------

--
-- Table structure for table `cfg_supplier_para`
--

CREATE TABLE `cfg_supplier_para` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table holding all the distribution lines of the project';

--
-- Dumping data for table `cfg_supplier_para`
--

INSERT INTO `cfg_supplier_para` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Contact number', '2020-06-02 06:06:26', '2020-06-02 11:27:51', 45, ''),
(2, 'Address', '2020-06-02 06:06:40', '2020-06-02 11:27:59', 45, ''),
(3, 'E-mail', '2020-06-02 10:12:06', '2020-06-02 11:28:07', 45, '');

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
(1, 'Parcel', '2019-06-15 13:21:08', '2020-06-02 11:28:19', 45, ''),
(2, 'Kg', '2019-06-15 13:21:08', '2020-06-02 11:28:27', 45, ''),
(4, 'Item', '2019-06-15 13:21:46', '2020-06-02 11:28:35', 45, ''),
(5, 'Liter', '2019-06-15 13:21:46', '2020-06-02 11:28:45', 45, ''),
(6, 'Box', '2019-06-15 13:21:46', '2020-06-02 11:28:53', 45, ''),
(7, 'Packet', '2020-06-01 14:40:56', '2020-06-02 11:29:01', 45, '');

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
(5, 'Ice cream', '2020-06-01 14:26:52', '2020-06-02 11:29:33', 45, ''),
(6, 'Chocolate', '2020-06-02 10:30:07', '2020-06-02 10:30:07', 45, ''),
(7, 'Milk', '2020-06-02 11:17:41', '2020-06-02 11:17:41', 45, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `user` smallint(5) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id`, `user`, `type`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 7, 1, '2020-06-01 16:38:00', '2020-06-01 16:38:00', 9, ''),
(2, 5, 1, '2020-06-01 16:38:00', '2020-06-01 16:38:00', 9, ''),
(3, 4, 1, '2020-06-01 16:38:00', '2020-06-01 16:38:00', 9, ''),
(4, 6, 1, '2020-06-01 16:38:00', '2020-06-01 16:38:00', 9, ''),
(5, 3, 1, '2020-06-01 16:38:00', '2020-06-01 16:38:00', 9, ''),
(6, 45, 2, '2020-06-02 11:18:43', '2020-06-02 11:18:43', 45, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `barcode_num` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `unit` tinyint(3) UNSIGNED NOT NULL,
  `category` smallint(5) UNSIGNED NOT NULL,
  `location` smallint(5) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `barcode_num`, `name`, `unit`, `category`, `location`, `status`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, '07350053850019', 'Munchee Ringo', 7, 3, 1, 1, '2020-06-01 14:42:17', '2020-06-01 14:44:30', 9, ''),
(2, '07350053850026', 'Munchee Hawaiian Cookies', 7, 3, 2, 2, '2020-06-01 14:48:09', '2020-06-01 14:48:09', 9, ''),
(3, '07350053850033', 'Carrots', 2, 1, 3, 3, '2020-06-01 14:50:45', '2020-06-01 14:50:45', 9, ''),
(4, 'GTIN-13: 07350053850019', 'Munchee Milk Shortcake', 7, 3, 1, 3, '2020-06-01 14:52:40', '2020-06-01 14:52:40', 9, ''),
(5, 'GTIN-14: 27350053850013', 'Beets', 2, 1, 4, 1, '2020-06-01 14:55:22', '2020-06-02 11:29:52', 45, ''),
(6, '07350053850333', 'Cadbury Dairy Milk', 7, 6, 6, 1, '2020-06-02 10:34:21', '2020-06-02 10:34:21', 45, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_para`
--

CREATE TABLE `tbl_product_para` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `product` smallint(5) UNSIGNED NOT NULL,
  `para` tinyint(3) UNSIGNED NOT NULL,
  `val` varchar(1023) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_para`
--

INSERT INTO `tbl_product_para` (`id`, `product`, `para`, `val`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 1, 3, '10', '2020-06-01 14:58:50', '2020-06-01 14:58:50', 9, ''),
(2, 1, 4, '20.00', '2020-06-01 14:58:50', '2020-06-01 14:58:50', 9, ''),
(3, 1, 2, '2020-07-01', '2020-06-01 14:58:50', '2020-06-01 14:58:50', 9, ''),
(4, 1, 1, '2020-06-01', '2020-06-01 14:58:50', '2020-06-01 14:58:50', 9, ''),
(5, 1, 6, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITEhUTEhIVFhUXFxUZFhUYFxgWGBsZHRcWFhgaGhcbHSggGBolGxUYIjEhJSkrLi4uGB8zODMtNygtLisBCgoKDg0OGxAQGzAlICYtLS8xMi0tLS0tLS8vLS0tLy01LS0tLS0tLS0tLS0tLS0vLS0vLS0tLS0vLS0tLS0tLf/AABEIAOEA4QMBEQACEQEDEQH/xAAcAAEAAgIDAQAAAAAAAAAAAAAABAUDBgECBwj/xABCEAACAQIDBAcFBAgEBwAAAAABAgADEQQSIQUxQVEGIjJhcYGhBxORscFCUtHwI2JygpKisuEzQ2PxFBY0U3OD0v/EABsBAQACAwEBAAAAAAAAAAAAAAADBAECBQYH/8QAPBEAAgEDAQUECQIFAgcAAAAAAAECAwQRIQUSMUFRYXGBsQYTIjKRocHR8BThFSNCUvEzciQlNGKCsuL/2gAMAwEAAhEDEQA/APcYAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIBHxuNp0Vz1XVF5sQPIczMpN8DeFOVR4iss1RPaThDm6lYBb2LJYNbdxuL+HjJPUs6n8Gr4TTXx4GmUvaHjSbmqB+yiEDwuL285MqMTsw2PbYxj5s9e2c7NSpsxuxRCx03lQTu0+EqvieTrJKpJLhlkiYIxAEAQBAEAQBAEAQBAE', '2020-06-01 14:58:50', '2020-06-01 14:58:50', 9, ''),
(6, 2, 1, '2020-04-11', '2020-06-01 15:02:19', '2020-06-01 15:02:19', 9, ''),
(7, 2, 2, '2020-06-01', '2020-06-01 15:02:19', '2020-06-01 15:02:19', 9, ''),
(8, 2, 6, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEBUSEhAVFRUVFhcXFxgWFxYXFRgYFRcXFxgXFxcYHiggGRsmGxgXITEiJSkrLi4uGCAzODMtNygtLisBCgoKDg0OGxAQGzEmICYvNjAtLS8tLS0tLS8tMC0vLS0vLS0tLS0tLS0tLS0vLS0tKy0tLS0tLS0tLS0tLS0tLf/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABgEDBAUHAgj/xABHEAABAwIDBQQGBwQIBgMAAAABAAIRAyEEEjEFIkFRYQYTcYEHMpGhsdEUI0JSVJLBF2KT8BUkQ2OCosLhc7LS0+PxM0RT/8QAGgEBAAMBAQEAAAAAAAAAAAAAAAMEBQECBv/EADURAAIBAwIDBQYFBAMAAAAAAAABAgMEERIhBTFREzJBYYEUFSIjUnEkkbHR8AYzoeFicvH/2gAMAwEAAhEDEQA/AO4oiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCKiqgCIiAIiIAiIgCIiAIiIAiIgCIiAKkotNtDHOY4w7yVO8vYWsNc+R7hByeEbpFosBtvNILScusLPq4sxuiPH5KJcUt3T7TPp4nXTkngzkWqOKfzRuMf0Vf35b9H+R67GRtUWs+mP6J9Nf0Xv3zbef5HOxkbNFG9qdqaWHIFWoA4iQ0BznRzytBgdTZap3pHoD7NUjnkEe9ys076FRZjF4+xDOUIPEpJepOUUNwvpAwr/7Xu/8AiNcwfm9X3rd0NqZxLHMcObSCPcvFTiVKn3016HuK1d1r8zbotb9NdyC1PaftBVw2HNVoYSC0b1hvGF5hxW3nJRTeX5HZQcVlkoRciHpJxZMZaQPLKZjncwfIq470hYwGctMjllPzWjkzpcQoxeGzrKouRYb0iYwPh+QidAyIk66q', '2020-06-01 15:02:19', '2020-06-02 11:30:24', 45, ''),
(9, 2, 4, '30.00', '2020-06-01 15:02:19', '2020-06-02 11:30:47', 45, ''),
(10, 2, 3, '20', '2020-06-01 15:02:19', '2020-06-02 11:30:59', 45, ''),
(11, 2, 5, '10%', '2020-06-01 15:02:19', '2020-06-02 11:30:16', 45, ''),
(12, 3, 4, '100.00', '2020-06-02 10:20:36', '2020-06-02 10:20:59', 45, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_user_action`
--

CREATE TABLE `tbl_product_user_action` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `product` smallint(5) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `purchase_price` float UNSIGNED DEFAULT NULL,
  `action` tinyint(3) UNSIGNED NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_user_action`
--

INSERT INTO `tbl_product_user_action` (`id`, `product`, `quantity`, `purchase_price`, `action`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 1, 2, 20, 1, '2020-06-01 15:03:17', '2020-06-01 15:04:08', 9, ''),
(6, 2, 4, 20, 1, '2020-06-01 15:10:24', '2020-06-01 15:10:24', 9, ''),
(7, 3, 1, 30, 2, '2020-06-01 15:11:05', '2020-06-01 15:11:05', 9, ''),
(8, 4, 1, 50, 3, '2020-06-01 15:11:19', '2020-06-01 15:11:19', 9, ''),
(11, 3, 5, 30, 2, '2020-06-02 11:33:39', '2020-06-02 11:33:39', 45, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_session`
--

CREATE TABLE `tbl_session` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `login` smallint(5) UNSIGNED NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_session`
--

INSERT INTO `tbl_session` (`id`, `login`, `session_id`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(4, 4, 'ccgsmii941shj44qr4i940d5uo', '2019-06-15 08:16:09', '2020-01-03 19:25:15', 1, ''),
(6, 5, 'd2erjr9r5e2gm6328a5q10teqo', '2019-06-15 08:16:09', '2020-06-01 16:40:35', 1, '');

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
(6, 'CHOCO-0001', '2020-06-02 10:32:40', '2020-06-02 10:32:40', 45, ''),
(7, 'MILK-0001', '2020-06-02 11:21:03', '2020-06-02 11:21:03', 45, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`id`, `name`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 'Ceylon Biscuits Limited (CBL)', '2020-06-02 04:58:08', '2020-06-02 04:59:06', 9, ''),
(2, 'S.K.Liyanapathirana Vegetable Suppliers', '2020-06-02 05:02:06', '2020-06-02 05:02:06', 9, ''),
(3, 'K.M.Nirmal  Fruite  Supplier', '2020-06-02 05:04:19', '2020-06-02 05:04:19', 9, ''),
(4, 'D.P.Gamage ', '2020-06-02 05:07:27', '2020-06-02 05:07:27', 9, ''),
(5, 'Abeysekera Suppliers', '2020-06-02 05:08:52', '2020-06-02 05:08:52', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier_para`
--

CREATE TABLE `tbl_supplier_para` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `supplier` smallint(5) UNSIGNED NOT NULL,
  `para` tinyint(3) UNSIGNED NOT NULL,
  `val` varchar(255) NOT NULL,
  `created_ts` datetime NOT NULL,
  `updated_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_supplier_para`
--

INSERT INTO `tbl_supplier_para` (`id`, `supplier`, `para`, `val`, `created_ts`, `updated_ts`, `updated_by`, `comment`) VALUES
(1, 5, 1, '0777123456', '2020-06-02 00:00:00', '2020-06-02 11:50:47', 45, NULL),
(2, 1, 2, 'Colombo', '2020-06-02 00:00:00', '2020-06-02 11:53:27', 45, NULL),
(3, 3, 3, 'km@gmail.com', '2020-06-02 00:00:00', '2020-06-02 11:54:02', 45, NULL),
(4, 2, 1, '0714583272', '2020-06-02 00:00:00', '2020-06-02 11:54:54', 45, NULL);

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
(7, 'Asha Sulaiman', '2019-08-15 13:00:00', '2020-06-02 11:56:18', 45, ''),
(8, 'WG Sampath Kokila', '2019-06-15 02:46:09', '2020-06-02 11:56:09', 45, ''),
(9, 'Sasiru Ayeshka', '2020-05-28 07:47:31', '2020-06-02 11:56:01', 45, ''),
(45, 'Theshi Pathman', '2020-06-02 10:12:55', '2020-06-02 11:56:29', 45, '');

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
(3, 6, 7, '2020-06-02 22:01:38', '2020-06-02 16:32:08', 45, NULL),
(4, 4, 8, '2020-06-02 22:01:38', '2020-06-02 11:57:27', 45, NULL);

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
(2, 5, 1, '2020-06-01 15:24:05', '2020-06-01 15:24:05', 9, ''),
(3, 6, 1, '2020-06-01 15:24:05', '2020-06-01 15:24:05', 9, ''),
(4, 2, 2, '2020-06-01 15:24:05', '2020-06-01 15:24:05', 9, ''),
(5, 8, 1, '2020-06-01 15:24:05', '2020-06-01 15:24:05', 9, '');

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
-- Indexes for table `cfg_login_para`
--
ALTER TABLE `cfg_login_para`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cfg_login_para` (`name`) USING BTREE,
  ADD KEY `index_cfg_login_para` (`updated_by`) USING BTREE;

--
-- Indexes for table `cfg_login_type`
--
ALTER TABLE `cfg_login_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_role_name` (`name`) USING BTREE,
  ADD KEY `index_role` (`created_ts`,`updated_ts`) USING BTREE,
  ADD KEY `fk_cfg_login_type_updated_by` (`updated_by`);

--
-- Indexes for table `cfg_product_para`
--
ALTER TABLE `cfg_product_para`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cfg_login_para` (`name`) USING BTREE,
  ADD KEY `index_cfg_login_para` (`updated_by`) USING BTREE;

--
-- Indexes for table `cfg_product_status`
--
ALTER TABLE `cfg_product_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cfg_login_para` (`name`) USING BTREE,
  ADD KEY `index_cfg_login_para` (`updated_by`) USING BTREE;

--
-- Indexes for table `cfg_role`
--
ALTER TABLE `cfg_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_role_name` (`name`) USING BTREE,
  ADD KEY `index_role` (`created_ts`,`updated_ts`) USING BTREE,
  ADD KEY `fk_cfg_role_updated_by` (`updated_by`);

--
-- Indexes for table `cfg_supplier_para`
--
ALTER TABLE `cfg_supplier_para`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cfg_supplier_para` (`name`) USING BTREE,
  ADD KEY `index_cfg_supplier_para` (`updated_by`) USING BTREE;

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
  ADD KEY `index_tbl_login` (`user`,`type`) USING BTREE,
  ADD KEY `fk_tbl_login_type` (`type`),
  ADD KEY `fk_tbl_login_updated_by` (`updated_by`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tbl_product` (`barcode_num`,`name`) USING BTREE,
  ADD KEY `fk_tbl_product_unit` (`unit`),
  ADD KEY `fk_tbl_product_category` (`category`),
  ADD KEY `fk_tbl_product_location` (`location`),
  ADD KEY `fk_tbl_product_status` (`status`),
  ADD KEY `fk_tbl_product_updated_by` (`updated_by`);

--
-- Indexes for table `tbl_product_para`
--
ALTER TABLE `tbl_product_para`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_tbl_product_para` (`para`,`product`,`updated_by`),
  ADD KEY `fk_tbl_product_para_product` (`product`),
  ADD KEY `fk_tbl_product_para_updated_by` (`updated_by`);

--
-- Indexes for table `tbl_product_user_action`
--
ALTER TABLE `tbl_product_user_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_tbl_product_para` (`updated_by`) USING BTREE,
  ADD KEY `fk_tbl_product_user_action_status` (`action`),
  ADD KEY `fk_tbl_product_user_action_product` (`product`);

--
-- Indexes for table `tbl_session`
--
ALTER TABLE `tbl_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_tbl_session` (`login`,`session_id`,`updated_by`) USING BTREE,
  ADD KEY `fk_tbl_session_updated_by` (`updated_by`);

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
-- Indexes for table `tbl_supplier_para`
--
ALTER TABLE `tbl_supplier_para`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_supplier_para_updated_by` (`updated_by`),
  ADD KEY `tbl_supplier_para_supplier` (`supplier`),
  ADD KEY `tbl_supplier_para_para` (`para`);

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
-- AUTO_INCREMENT for table `cfg_login_para`
--
ALTER TABLE `cfg_login_para`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cfg_login_type`
--
ALTER TABLE `cfg_login_type`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cfg_product_para`
--
ALTER TABLE `cfg_product_para`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cfg_product_status`
--
ALTER TABLE `cfg_product_status`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cfg_role`
--
ALTER TABLE `cfg_role`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cfg_supplier_para`
--
ALTER TABLE `cfg_supplier_para`
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
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_product_para`
--
ALTER TABLE `tbl_product_para`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_product_user_action`
--
ALTER TABLE `tbl_product_user_action`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_session`
--
ALTER TABLE `tbl_session`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_store_location`
--
ALTER TABLE `tbl_store_location`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_supplier_para`
--
ALTER TABLE `tbl_supplier_para`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_supplier_product`
--
ALTER TABLE `tbl_supplier_product`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cfg_login_para`
--
ALTER TABLE `cfg_login_para`
  ADD CONSTRAINT `fk_cfg_login_para_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cfg_login_type`
--
ALTER TABLE `cfg_login_type`
  ADD CONSTRAINT `fk_cfg_login_type_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cfg_product_para`
--
ALTER TABLE `cfg_product_para`
  ADD CONSTRAINT `fk_cfg_product_para_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cfg_product_status`
--
ALTER TABLE `cfg_product_status`
  ADD CONSTRAINT `fk_cfg_product_status_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cfg_role`
--
ALTER TABLE `cfg_role`
  ADD CONSTRAINT `fk_cfg_role_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cfg_supplier_para`
--
ALTER TABLE `cfg_supplier_para`
  ADD CONSTRAINT `fk_tbl_supplier_para_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

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
  ADD CONSTRAINT `fk_tbl_login_type` FOREIGN KEY (`type`) REFERENCES `cfg_login_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_login_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_tbl_login_user` FOREIGN KEY (`user`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `fk_tbl_product_category` FOREIGN KEY (`category`) REFERENCES `tbl_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_product_location` FOREIGN KEY (`location`) REFERENCES `tbl_store_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_product_status` FOREIGN KEY (`status`) REFERENCES `cfg_product_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_product_unit` FOREIGN KEY (`unit`) REFERENCES `cfg_unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_product_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_product_para`
--
ALTER TABLE `tbl_product_para`
  ADD CONSTRAINT `fk_tbl_product_para_para` FOREIGN KEY (`para`) REFERENCES `cfg_product_para` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_product_para_product` FOREIGN KEY (`product`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_product_para_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_product_user_action`
--
ALTER TABLE `tbl_product_user_action`
  ADD CONSTRAINT `fk_tbl_product_user_action_product` FOREIGN KEY (`product`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_product_user_action_status` FOREIGN KEY (`action`) REFERENCES `cfg_user_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_product_user_action_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tbl_session`
--
ALTER TABLE `tbl_session`
  ADD CONSTRAINT `fk_tbl_session_login` FOREIGN KEY (`login`) REFERENCES `tbl_login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_session_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

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
-- Constraints for table `tbl_supplier_para`
--
ALTER TABLE `tbl_supplier_para`
  ADD CONSTRAINT `fk_tbl_supplier_updated` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `test` FOREIGN KEY (`para`) REFERENCES `cfg_supplier_para` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `test1` FOREIGN KEY (`supplier`) REFERENCES `tbl_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_tbl_user_product_product` FOREIGN KEY (`product`) REFERENCES `tbl_product_user_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2023 at 05:49 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_flutter_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT 'NULL',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 'APPLE IOS IPHONE 11 SERIES', '7999000.00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nulla posuere sollicitudin aliquam ultrices sagittis orci. Purus gravida quis blandit turpis cursus in hac habitasse platea. Et netus et malesuada fames ac turpis egestas. Volutpat consequat mauris nunc congue nisi vitae suscipit tellus mauris. Nibh tellus molestie nunc non blandit.', '2023-09-20 04:48:31', '2023-09-20 04:50:31'),
(2, 'SAMSUNG GALAXY TAB S7 FE SERIES', '8899000.00', 'Ullamcorper morbi tincidunt ornare massa eget egestas purus. Maecenas sed enim ut sem. Mattis ullamcorper velit sed ullamcorper morbi. Cras semper auctor neque vitae tempus quam pellentesque nec nam. Arcu odio ut sem nulla pharetra diam sit amet nisl. Ornare lectus sit amet est placerat in.', '2023-09-20 04:49:22', NULL),
(3, 'XIAOMI REDMI SMARTPHONE NOTE 11 SERIES', '2739000.00', 'Pretium vulputate sapien nec sagittis. Ac turpis egestas sed tempus urna et. Suscipit tellus mauris a diam. Vulputate eu scelerisque felis imperdiet proin fermentum. Lobortis feugiat vivamus at augue eget arcu dictum. Nullam vehicula ipsum a arcu cursus vitae congue mauris. Vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere. Ac auctor augue mauris augue neque.', '2023-09-20 04:50:00', '2023-09-21 06:17:11'),
(4, 'REALME EARBUD HEADPHONES AIR WHITE', '899000.00', 'Ipsum nunc aliquet bibendum enim facilisis gravida neque convallis. Egestas maecenas pharetra convallis posuere morbi leo urna molestie at. Turpis massa sed elementum tempus egestas sed sed risus. Id porta nibh venenatis cras sed felis eget velit aliquet. Egestas pretium aenean pharetra magna. Tempor commodo ullamcorper a lacus vestibulum.', '2023-09-20 06:01:06', NULL),
(5, 'APPLE WATCH SE 40 SMART WATCH MYDM2ID/B-[HM]', '5499000.00', 'Faucibus ornare suspendisse sed nisi lacus sed. Quisque egestas diam in arcu. Tincidunt dui ut ornare lectus sit amet. Morbi non arcu risus quis varius quam. Blandit libero volutpat sed cras ornare. Eros in cursus turpis massa. Urna porttitor rhoncus dolor purus non. Ut pharetra sit amet aliquam id diam maecenas ultricies. Neque egestas congue quisque egestas diam in arcu cursus euismod. Arcu cursus euismod quis viverra nibh cras.', '2023-09-20 06:01:34', NULL),
(6, 'SAMSUNG SMART WATCH GALAXY WATCH4 40MM', '2239000.00', 'Amet risus nullam eget felis eget. Laoreet suspendisse interdum consectetur libero id faucibus. Nisl pretium fusce id velit ut tortor pretium. Ut etiam sit amet nisl. Rhoncus est pellentesque elit ullamcorper dignissim cras. Nibh mauris cursus mattis molestie a iaculis at erat. Ultrices neque ornare aenean euismod elementum nisi quis.', '2023-09-20 06:02:01', '2023-09-20 06:08:55'),
(7, 'XIAOMI - MI WATCH SERIES', '1599000.00', 'A diam maecenas sed enim ut sem viverra aliquet. Elementum integer enim neque volutpat ac tincidunt. Bibendum arcu vitae elementum curabitur vitae nunc sed velit. Quisque sagittis purus sit amet volutpat. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit.', '2023-09-20 06:02:32', '2023-09-21 03:58:54'),
(8, 'SAMSUNG SMART HEADSET BUDS2 BLACK', '1399000.00', 'Egestas congue quisque egestas diam in arcu cursus euismod. Vel quam elementum pulvinar etiam. Sed risus ultricies tristique nulla aliquet enim. Lectus nulla at volutpat diam ut venenatis. Massa tincidunt dui ut ornare lectus sit amet est. Arcu non sodales neque sodales.', '2023-09-20 06:03:13', '2023-09-21 06:06:19'),
(9, 'SAMSUNG TRAVEL ADAPTER (35W) W/O CABLE', '379000.00', 'Sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Morbi tristique senectus et netus et malesuada fames. Placerat duis ultricies lacus sed turpis tincidunt id aliquet. Aenean euismod elementum nisi quis. Faucibus interdum posuere lorem ipsum. Ut sem viverra aliquet eget sit amet tellus cras. Phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor.', '2023-09-20 06:03:41', '2023-09-21 06:04:33'),
(12, 'TEST PRODUCT 1011', '5499000.00', 'Lorem ipsum dolor sit amet.', '2023-09-21 06:18:46', NULL),
(13, 'NEW PRODUCT 500', '3499000.00', 'Lorem', '2023-09-21 06:26:52', NULL),
(14, 'PRODUCT 101', '599000.00', 'Lorem ipsum', '2023-09-21 06:27:47', NULL),
(15, 'PRODUCT 102 UPDATED', '4799000.00', 'Lorem', '2023-09-21 06:31:08', '2023-09-21 06:44:12'),
(16, 'NEW PRODUCT ARRIVAL 20500', '2000000.00', 'NULL', '2023-09-21 06:31:59', NULL),
(17, 'PRODUCT 500100', '7900000.00', 'Loem ipsum door', '2023-09-21 06:34:40', NULL),
(18, 'PRODUCT 001001 NEW', '6599000.00', '', '2023-09-21 06:39:23', '2023-09-21 06:46:10'),
(19, 'I-TEL S23 NEWEST 2023', '1299000.00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Massa massa ultricies mi quis hendrerit. Faucibus vitae aliquet nec ullamcorper sit amet risus nullam eget. Cursus euismod quis viverra nibh cras pulvinar mattis nunc. In fermentum posuere urna nec tincidunt praesent. Morbi tristique senectus et netus et. Vulputate sapien nec sagittis aliquam malesuada bibendum arcu. Sed tempus urna et pharetra pharetra massa massa. Dictum varius duis at consectetur lorem donec.', '2023-09-21 06:56:54', '2023-12-20 13:00:37'),
(20, 'OASE - EARBUD HEADPHONES TWS KT11 SERIES', '379000.00', 'Purus sit amet luctus venenatis lectus magna fringilla urna. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum arcu. Feugiat in fermentum posuere urna nec. Sed libero enim sed faucibus turpis. Eget lorem dolor sed viverra ipsum. Eget aliquet nibh praesent tristique magna sit amet. Vitae et leo duis ut diam quam nulla porttitor massa.', '2023-09-21 07:09:43', '2023-09-22 02:01:18'),
(21, 'New Product 101010', '6579000.00', 'NULL', '2023-12-20 12:56:13', '2023-12-20 13:38:05'),
(22, 'Standart Product ABC', '7699000.00', '', '2023-12-20 13:44:51', '2023-12-20 13:49:24'),
(23, 'My Product 200', '3789000.00', 'Lorem', '2023-12-20 13:45:44', NULL),
(24, 'My Product 201', '6569000.00', 'Lorem', '2023-12-20 13:46:36', '2023-12-20 13:49:41'),
(25, 'My Product 202', '3399000.00', 'Lorem', '2023-12-20 13:47:23', '2023-12-20 13:49:53'),
(26, 'My Product 203', '2779000.00', 'Lorem', '2023-12-20 13:49:01', '2023-12-20 13:50:03'),
(27, 'Product XYZ 1', '1299000.00', 'Lorem ipsum', '2023-12-20 13:51:57', '2023-12-20 13:57:21'),
(28, 'Product XYZ 2', '7689000.00', 'Lorem ipsum', '2023-12-20 13:57:02', '2023-12-20 13:57:33'),
(29, 'Product XYZ 3', '1299000.00', 'Lorem ipsum', '2023-12-20 13:59:21', '2023-12-20 14:07:55'),
(30, 'Product XYZ 4', '5499000.00', 'Lorem ipsum', '2023-12-20 14:07:12', '2023-12-20 14:08:05'),
(31, 'Product XYZ 5', '2879000.00', 'Lorem ipsum', '2023-12-20 14:07:23', '2023-12-20 14:08:16'),
(32, 'Simple Product', '5499000.00', 'Lorem ipsum dolor sit amet', '2023-12-20 14:10:27', NULL),
(33, 'YES PLEASE 1001', '5699000.00', 'yes please product top', '2023-12-20 16:42:33', NULL),
(34, 'NAH Project 2877400', '639000.00', 'Testing description ', '2023-12-20 16:44:48', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

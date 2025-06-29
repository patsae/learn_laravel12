-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2025 at 04:24 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attractions_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `open_time` varchar(100) DEFAULT NULL,
  `ticket_price` varchar(100) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `location`, `description`, `category`, `open_time`, `ticket_price`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'วัดพระแก้ว', 'กรุงเทพมหานคร', 'วัดคู่บ้านคู่เมืองที่ประดิษฐานพระแก้วมรกต', 'ศาสนสถาน', '08:30 - 15:30', '500 บาท (ต่างชาติ)', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(2, 'พระบรมมหาราชวัง', 'กรุงเทพมหานคร', 'พระราชวังหลวงของไทย มีสถาปัตยกรรมงดงาม', 'ประวัติศาสตร์', '08:30 - 15:30', '500 บาท', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(3, 'วัดอรุณราชวราราม', 'กรุงเทพมหานคร', 'วัดชื่อดังริมแม่น้ำเจ้าพระยา มีพระปรางค์สูงเด่น', 'ศาสนสถาน', '08:00 - 17:30', '100 บาท', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(4, 'ตลาดร่มหุบ', 'สมุทรสงคราม', 'ตลาดที่มีรถไฟวิ่งผ่านกลางตลาด สร้างความตื่นเต้น', 'วัฒนธรรม', '06:00 - 17:00', 'ฟรี', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(5, 'ตลาดน้ำอัมพวา', 'สมุทรสงคราม', 'ตลาดน้ำยามเย็นยอดนิยมริมคลองอัมพวา', 'วัฒนธรรม', '16:00 - 21:00 (ศุกร์ - อาทิตย์)', 'ฟรี', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(6, 'เขาใหญ่', 'นครราชสีมา', 'อุทยานแห่งชาติที่มีธรรมชาติสวยงามและสัตว์ป่า', 'ธรรมชาติ', '06:00 - 18:00', '40 บาท (คนไทย) / 400 บาท (ต่างชาติ)', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(7, 'ดอยอินทนนท์', 'เชียงใหม่', 'ยอดเขาสูงที่สุดในประเทศไทย มีอากาศเย็นตลอดปี', 'ธรรมชาติ', '06:00 - 18:00', '50 บาท / 300 บาท', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(8, 'ภูชี้ฟ้า', 'เชียงราย', 'จุดชมวิวทะเลหมอกยอดนิยม ชมพระอาทิตย์ขึ้น', 'ธรรมชาติ', 'ตลอดวัน', 'ฟรี', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(9, 'เกาะพะงัน', 'สุราษฎร์ธานี', 'เกาะยอดนิยมสำหรับ Full Moon Party และธรรมชาติ', 'เกาะ/ทะเล', 'ตลอดวัน', 'ฟรี (ค่าข้ามเรือ)', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(10, 'เกาะสมุย', 'สุราษฎร์ธานี', 'เกาะท่องเที่ยวชื่อดังระดับโลก มีชายหาดสวยงาม', 'เกาะ/ทะเล', 'ตลอดวัน', 'ฟรี (ค่าข้ามเรือ)', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(11, 'เกาะพีพี', 'กระบี่', 'เกาะที่มีธรรมชาติสวยงาม น้ำทะเลใส และดำน้ำชมปะการัง', 'เกาะ/ทะเล', 'ตลอดวัน', 'ฟรี (ค่าทัวร์หรือเรือ)', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(12, 'อุทยานประวัติศาสตร์สุโขทัย', 'สุโขทัย', 'แหล่งโบราณคดีที่เคยเป็นเมืองหลวงของสุโขทัย', 'ประวัติศาสตร์', '06:00 - 18:00', '20 บาท / 100 บาท', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(13, 'อุทยานประวัติศาสตร์อยุธยา', 'พระนครศรีอยุธยา', 'แหล่งมรดกโลกและเมืองเก่าแก่ของไทย', 'ประวัติศาสตร์', '08:00 - 17:00', '20 บาท / 50 บาท', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(14, 'เขาสามมุก', 'ชลบุรี', 'จุดชมวิวทะเล และสถานที่ศักดิ์สิทธิ์', 'ธรรมชาติ', 'ตลอดวัน', 'ฟรี', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35'),
(15, 'ปาย', 'แม่ฮ่องสอน', 'เมืองท่องเที่ยวยอดนิยมของนักเดินทาง มีธรรมชาติและวัฒนธรรมผสมผสาน', 'ธรรมชาติ/วัฒนธรรม', 'ตลอดวัน', 'ฟรี', 'https://dummyjson.com/image/250', '2025-06-29 21:23:35', '2025-06-29 21:23:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

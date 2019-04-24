-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 21, 2019 at 09:22 PM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.15-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carshow5`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `Chassis` int(8) NOT NULL,
  `Engine_no` int(8) NOT NULL DEFAULT '0',
  `CC` int(8) NOT NULL,
  `Color` varchar(30) NOT NULL,
  `Transmission` varchar(30) NOT NULL,
  `Brand` varchar(30) NOT NULL,
  `Price` int(16) NOT NULL,
  `Car_type` varchar(30) NOT NULL,
  `Designer` varchar(30) DEFAULT NULL,
  `HP` int(8) DEFAULT NULL,
  `4wheel_drive` char(1) DEFAULT NULL,
  `Fog_light` char(1) DEFAULT NULL,
  `Ignition` varchar(30) DEFAULT NULL,
  `Door` int(8) DEFAULT NULL,
  `Seat` int(8) DEFAULT NULL,
  `Salesman_id` int(8) DEFAULT NULL,
  `Customer_id` int(8) DEFAULT NULL,
  `Quantity` int(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`Chassis`, `Engine_no`, `CC`, `Color`, `Transmission`, `Brand`, `Price`, `Car_type`, `Designer`, `HP`, `4wheel_drive`, `Fog_light`, `Ignition`, `Door`, `Seat`, `Salesman_id`, `Customer_id`, `Quantity`) VALUES
(15000001, 45000001, 1800, 'Blue', 'Manual', 'Toyota', 210000, 'Luxury', 'Khungsu Whandu', 120, 'N', 'N', 'Fuel', 4, 4, NULL, NULL, NULL),
(15000002, 45000002, 17600, 'Red', 'Auto', 'Bugatti Chiron', 1050000000, 'Luxury', 'Ser Jaime Lannister', 1100, 'Y', 'N', 'Fuel', 2, 2, 17050005, 17070006, 1),
(15000003, 45000003, 9750, 'Blue', 'Auto', 'Dodge Viper', 20000000, 'Sport', 'null', 650, 'Y', 'N', 'Fuel', 2, 2, 17050001, 17070001, 1),
(15000004, 45000004, 8250, 'Blue', 'Auto', 'Tesla', 8000000, 'Hatch Back', 'null', 550, 'N', 'N', 'Electric', 2, 4, NULL, NULL, NULL),
(15000005, 45000005, 8800, 'Red', 'Auto', 'BMW', 24000000, 'Luxury', 'Oliver Queen', 700, 'N', 'N', 'Fual', 2, 2, 17050002, 17070002, NULL),
(15000006, 45000006, 5100, 'Black', 'Auto', 'Hyundai', 10000000, 'Family', 'null', 340, 'N', 'N', 'Fual', 4, 4, 17050001, 17070007, NULL),
(15000007, 45000007, 13500, 'Red', 'Auto', 'Porsche', 125000000, 'Sport', 'null', 900, 'Y', 'N', 'Fual', 2, 2, NULL, NULL, NULL),
(15000008, 45000008, 7500, 'White', 'Auto', 'Toyota', 18000000, 'Family', 'null', 500, 'Y', 'N', 'Fual', 4, 4, 17050003, 17070003, 1),
(15000009, 45000009, 12500, 'Blue', 'Manual', 'Ford', 33000000, 'Sport', 'null', 850, 'Y', 'N', 'Fual', 2, 2, 17050004, 17070004, NULL),
(15000010, 45000010, 15000, 'Blue', 'Auto', 'Aston Martin', 80000000, 'Luxury', 'Adam Sandler', 700, 'Y', 'N', 'Fual', 2, 2, 17050005, 17070005, NULL),
(15000011, 45000011, 16500, 'Black', 'Auto', 'Porsche', 100000000, 'Sport', 'null', 800, 'Y', 'N', 'Fual', 2, 2, 17050003, 17070008, NULL),
(15000012, 45000012, 16500, 'Red', 'Auto', 'Ferrari', 24000000, 'Sport', 'null', 950, 'Y', 'N', 'Fual', 2, 2, 17050004, 17070009, NULL),
(15000013, 45000013, 14200, 'White', 'Auto', 'Lamborghini', 22000000, 'Sport', 'null', 900, 'Y', 'N', 'Fual', 2, 2, 17050002, 17070010, NULL),
(15000014, 45000014, 12500, 'Blue', 'Manual', 'Hummer', 18000000, 'Off-Road', 'null', 800, 'Y', 'Y', 'Fual', 2, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `n_id` int(8) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone_no` int(16) DEFAULT NULL,
  `Payment_type` varchar(30) NOT NULL,
  `Cash_amount` int(16) DEFAULT NULL,
  `No_of_installments` int(8) DEFAULT NULL,
  `Premium` int(16) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`n_id`, `Name`, `Address`, `Phone_no`, `Payment_type`, `Cash_amount`, `No_of_installments`, `Premium`) VALUES
(17070001, 'Jamal Akbar', '26/9 Wireless Gate, Mohakhali, Dhaka', 1759332219, 'cash', 20000000, NULL, NULL),
(17070002, 'Sohel Chowdhury', '59 TB Gate Mohakhali, Dhaka', 1616255913, 'installment', NULL, 6, 4000000),
(17070003, 'Idris Khan', '178/34 Banani, Dhaka', 1834543411, 'cash', 18000000, NULL, NULL),
(17070004, 'Maksudul Anwar', '25, Road No. 4, Ghulshan, Dhaka', 1739143926, 'cash', 30000000, NULL, NULL),
(17070005, 'Raihanaa Khanam', '22, Block B, New Circle,Malibagh, Dhaka', 1890485496, 'cash', 80000000, NULL, NULL),
(17070006, 'Sajjad Ahmed', '43/6 GEC Circle, Chittagong', 1625732594, 'installment', NULL, 21, 5000000),
(17070007, 'Tawhid Babu', '1929, K.B. Aman Alini Road,Chawkbazar, Chittagong', 1755028947, 'installment', 10000000, NULL, NULL),
(17070008, 'Fabiha chingu', '31/4 Road No. 7, Nilkhet, Dhaka', 1839946563, 'cash', 100000000, 12, NULL),
(17070009, 'Najifa Akther', '39/26 Bosundhora R/A, Dhaka', 1835945346, 'installment', 100000, 4, 8000000),
(17070010, 'Ariful Hasan', '89/45 Mothikhil, Dhaka', 1723675143, 'installment', NULL, 11, 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `n_id` int(8) NOT NULL,
  `date_of_Birth` date NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `salary` int(8) NOT NULL,
  `sex` char(1) NOT NULL,
  `password` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`n_id`, `date_of_Birth`, `name`, `address`, `salary`, `sex`, `password`) VALUES
(17001000, '2019-04-01', 'eralp', 'atakent', 1000, 'M', '123456'),
(17050001, '2019-04-02', 'ahmet', 'asdasdasd', 9000, 'M', '123456'),
(17090001, '2019-04-01', 'kerim', 'atakent', 5000, 'M', '123456'),
(17010001, '2019-04-09', 'admin', 'adressss', 10000, 'M', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `n_id` int(8) NOT NULL DEFAULT '0',
  `Commission` int(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`n_id`, `Commission`) VALUES
(17050001, 5),
(17050002, 2),
(17050003, 7),
(17050004, 40),
(17050005, 15),
(17050006, 10);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `n_id` int(8) NOT NULL DEFAULT '0',
  `Staff_type` varchar(30) NOT NULL,
  `G_location` varchar(30) DEFAULT NULL,
  `C_type` varchar(30) DEFAULT NULL,
  `Mec_grade` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`n_id`, `Staff_type`, `G_location`, `C_type`, `Mec_grade`) VALUES
(17090001, 'Security', 'Main Gate', NULL, NULL),
(17090004, 'Security', 'Store House', NULL, NULL),
(17090003, 'Security', 'Main Gate', NULL, NULL),
(17090002, 'Cleaner', NULL, 'Car Cleaner', NULL),
(17090005, 'Cleaner', NULL, 'Car Cleaner', NULL),
(17090006, 'Mechanic', NULL, NULL, 'grade3'),
(17090007, 'Mechanic', NULL, NULL, 'grade1'),
(17090008, 'Mechanic', NULL, NULL, 'grade2'),
(17090009, 'Mechanic', NULL, NULL, 'grade1'),
(17090010, 'Mechanic', NULL, NULL, 'grade3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`Engine_no`),
  ADD KEY `Salesman_id` (`Salesman_id`),
  ADD KEY `Customer_id` (`Customer_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`n_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

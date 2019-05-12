-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 12, 2019 at 02:16 PM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.2.17-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carshow6`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_car` ()  BEGIN  
SELECT * FROM car;  
END$$

DELIMITER ;

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
(15000001, 45000001, 1800, 'Blue', 'Manual', 'Toyota', 2100009, 'Luxury', 'Khungsu Whandu', 120, 'N', 'N', 'Fuel', 4, 4, NULL, NULL, NULL),
(15000002, 45000002, 17600, 'Red', 'Auto', 'Bugatti Chiron', 105000, 'Luxury', 'Ser Jaime Lannister', 1100, 'Y', 'N', 'Fuel', 2, 2, 17050005, 17070006, 1),
(15000003, 45000003, 9750, 'Blue', 'Auto', 'Dodge Viper', 20000000, 'Sport', 'null', 650, 'Y', 'N', 'Fuel', 2, 2, 17050001, 17070001, 1),
(15000004, 45000004, 8250, 'Blue', 'Auto', 'Tesla', 8000000, 'Hatch Back', 'null', 550, 'N', 'N', 'Electric', 2, 4, NULL, NULL, NULL),
(15000005, 45000005, 8800, 'Red', 'Auto', 'BMW', 24000000, 'Luxury', 'Oliver Queen', 700, 'N', 'N', 'Fual', 2, 2, 17050002, 17070002, NULL),
(15000006, 45000006, 5100, 'Black', 'Auto', 'Hyundai', 10000000, 'Family', 'null', 340, 'N', 'N', 'Fual', 4, 4, 17050001, 17070007, NULL),
(15000007, 45000007, 13500, 'Red', 'Auto', 'Porsche', 125000000, 'Sport', 'null', 900, 'Y', 'N', 'Fual', 2, 2, NULL, NULL, NULL),
(15000008, 45000008, 7500, 'White', 'Auto', 'Toyota', 18000000, 'Family', 'null', 500, 'Y', 'N', 'Fual', 4, 4, 17050003, 17070003, 1),
(15000009, 45000009, 12500, 'Blue', 'Manual', 'Ford', 330000, 'Sport', 'null', 850, 'Y', 'N', 'Fual', 2, 2, 17050004, 17070004, NULL),
(15000010, 45000010, 15000, 'Blue', 'Auto', 'Aston Martin', 80000000, 'Luxury', 'Adam Sandler', 700, 'Y', 'N', 'Fual', 2, 2, 17050005, 17070005, NULL),
(15000011, 45000011, 16500, 'Black', 'Auto', 'Porsche', 100000000, 'Sport', 'null', 800, 'Y', 'N', 'Fual', 2, 2, 17050003, 17070008, NULL),
(15000012, 45000012, 16500, 'Red', 'Auto', 'Ferrari', 24000000, 'Sport', 'null', 950, 'Y', 'N', 'Fual', 2, 2, 17050004, 17070009, NULL),
(15000013, 45000013, 14200, 'White', 'Auto', 'Lamborghini', 22000000, 'Sport', 'null', 900, 'Y', 'N', 'Fual', 2, 2, 17050002, 17070010, NULL),
(15000014, 45000014, 12500, 'Blue', 'Manual', 'Hummer', 50000, 'Off-Road', 'null', 800, 'Y', 'Y', 'Fual', 2, 2, NULL, NULL, NULL);

--
-- Triggers `car`
--
DELIMITER $$
CREATE TRIGGER `car_after_delete` AFTER DELETE ON `car` FOR EACH ROW BEGIN

 INSERT INTO car_audit
    SET action = 'delete',
     Chassis = OLD.Chassis,
        Price = OLD.Price,
        changedat = NOW();

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `car_price_update` BEFORE UPDATE ON `car` FOR EACH ROW BEGIN
    INSERT INTO car_audit
    SET action = 'update',
     Chassis = OLD.Chassis,
        Price = OLD.Price,
        changedat = NOW(); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `car_audit`
--

CREATE TABLE `car_audit` (
  `id` int(11) NOT NULL,
  `Chassis` int(11) NOT NULL,
  `Price` varchar(50) NOT NULL,
  `changedat` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_audit`
--

INSERT INTO `car_audit` (`id`, `Chassis`, `Price`, `changedat`, `action`) VALUES
(1, 15000001, '210000', '2019-04-28 22:58:28', 'update'),
(2, 15000002, '1050000000', '2019-04-28 22:58:31', 'update'),
(3, 15000009, '33000000', '2019-04-28 22:58:35', 'update'),
(4, 15000002, '10500000', '2019-04-29 08:43:12', 'update'),
(5, 15000015, '100000', '2019-04-29 09:42:30', 'delete'),
(6, 45000016, '10000', '2019-04-29 10:45:07', 'delete'),
(7, 15000014, '18000000', '2019-04-29 10:45:50', 'update');

-- --------------------------------------------------------

--
-- Stand-in structure for view `car_view`
-- (See below for the actual view)
--
CREATE TABLE `car_view` (
`Chassis` int(8)
,`CC` int(8)
,`Price` int(16)
,`HP` int(8)
);

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
(17010002, 'admin2', 'test', 5566477, 'cash', 20000, 4, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_cashamount_view`
-- (See below for the actual view)
--
CREATE TABLE `customer_cashamount_view` (
`n_id` int(8)
,`Name` varchar(30)
,`Cash_amount` int(16)
);

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
(17090001, '2019-04-01', 'kerim', 'atakent', 5000, 'F', '123456'),
(17010001, '2019-04-09', 'eralp', 'adressss', 10000, 'M', '123456');

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `before_employee_update` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
     n_id = OLD.n_id,
        name = OLD.name,
        changedat = NOW(); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employees_audit`
--

CREATE TABLE `employees_audit` (
  `id` int(11) NOT NULL,
  `n_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `changedat` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees_audit`
--

INSERT INTO `employees_audit` (`id`, `n_id`, `name`, `changedat`, `action`) VALUES
(1, 17010001, 'admin', '2019-04-28 22:35:27', 'update'),
(2, 17090001, 'kerim', '2019-04-29 09:11:25', 'update');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_update_view`
-- (See below for the actual view)
--
CREATE TABLE `employee_update_view` (
`n_id` int(11)
,`changedat` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_view`
-- (See below for the actual view)
--
CREATE TABLE `employee_view` (
`n_id` int(8)
,`name` varchar(30)
,`sex` char(1)
,`salary` int(8)
);

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
-- Stand-in structure for view `satff_view`
-- (See below for the actual view)
--
CREATE TABLE `satff_view` (
`n_id` int(8)
,`Staff_type` varchar(30)
);

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

-- --------------------------------------------------------

--
-- Structure for view `car_view`
--
DROP TABLE IF EXISTS `car_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `car_view`  AS  select `car`.`Chassis` AS `Chassis`,`car`.`CC` AS `CC`,`car`.`Price` AS `Price`,`car`.`HP` AS `HP` from `car` ;

-- --------------------------------------------------------

--
-- Structure for view `customer_cashamount_view`
--
DROP TABLE IF EXISTS `customer_cashamount_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_cashamount_view`  AS  select `customer`.`n_id` AS `n_id`,`customer`.`Name` AS `Name`,`customer`.`Cash_amount` AS `Cash_amount` from `customer` ;

-- --------------------------------------------------------

--
-- Structure for view `employee_update_view`
--
DROP TABLE IF EXISTS `employee_update_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_update_view`  AS  select `employees_audit`.`n_id` AS `n_id`,`employees_audit`.`changedat` AS `changedat` from `employees_audit` ;

-- --------------------------------------------------------

--
-- Structure for view `employee_view`
--
DROP TABLE IF EXISTS `employee_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_view`  AS  select `employee`.`n_id` AS `n_id`,`employee`.`name` AS `name`,`employee`.`sex` AS `sex`,`employee`.`salary` AS `salary` from `employee` ;

-- --------------------------------------------------------

--
-- Structure for view `satff_view`
--
DROP TABLE IF EXISTS `satff_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `satff_view`  AS  select `staff`.`n_id` AS `n_id`,`staff`.`Staff_type` AS `Staff_type` from `staff` ;

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
-- Indexes for table `car_audit`
--
ALTER TABLE `car_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `employees_audit`
--
ALTER TABLE `employees_audit`
  ADD PRIMARY KEY (`id`);

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

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car_audit`
--
ALTER TABLE `car_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `employees_audit`
--
ALTER TABLE `employees_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2018 at 01:24 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr9_rent_a_car`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_ID` int(11) NOT NULL,
  `street` varchar(80) DEFAULT NULL,
  `house_number` int(11) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_ID`, `street`, `house_number`, `zip_code`, `city`, `country`) VALUES
(100, 'Hansestrasse', 14, 12345, 'Hamburg', 'Germany'),
(101, 'Bavariastrasse', 17, 12346, 'München', 'Germany'),
(102, 'Hessenstrasse', 23, 12347, 'Frankfurt', 'Germany'),
(103, 'Mercedesstrasse', 124, 12348, 'Stuttgart', 'Germany'),
(104, 'Zooallee', 37, 12349, 'Köln', 'Germany');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_ID` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `fk_value_total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_ID`, `date`, `fk_value_total`) VALUES
(201, '2018-02-12', NULL),
(202, '2017-12-02', NULL),
(203, '2017-12-04', NULL),
(204, '2016-05-04', NULL),
(205, '2015-08-22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_ID` int(11) NOT NULL,
  `employeeNumber` int(11) DEFAULT NULL,
  `salespy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_ID`, `employeeNumber`, `salespy`) VALUES
(1000, 2100, 1200450);

-- --------------------------------------------------------

--
-- Table structure for table `company_locations`
--

CREATE TABLE `company_locations` (
  `loc_ID` int(11) NOT NULL,
  `opening_hours` varchar(50) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `fk_address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_locations`
--

INSERT INTO `company_locations` (`loc_ID`, `opening_hours`, `phone`, `fk_address_ID`) VALUES
(1001, '8am to 4pm', 2147483647, NULL),
(1002, '7am to 3pm', 2147483647, NULL),
(1003, '6am to 10pm', 43167465, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `fk_address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_ID`, `first_name`, `last_name`, `phone`, `birthday`, `fk_address_ID`) VALUES
(1238, 'Uschi', 'Müller', 1213334, '1958-06-18', NULL),
(12345, 'Kurt', 'Schmitt', 2147483647, '1985-06-10', NULL),
(12346, 'Erika', 'Stift', 123023944, '1973-02-13', NULL),
(12347, 'Gerhard', 'Seemann', 1213333, '1962-04-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_ID` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `drivers_license` varchar(10) DEFAULT NULL,
  `fk_address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_ID`, `first_name`, `last_name`, `drivers_license`, `fk_address_ID`) VALUES
(140, 'Uschi', 'Müller', '123484', NULL),
(141, 'Stefan', 'Schmitt', '123478', NULL),
(142, 'Lisa', 'Müller', '1256078', NULL),
(143, 'Karin', 'Wolke', '1256099', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_ID` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `fk_address_ID` int(11) DEFAULT NULL,
  `fk_salary_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_ID`, `first_name`, `last_name`, `position`, `fk_address_ID`, `fk_salary_level`) VALUES
(1256, 'Katrin', 'Maier', 'Marketing', NULL, NULL),
(1257, 'Siegfried', 'Schmittke', 'Test driver', NULL, NULL),
(1258, 'Wanja', 'Stadtbäumer', 'Telephonist', NULL, NULL),
(1259, 'Nicola', 'Pichler', 'Insurance consultant', NULL, NULL),
(1260, 'Ellen', 'Schiffer', 'Social Media Manager', NULL, NULL),
(1261, 'Norbert', 'Peters', 'Designer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `ins_ID` int(11) NOT NULL,
  `ins_price` int(11) DEFAULT NULL,
  `ins_company` varchar(80) DEFAULT NULL,
  `ins_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`ins_ID`, `ins_price`, `ins_company`, `ins_level`) VALUES
(10010, 1400, 'Allianz', 6),
(10011, 1200, 'Wiener Staedtische', 4),
(10012, 1800, 'Zuericher', 9),
(10013, 2200, 'Axa', 11),
(10014, 1300, 'Generali', 7);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_ID` int(11) NOT NULL,
  `comment1` varchar(255) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `fk_address_ID` int(11) DEFAULT NULL,
  `fk_emp_ID` int(11) DEFAULT NULL,
  `fk_customer_ID` int(11) DEFAULT NULL,
  `fk_price_ID` int(11) DEFAULT NULL,
  `fk_pickup_ID` int(11) DEFAULT NULL,
  `fk_return_ID` int(11) DEFAULT NULL,
  `fk_booking_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_ID`, `comment1`, `invoice_date`, `fk_address_ID`, `fk_emp_ID`, `fk_customer_ID`, `fk_price_ID`, `fk_pickup_ID`, `fk_return_ID`, `fk_booking_ID`) VALUES
(981, 'This is a random text for ID 981', '2016-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(982, 'This is a random text for ID 982', '2016-12-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(983, 'This is a random text for ID 983', '2016-12-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(984, 'This is a random text for ID 984', '2018-03-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(985, 'This is a random text for ID 985', '2018-01-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(986, 'This is a random text for ID 986', '2017-09-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(987, 'This is a random text for ID 987', '2018-02-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pickup_place`
--

CREATE TABLE `pickup_place` (
  `pickup_ID` int(11) NOT NULL,
  `pickup_date` date DEFAULT NULL,
  `pickup_time` int(11) DEFAULT NULL,
  `fk_loc_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pickup_place`
--

INSERT INTO `pickup_place` (`pickup_ID`, `pickup_date`, `pickup_time`, `fk_loc_ID`) VALUES
(1400, '2016-12-20', 12, NULL),
(1401, '2017-02-20', 10, NULL),
(1402, '0000-00-00', 13, NULL),
(1403, '2018-12-11', 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `price_ID` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `value_total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`price_ID`, `value`, `value_total`) VALUES
(1234, 200, 245),
(1235, 250, 300),
(1236, 300, 350),
(1237, 350, 410),
(1238, 460, 500);

-- --------------------------------------------------------

--
-- Table structure for table `rent_status`
--

CREATE TABLE `rent_status` (
  `rent_ID` int(11) NOT NULL,
  `status1` varchar(20) DEFAULT NULL,
  `fk_return_ID` int(11) DEFAULT NULL,
  `fk_pickup_ID` int(11) DEFAULT NULL,
  `fk_VIN` int(11) DEFAULT NULL,
  `fk_salary_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rent_status`
--

INSERT INTO `rent_status` (`rent_ID`, `status1`, `fk_return_ID`, `fk_pickup_ID`, `fk_VIN`, `fk_salary_level`) VALUES
(800, 'available', NULL, NULL, NULL, NULL),
(801, 'unavailable', NULL, NULL, NULL, NULL),
(802, 'unavailable', NULL, NULL, NULL, NULL),
(803, 'available', NULL, NULL, NULL, NULL),
(804, 'available', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `return_place`
--

CREATE TABLE `return_place` (
  `return_id` int(11) NOT NULL,
  `return_date` date DEFAULT NULL,
  `return_time` int(11) DEFAULT NULL,
  `fk_loc_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return_place`
--

INSERT INTO `return_place` (`return_id`, `return_date`, `return_time`, `fk_loc_ID`) VALUES
(1500, '2018-12-11', 14, NULL),
(1501, '2017-10-09', 9, NULL),
(1502, '2017-04-05', 6, NULL),
(1503, '2016-07-08', 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `salary_level` int(11) NOT NULL,
  `salary_value` int(11) DEFAULT NULL,
  `fk_emp_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`salary_level`, `salary_value`, `fk_emp_ID`) VALUES
(0, 20000, NULL),
(1, 40000, NULL),
(2, 50000, NULL),
(3, 60000, NULL),
(4, 70000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `VIN` int(11) NOT NULL,
  `license_plate` varchar(10) DEFAULT NULL,
  `gas` varchar(20) DEFAULT NULL,
  `reg_date` int(11) DEFAULT NULL,
  `max_passenger` int(11) DEFAULT NULL,
  `cond` varchar(20) DEFAULT NULL,
  `km` int(11) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `car_model` varchar(20) DEFAULT NULL,
  `manufacturer` varchar(30) DEFAULT NULL,
  `fk_ins_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`VIN`, `license_plate`, `gas`, `reg_date`, `max_passenger`, `cond`, `km`, `class`, `car_model`, `manufacturer`, `fk_ins_ID`) VALUES
(13215648, 'W-1248MW', 'diesel', 2005, 8, 'bad', 220000, 'multi-purpose-vehicl', 'Multipla', 'Fiat', NULL),
(123902343, 'W-1247MW', 'hybrid', 2018, 5, 'new', 5000, 'executive car', 'E-Class', 'Daimler-Benz', NULL),
(123902344, 'W-1243MW', 'petrol', 2016, 5, 'good', 120000, 'compact car', 'Astra', 'Opel', NULL),
(123902345, 'W-1244MW', 'diesel', 2018, 4, 'very good', 20000, 'b-segment', 'Corsa', 'Opel', NULL),
(123902346, 'W-1246MW', 'diesel', 2014, 2, 'not so good', 100000, 'supersupersuper-mini', 'Smart', 'Daimler-Benz', NULL),
(123902387, 'W-1245MW', 'electric drive', 2017, 5, 'good', 50000, 'compact-car', 'Golf', 'VW', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_ID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_ID`),
  ADD KEY `fk_value_total` (`fk_value_total`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_ID`);

--
-- Indexes for table `company_locations`
--
ALTER TABLE `company_locations`
  ADD PRIMARY KEY (`loc_ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`),
  ADD KEY `fk_salary_level` (`fk_salary_level`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`ins_ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_ID`),
  ADD KEY `fk_emp_ID` (`fk_emp_ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`),
  ADD KEY `fk_price_ID` (`fk_price_ID`),
  ADD KEY `fk_pickup_ID` (`fk_pickup_ID`),
  ADD KEY `fk_return_ID` (`fk_return_ID`),
  ADD KEY `fk_booking_ID` (`fk_booking_ID`);

--
-- Indexes for table `pickup_place`
--
ALTER TABLE `pickup_place`
  ADD PRIMARY KEY (`pickup_ID`),
  ADD KEY `fk_loc_ID` (`fk_loc_ID`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`price_ID`);

--
-- Indexes for table `rent_status`
--
ALTER TABLE `rent_status`
  ADD PRIMARY KEY (`rent_ID`),
  ADD KEY `fk_return_ID` (`fk_return_ID`),
  ADD KEY `fk_pickup_ID` (`fk_pickup_ID`),
  ADD KEY `fk_VIN` (`fk_VIN`);

--
-- Indexes for table `return_place`
--
ALTER TABLE `return_place`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_loc_ID` (`fk_loc_ID`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`salary_level`),
  ADD KEY `fk_emp_ID` (`fk_emp_ID`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`VIN`),
  ADD KEY `fk_ins_ID` (`fk_ins_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_value_total`) REFERENCES `prices` (`price_ID`);

--
-- Constraints for table `company_locations`
--
ALTER TABLE `company_locations`
  ADD CONSTRAINT `company_locations_ibfk_1` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`fk_salary_level`) REFERENCES `salaries` (`salary_level`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_emp_ID`) REFERENCES `employees` (`emp_ID`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`),
  ADD CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `invoice_ibfk_5` FOREIGN KEY (`fk_price_ID`) REFERENCES `prices` (`price_ID`),
  ADD CONSTRAINT `invoice_ibfk_6` FOREIGN KEY (`fk_pickup_ID`) REFERENCES `pickup_place` (`pickup_ID`),
  ADD CONSTRAINT `invoice_ibfk_7` FOREIGN KEY (`fk_return_ID`) REFERENCES `return_place` (`return_id`),
  ADD CONSTRAINT `invoice_ibfk_8` FOREIGN KEY (`fk_booking_ID`) REFERENCES `booking` (`booking_ID`);

--
-- Constraints for table `pickup_place`
--
ALTER TABLE `pickup_place`
  ADD CONSTRAINT `pickup_place_ibfk_1` FOREIGN KEY (`fk_loc_ID`) REFERENCES `company_locations` (`loc_ID`);

--
-- Constraints for table `rent_status`
--
ALTER TABLE `rent_status`
  ADD CONSTRAINT `rent_status_ibfk_1` FOREIGN KEY (`fk_return_ID`) REFERENCES `return_place` (`return_id`),
  ADD CONSTRAINT `rent_status_ibfk_2` FOREIGN KEY (`fk_pickup_ID`) REFERENCES `pickup_place` (`pickup_ID`),
  ADD CONSTRAINT `rent_status_ibfk_3` FOREIGN KEY (`fk_VIN`) REFERENCES `vehicle` (`VIN`);

--
-- Constraints for table `return_place`
--
ALTER TABLE `return_place`
  ADD CONSTRAINT `return_place_ibfk_1` FOREIGN KEY (`fk_loc_ID`) REFERENCES `company_locations` (`loc_ID`);

--
-- Constraints for table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`fk_emp_ID`) REFERENCES `employees` (`emp_ID`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`fk_ins_ID`) REFERENCES `insurance` (`ins_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

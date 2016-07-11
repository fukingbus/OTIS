-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2016-07-11 15:59:45
-- 伺服器版本: 10.1.13-MariaDB
-- PHP 版本： 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `project_db`
--

-- --------------------------------------------------------

--
-- 資料表結構 `airline`
--

CREATE TABLE `airline` (
  `AirlineCode` varchar(2) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `airlineName` varchar(20) NOT NULL,
  `icon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `airline`
--

INSERT INTO `airline` (`AirlineCode`, `Password`, `airlineName`, `icon`) VALUES
('BR', '123456', '長榮航空', 'Carrier2.png'),
('CI', '123456', '中華航空', 'Carrier1.png'),
('CX', '123456', '國泰航空', 'Carrier3.png'),
('EK', '123456', '阿聯酋航空', 'Carrier11.png'),
('HX', '123456', '香港航空', 'Carrier4.png'),
('JL', '123456', '日本航空', 'Carrier7.png'),
('KA', '123456', '港龍航空', 'Carrier5.png'),
('MU', '123456', '中國東方航空', 'Carrier8.png'),
('NH', '123456', '全日空航空', 'Carrier6.png'),
('SQ', '123456', '新加坡航空', 'Carrier9.png'),
('TG', '123456', '泰國國際航空', 'Carrier12.png'),
('UA', '123456', '美國聯合航空', 'Carrier10.png');

-- --------------------------------------------------------

--
-- 資料表結構 `customer`
--

CREATE TABLE `customer` (
  `CustID` varchar(4) NOT NULL DEFAULT '',
  `Password` varchar(10) NOT NULL,
  `Surname` varchar(15) NOT NULL,
  `GivenName` varchar(30) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Passport` varchar(15) NOT NULL,
  `MobileNo` varchar(15) NOT NULL,
  `Nationality` varchar(15) NOT NULL,
  `BonusPoint` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `customer`
--

INSERT INTO `customer` (`CustID`, `Password`, `Surname`, `GivenName`, `DateOfBirth`, `Gender`, `Passport`, `MobileNo`, `Nationality`, `BonusPoint`) VALUES
('C001', '123456', 'Chanb', 'Chi Ming3', '1982-02-09', 'F', 'F18421223', '95214224', 'Chinesaaa', 0),
('C002', '123456', 'Wong', 'Chun Tin', '1991-03-31', 'F', 'G6645132', '96254685', 'Chinese', 0),
('C003', '123456', 'Tang', 'Tai Chi', '1979-09-24', 'M', 'T2165158', '91254854', 'Chinese', 0),
('C004', '123456', 'Man', 'Chi Kuen', '1952-01-18', 'M', 'G2514144', '92548475', 'Chinese', 0),
('C005', '123456', 'Lee', 'Man Tao', '1983-04-16', 'M', 'A1254855', '92165845', 'Chinese', 0),
('C006', '123456', 'Leung', 'Shun Yee', '1991-02-19', 'F', 'B1215485', '91236545', 'Chinese', 0),
('C007', '123456', 'Lee', 'Ka Man', '1998-06-05', 'F', 'R2315845', '92548548', 'Chinese', 0),
('C008', '123456', 'Lung', 'Chi Kin', '1985-12-06', 'M', 'R1254856', '97584254', 'Chinese', 0),
('C009', '123456', 'Chan', 'Siu Dong', '1973-08-19', 'M', 'G6584251', '94652514', 'Chinese', 0),
('C010', '123456', 'Cheung', 'Tai Tim', '1978-08-17', 'M', 'J56698452', '94521575', 'Chinese', 0),
('C011', '123456', 'Fung', 'Chi Tak', '1977-02-15', 'M', 'T15515155', '96251675', 'Chinese', 0),
('C012', '123456', 'Chan', 'Man Sheung', '1976-06-18', 'F', 'F21251515', '95462415', 'Chinese', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `flightbooking`
--

CREATE TABLE `flightbooking` (
  `BookingID` int(7) NOT NULL,
  `FlightNo` varchar(6) NOT NULL,
  `DepDateTime` datetime NOT NULL,
  `Class` varchar(10) NOT NULL,
  `OrderDate` date NOT NULL,
  `StaffID` varchar(10) NOT NULL,
  `CustID` varchar(4) NOT NULL,
  `AdultNum` int(11) NOT NULL,
  `ChildNum` int(11) NOT NULL,
  `InfantNum` int(11) NOT NULL,
  `AdultPrice` int(11) NOT NULL,
  `ChildPrice` int(11) NOT NULL,
  `InfantPrice` int(11) NOT NULL,
  `TotalAmt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `flightbooking`
--

INSERT INTO `flightbooking` (`BookingID`, `FlightNo`, `DepDateTime`, `Class`, `OrderDate`, `StaffID`, `CustID`, `AdultNum`, `ChildNum`, `InfantNum`, `AdultPrice`, `ChildPrice`, `InfantPrice`, `TotalAmt`) VALUES
(1, 'BR858', '2015-06-22 20:55:00', 'Economy', '2016-07-03', 'fai1', 'C003', 1, 2, 3, 4, 5, 6, 7),
(3, 'BR858', '2015-06-22 20:55:00', 'Economy', '2016-07-03', 'fai1', 'C002', 1, 2, 3, 4, 5, 6, 7),
(4, 'BR858', '2015-06-22 20:55:00', 'Economy', '2016-07-03', 'cheong1', 'C001', 1, 2, 3, 4, 5, 6, 7),
(5, 'BR858', '2015-06-22 20:55:00', 'Economy', '2016-07-03', 'fai1', 'C001', 223, 3412, 23123, 4, 5, 6, 7);

-- --------------------------------------------------------

--
-- 資料表結構 `flightclass`
--

CREATE TABLE `flightclass` (
  `FlightNo` varchar(6) NOT NULL,
  `Class` varchar(10) NOT NULL,
  `AirlineCode` varchar(2) NOT NULL,
  `Price_Adult` int(11) NOT NULL,
  `Price_Children` int(11) NOT NULL,
  `Price_Infant` int(11) NOT NULL,
  `Tax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `flightclass`
--

INSERT INTO `flightclass` (`FlightNo`, `Class`, `AirlineCode`, `Price_Adult`, `Price_Children`, `Price_Infant`, `Tax`) VALUES
('BR856', 'Economy', 'BR', 1023, 774, 596, 0),
('BR858', 'Business', 'BR', 3088, 3088, 3088, 0),
('BR858', 'Economy', 'BR', 1023, 774, 596, 0),
('BR872', 'Economy', 'BR', 1023, 774, 596, 0),
('CI602', 'Business', 'CI', 2999, 2999, 500, 0),
('CI602', 'Economy', 'CI', 999, 746, 500, 0),
('CI614', 'Economy', 'CI', 931, 694, 500, 0),
('CI680', 'Business', 'CI', 2977, 2977, 500, 0),
('CI680', 'Economy', 'CI', 1098, 792, 500, 0),
('CX360', 'Business', 'CX', 6500, 6500, 2000, 0),
('CX360', 'Economy', 'CX', 3990, 2990, 1500, 0),
('CX364', 'Business', 'CX', 6500, 6500, 2000, 0),
('CX364', 'Economy', 'CX', 3990, 2990, 1500, 0),
('CX400', 'Economy', 'CX', 1490, 1090, 740, 0),
('CX406', 'Economy', 'CX', 1544, 1155, 740, 0),
('CX510', 'Economy', 'CX', 1554, 1115, 740, 0),
('CX564', 'Economy', 'CX', 1305, 1174, 760, 0),
('CX617', 'Economy', 'CX', 4300, 3100, 1300, 0),
('CX659', 'Business', 'CX', 3500, 3500, 800, 0),
('CX659', 'Economy', 'CX', 1760, 1760, 800, 0),
('CX703', 'Economy', 'CX', 4300, 3100, 1300, 0),
('CX713', 'Business', 'CX', 7500, 7500, 2000, 0),
('CX713', 'Economy', 'CX', 4300, 3100, 1300, 0),
('CX715', 'Business', 'CX', 3500, 3500, 800, 0),
('CX715', 'Economy', 'CX', 1880, 1880, 800, 0),
('CX735', 'Economy', 'CX', 1880, 1880, 800, 0),
('EK385', 'Economy', 'EK', 2200, 1652, 600, 0),
('EK386', 'Economy', 'EK', 2200, 1652, 600, 0),
('EK395', 'Economy', 'EK', 2200, 1652, 600, 0),
('HX232', 'Business', 'HX', 5600, 5600, 3000, 0),
('HX232', 'Economy', 'HX', 2850, 1800, 1200, 0),
('HX234', 'Economy', 'HX', 2850, 1800, 1200, 0),
('HX236', 'Economy', 'HX', 27850, 1800, 1200, 0),
('HX246', 'Business', 'HX', 5600, 5600, 3000, 0),
('HX246', 'Economy', 'HX', 2850, 1800, 1200, 0),
('HX252', 'Economy', 'HX', 1584, 1152, 500, 0),
('HX264', 'Economy', 'HX', 1584, 1152, 500, 0),
('HX282', 'Economy', 'HX', 1584, 1152, 500, 0),
('HX284', 'Business', 'HX', 2499, 2499, 530, 0),
('HX284', 'Economy', 'HX', 1584, 1160, 530, 0),
('JL7050', 'Business', 'JL', 11000, 7111, 800, 0),
('JL7050', 'Economy', 'JL', 7111, 5400, 600, 0),
('JL7054', 'Economy', 'JL', 7111, 5400, 750, 0),
('JL7060', 'Business', 'JL', 11000, 7111, 800, 0),
('JL7060', 'Economy', 'JL', 7111, 5400, 750, 0),
('KA482', 'Economy', 'KA', 1699, 1140, 670, 0),
('KA499', 'Economy', 'KA', 1699, 1162, 970, 0),
('KA565', 'Economy', 'KA', 1069, 1254, 670, 0),
('KA802', 'Business', 'KA', 8000, 7900, 1200, 0),
('KA802', 'Economy', 'KA', 4100, 3050, 1000, 0),
('KA858', 'Business', 'KA', 8050, 7900, 1200, 0),
('KA864', 'Economy', 'KA', 4100, 3050, 1000, 0),
('KA876', 'Economy', 'KA', 4100, 3050, 1000, 0),
('MU502', 'Economy', 'MU', 1990, 1190, 900, 0),
('MU503', 'Economy', 'MU', 1688, 1550, 400, 0),
('MU509', 'Economy', 'MU', 1658, 1550, 400, 0),
('MU702', 'Economy', 'MU', 1990, 1190, 800, 0),
('MU722', 'Economy', 'MU', 1893, 1140, 800, 0),
('MU724', 'Economy', 'MU', 2690, 2400, 1000, 0),
('MU728', 'Economy', 'MU', 1458, 1140, 400, 0),
('SQ857', 'Economy', 'SQ', 2950, 2950, 800, 0),
('SQ861', 'Business', 'SQ', 6500, 6500, 800, 0),
('SQ861', 'Economy', 'SQ', 3000, 3050, 800, 0),
('SQ865', 'Business', 'SQ', 6500, 6500, 800, 0),
('SQ865', 'Economy', 'SQ', 3050, 3050, 800, 0),
('SQ871', 'Economy', 'SQ', 3000, 3050, 800, 0),
('SQ891', 'Economy', 'SQ', 3010, 3010, 800, 0),
('TG601', 'Business', 'TG', 5600, 5600, 1200, 0),
('TG601', 'Economy', 'TG', 2400, 1850, 1000, 0),
('TG603', 'Economy', 'TG', 2400, 1850, 1000, 0),
('TG607', 'Economy', 'TG', 2400, 1850, 1000, 0),
('TG639', 'Business', 'TG', 5600, 5600, 1200, 0),
('TG639', 'Economy', 'TG', 2400, 1850, 1000, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `flightschedule`
--

CREATE TABLE `flightschedule` (
  `FlightNo` varchar(6) NOT NULL,
  `DepDateTime` datetime NOT NULL,
  `ArrDateTime` datetime NOT NULL,
  `DepAirport` varchar(3) NOT NULL,
  `ArrAirport` varchar(3) NOT NULL,
  `FlyMinute` int(11) NOT NULL,
  `Aircraft` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `flightschedule`
--

INSERT INTO `flightschedule` (`FlightNo`, `DepDateTime`, `ArrDateTime`, `DepAirport`, `ArrAirport`, `FlyMinute`, `Aircraft`) VALUES
('BR856', '2015-06-22 17:00:00', '2015-06-22 18:45:00', 'HKG', 'TPE', 105, 'A330-300'),
('BR858', '2015-06-22 20:55:00', '2015-06-22 22:40:00', 'HKG', 'TPE', 105, 'A330-300'),
('BR872', '2015-06-23 19:25:00', '2015-06-23 21:10:00', 'HKG', 'TPE', 105, 'A330-300'),
('CI602', '2015-06-20 10:15:00', '2015-06-20 11:55:00', 'HKG', 'TPE', 100, '747-400'),
('CI614', '2015-06-20 17:35:00', '2015-06-20 19:15:00', 'HKG', 'TPE', 100, 'A330-300'),
('CI680', '2015-06-20 13:25:00', '2015-06-20 15:05:00', 'HKG', 'TPE', 100, 'A330-300'),
('CX360', '2015-06-25 13:55:00', '2015-06-25 16:25:00', 'HKG', 'PVG', 150, 'A330-200'),
('CX364', '2015-06-24 17:35:00', '2015-06-24 20:10:00', 'HKG', 'PVG', 150, '777-300'),
('CX400', '2015-06-22 16:25:00', '2015-06-22 18:15:00', 'HKG', 'TPE', 110, 'A330-300'),
('CX406', '2015-06-20 12:15:00', '2015-06-20 14:15:00', 'HKG', 'TPE', 120, 'A330-300'),
('CX510', '2015-06-22 14:55:00', '2015-06-22 16:45:00', 'HKG', 'TPE', 110, 'A330-300'),
('CX564', '2016-07-15 05:29:44', '2015-06-20 15:05:00', 'HKG', 'TPE', 115, 'A330-300'),
('CX617', '2015-07-24 21:20:00', '2015-07-24 23:10:00', 'HKG', 'BKK', 175, '777-300'),
('CX659', '2015-07-28 01:45:00', '2015-07-28 05:25:00', 'HKG', 'SIN', 220, 'A330-300'),
('CX703', '2016-07-23 17:05:00', '2015-07-23 19:00:00', 'HKG', 'BKK', 170, 'A330-300'),
('CX713', '2015-07-22 08:50:00', '2015-07-22 10:40:00', 'HKG', 'BKK', 170, 'A330-300'),
('CX715', '2015-07-28 20:25:00', '2015-07-28 00:15:00', 'HKG', 'SIN', 230, '777-300'),
('CX715', '2015-07-29 20:25:00', '2015-07-29 00:15:00', 'HKG', 'SIN', 230, '777-300'),
('CX735', '2015-07-30 14:30:00', '2015-07-30 18:20:00', 'HKG', 'SIN', 230, 'A340-300'),
('EK385', '2015-07-22 21:50:00', '2015-07-22 23:45:00', 'HKG', 'BKK', 175, 'A380-800'),
('EK385', '2015-07-23 21:50:00', '2015-07-23 23:45:00', 'HKG', 'BKK', 175, 'A380-800'),
('EK386', '2015-07-24 19:50:00', '2015-07-24 21:45:00', 'HKG', 'BKK', 175, 'A380-800'),
('EK395', '2016-07-25 17:50:00', '2016-07-25 19:45:00', 'HKG', 'BKK', 175, 'A380-800'),
('HX232', '2015-06-29 17:25:00', '2015-06-29 19:55:00', 'HKG', 'PVG', 150, 'A330-200'),
('HX234', '2015-06-29 21:00:00', '2015-06-29 23:25:00', 'HKG', 'PVG', 145, 'A330-200'),
('HX236', '2015-06-30 08:15:00', '2015-06-30 10:50:00', 'HKG', 'PVG', 155, 'A330-200'),
('HX246', '2015-06-28 13:15:00', '2015-06-28 15:45:00', 'HKG', 'PVG', 150, 'A330-200'),
('HX252', '2015-06-21 09:30:00', '2015-06-21 11:25:00', 'HKG', 'TPE', 115, 'A330-300'),
('HX264', '2015-06-20 12:10:00', '2015-06-20 13:50:00', 'HKG', 'TPE', 100, 'A330-300'),
('HX282', '2015-06-20 17:40:00', '2015-06-20 19:30:00', 'HKG', 'TPE', 110, 'A330-300'),
('HX284', '2015-06-23 22:50:00', '2015-06-24 00:40:00', 'HKG', 'TPE', 110, 'A330-300'),
('JL7050', '2015-06-23 01:45:00', '2015-06-23 06:25:00', 'HKG', 'KIX', 220, 'A320'),
('JL7054', '2015-06-25 13:10:00', '2015-06-25 20:00:00', 'HKG', 'KIX', 350, 'A320'),
('JL7060', '2015-06-23 07:55:00', '2015-06-23 12:45:00', 'HKG', 'KIX', 230, 'A320'),
('KA482', '2015-06-20 18:25:00', '2015-06-20 20:15:00', 'HKG', 'TPE', 115, 'A330-300'),
('KA499', '2015-06-21 14:55:00', '2015-06-21 16:45:00', 'HKG', 'TPE', 110, 'A330-300'),
('KA565', '2015-06-24 17:00:00', '2015-06-24 18:45:00', 'HKG', 'TPE', 105, 'A330-300'),
('KA802', '2015-06-24 08:00:00', '2015-06-24 10:30:00', 'HKG', 'PVG', 150, 'A330-200'),
('KA858', '2015-09-30 10:00:00', '2015-09-30 12:20:00', 'HKG', 'SHA', 140, 'A330-200'),
('KA864', '2015-07-15 09:25:00', '2015-07-15 12:00:00', 'HKG', 'SHA', 155, 'A330-200'),
('KA876', '2015-06-22 09:55:00', '2015-06-22 12:30:00', 'HKG', 'PVG', 155, 'A321'),
('MU502', '2015-06-25 12:50:00', '2015-06-25 15:25:00', 'HKG', 'PVG', 155, 'A321'),
('MU702', '2015-06-26 13:55:00', '2015-06-26 16:25:00', 'HKG', 'PVG', 150, 'A320'),
('MU724', '2015-06-25 09:35:00', '2015-06-25 11:45:00', 'HKG', 'PVG', 130, 'A321'),
('SQ857', '2015-07-28 09:05:00', '2015-07-28 12:50:00', 'HKG', 'SIN', 225, '777-300'),
('SQ861', '2015-07-26 15:20:00', '2015-07-26 19:10:00', 'HKG', 'SIN', 230, 'A380-800'),
('SQ865', '2015-07-26 18:50:00', '2015-07-26 22:35:00', 'HKG', 'SIN', 225, '777-300'),
('SQ871', '2015-07-26 19:55:00', '2015-07-26 23:40:00', 'HKG', 'SIN', 225, '777-200'),
('SQ891', '2015-07-30 12:30:00', '2015-07-30 16:15:00', 'HKG', 'SIN', 225, 'A380-800'),
('TG601', '2015-07-24 13:25:00', '2015-07-24 15:05:00', 'HKG', 'BKK', 160, 'A380-800'),
('TG603', '2016-07-25 07:45:00', '2016-07-25 09:25:00', 'HKG', 'BKK', 160, 'A330-300'),
('TG607', '2015-07-22 20:45:00', '2015-07-22 22:25:00', 'HKG', 'BKK', 160, '747-400'),
('TG639', '2015-07-22 19:05:00', '2015-07-22 20:45:00', 'HKG', 'BKK', 160, 'A330-300');

-- --------------------------------------------------------

--
-- 資料表結構 `hotel`
--

CREATE TABLE `hotel` (
  `HotelID` int(11) NOT NULL DEFAULT '0',
  `Password` varchar(10) NOT NULL,
  `ChiName` varchar(50) NOT NULL,
  `EngName` varchar(80) NOT NULL,
  `Star` decimal(4,1) DEFAULT NULL,
  `Rating` decimal(4,1) NOT NULL DEFAULT '0.0',
  `Country` varchar(30) NOT NULL,
  `City` varchar(30) NOT NULL,
  `District` varchar(30) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Tel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `hotel`
--

INSERT INTO `hotel` (`HotelID`, `Password`, `ChiName`, `EngName`, `Star`, `Rating`, `Country`, `City`, `District`, `Address`, `Tel`) VALUES
(1, '123456', '台北君悅酒店', 'Grand Hyatt Taipei', '4.5', '4.3', 'Taiwan', 'Taipei', '信義', '2 SongShou Road Taipei 11051 台灣 ', '30774857'),
(2, '123456', '台北凱撒大飯店', 'Caesar Park Taipei', '4.0', '3.9', 'Taiwan', 'Taipei', '中正', '38 Chung Hsiao West Road Section 1 Zhongzheng Taipei 100 台灣', '30774857'),
(3, '123456', '台北福華大飯店', 'The Howard Plaza Hotel Taipei', '4.0', '3.9', 'Taiwan', 'Taipei', '大安', '160, Sec.3, Ren Ai Rd Taipei 10657 台灣 ', '30774857'),
(4, '123456', '台北中山意舍酒店', 'amba Taipei Zhongshan', '3.5', '4.0', 'Taiwan', 'Taipei', '中山', '57-1 Zhongshan North Road Section 2 Taipei 10412 台灣 ', '30774857'),
(5, '123456', '台北晶華酒店', 'Regent Taipei', '5.0', '4.4', 'Taiwan', 'Taipei', '中山', 'No 3, Lane 39, Section 2 ZhongShan North, Road Taipei 104 台灣 ', '30774857'),
(6, '123456', '台北西華飯店', 'The Sherwood Taipei', '4.5', '4.5', 'Taiwan', 'Taipei', '松山', '111 Min Sheng East Road Taipei 104 台灣 ', '30774857'),
(7, '123456', '黑部觀光酒店', 'Kurobe Kanko Hotel', '3.0', '3.9', 'Japan', 'Nagano', 'Omachi', '2822 Taira Omachi Nagano-ken 398-0001 日本 ', '30774857'),
(8, '123456', '落葉松莊酒店', 'Hotel Karamatsuso', '3.0', '3.0', 'Japan', 'Nagano', 'Omachi', '2884-109 Taira Omachi Nagano-ken 398-0001 日本 ', '30774857'),
(9, '123456', '東根拉雪酒店', 'Hotel La Neige Higashi-kan', '5.0', '4.5', 'Japan', 'Nagano', 'Hakuba', 'Happo Wadanonomori Hakuba Nagano-ken 399-9301 日本', '30774857'),
(10, '123456', '松本多米酒店', 'Dormy Inn Matsumoto', '4.0', '4.6', 'Japan', 'Nagano', 'Matsumoto', '2-2-1 Fukashi Matsumoto Nagano-ken 390-0815 日本 ', '30774857'),
(11, '123456', '新加坡唐購物中心萬豪酒店', 'Singapore Marriott Tang Plaza Hotel', '5.0', '4.4', 'Singapore', 'Singapore', '烏節路', '320 Orchard Road Singapore 238865 新加坡', '30774857'),
(12, '123456', '新加坡瑞士史丹福酒店', 'Swissotel The Stamford, Singapore', '5.0', '4.3', 'Singapore', 'Singapore', '殖民區 - 美芝路', '2 Stamford Road Singapore 178882 新加坡 ', '30774857'),
(13, '123456', '克萊蒙梭公園大道酒店', 'Park Avenue Clemenceau', '4.0', '3.8', 'Singapore', 'Singapore', '新加坡河', '81A Clemenceau Avenue # 05 - 18 UE Square Singapore 239918 新加坡', '30774857'),
(14, '123456', '新加坡國敦河畔大酒店', 'Grand Copthorne Waterfront Hotel Singapore', '4.0', '4.1', 'Singapore', 'Singapore', '新加坡河', '392 Havelock Road Singapore 169663 新加坡', '30774857'),
(15, '123456', '聖里吉斯曼谷酒店', 'The St. Regis Bangkok', '5.0', '4.6', 'Thailand', 'Bangkok', '市中心 - 暹邏廣場', '159 Rajadamri Road Bangkok Bangkok 10330 泰國', '30774857'),
(16, '123456', '帕色哇公主飯店', 'Pathumwan Princess Hotel', '4.5', '4.5', 'Thailand', 'Bangkok', '市中心 - 暹邏廣場', '444 MBK Center, Phayathai Rd., Wangmai Pathumwan Bangkok Bangkok 10330 泰國', '30774857'),
(17, '123456', '曼谷悅榕莊', 'Banyan Tree Bangkok', '5.0', '4.6', 'Thailand', 'Bangkok', '是隆路 - 沙吞', '21/100 South Sathon Road Bangkok Bangkok 10120 泰國 ', '30774857'),
(18, '123456', 'D&D 旅館', 'D&D Inn', '3.0', '4.1', 'Thailand', 'Bangkok', '舊城', '68-70 Khaosan Road, Pranakorn Bangkok 10200 泰國 ', '30774857'),
(19, '123456', '曼谷東方公寓', 'Oriental Residence Bangkok', '5.0', '4.7', 'Thailand', 'Bangkok', '素坤逸路', '110 Wireless Road, Lumpini, Pathumwan Bangkok Bangkok 10330 泰國 ', '30774857'),
(20, '123456', '上海虹橋元一希爾頓酒店', 'Hilton Shanghai Hongqiao', '5.0', '4.2', 'China', 'Shanghai', 'Minhang', 'No.1116 Hong Song East Road Minhang Shanghai 201103 中國', '30774857'),
(21, '123456', '和平飯店', 'Fairmont Peace Hotel', '5.0', '4.7', 'China', 'Shanghai', '黃浦 - 外灘', '20 Nanjing Road East, Huang Pu District Shanghai Shanghai 200002 中國', '30774857'),
(22, '123456', '上海世茂皇家艾美酒店', 'Le Royal Meridien Shanghai', '5.0', '4.3', 'China', 'Shanghai', '黃浦 - 外灘', '789 Nanjing Road East Shanghai Shanghai 200001 中國 ', '30774857'),
(23, '123456', '華亨賓館', 'Jin Jiang Hua Ting Hotel & Towers', '4.0', '3.6', 'China', 'Shanghai', '徐匯', '1200 Cao Xi Bei Road Shanghai Shanghai 200030 中國', '30774857'),
(24, '123456', '上海靜安香格里拉大酒店', 'Jing An Shangri-La, West Shanghai', '4.5', '4.7', 'China', 'Shanghai', '長寧', '1218 Middle Yan''an Road Jing An Kerry Centre, West Nanjing Shanghai Shanghai 200040 中國', '30774857');

-- --------------------------------------------------------

--
-- 資料表結構 `hotelbooking`
--

CREATE TABLE `hotelbooking` (
  `BookingID` int(7) NOT NULL,
  `OrderDate` date NOT NULL,
  `StaffID` varchar(10) NOT NULL,
  `CustID` varchar(4) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `RoomType` varchar(45) NOT NULL,
  `Price` int(11) NOT NULL,
  `RoomNum` int(11) NOT NULL,
  `TotalAmt` int(11) NOT NULL,
  `Checkin` date NOT NULL,
  `Checkout` date NOT NULL,
  `Remark` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `hotelbooking`
--

INSERT INTO `hotelbooking` (`BookingID`, `OrderDate`, `StaffID`, `CustID`, `HotelID`, `RoomType`, `Price`, `RoomNum`, `TotalAmt`, `Checkin`, `Checkout`, `Remark`) VALUES
(3, '2016-07-26', 'fai1', 'C001', 7, '傳統客房', 1, 1, 1, '2016-07-05', '2016-07-27', '1'),
(4, '2016-07-26', 'fai1', 'C002', 19, '套房, 2 間臥室', 4, 2, 3, '2016-07-05', '2016-07-27', '6'),
(5, '2016-07-19', 'fai1', 'C003', 11, '豪華標準客房', 4, 2, 2, '2016-06-28', '2016-07-29', '6'),
(7, '2016-07-11', 'fai1', 'C001', 2, '四人房', 200, 1, 100, '2016-07-11', '2016-07-13', '300');

-- --------------------------------------------------------

--
-- 資料表結構 `room`
--

CREATE TABLE `room` (
  `HotelID` int(11) NOT NULL,
  `RoomType` varchar(45) NOT NULL,
  `NonSmoking` tinyint(1) NOT NULL,
  `RoomNum` int(11) NOT NULL,
  `RoomSize` int(11) NOT NULL,
  `AdultNum` int(11) NOT NULL,
  `ChildNum` int(11) NOT NULL,
  `RoomDesc` varchar(50) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `room`
--

INSERT INTO `room` (`HotelID`, `RoomType`, `NonSmoking`, `RoomNum`, `RoomSize`, `AdultNum`, `ChildNum`, `RoomDesc`, `Price`) VALUES
(1, '君悅客房 - 一大床', 1, 4, 24, 3, 2, '1 張特大雙人床', 2344),
(1, '君悅行政套房 - 一大床', 1, 5, 70, 3, 2, '1 張特大雙人床', 5485),
(1, '君悅豪華客房', 1, 3, 40, 3, 2, '1 張特大雙人床', 2493),
(1, '君悅豪華客房 - 二小床', 1, 4, 40, 3, 2, '2 張單人床', 2493),
(1, '嘉賓軒客房 一大床', 1, 3, 56, 3, 2, '1 張特大雙人床', 3241),
(1, '頂級套房, 1 張特大雙人床', 0, 4, 80, 3, 2, '1 張特大雙人床', 3989),
(1, '頂級標準客房', 1, 5, 36, 3, 2, '2 張單人床', 2344),
(2, 'Metro Room', 1, 4, 30, 2, 2, '1 張雙人床', 1142),
(2, '四人房', 1, 5, 45, 4, 2, '2 張床', 1655),
(2, '套房', 1, 4, 30, 3, 2, '1 張雙人床', 1364),
(2, '高級客房', 1, 5, 30, 3, 2, '1 張雙人床', 948),
(2, '高級雙人房', 1, 5, 30, 3, 2, '2 張單人床', 1007),
(3, '尊爵高級套房', 1, 2, 26, 3, 2, '1 張特大雙人床', 1398),
(3, '尊爵高級雙人單床房', 0, 3, 26, 3, 2, '1 張特大雙人床', 1392),
(3, '標準單人房', 1, 5, 23, 2, 1, '1 張單人床', 991),
(3, '豪華雙人房', 1, 5, 32, 3, 2, '1 張雙人床', 906),
(4, '中房一中床', 1, 4, 34, 3, 2, '1 張加大雙人床', 758),
(4, '標準客房', 1, 4, 35, 3, 2, '1 張特大雙人床', 1646),
(4, '酷景房一中床', 1, 5, 35, 3, 2, '1 張加大雙人床', 971),
(4, '陽台房二單床', 1, 5, 35, 3, 2, '2 張單人床', 1112),
(5, '寰宇客房一大床', 1, 3, 60, 3, 2, '1 張特大雙人床', 2016),
(5, '精緻套房', 1, 4, 60, 3, 2, '1 張特大雙人床', 3747),
(5, '豪華客房一特大床客房', 1, 5, 55, 3, 2, '1 張特大雙人床', 1747),
(5, '高級客房', 1, 5, 45, 3, 2, '1 張特大雙人床', 1635),
(6, '普通套房', 0, 5, 25, 3, 2, '1 張特大雙人床', 1908),
(6, '行政標準客房', 1, 5, 60, 3, 2, '1 張特大雙人床', 1603),
(6, '豪華三人房', 1, 3, 39, 4, 2, '3 張單人床', 1460),
(6, '豪華標準客房', 1, 5, 70, 3, 2, '1 張特大雙人床', 1221),
(6, '豪華雙人房', 0, 5, 30, 3, 2, '2 張單人床', 1259),
(7, '傳統客房', 1, 3, 30, 3, 2, '1 張日式床墊', 724),
(7, '傳統客房 (8 Tatami mat)', 1, 5, 30, 3, 2, '1 張日式床墊', 706),
(8, '傳統客房 (Japanese Style Room)', 1, 5, 60, 6, 2, '4 張日式床墊', 918),
(8, '傳統客房 (Run of the House Japanese Style Room)', 0, 5, 35, 3, 2, '1 張日式床墊', 965),
(9, '普通套房 (B Type)', 0, 5, 50, 3, 2, '2 張單人床', 3175),
(9, '標準小木屋', 1, 5, 70, 6, 2, '4 張床', 3686),
(9, '豪華標準客房 (A Type)', 1, 3, 50, 3, 2, '2 張單人床', 2658),
(9, '豪華標準客房, 轉角', 1, 3, 50, 3, 2, '2 張單人床', 3522),
(10, '雙人房, 1 張雙人床', 1, 5, 16, 2, 1, '1 張雙人床', 680),
(10, '雙人房, 2 張單人床', 1, 5, 22, 3, 1, '2 張單人床', 781),
(11, '標準客房, 露台', 1, 5, 60, 3, 2, '1 張特大雙人床', 4452),
(11, '行政標準客房', 1, 5, 60, 3, 2, '1 張特大雙人床 或 2 張單人床', 3090),
(11, '豪華標準客房', 1, 5, 56, 3, 2, '1 張特大雙人床 或 2 張單人床', 2079),
(11, '開放式客房', 1, 5, 60, 3, 2, '1 張特大雙人床', 2859),
(12, 'Swiss, 行政標準客房', 1, 5, 34, 3, 2, '1 張特大雙人床 或 2 張單人床', 1915),
(12, '標準客房 (Swiss Advantage)', 1, 2, 40, 3, 2, '1 張雙人床或 1 張單人床', 1571),
(12, '經典標準客房', 0, 5, 61, 3, 2, '1 張特大雙人床 或 2 張單人床', 1424),
(12, '頂級標準客房, 1 張特大雙人床', 1, 5, 50, 3, 2, '1 張特大雙人床', 1866),
(13, '公寓, 1 間臥室, 廚房', 1, 5, 43, 3, 2, '1 張加大雙人床', 1328),
(13, '公寓, 2 間臥室, 廚房', 1, 5, 57, 3, 2, '1 張加大雙人床 或 1 張單人床', 1733),
(14, '俱樂部標準客房', 1, 1, 28, 3, 2, '1 張特大雙人床 或 2 張單人床', 2285),
(14, '行政套房, 1 張特大雙人床', 1, 5, 55, 3, 2, '1 張特大雙人床', 2634),
(14, '豪華標準客房', 1, 5, 28, 3, 2, '1 張特大雙人床 或 2 張單人床', 1274),
(14, '高級客房, 海灣景', 0, 5, 32, 3, 2, '1 張特大雙人床', 1182),
(15, 'Caroline Astor Suite, 1 King bed', 0, 5, 90, 3, 2, '1 張特大雙人床', 4732),
(15, 'St. Regis Suite, 1 King Bed', 1, 5, 100, 3, 2, '1 張特大雙人床', 2883),
(15, '豪華標準客房, 1 張特大雙人床', 1, 5, 45, 3, 2, '1 張特大雙人床', 1546),
(15, '頂級標準客房, 1 張特大雙人床', 1, 5, 55, 3, 2, '1 張特大雙人床', 1898),
(16, 'Execuplus Suite, 1 Double or 2 Single Beds', 1, 5, 64, 3, 2, '1 張雙人床 或 2 張單人床', 1137),
(16, '高級單人房', 1, 5, 34, 3, 2, '1 張雙人床 或 2 張單人床', 768),
(16, '高級雙人房', 1, 5, 34, 3, 2, '1 張雙人床 或 2 張單人床', 705),
(17, '套房, 1 間臥室', 0, 5, 59, 3, 2, '1 張特大雙人床', 1281),
(17, '套房, 2 間臥室', 1, 5, 119, 3, 2, '2 張特大雙人床', 2870),
(17, '尊貴標準客房, 1 張特大雙人床', 1, 5, 48, 3, 2, '1 張特大雙人床', 2120),
(17, '豪華標準客房, 1 張特大雙人床', 1, 5, 48, 3, 2, '1 張特大雙人床', 1006),
(18, 'Family with Balcony', 1, 5, 28, 4, 2, '2 張雙人床', 372),
(18, '標準客房, 2 張單人床', 1, 5, 21, 2, 2, '2 張單人床', 196),
(18, '豪華標準客房, 1 張單人床', 1, 5, 19, 1, 1, '1 張單人床', 176),
(18, '豪華標準客房, 1 張雙人床', 1, 5, 23, 2, 1, '1 張雙人床', 244),
(18, '豪華標準客房, 3 張單人床', 1, 5, 26, 4, 2, '3 張單人床', 303),
(19, 'Grand Deluxe', 1, 1, 40, 3, 2, '1 張特大雙人床 或 2 張單人床', 939),
(19, '套房', 1, 5, 120, 3, 2, '1 張特大雙人床及 1 張加大雙人床', 2504),
(19, '套房, 2 間臥室', 1, 5, 120, 3, 2, '1 張特大雙人床及 2 張單人床', 3452),
(20, '一樓客房', 1, 5, 86, 3, 2, '1 張特大雙人床', 3303),
(20, '一特大床客房', 1, 5, 46, 3, 2, '1 張特大雙人床', 1164),
(20, '二單人床客房', 1, 5, 46, 2, 1, '2 張單人床', 1164),
(20, '豪華標準客房', 1, 5, 46, 3, 2, '1 張特大雙人床', 2685),
(21, '一卧室套房', 1, 5, 89, 3, 2, '1 張特大雙人床', 3278),
(21, '特色江景套房', 1, 5, 178, 3, 2, '1 張特大雙人床', 5619),
(21, '費爾蒙房', 1, 5, 49, 3, 2, '1 張特大雙人床 或 2 張加大雙人床', 1873),
(21, '費爾蒙金尊客房', 1, 1, 49, 3, 2, '1 張特大雙人床', 2110),
(22, '帝皇套房', 1, 5, 72, 3, 2, '1 張特大雙人床', 11035),
(22, '皇家套房', 1, 5, 92, 4, 2, '1 張特大雙人床', 48494),
(22, '纯净客房', 1, 5, 38, 3, 2, '1 張特大雙人床', 1341),
(22, '艾美房', 1, 5, 48, 3, 2, '1 張特大雙人床', 1403),
(22, '豪華客房', 1, 5, 38, 3, 2, '1 張特大雙人床 或 2 張單人床', 1153),
(22, '高級豪華房', 1, 5, 38, 3, 2, '1 張特大雙人床 或 2 張單人床', 1278),
(23, '行政標準客房', 1, 5, 30, 3, 2, '1 張特大雙人床 或 2 張單人床', 911),
(23, '行政豪华房', 1, 5, 45, 3, 2, '1 張特大雙人床', 1041),
(23, '豪華大床房', 1, 5, 28, 3, 2, '1 張特大雙人床', 638),
(24, '尊貴套房', 1, 5, 45, 3, 2, '1 張特大雙人床', 5344),
(24, '標準客房', 1, 5, 28, 3, 2, '2 張單人床', 2732),
(24, '豪華套房, 1 張特大雙人床', 1, 5, 45, 3, 2, '1 張特大雙人床', 5344);

-- --------------------------------------------------------

--
-- 資料表結構 `staff`
--

CREATE TABLE `staff` (
  `StaffID` varchar(10) NOT NULL DEFAULT '',
  `Name` varchar(25) NOT NULL,
  `Sex` varchar(1) NOT NULL,
  `Branch` varchar(4) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Post` varchar(25) NOT NULL,
  `Supervisor` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `staff`
--

INSERT INTO `staff` (`StaffID`, `Name`, `Sex`, `Branch`, `Email`, `Password`, `Post`, `Supervisor`) VALUES
('cheong1', 'Lam Sin Cheong', 'M', 'ST02', 'cheong@tt.com', '123456', 'Customer Service Officer', 'on1'),
('fai1', 'Siu Yao Fai', 'M', 'MK01', 'fai@tt.com', '123456', 'Branch Manager', 'fan1'),
('fan1', 'Tang Cheuk Fan', 'M', 'ST01', 'fan@tt.com', '123456', 'CEO', NULL),
('han1', 'Chan Yuen Han', 'F', 'TS01', 'han@tt.com', '123456', 'Customer Service Officer', 'shun1'),
('kam1', 'Yuk Siu Kam', 'F', 'ST01', 'kam@tt.com', '123456', 'Branch Manager', 'fan1'),
('kuen1', 'Leung Siu Kuen', 'M', 'TW01', 'kuen@tt.com', '123456', 'Branch Manager', 'fan1'),
('lung1', 'Kam Hiu Lung', 'M', 'TS01', 'lung@tt.com', '123456', 'Customer Service Officer', 'shun1'),
('ming1', 'Cheung Ming', 'M', 'MK01', 'ming@tt.com', '123456', 'Customer Service Officer', 'fai1'),
('ning1', 'Leung Chin Ning', 'F', 'TW01', 'ning@tt.com', '123456', 'Customer Service Officer', 'kuen1'),
('on1', 'Lam Hin On', 'M', 'ST02', 'on@tt.com', '123456', 'Branch Manager', 'fan1'),
('shun1', 'Chan Tai Shun', 'M', 'TS01', 'shun@tt.com', '123456', 'Branch Manager', 'fan1'),
('tak1', 'Au Siu Tak', 'M', 'MK01', 'tak@tt.com', '123456', 'Customer Service Officer', 'fai1'),
('yum1', 'Chan See Yum', 'F', 'ST01', 'yum@tt.com', '123456', 'Customer Service Officer', 'kam1');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`AirlineCode`);

--
-- 資料表索引 `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustID`);

--
-- 資料表索引 `flightbooking`
--
ALTER TABLE `flightbooking`
  ADD PRIMARY KEY (`BookingID`,`FlightNo`,`DepDateTime`),
  ADD KEY `idx_fb_flightschedule` (`FlightNo`,`DepDateTime`),
  ADD KEY `idx_fb_flightclass` (`FlightNo`,`Class`),
  ADD KEY `idx_fb_StaffID` (`StaffID`),
  ADD KEY `idx_fb_CustID` (`CustID`);

--
-- 資料表索引 `flightclass`
--
ALTER TABLE `flightclass`
  ADD PRIMARY KEY (`FlightNo`,`Class`),
  ADD KEY `idx_flightclass_AirlineCode` (`AirlineCode`);

--
-- 資料表索引 `flightschedule`
--
ALTER TABLE `flightschedule`
  ADD PRIMARY KEY (`FlightNo`,`DepDateTime`),
  ADD KEY `idx_fs_FlightNp` (`FlightNo`);

--
-- 資料表索引 `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`HotelID`),
  ADD UNIQUE KEY `ChiName_unique` (`ChiName`),
  ADD UNIQUE KEY `EngName_unique` (`EngName`);

--
-- 資料表索引 `hotelbooking`
--
ALTER TABLE `hotelbooking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `idx_hb_room` (`HotelID`,`RoomType`),
  ADD KEY `idx_hb_StaffD` (`StaffID`),
  ADD KEY `idx_hb_CustID` (`CustID`);

--
-- 資料表索引 `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`HotelID`,`RoomType`),
  ADD KEY `idx_room_HotelID` (`HotelID`);

--
-- 資料表索引 `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `idx_staff_Supervisor` (`Supervisor`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `flightbooking`
--
ALTER TABLE `flightbooking`
  MODIFY `BookingID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用資料表 AUTO_INCREMENT `hotelbooking`
--
ALTER TABLE `hotelbooking`
  MODIFY `BookingID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `flightbooking`
--
ALTER TABLE `flightbooking`
  ADD CONSTRAINT `fk_fb_customer` FOREIGN KEY (`CustID`) REFERENCES `customer` (`CustID`),
  ADD CONSTRAINT `fk_fb_flightclass` FOREIGN KEY (`FlightNo`,`Class`) REFERENCES `flightclass` (`FlightNo`, `Class`),
  ADD CONSTRAINT `fk_fb_flightschedule` FOREIGN KEY (`FlightNo`,`DepDateTime`) REFERENCES `flightschedule` (`FlightNo`, `DepDateTime`),
  ADD CONSTRAINT `fk_fb_staff` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);

--
-- 資料表的 Constraints `flightclass`
--
ALTER TABLE `flightclass`
  ADD CONSTRAINT `fk_flightclass_AirlineCode` FOREIGN KEY (`AirlineCode`) REFERENCES `airline` (`AirlineCode`);

--
-- 資料表的 Constraints `flightschedule`
--
ALTER TABLE `flightschedule`
  ADD CONSTRAINT `fk_fs_flightclass` FOREIGN KEY (`FlightNo`) REFERENCES `flightclass` (`FlightNo`);

--
-- 資料表的 Constraints `hotelbooking`
--
ALTER TABLE `hotelbooking`
  ADD CONSTRAINT `fk_hb_CustID` FOREIGN KEY (`CustID`) REFERENCES `customer` (`CustID`),
  ADD CONSTRAINT `fk_hb_StaffID` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`),
  ADD CONSTRAINT `fk_hb_room` FOREIGN KEY (`HotelID`,`RoomType`) REFERENCES `room` (`HotelID`, `RoomType`);

--
-- 資料表的 Constraints `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `fk_room_HotelID` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`);

--
-- 資料表的 Constraints `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_staff_StaffID` FOREIGN KEY (`Supervisor`) REFERENCES `staff` (`StaffID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

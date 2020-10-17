-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 17, 2020 at 06:53 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gdoordb`
--
CREATE DATABASE IF NOT EXISTS `gdoordb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gdoordb`;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bcatid` smallint(6) NOT NULL,
  `brndname` varchar(80) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`bid`, `bcatid`, `brndname`) VALUES
(1, 1, 'Amaar'),
(2, 1, 'Clopay'),
(3, 1, 'Premier'),
(4, 2, 'Carisol'),
(5, 3, 'Carisol'),
(6, 4, 'Carisol'),
(7, 5, 'Carisol'),
(8, 6, 'LiftMaster'),
(9, 7, 'Carisol'),
(10, 8, 'Carisol');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `catname`) VALUES
(1, 'Garage door and window'),
(2, 'Garage Door Storm Resistance'),
(3, 'Garage Door Weather Strip'),
(4, 'Garage Door Lock'),
(5, 'Garage Door Handle'),
(6, 'Garage Door Opener'),
(7, 'Installation kit'),
(8, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE IF NOT EXISTS `colors` (
  `clid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `ccid` mediumint(9) NOT NULL,
  `color` varchar(30) NOT NULL,
  `cname` varchar(20) NOT NULL,
  PRIMARY KEY (`clid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`clid`, `ccid`, `color`, `cname`) VALUES
(1, 1, 'E6E3D6', 'Surfmist');

-- --------------------------------------------------------

--
-- Table structure for table `customcolor`
--

CREATE TABLE IF NOT EXISTS `customcolor` (
  `ccid` smallint(6) NOT NULL AUTO_INCREMENT,
  `width` tinyint(4) NOT NULL,
  `custcolprice` decimal(10,0) NOT NULL,
  `custcoltax` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ccid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `customcolor`
--

INSERT INTO `customcolor` (`ccid`, `width`, `custcolprice`, `custcoltax`) VALUES
(1, 10, '2700', '15'),
(2, 11, '2700', '15'),
(3, 12, '2700', '15'),
(4, 13, '2700', '15'),
(5, 14, '2700', '15'),
(6, 15, '3600', '15'),
(7, 16, '3600', '15'),
(8, 17, '3600', '15'),
(9, 18, '3600', '15'),
(10, 19, '3600', '15'),
(11, 20, '3600', '15');

-- --------------------------------------------------------

--
-- Table structure for table `cutomerdetails`
--

CREATE TABLE IF NOT EXISTS `cutomerdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gdodrid` bigint(20) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `add1` varchar(60) NOT NULL,
  `add2` varchar(60) NOT NULL,
  `country` varchar(40) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cutomerdetails`
--

INSERT INTO `cutomerdetails` (`id`, `gdodrid`, `fname`, `lname`, `phone`, `email`, `add1`, `add2`, `country`, `state`, `city`) VALUES
(1, 1, 'Felix', 'peter', '9442401258', 'felixpeter72@gmail.com', '1st street', 'kovil street', 'Jamaica', 'Clarendon', 'pudukottai'),
(2, 2, 'Felix', 'peter', '9442401258', 'felixpeter72@gmail.com', '1st street', 'kovil street', 'Australia', 'Australian Capital Territory', 'pudukottai');

-- --------------------------------------------------------

--
-- Table structure for table `delivaddress`
--

CREATE TABLE IF NOT EXISTS `delivaddress` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gdodrid` bigint(20) NOT NULL,
  `fname` varchar(40) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `add1` varchar(60) NOT NULL,
  `add2` varchar(60) NOT NULL,
  `country` varchar(30) NOT NULL,
  `state` varchar(40) NOT NULL,
  `city` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `delivaddress`
--

INSERT INTO `delivaddress` (`id`, `gdodrid`, `fname`, `lname`, `phone`, `email`, `add1`, `add2`, `country`, `state`, `city`) VALUES
(1, 1, 'Felix', 'peter', '9442401258', 'felixpeter72@gmail.com', '1st street', 'kovil street', 'Jamaica', 'Clarendon', 'pudukottai'),
(2, 2, 'Felix', 'peter', '9442401258', 'felixpeter72@gmail.com', '1st street', 'kovil street', 'Australia', 'Australian Capital Territory', 'pudukottai');

-- --------------------------------------------------------

--
-- Table structure for table `gdooraccessories`
--

CREATE TABLE IF NOT EXISTS `gdooraccessories` (
  `acid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cid` mediumint(5) NOT NULL,
  `accessoriesname` varchar(100) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`acid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gdooraccessories`
--

INSERT INTO `gdooraccessories` (`acid`, `cid`, `accessoriesname`, `price`) VALUES
(1, 1, 'Garage Door Dexion (Installation Kit) ', 1000),
(2, 1, 'Garage Door (Rawl Bolts) Installation Kit', 500),
(3, 1, 'Garage Door (Adhesive) Installation Kit ', 900);

-- --------------------------------------------------------

--
-- Table structure for table `gdoororder`
--

CREATE TABLE IF NOT EXISTS `gdoororder` (
  `odrid` bigint(20) NOT NULL AUTO_INCREMENT,
  `odrdate` date NOT NULL,
  `totalamount` double NOT NULL,
  `paidstatus` varchar(15) NOT NULL,
  `custwind` tinyint(4) NOT NULL,
  `custqty` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`odrid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `gdoororder`
--

INSERT INTO `gdoororder` (`odrid`, `odrdate`, `totalamount`, `paidstatus`, `custwind`, `custqty`, `status`) VALUES
(1, '2020-10-16', 45000, 'Pending', 1, 0, 0),
(2, '2020-10-16', 45000, 'Pending', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `glasstype`
--

CREATE TABLE IF NOT EXISTS `glasstype` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `glstypename` varchar(34) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `glasstype`
--

INSERT INTO `glasstype` (`gid`, `glstypename`) VALUES
(1, 'Clear'),
(2, 'Mirror'),
(3, 'Obscured'),
(4, 'Tint');

-- --------------------------------------------------------

--
-- Table structure for table `odrproducts`
--

CREATE TABLE IF NOT EXISTS `odrproducts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `odrid` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `windid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `odrproducts`
--

INSERT INTO `odrproducts` (`id`, `odrid`, `pid`, `windid`) VALUES
(1, 2, 1, 1),
(2, 2, 19, 0),
(3, 2, 22, 0),
(4, 2, 26, 0),
(5, 2, 28, 0),
(6, 2, 36, 0),
(7, 2, 48, 0),
(8, 2, 49, 0),
(9, 2, 50, 0),
(10, 2, 51, 0),
(11, 2, 52, 0);

-- --------------------------------------------------------

--
-- Table structure for table `productentry`
--

CREATE TABLE IF NOT EXISTS `productentry` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pcode` varchar(15) NOT NULL,
  `pname` varchar(150) NOT NULL,
  `catid` tinyint(4) NOT NULL,
  `typeid` smallint(6) NOT NULL,
  `width` tinyint(4) NOT NULL,
  `height` tinyint(4) NOT NULL,
  `colrid` smallint(6) NOT NULL,
  `brndid` smallint(6) NOT NULL,
  `qty` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `colorprice` double NOT NULL,
  `tax` double NOT NULL,
  `installprice` double NOT NULL,
  `warranty` varchar(14) NOT NULL,
  `pic` varchar(200) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `productentry`
--

INSERT INTO `productentry` (`pid`, `pcode`, `pname`, `catid`, `typeid`, `width`, `height`, `colrid`, `brndid`, `qty`, `price`, `colorprice`, `tax`, `installprice`, `warranty`, `pic`) VALUES
(1, 'GD001', '4 rises garage door Amaar', 1, 1, 10, 7, 1, 1, 0, 66376.4086956522, 600, 15, 2000, '5 years', 'proimgs/2020_09_26_17_09_39_4 rise gdoor surfmist E6E3D6.jpg'),
(2, 'GD002', '4 rises garage door Amaar', 1, 1, 10, 8, 1, 1, 0, 78450, 500, 15, 2500, '5 years', 'proimgs/2020_09_27_09_35_48_4 rise gdoor surfmist E6E3D6.jpg'),
(3, 'GD003', '4 rises garage door Amaar no window', 1, 1, 10, 9, 1, 1, 0, 108585.14, 500, 15, 800, '5 years', 'proimgs/2020_09_27_09_36_42_4 rise gdoor surfmist E6E3D61.jpg'),
(4, 'GD004', '5 rises garage door Amaar no window', 1, 1, 12, 7, 1, 1, 0, 78505.78, 0, 15, 4000, '5 years', 'proimgs/2020_09_27_09_41_33_Garage door 5 Surfmist E6E3D6.jpg'),
(5, 'GD004', '5 rises garage door Amaar no window', 1, 1, 12, 8, 1, 1, 0, 96453.93, 0, 15, 3500, '5 years', 'proimgs/2020_09_27_09_42_37_Garage door 5 Surfmist E6E3D6.jpg'),
(6, 'GD005', '5 rises garage door Amaar no window', 1, 1, 12, 9, 1, 1, 0, 147296, 0, 15, 3000, '5 years', 'proimgs/2020_09_27_09_43_35_Garage door 5 Surfmist E6E3D61.jpg'),
(7, 'GD005', '6 rises garage door Amaar no window', 1, 1, 14, 7, 1, 1, 0, 102934.73, 0, 15, 4500, '5 years', 'proimgs/2020_09_27_09_46_13_Garage door 6 SurfmistE6E3D6.jpg'),
(8, 'GD006', '6 rises garage door Amaar no window', 1, 1, 14, 8, 1, 1, 0, 123897.808, 0, 15, 5500, '5 years', 'proimgs/2020_09_27_09_46_57_Garage door 6 SurfmistE6E3D6.jpg'),
(9, 'GD007', '6 rises garage door Amaar no window', 1, 1, 14, 9, 1, 1, 0, 163833.243, 0, 15, 5000, '5 years', 'proimgs/2020_09_27_09_47_50_Garage door 6 SurfmistE6E3D61.jpg'),
(10, 'GD008', '7 rises garage door Amaar no window', 1, 1, 16, 7, 1, 1, 0, 112377.973, 0, 15, 7500, '5 years', 'proimgs/2020_09_27_09_49_47_Garage door 7 Surfmist E6E3D6.jpg'),
(11, 'GD009', '7 rises garage door Amaar no window', 1, 1, 16, 8, 1, 1, 0, 129923.086, 0, 15, 8000, '5 years', 'proimgs/2020_09_27_09_50_39_Garage door 7 Surfmist E6E3D6.jpg'),
(12, 'GD0010', '7 rises garage door Amaar no window', 1, 1, 16, 9, 1, 1, 0, 130567.08, 0, 15, 7000, '5 years', 'proimgs/2020_09_27_09_51_38_Garage door 7 Surfmist E6E3D61.jpg'),
(13, 'GD0011', '8 rises garage door Amaar no window', 1, 1, 18, 7, 1, 1, 0, 127972.443, 0, 15, 9000, '5 years', 'proimgs/2020_09_27_09_52_45_Garage door 8 Surfmist E6E3D6.jpg'),
(14, 'GD0012', '8 rises garage door Amaar no window', 1, 1, 18, 8, 1, 1, 0, 151413.113, 0, 15, 8500, '5 years', 'proimgs/2020_09_27_09_54_14_Garage door 8 Surfmist E6E3D6.jpg'),
(15, 'GD0013', '8 rises garage door Amaar no window', 1, 1, 18, 9, 1, 1, 0, 222347.973, 0, 15, 6500, '5 years', 'proimgs/2020_09_27_09_54_59_Garage door 8 Surfmist E6E3D61.jpg'),
(16, 'GD0014', '9 rises garage door Amaar no window', 1, 1, 20, 7, 1, 1, 0, 193345.452, 0, 15, 7000, '5 years', 'proimgs/2020_09_27_09_57_06_Garage door 9 Surfmist E6E3D6.jpg'),
(17, 'GD0015', '9 rises garage door Amaar no window', 1, 1, 20, 8, 1, 1, 0, 216285.121, 0, 15, 7000, '5 years', 'proimgs/2020_09_27_09_57_55_Garage door 9 Surfmist E6E3D6.jpg'),
(18, 'GD0016', '9 rises garage door Amaar no window', 1, 1, 20, 9, 1, 1, 0, 218285.121, 0, 15, 9000, '5 years', 'proimgs/2020_09_27_09_58_41_Garage door 9 Surfmist E6E3D61.jpg'),
(19, 'GD0045', 'Garage Door Storm Resistance Regular (No B races)', 2, 4, 10, 7, 0, 4, 0, 0, 0, 15, 0, '5 years', 'proimgs/2020_09_29_09_30_00_0 gd resistance.jpg'),
(20, 'GD0046', 'Garage Door Storm Resistance Tropical Storm Winds (2 Braces)', 2, 5, 10, 7, 0, 4, 0, 8000, 0, 15, 900, '5 years', 'proimgs/2020_09_29_09_32_16_2 gd resistance.jpg'),
(21, 'GD0046', 'Garage Door Storm Resistance Hurricane Storm Winds (4 Braces)', 2, 14, 10, 7, 0, 4, 0, 16000, 0, 15, 1800, '5 years', 'proimgs/2020_09_29_09_33_22_4 gd resistance.jpg'),
(22, 'GD0098', 'Garage Door Weather Strip 14ft', 3, 6, 10, 7, 0, 5, 0, 2800, 0, 15, 500, '2 years', 'proimgs/2020_09_30_06_56_11_beige-masonite-door-seals-76590-64_1000.jpg'),
(23, 'GD0099', 'Garage Door Weather Strip 24ft', 3, 7, 10, 7, 0, 5, 0, 4800, 0, 15, 250, '2 years', 'proimgs/2020_09_30_06_58_17_beige-masonite-door-seals-76590-64_1000.jpg'),
(24, 'GD0099', 'Garage Door Weather Strip 16ft', 3, 6, 10, 8, 0, 5, 0, 3200, 0, 15, 800, '2 years', 'proimgs/2020_09_30_07_23_07_beige-masonite-door-seals-76590-64_1000.jpg'),
(25, 'GD0040', 'Garage Door Weather Strip 26ft', 3, 7, 10, 8, 0, 5, 0, 5200, 0, 15, 850, '2 years', 'proimgs/2020_09_30_07_25_38_beige-masonite-door-seals-76590-64_1000.jpg'),
(26, 'GD0027', 'Garage Door Lock Interior Side', 4, 8, 0, 0, 0, 6, 0, 2000, 0, 15, 250, '2 years', 'proimgs/2020_09_30_09_14_13_gdoor inside lock pair.jpg'),
(27, 'GD0028', 'Garage Door Lock Exterior Center Keyed', 4, 9, 0, 0, 0, 6, 0, 1500, 0, 15, 200, '4 years', 'proimgs/2020_09_30_09_15_28_gdoor outside lock single.jpg'),
(28, 'GD0023', 'Garage door hangle Inside and outside (pair)', 5, 10, 0, 0, 0, 7, 0, 1200, 0, 15, 120, '5 years', 'proimgs/2020_09_30_10_07_16_door handle inside pair.jpg'),
(29, 'GD0023', 'Garage door hangle Inside', 5, 11, 0, 0, 0, 7, 0, 600, 0, 15, 50, '5 years', 'proimgs/2020_09_30_10_08_02_Door Handle Inside.jpg'),
(36, 'GD0065', 'Garage Door Opener 8550W 7ft Rail ceiling mount ( Visor remote )', 6, 12, 0, 7, 0, 8, 0, 63295.939, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_11_56_50_Liftmaster ceiling mount visor remote.jpg'),
(37, 'GD0067', 'Garage Door Opener 8550W 8ft Rail ceiling mount ( Visor remote )', 6, 12, 0, 8, 0, 8, 0, 68934.617, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_11_57_51_Liftmaster ceiling mount visor remote.jpg'),
(38, 'GD0069', 'Garage Door Opener 8550W 10ft Rail ceiling mount ( Visor remote )', 6, 12, 0, 10, 0, 8, 0, 75598.513, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_12_00_09_Liftmaster ceiling mount visor remote.jpg'),
(39, 'GD0069', 'Garage Door Opener 8550W 7ft Rail ceiling mount ( Wireless keypad )', 6, 12, 0, 7, 0, 8, 0, 63295.939, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_12_04_41_Liftmaster ceilling mount wireless key.jpg'),
(40, 'GD0076', 'Garage Door Opener 8550W 8ft Rail ceiling mount ( Wireless keypad )', 6, 12, 0, 8, 0, 8, 0, 68934.617, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_12_06_17_Liftmaster ceilling mount wireless key.jpg'),
(41, 'GD0076', 'Garage Door Opener 8550W 10ft Rail ceiling mount ( Wireless keypad )', 6, 12, 0, 10, 0, 8, 0, 75598.513, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_12_07_08_Liftmaster ceilling mount wireless key.jpg'),
(42, 'GD0076', 'Garage Door Opener 8550W 7ft Rail wall mount ( Visor remote )', 6, 13, 0, 7, 0, 8, 0, 63295.939, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_12_08_24_Liftmaster wall mount with visor remote.jpg'),
(43, 'GD0076', 'Garage Door Opener 8550W 8ft Rail wall mount ( Visor remote )', 6, 13, 0, 8, 0, 8, 0, 68934.617, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_12_09_51_Liftmaster wall mount with visor remote.jpg'),
(44, 'GD0076', 'Garage Door Opener 8550W 10ft Rail wall mount ( Visor remote )', 6, 13, 0, 10, 0, 8, 0, 75598.513, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_12_10_41_Liftmaster wall mount with visor remote.jpg'),
(45, 'GD0012', 'Garage Door Opener 8550W 7ft Rail wall mount ( Wireless keypad )', 6, 13, 0, 7, 0, 8, 0, 63295.939, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_12_12_06_LiftMaster  wall mount Wireless keypad.jpg'),
(46, 'GD0013', 'Garage Door Opener 8550W 8ft Rail wall mount ( Wireless keypad )', 6, 13, 0, 8, 0, 8, 0, 68934.617, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_12_13_07_LiftMaster  wall mount Wireless keypad.jpg'),
(47, 'GD0014', 'Garage Door Opener 8550W 10ft Rail wall mount ( Wireless keypad )', 6, 13, 0, 10, 0, 8, 0, 75598.513, 0, 15, 2000, '5 years', 'proimgs/2020_09_30_12_14_05_LiftMaster  wall mount Wireless keypad.jpg'),
(48, 'GD0091', 'Garage door dexion', 7, 15, 0, 0, 0, 9, 0, 3058.36, 0, 15, 0, '5 years', 'proimgs/2020_10_13_09_27_38_dexion.jpg'),
(49, 'GD0012', 'M8 Rawl Bolts - 5/16', 7, 16, 0, 0, 0, 9, 0, 343.4, 0, 15, 0, '5 years', 'proimgs/2020_10_13_10_14_03_rawl bolts.jpg'),
(50, 'GD0089', '5/16 inch Fastenal Bolts - 18', 7, 16, 0, 0, 0, 9, 0, 272.44, 0, 15, 0, '5 years', 'proimgs/2020_10_13_10_23_34_bolts.jpg'),
(51, 'GD0089', '5/16 inch Fastenal Nuts - 18', 7, 16, 0, 0, 0, 9, 0, 185.48, 0, 15, 0, '5 years', 'proimgs/2020_10_13_10_24_45_nuts.jpg'),
(52, 'GD0089', 'Plastic Adhesive - 3M', 7, 17, 0, 0, 0, 9, 0, 1876, 0, 15, 0, '5 years', 'proimgs/2020_10_13_10_25_57_Plastic adhesive.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `tid` smallint(6) NOT NULL AUTO_INCREMENT,
  `ctid` smallint(6) NOT NULL,
  `typename` varchar(80) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`tid`, `ctid`, `typename`) VALUES
(1, 1, 'Non padded'),
(2, 1, 'Padded'),
(4, 2, 'Regular'),
(5, 2, 'Tropical Storm Winds'),
(6, 3, 'Sides Only'),
(7, 3, 'Sides and Top'),
(8, 4, 'Interior Side Locks (Pair)'),
(9, 4, 'Exterior Center Keyed Lock'),
(10, 5, 'Inside and Outside'),
(11, 5, 'Inside'),
(12, 6, 'Ceiling Mounted'),
(13, 6, 'Wall Mounted'),
(14, 2, 'Hurricane Storm Winds'),
(15, 7, 'Slotted Metal'),
(16, 7, '5/16 inch'),
(17, 7, '3M');

-- --------------------------------------------------------

--
-- Table structure for table `windentry`
--

CREATE TABLE IF NOT EXISTS `windentry` (
  `wsid` smallint(6) NOT NULL AUTO_INCREMENT,
  `typeid` smallint(6) NOT NULL,
  `glstypid` smallint(6) NOT NULL,
  `windprice` double NOT NULL,
  `glassprice` double NOT NULL,
  `tax` tinyint(4) NOT NULL,
  `instprice` double NOT NULL,
  `pic` varchar(800) NOT NULL,
  PRIMARY KEY (`wsid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `windentry`
--

INSERT INTO `windentry` (`wsid`, `typeid`, `glstypid`, `windprice`, `glassprice`, `tax`, `instprice`, `pic`) VALUES
(1, 1, 3, 2000, 500, 15, 200, 'windlist/2020_10_13_18_48_49_Clear glass copy.jpg'),
(2, 2, 3, 2100, 500, 15, 200, 'windlist/2020_10_13_18_49_13_casecade copy.jpg'),
(3, 3, 3, 2500, 500, 15, 200, 'windlist/2020_10_13_18_49_31_Cathedrel thickblue clear copy.jpg'),
(4, 4, 3, 2200, 500, 15, 200, 'windlist/2020_10_13_18_49_49_Waterford copy.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `windowsentry`
--

CREATE TABLE IF NOT EXISTS `windowsentry` (
  `wid` bigint(20) NOT NULL AUTO_INCREMENT,
  `did` bigint(20) NOT NULL,
  `wintypeid` smallint(6) NOT NULL,
  `windplsid` tinyint(4) NOT NULL,
  `windprice` double NOT NULL,
  `glasstypeid` smallint(6) NOT NULL,
  `glassprice` double NOT NULL,
  `wintax` tinyint(4) NOT NULL,
  `installprice` double NOT NULL,
  `windpic` varchar(500) NOT NULL,
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `windowsentry`
--

INSERT INTO `windowsentry` (`wid`, `did`, `wintypeid`, `windplsid`, `windprice`, `glasstypeid`, `glassprice`, `wintax`, `installprice`, `windpic`) VALUES
(1, 1, 1, 1, 5500, 3, 500, 15, 800, 'proimgs/2020_09_28_11_47_46_4 rise gdoor surfmist E6E3D6 plain.jpg'),
(2, 1, 1, 2, 5500, 3, 500, 15, 800, 'proimgs/2020_09_28_16_43_00_4 rise gdoor surfmist E6E3D6 plain second.jpg'),
(3, 1, 1, 3, 5500, 3, 500, 15, 800, 'proimgs/2020_09_28_16_43_40_4 rise gdoor surfmist E6E3D6 plain left.jpg'),
(4, 1, 1, 4, 5500, 3, 500, 15, 800, 'proimgs/2020_09_28_16_44_06_4 rise gdoor surfmist E6E3D6 plain right.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `windowstype`
--

CREATE TABLE IF NOT EXISTS `windowstype` (
  `wtid` int(11) NOT NULL AUTO_INCREMENT,
  `windtypname` varchar(34) NOT NULL,
  PRIMARY KEY (`wtid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `windowstype`
--

INSERT INTO `windowstype` (`wtid`, `windtypname`) VALUES
(1, 'Plain'),
(2, 'Casecade'),
(3, 'Cathedral'),
(4, 'Waterford'),
(5, 'Wagon Wheel'),
(6, 'Sunset');

-- --------------------------------------------------------

--
-- Table structure for table `windplace`
--

CREATE TABLE IF NOT EXISTS `windplace` (
  `wpid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `wplace` varchar(40) NOT NULL,
  PRIMARY KEY (`wpid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `windplace`
--

INSERT INTO `windplace` (`wpid`, `wplace`) VALUES
(1, 'Top'),
(2, 'Second row'),
(3, 'Left'),
(4, 'Right');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ebill`
--
DROP DATABASE `ebill`;
CREATE DATABASE IF NOT EXISTS `ebill` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ebill`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(14) NOT NULL PRIMARY KEY,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE admin AUTO_INCREMENT=99999999999990;

-- --------------------------------------------------------


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(14) NOT NULL PRIMARY KEY,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` int(14) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE user AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `id` int(14) NOT NULL PRIMARY KEY,
  `aid` int(14) NOT NULL,
  `uid` int(14) NOT NULL,
  `units` decimal(10,2) NOT NULL,
  `amount` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `bdate` date NOT NULL,
  `ddate` date NOT NULL,
  FOREIGN KEY (aid) REFERENCES admin(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (uid) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE bill AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(14) NOT NULL PRIMARY KEY,
  `bid` int(14) NOT NULL ,
  `payable` int(10) NOT NULL,
  `date` timestamp NOT NULL,
  `status` varchar(10) NOT NULL,
  -- FOREIGN KEY (status) REFERENCES bill(status) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (bid) REFERENCES bill(id) ON DELETE CASCADE ON UPDATE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE transaction AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
CREATE TABLE IF NOT EXISTS `complaint` (
  `id` int(14) NOT NULL PRIMARY KEY,
  `uid` int(14) NOT NULL,
  `aid` int(14) NOT NULL,
  `complaint` varchar(140) NOT NULL,
  `status` varchar(10) NOT NULL,
  FOREIGN KEY (aid) REFERENCES admin(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (uid) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE complaint AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `unitsRate`
--

DROP TABLE IF EXISTS `unitsRate`;
CREATE TABLE IF NOT EXISTS `unitsRate` (
  `200` int(14) NOT NULL,
  `500` int(14) NOT NULL,
  `100` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ecab
--

CREATE DATABASE IF NOT EXISTS ecab;
USE ecab;

--
-- Definition of table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings` (
  `BookingId` int(10) unsigned NOT NULL auto_increment,
  `UserId` varchar(45) NOT NULL,
  `TravelDate` date NOT NULL,
  `Source` varchar(45) NOT NULL,
  `Destination` varchar(45) NOT NULL,
  `VehicleNumber` varchar(45) NOT NULL,
  `TotalFare` varchar(45) NOT NULL,
  `BookingDate` date NOT NULL,
  PRIMARY KEY  (`BookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` (`BookingId`,`UserId`,`TravelDate`,`Source`,`Destination`,`VehicleNumber`,`TotalFare`,`BookingDate`) VALUES 
 (1,'alok','2015-05-15','Dehradun','New Delhi','UA-05-1876','3580','2015-05-07'),
 (2,'alok','2015-05-21','Dehradun','Meerut','UA-02-9784','2584','2015-05-07'),
 (3,'alok','2015-05-22','Dehradun','Mussorrie','UA-08-3487','1704.5','2015-05-07'),
 (4,'alok','2015-05-20','Dehradun','Haridwar','UA-07-2021','1615','2015-05-12'),
 (5,'alok','2015-06-04','Dehradun','Meerut','UA-07-2021','2476','2015-05-12'),
 (6,'alok','2015-06-25','Dehradun','New Delhi','UA-07-2021','3296','2015-05-14');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;


--
-- Definition of table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `VehicleNumber` varchar(40) NOT NULL,
  `VehicleType` varchar(45) NOT NULL,
  `Model` varchar(45) NOT NULL,
  `SeatingCapacity` int(10) unsigned NOT NULL,
  `AC` int(10) unsigned NOT NULL,
  `MusicSystem` int(10) unsigned NOT NULL,
  `FixedCharge` double NOT NULL,
  `Fare` double NOT NULL,
  `Photo` varchar(100) NOT NULL,
  PRIMARY KEY  (`VehicleNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` (`VehicleNumber`,`VehicleType`,`Model`,`SeatingCapacity`,`AC`,`MusicSystem`,`FixedCharge`,`Fare`,`Photo`) VALUES 
 ('UA-02-9784','Sedan','Accord',5,1,1,1100,8.8,'photos/UA-02-9784.jpg'),
 ('UA-05-1876','Sedan','SX-4',4,1,1,1200,8.5,'photos/UA-05-1876.jpg'),
 ('UA-06-5659','Sedan','Etios',5,1,1,1300,8.9,'photos/UA-06-5659.jpg'),
 ('UA-07-2021','Sedan','Indigo',5,1,1,1000,8.2,'photos/UA-07-2021.jpg'),
 ('UA-07-8186','Small','Alto',5,1,1,800,7.6,'photos/UA-07-8186.jpg'),
 ('UA-08-3487','Small','Indica',5,1,1,1400,8.7,'photos/UA-08-3487.jpg'),
 ('UK-04-9874','Sedan','Innova',7,1,1,1600,8.8,'photos/UK-04-9874.jpg'),
 ('UK-06-3929','Small','Wagon-R',5,1,1,800,7.5,'photos/UK-06-3929.jpg'),
 ('UK-08-9723','SUV','Sumo',10,1,1,1700,8.5,'photos/UK-08-9723.jpg'),
 ('UK07-AB-1234','SUV','Scorpio',7,1,1,1000,8.5,'photos/UK07-AB-1234.jpg'),
 ('UP-07-4387','Small','Ritz',5,1,1,950,7.9,'photos/UP-07-4387.jpg'),
 ('UP06-AC-4567','SUV','Duster',7,1,1,1500,8.5,'photos/UP06-AC-4567.jpg');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;


--
-- Definition of table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `LocationId` int(11) NOT NULL auto_increment,
  `Source` varchar(40) NOT NULL,
  `Destination` varchar(45) NOT NULL,
  `Distance` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`LocationId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`LocationId`,`Source`,`Destination`,`Distance`) VALUES 
 (1,'Dehradun','Haridwar',75),
 (2,'Dehradun','Meerut',180),
 (3,'Dehradun','Mussorrie',35),
 (4,'Dehradun','New Delhi',280),
 (5,'Haridwar','Rishikesh',40),
 (6,'Haridwar','Roorkee',35);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `UserId` varchar(40) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `RoleName` varchar(45) NOT NULL,
  `SecretQuestion` varchar(100) NOT NULL,
  `Answer` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `City` varchar(40) NOT NULL,
  `MobileNumber` varchar(45) NOT NULL,
  `CreditCard` varchar(20) NOT NULL,
  PRIMARY KEY  (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`UserId`,`Password`,`RoleName`,`SecretQuestion`,`Answer`,`Name`,`Email`,`Address`,`City`,`MobileNumber`,`CreditCard`) VALUES 
 ('alok','abc123','Member','Favourite Color','red','Alok Bisht','ndhagarra@gmail.com','H.No. - 334-F, Lane No 13, Mohit Nagar','Dehradun','9319056587','4354-2332-4565-6767'),
 ('nagendra','abc123','Admin','Favourite Color','Red','Nagendra Dhagarra','ndhagarra@gmail.com','H.NO 31, Panchsheel Park,  Chakrata Road','Dehradun','9319056587','6333-4455-5666-6888');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

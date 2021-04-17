-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Apr 2021 um 14:33
-- Server-Version: 10.4.18-MariaDB
-- PHP-Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr9_famazon_natalia`
--
CREATE DATABASE IF NOT EXISTS `cr9_famazon_natalia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr9_famazon_natalia`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buy`
--

DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy` (
  `buy_ID` varchar(50) NOT NULL,
  `fk_product_id` int(10) UNSIGNED NOT NULL,
  `fk_customer_id` int(10) UNSIGNED NOT NULL,
  `DateOfBuy` datetime DEFAULT NULL,
  `FinalSum` smallint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `buy`
--

INSERT INTO `buy` (`buy_ID`, `fk_product_id`, `fk_customer_id`, `DateOfBuy`, `FinalSum`) VALUES
('1001', 6, 9272, '2021-04-20 11:11:19', 45),
('1002', 6, 9272, '2021-04-22 18:01:00', 45),
('1003', 1, 8202, '2013-04-02 15:40:00', 188),
('1004', 8, 11726, '2021-04-12 01:01:00', 81),
('1005', 5, 8202, '2013-04-05 11:15:00', 108),
('1006', 1, 8202, '2013-04-05 11:20:00', 99);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `count_succesful_payments`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `count_succesful_payments`;
CREATE TABLE `count_succesful_payments` (
`no_of_buys` bigint(21)
,`no_of_products` bigint(21)
,`no_of_total_sells` bigint(21)
,`no_of_successful_payments` bigint(21)
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `creates_invoice_for`
--

DROP TABLE IF EXISTS `creates_invoice_for`;
CREATE TABLE `creates_invoice_for` (
  `creates_invoice_ID` varchar(50) NOT NULL,
  `fk_payment_id` int(20) UNSIGNED NOT NULL,
  `fk_customer_id` int(10) UNSIGNED NOT NULL,
  `fk_payment_form_id` varchar(50) DEFAULT NULL,
  `InvoiceID` int(10) DEFAULT NULL,
  `InvoiceDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `creates_invoice_for`
--

INSERT INTO `creates_invoice_for` (`creates_invoice_ID`, `fk_payment_id`, `fk_customer_id`, `fk_payment_form_id`, `InvoiceID`, `InvoiceDate`) VALUES
('invoice-111-1002-9272', 111, 9272, 'DirectDebit-9272-01', 111, '2021-04-22'),
('invoice-222-1005-8202', 222, 8202, 'PayPal-8202-01', 222, '2013-04-05'),
('invoice-333-1003-8202', 333, 8202, 'PayPal-8202-01', 333, '2013-04-02'),
('invoice-333-1003-9272', 333, 8202, 'PayPal-8202-01', 333, '2013-04-02'),
('invoice-444-1001-9272', 444, 9272, 'PayPal-9272-01', 444, '2021-04-20'),
('invoice-555-1006-8202', 555, 8202, 'DirectDebit-8202-01', 555, '2013-04-05'),
('invoice-666-1004-11726', 666, 11726, 'CreditCard-11726-01', 666, '2021-04-12');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `CustomerID` int(10) UNSIGNED NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `Username` varchar(60) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customers`
--

INSERT INTO `customers` (`CustomerID`, `FirstName`, `LastName`, `Address`, `Username`, `Email`) VALUES
(8202, 'Adelind', 'Bevan', '8 Schurz Court', 'abevan3', 'abevan3@foxnews.com'),
(9272, 'Diego', 'Gemmell', '84751 Bashford Parkway', 'dgemmell8', 'dgemmell8@eepurl.com'),
(10482, 'Percy', 'Synder', '63 Kenwood Place', 'psynder9', 'psynder9@liveinternet.ru'),
(11726, 'Lura', 'Tezure', '76740 Kings Avenue', 'ltezurea', 'ltezurea@4shared.com'),
(12811, 'Hilarius', 'Bowerman', '1366 Holmberg Lane', 'hbowermanb', 'hbowermanb@t-online.de'),
(13337, 'Sloan', 'Allday', '6 Eastlawn Pass', 'sallday5', 'sallday5@phpbb.com'),
(22137, 'Gabby', 'Waterman', '15 Morning Road', 'gwatermand', 'gwatermand@topsy.com'),
(48329, 'Keith', 'Joannet', '71473 Stang Court', 'kjoanne', 'kjoannet2@deliciousdays.c'),
(72094, 'Waylon', 'Balkwill', '37162 Esch Avenue', 'wbalkwill', 'wbalkwill1@illinois.edu'),
(81713, 'Quintilla', 'Esom', '8 Kropf Pass', 'qesomc', 'qesomc@blog.com'),
(82738, 'Thomasa', 'Edwards', '15133 Division Street', 'tedwards0', 'tedwards0@who.int'),
(83748, 'Constantine', 'Vanyashkin', '5086 Sundown Road', 'cvanyashkin6', 'cvanyashkin6@wufoo.com'),
(92749, 'Bernelle', 'Greenhill', '9 Maple Point', 'bgreenhill7', 'bgreenhill7@hexun.com');

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `customers_no_searches`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `customers_no_searches`;
CREATE TABLE `customers_no_searches` (
`SearchID` varchar(50)
,`CustomerID` int(10) unsigned
,`FirstName` varchar(50)
,`LastName` varchar(50)
,`SearchDate` datetime
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `customers_purchased_on_which_day`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `customers_purchased_on_which_day`;
CREATE TABLE `customers_purchased_on_which_day` (
`CustomerID` int(10) unsigned
,`FirstName` varchar(50)
,`LastName` varchar(50)
,`ProductName` varchar(20)
,`DateOfBuy` datetime
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `customers_searching_products_per_date_&_product`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `customers_searching_products_per_date_&_product`;
CREATE TABLE `customers_searching_products_per_date_&_product` (
`SearchID` varchar(50)
,`ProductName` varchar(20)
,`CustomerID` int(10) unsigned
,`FirstName` varchar(50)
,`LastName` varchar(50)
,`SearchDate` datetime
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `customers_shipping_per_delivery_company`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `customers_shipping_per_delivery_company`;
CREATE TABLE `customers_shipping_per_delivery_company` (
`CustomerID` int(10) unsigned
,`Number_of_times` bigint(21)
,`ShippingCompanyName` varchar(30)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `customers_without_purchase`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `customers_without_purchase`;
CREATE TABLE `customers_without_purchase` (
`CustomerID` int(10) unsigned
,`FirstName` varchar(50)
,`LastName` varchar(50)
,`DateOfBuy` datetime
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivers_products_to`
--

DROP TABLE IF EXISTS `delivers_products_to`;
CREATE TABLE `delivers_products_to` (
  `delivers_products_to_ID` varchar(40) NOT NULL,
  `fk_shipping_company_id` int(10) UNSIGNED NOT NULL,
  `fk_customer_id` int(10) UNSIGNED NOT NULL,
  `DeliveryLink` varchar(50) DEFAULT NULL,
  `DeliveryDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `delivers_products_to`
--

INSERT INTO `delivers_products_to` (`delivers_products_to_ID`, `fk_shipping_company_id`, `fk_customer_id`, `DeliveryLink`, `DeliveryDate`) VALUES
('161f:36f6:d464:3449:494:edef:e2dc:fee0', 123456, 8202, 'http://tracking-now-161f:36f6:d464:3449:494:edef:e', '2013-04-05 00:00:00'),
('8d0d:7d0d:3d89:1645:c2e8:ca1d:c1be:342f', 490849, 8202, 'http://tracking-now-8d0d:7d0d:3d89:1645:c2e8:ca1d:', '2013-04-25 00:00:00'),
('e1e7:6f11:cef:85c6:b41f:a424:a1b9:6a86', 123456, 8202, 'http://tracking-now-e1e7:6f11:cef:85c6:b41f:a424:a', '2013-04-15 00:00:00'),
('e430:1c5:d75f:52e4:1724:4e82:f487:dbc5', 298765, 9272, 'http://tracking-now-e430:1c5:d75f:52e4:1724:4e82:f', '2021-04-25 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `famazon_contact`
--

DROP TABLE IF EXISTS `famazon_contact`;
CREATE TABLE `famazon_contact` (
  `FamazonContactID` varchar(10) NOT NULL,
  `FamazonName` varchar(50) DEFAULT NULL,
  `FamazonAddress` varchar(50) DEFAULT NULL,
  `FamazonEmail` varchar(20) DEFAULT NULL,
  `FamazonPhone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `famazon_contact`
--

INSERT INTO `famazon_contact` (`FamazonContactID`, `FamazonName`, `FamazonAddress`, `FamazonEmail`, `FamazonPhone`) VALUES
('famazon-1', 'Famazon Corporation', 'Famazon Street 1, Famazon City, Famazonia', 'info@famazon.com', '0123456789');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gives_to_delivery`
--

DROP TABLE IF EXISTS `gives_to_delivery`;
CREATE TABLE `gives_to_delivery` (
  `gives_to_delivery_ID` int(20) UNSIGNED NOT NULL,
  `fk_supplier_id` int(11) UNSIGNED NOT NULL,
  `fk_shipping_company_id` int(10) UNSIGNED NOT NULL,
  `ParcelWeight` smallint(4) DEFAULT NULL,
  `ParcelDimensions` smallint(4) DEFAULT NULL,
  `ParcelUniqueCode` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `gives_to_delivery`
--

INSERT INTO `gives_to_delivery` (`gives_to_delivery_ID`, `fk_supplier_id`, `fk_shipping_company_id`, `ParcelWeight`, `ParcelDimensions`, `ParcelUniqueCode`) VALUES
(1, 530125831, 123456, 3, 10, 4728937),
(2, 53629586, 490849, 13, 1, 289084),
(3, 53629586, 123456, 1, 10, 1372830),
(4, 750925946, 298765, 5, 11, 7544745);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `how_many_customers_received_parcel`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `how_many_customers_received_parcel`;
CREATE TABLE `how_many_customers_received_parcel` (
`COUNT(*)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `list_products_offered_by_suppplier`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `list_products_offered_by_suppplier`;
CREATE TABLE `list_products_offered_by_suppplier` (
`ProductID` int(10) unsigned
,`SupplierID` int(11) unsigned
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `list_products_offered_by_suppplier_by_name`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `list_products_offered_by_suppplier_by_name`;
CREATE TABLE `list_products_offered_by_suppplier_by_name` (
`ProductName` varchar(20)
,`SupplierID` int(11) unsigned
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `no_products_paid`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `no_products_paid`;
CREATE TABLE `no_products_paid` (
`no_of_products_paid` bigint(21)
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `PaymentID` int(20) UNSIGNED NOT NULL,
  `fk_payment_form_id` varchar(50) DEFAULT NULL,
  `fk_buy_id` varchar(50) DEFAULT NULL,
  `DateOfPayment` date DEFAULT NULL,
  `TimeOfPayment` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`PaymentID`, `fk_payment_form_id`, `fk_buy_id`, `DateOfPayment`, `TimeOfPayment`) VALUES
(111, 'DirectDebit-9272-01', '1002', NULL, NULL),
(222, 'PayPal-8202-01', '1005', '2013-04-05', '11:18:00'),
(333, 'PayPal-8202-01', '1003', '2013-04-02', '15:43:00'),
(444, 'PayPal-9272-01', '1001', '2021-04-22', '18:03:20'),
(555, 'DirectDebit-8202-01', '1006', '2013-04-05', '11:20:00'),
(666, 'CreditCard-11726-01', '1004', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment_form`
--

DROP TABLE IF EXISTS `payment_form`;
CREATE TABLE `payment_form` (
  `PaymentFormID` varchar(50) NOT NULL,
  `FormPayment` varchar(20) DEFAULT NULL,
  `PaymentInstitutionName` varchar(20) DEFAULT NULL,
  `fk_customer_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `payment_form`
--

INSERT INTO `payment_form` (`PaymentFormID`, `FormPayment`, `PaymentInstitutionName`, `fk_customer_id`) VALUES
('CreditCard-10482-01', 'CreditCard', 'Erste Bank', 10482),
('CreditCard-11726-01', 'CreditCard', 'American Express', 11726),
('CreditCard-13337-01', 'CreditCard', 'Erste Bank', 13337),
('CreditCard-22137-01', 'CreditCard', 'American Express', 22137),
('CreditCard-48329-01', 'CreditCard', 'Erste Bank', 48329),
('CreditCard-81713-01', 'CreditCard', 'Erste Bank', 81713),
('CreditCard-92749-01', 'CreditCard', 'Erste Bank', 92749),
('CreditCard-92749-02', 'CreditCard', 'Bank Austria', 92749),
('DirectDebit-10482-01', 'Direct Debit', 'Erste Bank', 10482),
('DirectDebit-8202-01', 'Direct Debit', 'Bank Austria', 8202),
('DirectDebit-82738-01', 'Direct Debit', 'Bank Austria', 82738),
('DirectDebit-82738-02', 'Direct Debit', 'ING Bank', 82738),
('DirectDebit-82738-03', 'Direct Debit', 'Bank Austria', 82738),
('DirectDebit-9272-01', 'Direct Debit', 'ING Bank', 9272),
('PayPal-10482-01', 'PayPal', 'PayPal Corp.', 10482),
('PayPal-12811-01', 'PayPal', 'PayPal Corp.', 12811),
('PayPal-48329-01', 'PayPal', 'PayPal Corp.', 48329),
('PayPal-72094-01', 'PayPal', 'PayPal Corp.', 72094),
('PayPal-8202-01', 'PayPal', 'PayPal Corp', 8202),
('PayPal-83748-01', 'PayPal', 'PayPal Corp.', 83748),
('PayPal-9272-01', 'PayPal', 'PayPal Corp.', 9272);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `ProductID` int(10) UNSIGNED NOT NULL,
  `ProductName` varchar(20) DEFAULT NULL,
  `ProductDescr` varchar(50) DEFAULT NULL,
  `ProductPhoto` varchar(60) DEFAULT NULL,
  `EAN` bigint(20) DEFAULT NULL,
  `ProductPrice` smallint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `ProductDescr`, `ProductPhoto`, `EAN`, `ProductPrice`) VALUES
(1, 'Tomatoes Tear D', 'aord about the ', 'http://dummyimage.com/134x100.png/5fa2dd/ffffff', 571824092, 99),
(2, 'Pork - Bacon,ba', 'Cord about the ', 'http://dummyimage.com/201x100.png/5fa2dd/ffffff', 822687631, 7),
(3, 'Plasticknivesbl', 'nord about the ', 'http://dummyimage.com/202x100.png/ff4444/ffffff', 101977522, 79),
(4, 'Cut Wakame - Ha', 'tord about the ', 'http://dummyimage.com/226x100.png/5fa2dd/ffffff', 257093976, 44),
(5, 'Chocolate - Chi', 'Oord about the ', 'http://dummyimage.com/107x100.png/5fa2dd/ffffff', 285272353, 27),
(6, 'Bread - Rolls, ', 'mord about the ', 'http://dummyimage.com/141x100.png/dddddd/000000', 604882647, 45),
(7, 'Lentils - Green', 'Mord about the ', 'http://dummyimage.com/161x100.png/ff4444/ffffff', 938386323, 16),
(8, 'Oil - Macadamia', 'Hord about the ', 'http://dummyimage.com/179x100.png/ff4444/ffffff', 311367833, 81),
(9, 'Cheese - Goat W', 'Cord about the ', 'http://dummyimage.com/212x100.png/cc0000/ffffff', 502792393, 35),
(10, 'True - Vue Cont', 'uord about the ', 'http://dummyimage.com/190x100.png/cc0000/ffffff', 98927325, 91);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `products_bought`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `products_bought`;
CREATE TABLE `products_bought` (
`ProductID` int(10) unsigned
,`ProductName` varchar(20)
,`DateOfBuy` datetime
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `searches`
--

DROP TABLE IF EXISTS `searches`;
CREATE TABLE `searches` (
  `SearchID` varchar(50) NOT NULL,
  `fk_product_id` int(10) UNSIGNED NOT NULL,
  `fk_customer_id` int(10) UNSIGNED NOT NULL,
  `SearchDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `searches`
--

INSERT INTO `searches` (`SearchID`, `fk_product_id`, `fk_customer_id`, `SearchDate`) VALUES
('25a9:6406:f5:fbfd:f30e:6357:9496:acbess', 10, 9272, '2021-04-20 10:10:05'),
('36872:dmkald:8282:mc:dadaa:d2bf:888:nan', 6, 9272, '2021-04-20 11:11:19'),
('704b:a600:54e7:13df:f352:9742:f682:a9da', 6, 83748, '2017-06-15 23:19:00'),
('7282:dklamd:87d:mdk:48jd:dma2:82:mklsa1', 1, 8202, '2013-04-02 10:39:32'),
('85ff:8589:551d:4700:6d48:d2bf:2c87:fccc', 5, 8202, '2013-04-05 11:10:42'),
('a219:6547:8dcb:b2a:1c57:894b:d754:810e', 2, 10482, '2020-07-08 16:40:00'),
('asjdklam:8589:551d:4700:6d48:d2bf:dfccc', 6, 8202, '2018-04-01 16:40:11'),
('d426:4e83:a4d2:87b8:f6de:3c8a:3056:ec52', 8, 11726, '2021-04-12 00:40:18'),
('d493:c1c8:e74e:1666:11df:67f1:6842:8222', 1, 8202, '2020-12-08 01:40:25');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sells`
--

DROP TABLE IF EXISTS `sells`;
CREATE TABLE `sells` (
  `sells_ID` varchar(50) NOT NULL,
  `fk_product_id` int(10) UNSIGNED NOT NULL,
  `fk_supplier_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sells`
--

INSERT INTO `sells` (`sells_ID`, `fk_product_id`, `fk_supplier_id`) VALUES
('DCR-Plastiknivesbl', 3, 53629586),
('DCR-Tomatoes', 1, 53629586),
('EGH-Pork', 2, 328769020),
('HZ-Chocolate', 5, 530125831),
('HZ-CutWakame', 4, 530125831),
('KG-BreadRolls', 6, 750925946),
('PRL-LentilsGreen', 7, 32843208),
('WUH-Cheese-Goat', 9, 890932270),
('WUH-OliMacadamia', 8, 890932270),
('WUH-TrueVueCont', 10, 890932270);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shipping_company`
--

DROP TABLE IF EXISTS `shipping_company`;
CREATE TABLE `shipping_company` (
  `ShippingCompanyID` int(10) UNSIGNED NOT NULL,
  `ShippingCompanyName` varchar(30) DEFAULT NULL,
  `ShippingCompanyAddress` varchar(30) DEFAULT NULL,
  `ShippingCompanyEmail` varchar(30) DEFAULT NULL,
  `ShippingCompanyPhone` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `shipping_company`
--

INSERT INTO `shipping_company` (`ShippingCompanyID`, `ShippingCompanyName`, `ShippingCompanyAddress`, `ShippingCompanyEmail`, `ShippingCompanyPhone`) VALUES
(123456, 'Famazon Delivery', 'Famazon Street 1, Famazon City', 'delivery@famazon.com', 123456789),
(298765, 'DHL', 'Am Euro Platz 2, Euro Plaza 4,', 'info@dhl.com', 2147483647),
(490849, 'Österreichische Post', ' Löwengasse 22, 1030 Wien', 'info@post.at', 53534836);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `successful`
--

DROP TABLE IF EXISTS `successful`;
CREATE TABLE `successful` (
  `successful_ID` varchar(20) NOT NULL,
  `fk_payment_id` int(20) UNSIGNED NOT NULL,
  `fk_supplier_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `successful`
--

INSERT INTO `successful` (`successful_ID`, `fk_payment_id`, `fk_supplier_id`) VALUES
('222-530125831-201304', 222, 530125831),
('333-53629586-2013040', 333, 53629586),
('444-750925946-202104', 444, 750925946),
('555-53629586-2013040', 555, 53629586);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `SupplierID` int(11) UNSIGNED NOT NULL,
  `SupplierName` varchar(50) DEFAULT NULL,
  `SupplierAddress` varchar(50) DEFAULT NULL,
  `SupplierEmail` varchar(20) DEFAULT NULL,
  `SupplierPhone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierName`, `SupplierAddress`, `SupplierEmail`, `SupplierPhone`) VALUES
(32843208, 'Prosacco, Rau and Lang', '9 Hanover Alley', 'icapponeer1@sfgate.c', '4771505627'),
(53629586, 'Daniel, Carter and Ryan', '70 Melody Center', 'jkell4@blogspot.com', NULL),
(328769020, 'Erdman, Gibson and Hodkiewicz', '0135 Riverside Circle', 'csampey2@tuttocitta.', NULL),
(530125831, 'Heathcote Zboncak', '3 Blackbird Trail', 'aschulz0@msu.edu', '8004118192'),
(750925946, 'Kiehn Group', '56681 American Point', 'slearmouth5@biblegat', '6296356255'),
(890932270, 'Wilkinson, Ullrich and Hills', '76 Rutledge Parkway', NULL, '3088197749'),
(930451209, 'Graham, Hagenes and Rowe', '56 Everett Road', NULL, '7647070649');

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `unpaid_invoices`
-- (Siehe unten für die tatsächliche Ansicht)
--
DROP VIEW IF EXISTS `unpaid_invoices`;
CREATE TABLE `unpaid_invoices` (
`PaymentID` int(20) unsigned
,`fk_payment_form_id` varchar(50)
,`fk_buy_id` varchar(50)
,`DateOfPayment` date
,`TimeOfPayment` time
);

-- --------------------------------------------------------

--
-- Struktur des Views `count_succesful_payments`
--
DROP TABLE IF EXISTS `count_succesful_payments`;

DROP VIEW IF EXISTS `count_succesful_payments`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `count_succesful_payments`  AS SELECT (select count(0) from `buy`) AS `no_of_buys`, (select count(0) from `products`) AS `no_of_products`, (select count(0) from `sells`) AS `no_of_total_sells`, (select count(0) from `successful`) AS `no_of_successful_payments` ;

-- --------------------------------------------------------

--
-- Struktur des Views `customers_no_searches`
--
DROP TABLE IF EXISTS `customers_no_searches`;

DROP VIEW IF EXISTS `customers_no_searches`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customers_no_searches`  AS SELECT `searches`.`SearchID` AS `SearchID`, `customers`.`CustomerID` AS `CustomerID`, `customers`.`FirstName` AS `FirstName`, `customers`.`LastName` AS `LastName`, `searches`.`SearchDate` AS `SearchDate` FROM (`customers` left join `searches` on(`searches`.`fk_customer_id` = `customers`.`CustomerID`)) WHERE `searches`.`SearchDate` is null ;

-- --------------------------------------------------------

--
-- Struktur des Views `customers_purchased_on_which_day`
--
DROP TABLE IF EXISTS `customers_purchased_on_which_day`;

DROP VIEW IF EXISTS `customers_purchased_on_which_day`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customers_purchased_on_which_day`  AS SELECT `customers`.`CustomerID` AS `CustomerID`, `customers`.`FirstName` AS `FirstName`, `customers`.`LastName` AS `LastName`, `products`.`ProductName` AS `ProductName`, `buy`.`DateOfBuy` AS `DateOfBuy` FROM ((`buy` join `customers` on(`buy`.`fk_customer_id` = `customers`.`CustomerID`)) join `products` on(`buy`.`fk_product_id` = `products`.`ProductID`)) ;

-- --------------------------------------------------------

--
-- Struktur des Views `customers_searching_products_per_date_&_product`
--
DROP TABLE IF EXISTS `customers_searching_products_per_date_&_product`;

DROP VIEW IF EXISTS `customers_searching_products_per_date_&_product`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customers_searching_products_per_date_&_product`  AS SELECT `searches`.`SearchID` AS `SearchID`, `products`.`ProductName` AS `ProductName`, `customers`.`CustomerID` AS `CustomerID`, `customers`.`FirstName` AS `FirstName`, `customers`.`LastName` AS `LastName`, `searches`.`SearchDate` AS `SearchDate` FROM ((`products` join `searches` on(`searches`.`fk_product_id` = `products`.`ProductID`)) join `customers` on(`searches`.`fk_customer_id` = `customers`.`CustomerID`)) WHERE `searches`.`SearchDate` >= '2020-06-01' AND `searches`.`SearchDate` <= curdate() ;

-- --------------------------------------------------------

--
-- Struktur des Views `customers_shipping_per_delivery_company`
--
DROP TABLE IF EXISTS `customers_shipping_per_delivery_company`;

DROP VIEW IF EXISTS `customers_shipping_per_delivery_company`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customers_shipping_per_delivery_company`  AS SELECT `customers`.`CustomerID` AS `CustomerID`, count(`delivers_products_to`.`fk_customer_id`) AS `Number_of_times`, `shipping_company`.`ShippingCompanyName` AS `ShippingCompanyName` FROM ((`delivers_products_to` join `customers` on(`delivers_products_to`.`fk_customer_id` = `customers`.`CustomerID`)) join `shipping_company` on(`delivers_products_to`.`fk_shipping_company_id` = `shipping_company`.`ShippingCompanyID`)) GROUP BY `delivers_products_to`.`fk_shipping_company_id` ;

-- --------------------------------------------------------

--
-- Struktur des Views `customers_without_purchase`
--
DROP TABLE IF EXISTS `customers_without_purchase`;

DROP VIEW IF EXISTS `customers_without_purchase`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customers_without_purchase`  AS SELECT `customers`.`CustomerID` AS `CustomerID`, `customers`.`FirstName` AS `FirstName`, `customers`.`LastName` AS `LastName`, `buy`.`DateOfBuy` AS `DateOfBuy` FROM (`customers` left join `buy` on(`buy`.`fk_customer_id` = `customers`.`CustomerID`)) ;

-- --------------------------------------------------------

--
-- Struktur des Views `how_many_customers_received_parcel`
--
DROP TABLE IF EXISTS `how_many_customers_received_parcel`;

DROP VIEW IF EXISTS `how_many_customers_received_parcel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `how_many_customers_received_parcel`  AS SELECT count(0) AS `COUNT(*)` FROM `delivers_products_to` ;

-- --------------------------------------------------------

--
-- Struktur des Views `list_products_offered_by_suppplier`
--
DROP TABLE IF EXISTS `list_products_offered_by_suppplier`;

DROP VIEW IF EXISTS `list_products_offered_by_suppplier`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_products_offered_by_suppplier`  AS SELECT `products`.`ProductID` AS `ProductID`, `supplier`.`SupplierID` AS `SupplierID` FROM ((`sells` join `products` on(`sells`.`fk_product_id` = `products`.`ProductID`)) join `supplier` on(`sells`.`fk_supplier_id` = `supplier`.`SupplierID`)) ;

-- --------------------------------------------------------

--
-- Struktur des Views `list_products_offered_by_suppplier_by_name`
--
DROP TABLE IF EXISTS `list_products_offered_by_suppplier_by_name`;

DROP VIEW IF EXISTS `list_products_offered_by_suppplier_by_name`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_products_offered_by_suppplier_by_name`  AS SELECT `products`.`ProductName` AS `ProductName`, `supplier`.`SupplierID` AS `SupplierID` FROM ((`sells` join `products` on(`sells`.`fk_product_id` = `products`.`ProductID`)) join `supplier` on(`sells`.`fk_supplier_id` = `supplier`.`SupplierID`)) ;

-- --------------------------------------------------------

--
-- Struktur des Views `no_products_paid`
--
DROP TABLE IF EXISTS `no_products_paid`;

DROP VIEW IF EXISTS `no_products_paid`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `no_products_paid`  AS SELECT count(`payment`.`PaymentID`) AS `no_of_products_paid` FROM `payment` WHERE `payment`.`DateOfPayment` is not null ;

-- --------------------------------------------------------

--
-- Struktur des Views `products_bought`
--
DROP TABLE IF EXISTS `products_bought`;

DROP VIEW IF EXISTS `products_bought`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_bought`  AS SELECT `products`.`ProductID` AS `ProductID`, `products`.`ProductName` AS `ProductName`, `buy`.`DateOfBuy` AS `DateOfBuy` FROM (`buy` join `products` on(`buy`.`fk_product_id` = `products`.`ProductID`)) WHERE `buy`.`DateOfBuy` is not null ;

-- --------------------------------------------------------

--
-- Struktur des Views `unpaid_invoices`
--
DROP TABLE IF EXISTS `unpaid_invoices`;

DROP VIEW IF EXISTS `unpaid_invoices`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `unpaid_invoices`  AS SELECT `payment`.`PaymentID` AS `PaymentID`, `payment`.`fk_payment_form_id` AS `fk_payment_form_id`, `payment`.`fk_buy_id` AS `fk_buy_id`, `payment`.`DateOfPayment` AS `DateOfPayment`, `payment`.`TimeOfPayment` AS `TimeOfPayment` FROM `payment` WHERE `payment`.`DateOfPayment` is null ;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`buy_ID`),
  ADD KEY `fk_product_id` (`fk_product_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `creates_invoice_for`
--
ALTER TABLE `creates_invoice_for`
  ADD PRIMARY KEY (`creates_invoice_ID`),
  ADD KEY `creates_invoice_for_ibfk_1` (`fk_payment_id`),
  ADD KEY `creates_invoice_for_ibfk_2` (`fk_customer_id`),
  ADD KEY `creates_invoice_for_ibfk_3` (`fk_payment_form_id`);

--
-- Indizes für die Tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indizes für die Tabelle `delivers_products_to`
--
ALTER TABLE `delivers_products_to`
  ADD PRIMARY KEY (`delivers_products_to_ID`),
  ADD KEY `fk_shipping_company_id` (`fk_shipping_company_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `famazon_contact`
--
ALTER TABLE `famazon_contact`
  ADD PRIMARY KEY (`FamazonContactID`);

--
-- Indizes für die Tabelle `gives_to_delivery`
--
ALTER TABLE `gives_to_delivery`
  ADD PRIMARY KEY (`gives_to_delivery_ID`),
  ADD KEY `fk_supplier_id` (`fk_supplier_id`),
  ADD KEY `fk_shipping_company_id` (`fk_shipping_company_id`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `fk_payment_form_id` (`fk_payment_form_id`),
  ADD KEY `fk_buy_id` (`fk_buy_id`);

--
-- Indizes für die Tabelle `payment_form`
--
ALTER TABLE `payment_form`
  ADD PRIMARY KEY (`PaymentFormID`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indizes für die Tabelle `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`SearchID`),
  ADD KEY `fk_product_id` (`fk_product_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`sells_ID`),
  ADD KEY `fk_supplier_id` (`fk_supplier_id`),
  ADD KEY `bfk_product_id` (`fk_product_id`);

--
-- Indizes für die Tabelle `shipping_company`
--
ALTER TABLE `shipping_company`
  ADD PRIMARY KEY (`ShippingCompanyID`);

--
-- Indizes für die Tabelle `successful`
--
ALTER TABLE `successful`
  ADD PRIMARY KEY (`successful_ID`),
  ADD KEY `fk_payment_id` (`fk_payment_id`),
  ADD KEY `fk_supplier_id` (`fk_supplier_id`);

--
-- Indizes für die Tabelle `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92751;

--
-- AUTO_INCREMENT für Tabelle `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4294967297;

--
-- AUTO_INCREMENT für Tabelle `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `shipping_company`
--
ALTER TABLE `shipping_company`
  MODIFY `ShippingCompanyID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=490850;

--
-- AUTO_INCREMENT für Tabelle `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=930451210;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`ProductID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`CustomerID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `creates_invoice_for`
--
ALTER TABLE `creates_invoice_for`
  ADD CONSTRAINT `creates_invoice_for_ibfk_1` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`PaymentID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `creates_invoice_for_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`CustomerID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `creates_invoice_for_ibfk_3` FOREIGN KEY (`fk_payment_form_id`) REFERENCES `payment_form` (`PaymentFormID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `delivers_products_to`
--
ALTER TABLE `delivers_products_to`
  ADD CONSTRAINT `delivers_products_to_ibfk_1` FOREIGN KEY (`fk_shipping_company_id`) REFERENCES `shipping_company` (`ShippingCompanyID`),
  ADD CONSTRAINT `delivers_products_to_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints der Tabelle `gives_to_delivery`
--
ALTER TABLE `gives_to_delivery`
  ADD CONSTRAINT `gives_to_delivery_ibfk_1` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier` (`SupplierID`),
  ADD CONSTRAINT `gives_to_delivery_ibfk_2` FOREIGN KEY (`fk_shipping_company_id`) REFERENCES `shipping_company` (`ShippingCompanyID`);

--
-- Constraints der Tabelle `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_payment_form_id`) REFERENCES `payment_form` (`PaymentFormID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`fk_buy_id`) REFERENCES `buy` (`buy_ID`);

--
-- Constraints der Tabelle `payment_form`
--
ALTER TABLE `payment_form`
  ADD CONSTRAINT `payment_form_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints der Tabelle `searches`
--
ALTER TABLE `searches`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`CustomerID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`ProductID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `sells`
--
ALTER TABLE `sells`
  ADD CONSTRAINT `bfk_product_id` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`ProductID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_supplier_id` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier` (`SupplierID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `successful`
--
ALTER TABLE `successful`
  ADD CONSTRAINT `successful_ibfk_1` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`PaymentID`),
  ADD CONSTRAINT `successful_ibfk_2` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier` (`SupplierID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

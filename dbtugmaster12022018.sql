-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 02, 2018 at 10:31 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtugmaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_13_040127_create_job_orders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblattachments`
--

DROP TABLE IF EXISTS `tblattachments`;
CREATE TABLE IF NOT EXISTS `tblattachments` (
  `intAttachmentsID` int(11) NOT NULL AUTO_INCREMENT,
  `strAttachmentsDesc` varchar(45) DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intAttachmentsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblbalance`
--

DROP TABLE IF EXISTS `tblbalance`;
CREATE TABLE IF NOT EXISTS `tblbalance` (
  `intBalanceID` int(11) NOT NULL,
  `fltBalance` float NOT NULL DEFAULT '0',
  `dtUpdateBalance` date DEFAULT NULL,
  PRIMARY KEY (`intBalanceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tblbarge`
--

DROP TABLE IF EXISTS `tblbarge`;
CREATE TABLE IF NOT EXISTS `tblbarge` (
  `intBargeID` int(11) NOT NULL AUTO_INCREMENT,
  `intBGoodsID` int(11) DEFAULT NULL,
  `strBargeName` varchar(45) DEFAULT NULL,
  `fltBargeWeight` float DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intBargeID`),
  KEY `fk_tblBarge_tblGoods1_idx` (`intBGoodsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblberth`
--

DROP TABLE IF EXISTS `tblberth`;
CREATE TABLE IF NOT EXISTS `tblberth` (
  `intBerthID` int(11) NOT NULL AUTO_INCREMENT,
  `intBPierID` int(11) DEFAULT NULL,
  `strBerthName` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `boolDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intBerthID`),
  UNIQUE KEY `intBPierID` (`intBPierID`,`strBerthName`),
  KEY `fk_tblBerth_tblPier1_idx` (`intBPierID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblberth`
--

INSERT INTO `tblberth` (`intBerthID`, `intBPierID`, `strBerthName`, `isActive`, `boolDeleted`) VALUES
(1, 1, 'Berth 3', 1, 0),
(2, 1, 'Berth 4', 1, 0),
(3, 3, 'Berth 1', 1, 0),
(4, 2, 'Berth 2', 1, 0),
(5, 4, 'Berth 5', 1, 0),
(6, 3, 'Berth 6', 1, 0),
(7, 6, 'Berth 7', 1, 0),
(8, 3, 'Berth 84', 1, 0),
(9, 2, 'Berth 100', 1, 1),
(10, 10, 'Berth 3', 1, 0),
(11, 1, 'Berth 5', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblberthhistory`
--

DROP TABLE IF EXISTS `tblberthhistory`;
CREATE TABLE IF NOT EXISTS `tblberthhistory` (
  `intBerthHistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `strBHBerthName` varchar(45) DEFAULT NULL,
  `intBHBerthID` int(11) DEFAULT NULL,
  `intBHPierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intBerthHistoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblbill`
--

DROP TABLE IF EXISTS `tblbill`;
CREATE TABLE IF NOT EXISTS `tblbill` (
  `intBillID` int(11) NOT NULL AUTO_INCREMENT,
  `strSignature` text,
  `enumStatus` enum('Pending','Accepted','Rejected','Processing') NOT NULL,
  `boolDeleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intBillID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbill`
--

INSERT INTO `tblbill` (`intBillID`, `strSignature`, `enumStatus`, `boolDeleted`) VALUES
(1, NULL, 'Pending', 0),
(2, NULL, 'Accepted', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcharges`
--

DROP TABLE IF EXISTS `tblcharges`;
CREATE TABLE IF NOT EXISTS `tblcharges` (
  `intChargeID` int(11) NOT NULL AUTO_INCREMENT,
  `fltJOAmount` float DEFAULT '0',
  `fltTugboatDelayFee` float DEFAULT '0',
  `fltConsigneeViolationFee` float DEFAULT '0',
  `fltConsigneeLateFee` float DEFAULT '0',
  `fltConsigneeDamageFee` float DEFAULT '0',
  `fltCompanyDamageFee` float DEFAULT '0',
  `fltCompanyViolationFee` float DEFAULT '0',
  `intDiscount` int(11) NOT NULL,
  PRIMARY KEY (`intChargeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcharges`
--

INSERT INTO `tblcharges` (`intChargeID`, `fltJOAmount`, `fltTugboatDelayFee`, `fltConsigneeViolationFee`, `fltConsigneeLateFee`, `fltConsigneeDamageFee`, `fltCompanyDamageFee`, `fltCompanyViolationFee`, `intDiscount`) VALUES
(1, 66000, 2000, NULL, 0, 3000, NULL, NULL, 20),
(2, 1000, 0, NULL, 0, NULL, NULL, NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tblcheque`
--

DROP TABLE IF EXISTS `tblcheque`;
CREATE TABLE IF NOT EXISTS `tblcheque` (
  `intChequeID` int(11) NOT NULL AUTO_INCREMENT,
  `intCBillID` int(11) DEFAULT NULL,
  `dtPayment` date DEFAULT NULL,
  `intABANum` int(11) DEFAULT NULL,
  `intAmount` int(11) DEFAULT NULL,
  `strMemo` varchar(11) DEFAULT NULL,
  `intRouteNum` int(11) DEFAULT NULL,
  `intAccountNum` int(11) DEFAULT NULL,
  `boolDeleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`intChequeID`),
  KEY `fk_tblcheque_tblbill` (`intCBillID`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcheque`
--

INSERT INTO `tblcheque` (`intChequeID`, `intCBillID`, `dtPayment`, `intABANum`, `intAmount`, `strMemo`, `intRouteNum`, `intAccountNum`, `boolDeleted`) VALUES
(213, 2, '2018-10-30', NULL, 1000, '123wq', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcompany`
--

DROP TABLE IF EXISTS `tblcompany`;
CREATE TABLE IF NOT EXISTS `tblcompany` (
  `intCompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `intCGoodsID` int(11) DEFAULT NULL,
  `intCPostBillingTicketID` int(11) DEFAULT NULL,
  `strCompanyName` varchar(45) DEFAULT NULL,
  `strCompanyAddress` text,
  `strCompanyEmail` varchar(45) DEFAULT NULL,
  `strCompanyContactPNum` varchar(13) DEFAULT NULL,
  `strCompanyContactTNum` varchar(9) DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  `strCompanyPermit` text,
  `strCompanyPicture` text,
  PRIMARY KEY (`intCompanyID`),
  KEY `fk_tblCompany_tblGoods1_idx` (`intCGoodsID`),
  KEY `fk_tblCompany_tblPostBillingTicket1_idx` (`intCPostBillingTicketID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcompany`
--

INSERT INTO `tblcompany` (`intCompanyID`, `intCGoodsID`, `intCPostBillingTicketID`, `strCompanyName`, `strCompanyAddress`, `strCompanyEmail`, `strCompanyContactPNum`, `strCompanyContactTNum`, `boolDeleted`, `strCompanyPermit`, `strCompanyPicture`) VALUES
(1, NULL, NULL, 'Hi Energy Marine Services INC.', 'Rm. 306 Velco Centre cr Sr. Oca & Delgado Sts., South Harbor, Port Area, Manila', 'hienergymarineservices@gmail.com', NULL, NULL, 0, NULL, NULL),
(2, NULL, NULL, 'Tugmaster & Barge Pool Inc.', '115 RM 202 J LUNA ST, BINONDO, Manila, Metro Manila,', 'tugmaster@gmail.com', NULL, NULL, 0, NULL, NULL),
(3, NULL, NULL, 'Black Pink', 'Pandacan, Manila', 'blackpinkyg@gmail.com', NULL, NULL, 0, NULL, NULL),
(4, NULL, NULL, 'TWICE JYPE', 'Seoul South Korea', 'twicejype@gmail.com', NULL, NULL, 0, NULL, NULL),
(5, NULL, NULL, 'TWICE JYPE', 'Seoul South Korea', 'twicesujype@gmail.com', NULL, NULL, 0, NULL, NULL),
(6, NULL, NULL, 'Isaac Tailoring Shop', 'Pureza, Manila', 'isaac@gmail.com', NULL, NULL, 0, NULL, NULL),
(7, NULL, NULL, 'M Eyenet Training', 'Cubao', 'marinaslevie@gmail.com', NULL, NULL, 0, NULL, NULL),
(8, NULL, NULL, 'Akari', '1985-A Interior 6 Carlos st. Pandacan, Manila', 'akari@gmail.com', NULL, NULL, 0, NULL, NULL),
(9, NULL, NULL, 'Timba Importer Inc.', 'Mexico Cubao', 'Timba@gmail.com', NULL, NULL, 0, NULL, NULL),
(10, NULL, NULL, 'Testing Company 1', 'Testing Company  Address 1', 'clumsyreigny@gmail.com', '09286519686', '3681590', 0, 'DTI-Permits.jpg', NULL),
(11, NULL, NULL, 'Testing Company 2', 'Testing Company Address 2', 'reignshirley@gmail.com', '09124907819', '2124418', 0, 'DTI-Permit.jpg', NULL),
(12, NULL, NULL, 'Testing # 2', 'Testing Address # 2', 'ganilajoshua@gmail.com', '09272783766', '12365498', 0, 'Permit.png', NULL),
(13, NULL, NULL, 'Testing Company # 2', 'Testing Company # 2', 'ermalto110@gmail.com', '09286516986', '12356489', 0, 'DTI-Permit.jpg', NULL),
(14, NULL, NULL, 'Pagaduan', '554 Paltoc St. Sampaloc Manila', 'johnpagaduan04@gmail.com', '09206267696', '5593759', 0, 'Permit.png', NULL),
(15, NULL, NULL, 'Dorm Fam', 'A120', 'dormfam@gmail.com', '231', '231', 0, 'DTI-Permit.jpg', NULL),
(16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(17, NULL, NULL, 'HOMER', 'HOMER', 'ganilayow@gmail.com', '09102384071', '21224418', 0, 'DTI-Permits.jpg', NULL),
(18, NULL, NULL, 'Dorm Fam', 'A-120', 'johnpagaduan04@gmail.com', '09206267696', '5593759', 0, 'DTI-Permits.jpg', NULL),
(19, NULL, NULL, 'Dorm Fam', 'A-120', 'johncarlospagaduan@yahoo.com', '09206267696', '5593759', 0, 'DTI-Permits.jpg', NULL),
(20, NULL, NULL, 'Reign Shirley', 'Marikina City', 'reignexdummy@gmail.com', '09206267696', '5593759', 0, 'DTI-Permits.jpg', NULL),
(21, NULL, NULL, 'Reign Shirley', 'Marikina City', 'reignexdummy@gmail.com', '09206267696', '5593759', 0, 'DTI-Permits.jpg', NULL),
(22, NULL, NULL, 'Reign Shirley', 'Marikina City', 'reignshirley@gmail.com', '09206267696', '5593759', 0, 'DTI-Permits.jpg', NULL),
(23, NULL, NULL, 'Seonyo Sidae', 'Seoul South Korea', 'reignshirley@gmail.com', '123131', '231', 0, 'DTI-Permits.jpg', NULL),
(24, NULL, NULL, 'Seonyo Sidae', 'Seoul South Korea', 'johnpagaduan04@gmail.com', '123131', '231', 0, 'DTI-Permit.jpg', NULL),
(25, NULL, NULL, 'Testing Company 1', 'Testing Address 1', 'reignshirley@gmail.com', '09286519686', '3681590', 0, 'Permit.png', NULL),
(26, NULL, NULL, 'Testing Company Final Defense 1', 'Testing Company Final Defense Address 1', 'e_a_austria@yahoo.com', '09286548696', '21224481', 0, 'Permit.png', NULL),
(27, NULL, NULL, 'Testing Company Final Defense 2', 'Testing Company Final Defense Address 2', 'clumsyreigny@gmail.com', '0928158696', '3685109', 0, 'DTI-Permit.jpg', NULL),
(28, NULL, NULL, 'qwerty', 'qwerty', 'qwerty@gmail.com', '574212', '01444', 0, 'galaxy-wallpaper-green.jpg', NULL),
(29, NULL, NULL, 'zxcv', 'zxcv', 'zxc@gmail.com', '3242', '34234', 0, NULL, NULL),
(30, NULL, NULL, 'zxcv', 'zxcv', 'zxc@gmail.com', '3242', '34234', 0, NULL, NULL),
(31, NULL, NULL, 'zxcv', 'zxcv', 'zxc@gmail.com', '3242', '34234', 0, NULL, NULL),
(32, NULL, NULL, 'new', 'new', 'new@gmail.com', '23232', '02932', 0, '2D_Game_Character_Sprite_Sheets-_Featured-Image1.png', NULL),
(33, NULL, NULL, 'Fewa', 'Store #1', 'fewa@gmail.com', '1234', '1231', 0, 'ekko-teaser-2.jpg', NULL),
(34, NULL, NULL, 'joshua', 'joshua', 'ganilajoshua@gmail.com', '23232', '02932', 0, 'ekko-teaser-2.jpg', NULL),
(35, NULL, NULL, 'joshua', 'joshua', 'ganilajoshua@gmail.com', '23232', '02932', 0, 'ekko-teaser-2.jpg', NULL),
(36, NULL, NULL, 'Joshua', 'Joshua', 'ganilajoshua@gmail.com', '23232', '02932', 0, 'ekko-teaser-2.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontractclauses`
--

DROP TABLE IF EXISTS `tblcontractclauses`;
CREATE TABLE IF NOT EXISTS `tblcontractclauses` (
  `intContractClausesID` int(11) NOT NULL AUTO_INCREMENT,
  `strContractAgreements` text,
  `strContractTermsAndConditions` text,
  PRIMARY KEY (`intContractClausesID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblcontractfeesmatrix`
--

DROP TABLE IF EXISTS `tblcontractfeesmatrix`;
CREATE TABLE IF NOT EXISTS `tblcontractfeesmatrix` (
  `intContractFeesID` int(11) NOT NULL AUTO_INCREMENT,
  `enumServiceType` enum('Hauling','Tug Assist') DEFAULT NULL,
  `fltCFStandardRate` float DEFAULT NULL,
  `fltCFTugboatDelayFee` float DEFAULT NULL,
  `fltCFConsigneeLateFee` float DEFAULT NULL,
  `fltCFViolationFee` float DEFAULT NULL,
  `fltCFMinDamageFee` float DEFAULT NULL,
  `fltCFMaxDamageFee` float DEFAULT NULL,
  `intCFDiscount` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`intContractFeesID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcontractfeesmatrix`
--

INSERT INTO `tblcontractfeesmatrix` (`intContractFeesID`, `enumServiceType`, `fltCFStandardRate`, `fltCFTugboatDelayFee`, `fltCFConsigneeLateFee`, `fltCFViolationFee`, `fltCFMinDamageFee`, `fltCFMaxDamageFee`, `intCFDiscount`) VALUES
(1, 'Hauling', 2000, 1000, 1000, 1000, 3000, 5000, 20),
(2, 'Tug Assist', 1000, 2000, 1000, 2000, 2000, 4000, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontractlist`
--

DROP TABLE IF EXISTS `tblcontractlist`;
CREATE TABLE IF NOT EXISTS `tblcontractlist` (
  `intContractListID` int(11) NOT NULL AUTO_INCREMENT,
  `intCCompanyID` int(11) DEFAULT NULL,
  `intCQuotationID` int(11) DEFAULT NULL,
  `strContractListTitle` varchar(191) DEFAULT NULL,
  `strContractListDesc` text,
  `intCAttachmentsID` int(11) DEFAULT NULL,
  `isFinalized` tinyint(1) DEFAULT NULL,
  `enumStatus` enum('Pending','Created','Requesting For Changes','Accepted','Finalized','For Activation','Active','Expired') DEFAULT 'Pending',
  `boolDeleted` tinyint(1) DEFAULT '0',
  `datContractActive` date DEFAULT NULL,
  `datContractExpire` date DEFAULT NULL,
  `enumConValidity` enum('6','1') DEFAULT NULL,
  `strConsigneeSign` text,
  `strAdminSign` text,
  `isDefault` enum('Yes','No') DEFAULT 'Yes',
  PRIMARY KEY (`intContractListID`),
  KEY `fk_tblContractList_tblAgreement1_idx` (`intCQuotationID`),
  KEY `fk_tblContractList_tblWaiver1_idx` (`intCAttachmentsID`),
  KEY `fk_tblContractList_tblCompany1_idx` (`intCCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcontractlist`
--

INSERT INTO `tblcontractlist` (`intContractListID`, `intCCompanyID`, `intCQuotationID`, `strContractListTitle`, `strContractListDesc`, `intCAttachmentsID`, `isFinalized`, `enumStatus`, `boolDeleted`, `datContractActive`, `datContractExpire`, `enumConValidity`, `strConsigneeSign`, `strAdminSign`, `isDefault`) VALUES
(1, 3, NULL, 'Contract Title 1', '<p>Contract Details 2</p>', NULL, NULL, 'Expired', 0, '2018-10-26', '2019-04-26', '6', NULL, NULL, 'Yes'),
(2, 3, NULL, 'Contract Title Renewal 1', '<p>Contract Details Renewal 1<br></p>', NULL, NULL, 'Expired', 0, '2018-10-26', '2019-10-26', '1', NULL, NULL, 'Yes'),
(3, 3, NULL, 'Contract Renewal 2', '<p>Contract Renewal Details 2</p>', NULL, NULL, 'Active', 0, '2018-10-28', '2019-10-28', '1', NULL, NULL, 'Yes'),
(4, 28, NULL, NULL, '<p>All shipments to or from the Customer, which term shall include the exporter, importer, sender, receiver, owner, consignor, consignee, transferor or transferee of the shipments, will be handled by Unitrans Worldwide, Inc, herein called the “Company”) on the following terms and conditions:</p><p>•1.&nbsp;<span style=\"font-weight: bolder;\">Services by Third Parties</span>. Unless the Company carries, stores or otherwise physically handles the shipment, and loss, damage, expense or delay occurs during such activity, the Company assumes no liability as a carrier and is not to be held responsible for any loss, damage, expense or delay to the goods to be forwarded or imported except as provided in paragraph 8 and subject to the limitations of paragraph 9 below, but undertakes only to use reasonable care in the selection of carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others to whom it may entrust the goods for transportation, cartage, handling and/or delivery and/or storage or otherwise. When the company carries, stores or otherwise physically handles the shipment, it does so subject to the limitation of liability set forth in paragraph 8 below unless a separate bill of lading, air waybill or other contract of carriage is issued by the Company, in which event the terms thereof shall govern.</p><p>•2.&nbsp;<span style=\"font-weight: bolder;\">Liability Limitations of Third Parties</span>. The Company is authorized to select and engage carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others, as required, to transport, store, deal with and deliver the goods, all of whom shall be considered as the agents of the Customer, and the goods may be entrusted to such agencies subject to all conditions as to limitation of liability for loss, damage, expense or delay and to all rules, regulations, requirements and conditions, whether printed, written or stamped, appearing in bills of lading, receipts or tariffs issued by such carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others. The Company shall under no circumstances be liable for any loss, damage, expense or delay to the goods for any reason whatsoever when said goods are in custody, possession or control of third parties selected by the Company to forward, enter and clear, transport or render other services with respect to such goods.</p><p>•3.&nbsp;<span style=\"font-weight: bolder;\">Choosing Routes or Agents</span>. Unless express instructions in writing are received from the Customer, the Company has complete freedom in choosing the means, route and procedure to be followed in the handling, transportation and delivery of the goods. Advice by the Company to the Customer that a particular person or firm has been selected to render services with respect to the goods shall not be construed to mean that the Company warrants or represents that such person or firm will render such services.</p><p>•4.&nbsp;<span style=\"font-weight: bolder;\">Quotations Not Binding</span>. Quotations as to fees, rates of duty, freight charges, insurance premiums or other charges given by the Company to the Customer are for informational purposes only and are subject to change without notice and shall not under any circumstances be binding upon the Company unless the Company in writing specifically undertakes the handling or transportation of the shipment at a specific rate.</p><p>•5.&nbsp;<span style=\"font-weight: bolder;\">Duty to Furnish Information</span>.</p><p>(<span style=\"font-weight: bolder;\">a</span>) On an import at a reasonable time prior to entering of the goods for U.S. Customs, the Customer shall furnish to the Company invoices in proper form and other documents necessary or useful in the preparation of the U. S. Customs entry and, also, such further information as may be sufficient to establish, inter alia, the dutiable value, the classification, the country of origin, the genuineness of the merchandise and any mark or symbol associated with it, the Customer’s right to import and/or distribute the merchandise, and the merchandise’s admissibility, pursuant to U. S. law or regulation. If the Customer fails in a timely manner to furnish such information or documents, in whole or in part, as may be required to complete U. S. Customs entry or comply with U.S. laws or regulations, or if the information or documents furnished are inaccurate or incomplete, the Company shall be obligated only to use its best judgment in connection with the shipment and in no instance shall be charged with knowledge by the Customer of the true circumstances to which such inaccurate, incomplete, or omitted information or document pertains. Where a bond is required by U.S. Customs to be given for the production of any document or the performance of any act, the Customer shall be deemed bound by the terms of the bond notwithstanding the fact that the bond has been executed by the Company as principal, it being understood that the Company entered into such undertaking at the instance and on behalf of the Customer, and the Customer shall indemnify and hold the Company harmless for the consequences of any breach of the terms of the bond.</p><p>(<span style=\"font-weight: bolder;\">b</span>) On an export at a reasonable time prior to the exportation of the shipment the Customer shall furnish to the Company the commercial invoice in proper form and number, a proper consular declaration, weights, measures, values and other information in the language of and as may be required by the laws and regulations of U. S. and the country of destination of the goods.</p><p>(<span style=\"font-weight: bolder;\">c</span>) On an export or import the Company shall not in any way be responsible or liable for increased duty, penalty, fine or expense unless caused by the negligence or other fault of the Company, in which event its liability to the Customer shall be governed by the provisions of paragraphs 8-10 below. The Customer shall be bound by and warrant the accuracy of all invoices, documents and information furnished to the Company by the Customer or its agent for export, entry or other purposes and the Customer agrees to indemnify and hold harmless the Company against any increased duty, penalty, fine or expense including attorneys’ fees, resulting from any inaccuracy, incomplete statement, omission or any failure to make timely presentation, even if not due to any negligence of the Customer.</p><p>•6.&nbsp;<span style=\"font-weight: bolder;\">Declaring Higher Valuation</span>. Inasmuch as truckers, carriers, warehousemen and others to whom the goods are entrusted usually limit their liability for loss or damage unless a higher value is declared and a charge based on such higher value is agreed to by said truckers, etc., the Company must receive specific written instructions from the Customer to pay such higher charge based on valuation and the trucker, etc. must accept such higher declared value; otherwise the valuation placed by the Customer on the goods shall be considered solely for export or customs purposes and the goods will be delivered to the truckers, etc. subject to the limitation of liability set forth herein in paragraphs 8-10 below with respect to any claim against the Company and subject to the provisions of paragraph 2 above.</p><p>7.&nbsp;<span style=\"font-weight: bolder;\">Insurance</span>. The Company will make reasonable efforts to effect marine, fire, theft and other insurance upon the goods only after specific written instructions have been received by the Company in sufficient time prior to shipment from point of origin, and the Customer at the same time states specifically the kind and amount of insurance to be placed. The Company does not undertake or warrant that such insurance can or will be placed. Unless the Customer has its own open marine policy and instructs the Company to effect insurance under such policy, insurance is to be effected with one or more insurance companies or other underwriters to be selected by the Company. Any insurance placed shall be governed by the certificate or policy issued and will only be effective when accepted by such insurance companies or underwriters. Should an insurer dispute its liability for any reason, the insured shall have recourse against the insurer only and the Company shall not be under any responsibility or liability in relation thereto, notwithstanding that the premium upon the policy may not be at the same rates as that charged or paid to the Company by the Customer, or that the shipment was insured under a policy in the name of the Company. Insurance premiums and the charge of the Company for arranging the same shall be at the Customer’s expense. If for any reason the goods are held in warehouse, or elsewhere, the same will not be covered by any insurance, unless the Company receives written instructions from the Customer. Unless specifically agreed in writing, the Company assumes no responsibility to effect insurance on any export or import shipment which it does not handle.</p><p>•8.&nbsp;<span style=\"font-weight: bolder;\">Limitation of Liability for Loss, etc</span>.</p><p>(<span style=\"font-weight: bolder;\">a</span>) The Customer agrees that the Company shall only be liable for any loss, damage expense or delay to the goods resulting from the negligence or other fault of the Company; such liability shall be limited to an amount equal to the lesser of fifty dollars ($50.00) per entry or shipment or the fee(s) charged for services, provided that, in the case of partial loss, such amount will be adjusted, pro rata;</p><p>(<span style=\"font-weight: bolder;\">b</span>) Where the Company issues its own bill of lading and receives freight charges as its compensation, Customer has the option of paying a special compensation and increasing the limit of Company’s liability up to the shipment’s actual value; however, such option must be exercised by written agreement, entered into prior to any covered transaction(s),setting forth the limit of the Company’s liability and the compensation received;</p><p>(<span style=\"font-weight: bolder;\">c</span>) In instances other than in (b) above, unless the Customer makes specific written arrangements with the Company to pay special compensation and declare a higher value and Company agrees in writing, liability is limited to the amount set forth in (a) above;</p><p>(<span style=\"font-weight: bolder;\">d</span>) Customer agrees that the Company shall, in no event, be liable for consequential, punitive, statutory or special damages in excess of the monetary limit provided for above.</p><p>•9.&nbsp;<span style=\"font-weight: bolder;\">Presenting Claims</span>. Company shall not be liable under paragraph 8 for any claims not presented to it in writing within 90 days of either the date of loss or incident giving rise to the claim; no suit to recover for any claim or demand here under shall be maintained against the Company unless instituted within six (6) months after the presentation of the said claim or such longer period provided for under statute(s) of the State having jurisdiction of the matter.</p><p>•10.&nbsp;<span style=\"font-weight: bolder;\">Advancing Money</span>. The Company shall not be obliged to incur any expense, guarantee payment or advance any money in connection with the importing, forwarding, transporting, insuring, storing or coopering of the goods, unless the same is previously provided to the Company by the Customer on demand. The Company shall be under no obligation to advance freight charges, customs duties or taxes on any shipment, nor shall any advance by the Company be construed as a waiver of the provisions hereof.</p><p>•11.<span style=\"font-weight: bolder;\">&nbsp;Indemnification for Freight, Duties</span>. In the event that a carrier, other person or any governmental agency makes a claim or institutes legal action against the company for ocean or other freight, duties, fines, penalties, liquidated damages or other money due rising from a shipment of goods of the Customer, the Customer agrees to indemnify and hold harmless the Company for any amount the Company may be required to pay such carrier, other person or governmental agency together with reasonable expenses, including attorneys’ fees, incurred by the Company in connection with defending such claim or legal action and obtaining reimbursement from the Customer. The confiscation or detention of the goods by any governmental authority shall not affect or diminish the liability of the Customer to the Company to pay all charges or other money due promptly on demand.</p><p>•12.&nbsp;<span style=\"font-weight: bolder;\">C.O.D. Shipments</span>. Goods received with Customer’s or other person’s instructions to “Collect on Delivery” (C.O.D.) by drafts or otherwise, or to collect on any specified terms by time drafts or otherwise, are accepted by the Company only upon the express understanding that it will exercise reasonable care in the selection of a bank, correspondent, carrier or agent to whom it will send such item for collection, and the Company will not be responsible for any act, omission, default, suspension, insolvency or want of care, negligence, or fault of such bank, correspondent, carrier or agent, nor for any delay in remittance lost in exchange, or during transmission, or while in the course of collection.</p><p>•13.&nbsp;<span style=\"font-weight: bolder;\">General Lien on Any Property</span>. The Company shall have a general lien on any and all property (and documents relating thereto) of the customer, in its possession, custody or control or en route, for all claims for charges, expenses or advances incurred by the Company in connection with any shipments of the Customer and if such claim remains unsatisfied for thirty (30) days after demand for its payment is made, the Company may sell at public auction or private sale, upon ten (10) days written notice, registered mail(R.R.R.), to the Customer, the goods, wares and/or merchandise, or so much thereof as may be necessary to satisfy such lien, and apply the net proceeds of such sale to the payment of the amount due to the Company. Any surplus from such sale shall be transmitted to the Customer, and the Customer shall be liable for any deficiency in the sale.</p><p>•14.&nbsp;<span style=\"font-weight: bolder;\">Compensation of Company</span>. The compensation of the Company for its services shall be included with and is in addition to the rates and charges of all carriers and other agencies selected by the Company to transport and deal with the goods and such compensation shall be exclusive of any brokerage, commissions, dividends or other revenue received by the Company from carriers, insurers and others in connection with the shipment. On ocean exports, upon request, the Company shall provide a detailed breakout of the components of all charges assessed and a true copy of each pertinent document relating to these charges. In any referral for collection or action against the Customer for monies due the Company, upon recovery by the Company, the Customer shall pay the expenses of collection and/or litigation, including a reasonable attorney fee.</p><p>•15.&nbsp;<span style=\"font-weight: bolder;\">No Responsibility for Governmental Requirements</span>. It is the responsibility of the Customer to know and comply with the marking requirements of the U. S. Customs Service, the regulations of the U. S. Food and Drug Administration, and all other requirements, including regulations of Federal, state and/or local agencies pertaining to the merchandise. The Company shall not be responsible for action taken or fines or penalties assessed by any governmental agency against the shipment because of the failure of the Customer to comply with the law or the requirements or regulations of any governmental agency or with a notification issued to the Customer by any such agency.</p><p>•16.&nbsp;<span style=\"font-weight: bolder;\">Indemnity Against Liability Arising from the Importation of Merchandise</span>. The Customer agrees to indemnify and hold the Company harmless from any claims and/or liability arising from the importation of merchandise which violates any Federal, state and/or other laws or regulations and further agrees to indemnify and hold the Company harmless against any and all liability, loss, damages, costs, claims and/or expenses, including but not limited to attorney’s fees, which the Company may hereafter incur, suffer or be required to pay by reason of claims by any government agency or private party. In the event that any action, suit or proceeding is brought against the Company by any government agency or any private party, the Company shall give notice in writing to the Customer by mail at its address on file with the Company. Upon receipt of such notice, the Customer at its own expense shall defend against such action and take all steps as may be necessary or proper to prevent the obtaining of a judgment and/or order against the Company.</p><p>•17.&nbsp;<span style=\"font-weight: bolder;\">Loss, Damage or Expense Due to Delay</span>. Unless the services to be performed by the Company on behalf of the Customer are delayed by reason of the negligence or other fault of the Company, the Company shall not be responsible for any loss, damage or expense incurred by the Customer because of such delay. In the event the Company is at fault, as aforesaid, its liability is limited in accordance with the provisions of paragraphs 8-9 above.</p><p>18.<span style=\"font-weight: bolder;\">&nbsp;Construction of Terms and Venue</span>. The foregoing terms and conditions shall be construed according to the laws of the State shown on the reverse side hereof. Unless otherwise consented to in writing by the Company, no legal proceeding against the Company may be instituted by the Customer, its assigns, or subrogee except in the City shown on the reverse side</p>', NULL, NULL, 'Created', 0, NULL, NULL, '', NULL, NULL, 'Yes'),
(6, 32, NULL, 'Titlee', '<p><br></p><p>All shipments to or from the Customer, which term shall include the exporter, importer, sender, receiver, owner, consignor, consignee, transferor or transferee of the shipments, will be handled by Unitrans Worldwide, Inc, herein called the “Company”) on the following terms and conditions:</p><p>•1.&nbsp;<span style=\"font-weight: bolder;\">Services by Third Parties</span>. Unless the Company carries, stores or otherwise physically handles the shipment, and loss, damage, expense or delay occurs during such activity, the Company assumes no liability as a carrier and is not to be held responsible for any loss, damage, expense or delay to the goods to be forwarded or imported except as provided in paragraph 8 and subject to the limitations of paragraph 9 below, but undertakes only to use reasonable care in the selection of carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others to whom it may entrust the goods for transportation, cartage, handling and/or delivery and/or storage or otherwise. When the company carries, stores or otherwise physically handles the shipment, it does so subject to the limitation of liability set forth in paragraph 8 below unless a separate bill of lading, air waybill or other contract of carriage is issued by the Company, in which event the terms thereof shall govern.</p><p>•2.&nbsp;<span style=\"font-weight: bolder;\">Liability Limitations of Third Parties</span>. The Company is authorized to select and engage carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others, as required, to transport, store, deal with and deliver the goods, all of whom shall be considered as the agents of the Customer, and the goods may be entrusted to such agencies subject to all conditions as to limitation of liability for loss, damage, expense or delay and to all rules, regulations, requirements and conditions, whether printed, written or stamped, appearing in bills of lading, receipts or tariffs issued by such carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others. The Company shall under no circumstances be liable for any loss, damage, expense or delay to the goods for any reason whatsoever when said goods are in custody, possession or control of third parties selected by the Company to forward, enter and clear, transport or render other services with respect to such goods.</p><p>•3.&nbsp;<span style=\"font-weight: bolder;\">Choosing Routes or Agents</span>. Unless express instructions in writing are received from the Customer, the Company has complete freedom in choosing the means, route and procedure to be followed in the handling, transportation and delivery of the goods. Advice by the Company to the Customer that a particular person or firm has been selected to render services with respect to the goods shall not be construed to mean that the Company warrants or represents that such person or firm will render such services.</p><p>•4.&nbsp;<span style=\"font-weight: bolder;\">Quotations Not Binding</span>. Quotations as to fees, rates of duty, freight charges, insurance premiums or other charges given by the Company to the Customer are for informational purposes only and are subject to change without notice and shall not under any circumstances be binding upon the Company unless the Company in writing specifically undertakes the handling or transportation of the shipment at a specific rate.</p><p>•5.&nbsp;<span style=\"font-weight: bolder;\">Duty to Furnish Information</span>.</p><p>(<span style=\"font-weight: bolder;\">a</span>) On an import at a reasonable time prior to entering of the goods for U.S. Customs, the Customer shall furnish to the Company invoices in proper form and other documents necessary or useful in the preparation of the U. S. Customs entry and, also, such further information as may be sufficient to establish, inter alia, the dutiable value, the classification, the country of origin, the genuineness of the merchandise and any mark or symbol associated with it, the Customer’s right to import and/or distribute the merchandise, and the merchandise’s admissibility, pursuant to U. S. law or regulation. If the Customer fails in a timely manner to furnish such information or documents, in whole or in part, as may be required to complete U. S. Customs entry or comply with U.S. laws or regulations, or if the information or documents furnished are inaccurate or incomplete, the Company shall be obligated only to use its best judgment in connection with the shipment and in no instance shall be charged with knowledge by the Customer of the true circumstances to which such inaccurate, incomplete, or omitted information or document pertains. Where a bond is required by U.S. Customs to be given for the production of any document or the performance of any act, the Customer shall be deemed bound by the terms of the bond notwithstanding the fact that the bond has been executed by the Company as principal, it being understood that the Company entered into such undertaking at the instance and on behalf of the Customer, and the Customer shall indemnify and hold the Company harmless for the consequences of any breach of the terms of the bond.</p><p>(<span style=\"font-weight: bolder;\">b</span>) On an export at a reasonable time prior to the exportation of the shipment the Customer shall furnish to the Company the commercial invoice in proper form and number, a proper consular declaration, weights, measures, values and other information in the language of and as may be required by the laws and regulations of U. S. and the country of destination of the goods.</p><p>(<span style=\"font-weight: bolder;\">c</span>) On an export or import the Company shall not in any way be responsible or liable for increased duty, penalty, fine or expense unless caused by the negligence or other fault of the Company, in which event its liability to the Customer shall be governed by the provisions of paragraphs 8-10 below. The Customer shall be bound by and warrant the accuracy of all invoices, documents and information furnished to the Company by the Customer or its agent for export, entry or other purposes and the Customer agrees to indemnify and hold harmless the Company against any increased duty, penalty, fine or expense including attorneys’ fees, resulting from any inaccuracy, incomplete statement, omission or any failure to make timely presentation, even if not due to any negligence of the Customer.</p><p>•6.&nbsp;<span style=\"font-weight: bolder;\">Declaring Higher Valuation</span>. Inasmuch as truckers, carriers, warehousemen and others to whom the goods are entrusted usually limit their liability for loss or damage unless a higher value is declared and a charge based on such higher value is agreed to by said truckers, etc., the Company must receive specific written instructions from the Customer to pay such higher charge based on valuation and the trucker, etc. must accept such higher declared value; otherwise the valuation placed by the Customer on the goods shall be considered solely for export or customs purposes and the goods will be delivered to the truckers, etc. subject to the limitation of liability set forth herein in paragraphs 8-10 below with respect to any claim against the Company and subject to the provisions of paragraph 2 above.</p><p>7.&nbsp;<span style=\"font-weight: bolder;\">Insurance</span>. The Company will make reasonable efforts to effect marine, fire, theft and other insurance upon the goods only after specific written instructions have been received by the Company in sufficient time prior to shipment from point of origin, and the Customer at the same time states specifically the kind and amount of insurance to be placed. The Company does not undertake or warrant that such insurance can or will be placed. Unless the Customer has its own open marine policy and instructs the Company to effect insurance under such policy, insurance is to be effected with one or more insurance companies or other underwriters to be selected by the Company. Any insurance placed shall be governed by the certificate or policy issued and will only be effective when accepted by such insurance companies or underwriters. Should an insurer dispute its liability for any reason, the insured shall have recourse against the insurer only and the Company shall not be under any responsibility or liability in relation thereto, notwithstanding that the premium upon the policy may not be at the same rates as that charged or paid to the Company by the Customer, or that the shipment was insured under a policy in the name of the Company. Insurance premiums and the charge of the Company for arranging the same shall be at the Customer’s expense. If for any reason the goods are held in warehouse, or elsewhere, the same will not be covered by any insurance, unless the Company receives written instructions from the Customer. Unless specifically agreed in writing, the Company assumes no responsibility to effect insurance on any export or import shipment which it does not handle.</p><p>•8.&nbsp;<span style=\"font-weight: bolder;\">Limitation of Liability for Loss, etc</span>.</p><p>(<span style=\"font-weight: bolder;\">a</span>) The Customer agrees that the Company shall only be liable for any loss, damage expense or delay to the goods resulting from the negligence or other fault of the Company; such liability shall be limited to an amount equal to the lesser of fifty dollars ($50.00) per entry or shipment or the fee(s) charged for services, provided that, in the case of partial loss, such amount will be adjusted, pro rata;</p><p>(<span style=\"font-weight: bolder;\">b</span>) Where the Company issues its own bill of lading and receives freight charges as its compensation, Customer has the option of paying a special compensation and increasing the limit of Company’s liability up to the shipment’s actual value; however, such option must be exercised by written agreement, entered into prior to any covered transaction(s),setting forth the limit of the Company’s liability and the compensation received;</p><p>(<span style=\"font-weight: bolder;\">c</span>) In instances other than in (b) above, unless the Customer makes specific written arrangements with the Company to pay special compensation and declare a higher value and Company agrees in writing, liability is limited to the amount set forth in (a) above;</p><p>(<span style=\"font-weight: bolder;\">d</span>) Customer agrees that the Company shall, in no event, be liable for consequential, punitive, statutory or special damages in excess of the monetary limit provided for above.</p><p>•9.&nbsp;<span style=\"font-weight: bolder;\">Presenting Claims</span>. Company shall not be liable under paragraph 8 for any claims not presented to it in writing within 90 days of either the date of loss or incident giving rise to the claim; no suit to recover for any claim or demand here under shall be maintained against the Company unless instituted within six (6) months after the presentation of the said claim or such longer period provided for under statute(s) of the State having jurisdiction of the matter.</p><p>•10.&nbsp;<span style=\"font-weight: bolder;\">Advancing Money</span>. The Company shall not be obliged to incur any expense, guarantee payment or advance any money in connection with the importing, forwarding, transporting, insuring, storing or coopering of the goods, unless the same is previously provided to the Company by the Customer on demand. The Company shall be under no obligation to advance freight charges, customs duties or taxes on any shipment, nor shall any advance by the Company be construed as a waiver of the provisions hereof.</p><p>•11.<span style=\"font-weight: bolder;\">&nbsp;Indemnification for Freight, Duties</span>. In the event that a carrier, other person or any governmental agency makes a claim or institutes legal action against the company for ocean or other freight, duties, fines, penalties, liquidated damages or other money due rising from a shipment of goods of the Customer, the Customer agrees to indemnify and hold harmless the Company for any amount the Company may be required to pay such carrier, other person or governmental agency together with reasonable expenses, including attorneys’ fees, incurred by the Company in connection with defending such claim or legal action and obtaining reimbursement from the Customer. The confiscation or detention of the goods by any governmental authority shall not affect or diminish the liability of the Customer to the Company to pay all charges or other money due promptly on demand.</p><p>•12.&nbsp;<span style=\"font-weight: bolder;\">C.O.D. Shipments</span>. Goods received with Customer’s or other person’s instructions to “Collect on Delivery” (C.O.D.) by drafts or otherwise, or to collect on any specified terms by time drafts or otherwise, are accepted by the Company only upon the express understanding that it will exercise reasonable care in the selection of a bank, correspondent, carrier or agent to whom it will send such item for collection, and the Company will not be responsible for any act, omission, default, suspension, insolvency or want of care, negligence, or fault of such bank, correspondent, carrier or agent, nor for any delay in remittance lost in exchange, or during transmission, or while in the course of collection.</p><p>•13.&nbsp;<span style=\"font-weight: bolder;\">General Lien on Any Property</span>. The Company shall have a general lien on any and all property (and documents relating thereto) of the customer, in its possession, custody or control or en route, for all claims for charges, expenses or advances incurred by the Company in connection with any shipments of the Customer and if such claim remains unsatisfied for thirty (30) days after demand for its payment is made, the Company may sell at public auction or private sale, upon ten (10) days written notice, registered mail(R.R.R.), to the Customer, the goods, wares and/or merchandise, or so much thereof as may be necessary to satisfy such lien, and apply the net proceeds of such sale to the payment of the amount due to the Company. Any surplus from such sale shall be transmitted to the Customer, and the Customer shall be liable for any deficiency in the sale.</p><p>•14.&nbsp;<span style=\"font-weight: bolder;\">Compensation of Company</span>. The compensation of the Company for its services shall be included with and is in addition to the rates and charges of all carriers and other agencies selected by the Company to transport and deal with the goods and such compensation shall be exclusive of any brokerage, commissions, dividends or other revenue received by the Company from carriers, insurers and others in connection with the shipment. On ocean exports, upon request, the Company shall provide a detailed breakout of the components of all charges assessed and a true copy of each pertinent document relating to these charges. In any referral for collection or action against the Customer for monies due the Company, upon recovery by the Company, the Customer shall pay the expenses of collection and/or litigation, including a reasonable attorney fee.</p><p>•15.&nbsp;<span style=\"font-weight: bolder;\">No Responsibility for Governmental Requirements</span>. It is the responsibility of the Customer to know and comply with the marking requirements of the U. S. Customs Service, the regulations of the U. S. Food and Drug Administration, and all other requirements, including regulations of Federal, state and/or local agencies pertaining to the merchandise. The Company shall not be responsible for action taken or fines or penalties assessed by any governmental agency against the shipment because of the failure of the Customer to comply with the law or the requirements or regulations of any governmental agency or with a notification issued to the Customer by any such agency.</p><p>•16.&nbsp;<span style=\"font-weight: bolder;\">Indemnity Against Liability Arising from the Importation of Merchandise</span>. The Customer agrees to indemnify and hold the Company harmless from any claims and/or liability arising from the importation of merchandise which violates any Federal, state and/or other laws or regulations and further agrees to indemnify and hold the Company harmless against any and all liability, loss, damages, costs, claims and/or expenses, including but not limited to attorney’s fees, which the Company may hereafter incur, suffer or be required to pay by reason of claims by any government agency or private party. In the event that any action, suit or proceeding is brought against the Company by any government agency or any private party, the Company shall give notice in writing to the Customer by mail at its address on file with the Company. Upon receipt of such notice, the Customer at its own expense shall defend against such action and take all steps as may be necessary or proper to prevent the obtaining of a judgment and/or order against the Company.</p><p>•17.&nbsp;<span style=\"font-weight: bolder;\">Loss, Damage or Expense Due to Delay</span>. Unless the services to be performed by the Company on behalf of the Customer are delayed by reason of the negligence or other fault of the Company, the Company shall not be responsible for any loss, damage or expense incurred by the Customer because of such delay. In the event the Company is at fault, as aforesaid, itsaa liability is limited in accordance with the provisions of paragraphs 8-9 above.</p><p>18.<span style=\"font-weight: bolder;\">&nbsp;Construction of Terms and Venue</span>. The foregoing terms and conditions shall be construed according to the laws of the State shown on the reverse side hereof. Unless otherwise consented to in writing by the Company, no legal proceeding against the Company may be instituted by the Customer, its assigns, or subrogee except in the City shown on the reverse side</p>', NULL, NULL, 'Active', 0, '2018-10-27', '2019-10-27', '1', NULL, NULL, 'Yes');
INSERT INTO `tblcontractlist` (`intContractListID`, `intCCompanyID`, `intCQuotationID`, `strContractListTitle`, `strContractListDesc`, `intCAttachmentsID`, `isFinalized`, `enumStatus`, `boolDeleted`, `datContractActive`, `datContractExpire`, `enumConValidity`, `strConsigneeSign`, `strAdminSign`, `isDefault`) VALUES
(7, 33, NULL, 'Title 2', '<p><br></p><p>All shipments to or from the Customer, which term shall include the exporter, importer, sender, receiver, owner, consignor, consignee, transferor or transferee of the shipments, will be handled by Unitrans Worldwide, Inc, herein called the “Company”) on the following terms and conditions:</p><p>•1.&nbsp;<span style=\"font-weight: bolder;\">Services by Third Parties</span>. Unless the Company carries, stores or otherwise physically handles the shipment, and loss, damage, expense or delay occurs during such activity, the Company assumes no liability as a carrier and is not to be held responsible for any loss, damage, expense or delay to the goods to be forwarded or imported except as provided in paragraph 8 and subject to the limitations of paragraph 9 below, but undertakes only to use reasonable care in the selection of carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others to whom it may entrust the goods for transportation, cartage, handling and/or delivery and/or storage or otherwise. When the company carries, stores or otherwise physically handles the shipment, it does so subject to the limitation of liability set forth in paragraph 8 below unless a separate bill of lading, air waybill or other contract of carriage is issued by the Company, in which event the terms thereof shall govern.</p><p>•2.&nbsp;<span style=\"font-weight: bolder;\">Liability Limitations of Third Parties</span>. The Company is authorized to select and engage carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others, as required, to transport, store, deal with and deliver the goods, all of whom shall be considered as the agents of the Customer, and the goods may be entrusted to such agencies subject to all conditions as to limitation of liability for loss, damage, expense or delay and to all rules, regulations, requirements and conditions, whether printed, written or stamped, appearing in bills of lading, receipts or tariffs issued by such carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others. The Company shall under no circumstances be liable for any loss, damage, expense or delay to the goods for any reason whatsoever when said goods are in custody, possession or control of third parties selected by the Company to forward, enter and clear, transport or render other services with respect to such goods.</p><p>•3.&nbsp;<span style=\"font-weight: bolder;\">Choosing Routes or Agents</span>. Unless express instructions in writing are received from the Customer, the Company has complete freedom in choosing the means, route and procedure to be followed in the handling, transportation and delivery of the goods. Advice by the Company to the Customer that a particular person or firm has been selected to render services with respect to the goods shall not be construed to mean that the Company warrants or represents that such person or firm will render such services.</p><p>•4.&nbsp;<span style=\"font-weight: bolder;\">Quotations Not Binding</span>. Quotations as to fees, rates of duty, freight charges, insurance premiums or other charges given by the Company to the Customer are for informational purposes only and are subject to change without notice and shall not under any circumstances be binding upon the Company unless the Company in writing specifically undertakes the handling or transportation of the shipment at a specific rate.</p><p>•5.&nbsp;<span style=\"font-weight: bolder;\">Duty to Furnish Information</span>.</p><p>(<span style=\"font-weight: bolder;\">a</span>) On an import at a reasonable time prior to entering of the goods for U.S. Customs, the Customer shall furnish to the Company invoices in proper form and other documents necessary or useful in the preparation of the U. S. Customs entry and, also, such further information as may be sufficient to establish, inter alia, the dutiable value, the classification, the country of origin, the genuineness of the merchandise and any mark or symbol associated with it, the Customer’s right to import and/or distribute the merchandise, and the merchandise’s admissibility, pursuant to U. S. law or regulation. If the Customer fails in a timely manner to furnish such information or documents, in whole or in part, as may be required to complete U. S. Customs entry or comply with U.S. laws or regulations, or if the information or documents furnished are inaccurate or incomplete, the Company shall be obligated only to use its best judgment in connection with the shipment and in no instance shall be charged with knowledge by the Customer of the true circumstances to which such inaccurate, incomplete, or omitted information or document pertains. Where a bond is required by U.S. Customs to be given for the production of any document or the performance of any act, the Customer shall be deemed bound by the terms of the bond notwithstanding the fact that the bond has been executed by the Company as principal, it being understood that the Company entered into such undertaking at the instance and on behalf of the Customer, and the Customer shall indemnify and hold the Company harmless for the consequences of any breach of the terms of the bond.</p><p>(<span style=\"font-weight: bolder;\">b</span>) On an export at a reasonable time prior to the exportation of the shipment the Customer shall furnish to the Company the commercial invoice in proper form and number, a proper consular declaration, weights, measures, values and other information in the language of and as may be required by the laws and regulations of U. S. and the country of destination of the goods.</p><p>(<span style=\"font-weight: bolder;\">c</span>) On an export or import the Company shall not in any way be responsible or liable for increased duty, penalty, fine or expense unless caused by the negligence or other fault of the Company, in which event its liability to the Customer shall be governed by the provisions of paragraphs 8-10 below. The Customer shall be bound by and warrant the accuracy of all invoices, documents and information furnished to the Company by the Customer or its agent for export, entry or other purposes and the Customer agrees to indemnify and hold harmless the Company against any increased duty, penalty, fine or expense including attorneys’ fees, resulting from any inaccuracy, incomplete statement, omission or any failure to make timely presentation, even if not due to any negligence of the Customer.</p><p>•6.&nbsp;<span style=\"font-weight: bolder;\">Declaring Higher Valuation</span>. Inasmuch as truckers, carriers, warehousemen and others to whom the goods are entrusted usually limit their liability for loss or damage unless a higher value is declared and a charge based on such higher value is agreed to by said truckers, etc., the Company must receive specific written instructions from the Customer to pay such higher charge based on valuation and the trucker, etc. must accept such higher declared value; otherwise the valuation placed by the Customer on the goods shall be considered solely for export or customs purposes and the goods will be delivered to the truckers, etc. subject to the limitation of liability set forth herein in paragraphs 8-10 below with respect to any claim against the Company and subject to the provisions of paragraph 2 above.</p><p>7.&nbsp;<span style=\"font-weight: bolder;\">Insurance</span>. The Company will make reasonable efforts to effect marine, fire, theft and other insurance upon the goods only after specific written instructions have been received by the Company in sufficient time prior to shipment from point of origin, and the Customer at the same time states specifically the kind and amount of insurance to be placed. The Company does not undertake or warrant that such insurance can or will be placed. Unless the Customer has its own open marine policy and instructs the Company to effect insurance under such policy, insurance is to be effected with one or more insurance companies or other underwriters to be selected by the Company. Any insurance placed shall be governed by the certificate or policy issued and will only be effective when accepted by such insurance companies or underwriters. Should an insurer dispute its liability for any reason, the insured shall have recourse against the insurer only and the Company shall not be under any responsibility or liability in relation thereto, notwithstanding that the premium upon the policy may not be at the same rates as that charged or paid to the Company by the Customer, or that the shipment was insured under a policy in the name of the Company. Insurance premiums and the charge of the Company for arranging the same shall be at the Customer’s expense. If for any reason the goods are held in warehouse, or elsewhere, the same will not be covered by any insurance, unless the Company receives written instructions from the Customer. Unless specifically agreed in writing, the Company assumes no responsibility to effect insurance on any export or import shipment which it does not handle.</p><p>•8.&nbsp;<span style=\"font-weight: bolder;\">Limitation of Liability for Loss, etc</span>.</p><p>(<span style=\"font-weight: bolder;\">a</span>) The Customer agrees that the Company shall only be liable for any loss, damage expense or delay to the goods resulting from the negligence or other fault of the Company; such liability shall be limited to an amount equal to the lesser of fifty dollars ($50.00) per entry or shipment or the fee(s) charged for services, provided that, in the case of partial loss, such amount will be adjusted, pro rata;</p><p>(<span style=\"font-weight: bolder;\">b</span>) Where the Company issues its own bill of lading and receives freight charges as its compensation, Customer has the option of paying a special compensation and increasing the limit of Company’s liability up to the shipment’s actual value; however, such option must be exercised by written agreement, entered into prior to any covered transaction(s),setting forth the limit of the Company’s liability and the compensation received;</p><p>(<span style=\"font-weight: bolder;\">c</span>) In instances other than in (b) above, unless the Customer makes specific written arrangements with the Company to pay special compensation and declare a higher value and Company agrees in writing, liability is limited to the amount set forth in (a) above;</p><p>(<span style=\"font-weight: bolder;\">d</span>) Customer agrees that the Company shall, in no event, be liable for consequential, punitive, statutory or special damages in excess of the monetary limit provided for above.</p><p>•9.&nbsp;<span style=\"font-weight: bolder;\">Presenting Claims</span>. Company shall not be liable under paragraph 8 for any claims not presented to it in writing within 90 days of either the date of loss or incident giving rise to the claim; no suit to recover for any claim or demand here under shall be maintained against the Company unless instituted within six (6) months after the presentation of the said claim or such longer period provided for under statute(s) of the State having jurisdiction of the matter.</p><p>•10.&nbsp;<span style=\"font-weight: bolder;\">Advancing Money</span>. The Company shall not be obliged to incur any expense, guarantee payment or advance any money in connection with the importing, forwarding, transporting, insuring, storing or coopering of the goods, unless the same is previously provided to the Company by the Customer on demand. The Company shall be under no obligation to advance freight charges, customs duties or taxes on any shipment, nor shall any advance by the Company be construed as a waiver of the provisions hereof.</p><p>•11.<span style=\"font-weight: bolder;\">&nbsp;Indemnification for Freight, Duties</span>. In the event that a carrier, other person or any governmental agency makes a claim or institutes legal action against the company for ocean or other freight, duties, fines, penalties, liquidated damages or other money due rising from a shipment of goods of the Customer, the Customer agrees to indemnify and hold harmless the Company for any amount the Company may be required to pay such carrier, other person or governmental agency together with reasonable expenses, including attorneys’ fees, incurred by the Company in connection with defending such claim or legal action and obtaining reimbursement from the Customer. The confiscation or detention of the goods by any governmental authority shall not affect or diminish the liability of the Customer to the Company to pay all charges or other money due promptly on demand.</p><p>•12.&nbsp;<span style=\"font-weight: bolder;\">C.O.D. Shipments</span>. Goods received with Customer’s or other person’s instructions to “Collect on Delivery” (C.O.D.) by drafts or otherwise, or to collect on any specified terms by time drafts or otherwise, are accepted by the Company only upon the express understanding that it will exercise reasonable care in the selection of a bank, correspondent, carrier or agent to whom it will send such item for collection, and the Company will not be responsible for any act, omission, default, suspension, insolvency or want of care, negligence, or fault of such bank, correspondent, carrier or agent, nor for any delay in remittance lost in exchange, or during transmission, or while in the course of collection.</p><p>•13.&nbsp;<span style=\"font-weight: bolder;\">General Lien on Any Property</span>. The Company shall have a general lien on any and all property (and documents relating thereto) of the customer, in its possession, custody or control or en route, for all claims for charges, expenses or advances incurred by the Company in connection with any shipments of the Customer and if such claim remains unsatisfied for thirty (30) days after demand for its payment is made, the Company may sell at public auction or private sale, upon ten (10) days written notice, registered mail(R.R.R.), to the Customer, the goods, wares and/or merchandise, or so much thereof as may be necessary to satisfy such lien, and apply the net proceeds of such sale to the payment of the amount due to the Company. Any surplus from such sale shall be transmitted to the Customer, and the Customer shall be liable for any deficiency in the sale.</p><p>•14.&nbsp;<span style=\"font-weight: bolder;\">Compensation of Company</span>. The compensation of the Company for its services shall be included with and is in addition to the rates and charges of all carriers and other agencies selected by the Company to transport and deal with the goods and such compensation shall be exclusive of any brokerage, commissions, dividends or other revenue received by the Company from carriers, insurers and others in connection with the shipment. On ocean exports, upon request, the Company shall provide a detailed breakout of the components of all charges assessed and a true copy of each pertinent document relating to these charges. In any referral for collection or action against the Customer for monies due the Company, upon recovery by the Company, the Customer shall pay the expenses of collection and/or litigation, including a reasonable attorney fee.</p><p>•15.&nbsp;<span style=\"font-weight: bolder;\">No Responsibility for Governmental Requirements</span>. It is the responsibility of the Customer to know and comply with the marking requirements of the U. S. Customs Service, the regulations of the U. S. Food and Drug Administration, and all other requirements, including regulations of Federal, state and/or local agencies pertaining to the merchandise. The Company shall not be responsible for action taken or fines or penalties assessed by any governmental agency against the shipment because of the failure of the Customer to comply with the law or the requirements or regulations of any governmental agency or with a notification issued to the Customer by any such agency.</p><p>•16.&nbsp;<span style=\"font-weight: bolder;\">Indemnity Against Liability Arising from the Importation of Merchandise</span>. The Customer agrees to indemnify and hold the Company harmless from any claims and/or liability arising from the importation of merchandise which violates any Federal, state and/or other laws or regulations and further agrees to indemnify and hold the Company harmless against any and all liability, loss, damages, costs, claims and/or expenses, including but not limited to attorney’s fees, which the Company may hereafter incur, suffer or be required to pay by reason of claims by any government agency or private party. In the event that any action, suit or proceeding is brought against the Company by any government agency or any private party, the Company shall give notice in writing to the Customer by mail at its address on file with the Company. Upon receipt of such notice, the Customer at its own expense shall defend against such action and take all steps as may be necessary or proper to prevent the obtaining of a judgment and/or order against the Company.</p><p>•17.&nbsp;<span style=\"font-weight: bolder;\">Loss, Damage or Expense Due to Delay</span>. Unless the services to be performed by the Company on behalf of the Customer are delayed by reason of the negligence or other fault of the Company, the Company shall not be responsible for any loss, damage or expense incurred by the Customer because of such delay. In the event the Company is at fault, as aforesaid, itsaa liability is limited in accordance with the provisions of paragraphs 8-9 above.</p><p>18.<span style=\"font-weight: bolder;\">&nbsp;Construction of Terms and Venue</span>. The foregoing terms and conditions shall be construed according to the laws of the State shown on the reverse side hereof. Unless otherwise consented to in writing by the Company, no legal proceeding against the Company may be instituted by the Customer, its assigns, or subrogee except in the City shown on the reverse side</p>', NULL, NULL, 'Active', 0, '2018-10-29', '2019-04-29', '6', NULL, NULL, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbldispatchticket`
--

DROP TABLE IF EXISTS `tbldispatchticket`;
CREATE TABLE IF NOT EXISTS `tbldispatchticket` (
  `intDispatchTicketID` int(11) NOT NULL AUTO_INCREMENT,
  `strDispatchTicketDesc` varchar(45) DEFAULT NULL,
  `boolCApprovedby` tinyint(4) NOT NULL,
  `boolAApprovedby` tinyint(4) NOT NULL,
  `strConsigneeSign` text,
  `strAdminSign` text,
  `boolDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intDispatchTicketID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbldispatchticket`
--

INSERT INTO `tbldispatchticket` (`intDispatchTicketID`, `strDispatchTicketDesc`, `boolCApprovedby`, `boolAApprovedby`, `strConsigneeSign`, `strAdminSign`, `boolDeleted`) VALUES
(6, NULL, 1, 1, '{\"lines\":[[[108,144],[109,144],[146,133],[168,127],[247,101],[246,98],[225,91],[187,87],[151,88],[136,93],[130,98],[130,99],[152,107],[197,115],[243,118],[279,119],[297,119],[299,119],[297,119],[264,126],[228,135],[182,151],[175,156],[175,157],[200,157],[240,157],[279,155],[286,155],[284,155],[276,155],[262,161],[260,161],[261,161],[267,161],[290,159],[300,155],[302,153],[305,151],[306,151],[311,152]]]}', '{\"lines\":[[[80,176],[81,176],[168,144],[177,135],[183,127],[189,115],[189,109],[185,108],[180,106],[172,105],[156,105],[146,105],[136,106],[134,108],[134,111],[137,114],[145,119],[178,134],[188,136],[201,138],[207,139],[215,139],[220,139],[226,138],[230,135],[234,132],[240,127],[245,122],[247,120],[247,118],[247,117],[247,116],[245,115],[242,114],[231,114],[226,114],[219,114],[213,115],[207,118],[204,121],[202,126],[202,127],[205,129],[217,130],[231,130],[260,130],[286,125],[306,121],[315,120],[318,119]]]}', NULL),
(7, NULL, 1, 1, '{\"lines\":[[[69,111],[86,96],[155,69],[303,40],[312,41],[314,43],[314,44],[306,49],[270,69],[237,103],[190,130],[163,153],[161,155],[166,155],[183,152],[225,145],[282,137],[333,126],[366,119],[368,119],[369,119],[352,131],[295,147],[284,149],[280,150],[281,150],[282,150],[285,146],[313,87],[340,55],[355,29],[359,22],[361,20],[362,21],[363,23],[379,62],[391,87],[414,152],[439,203],[454,228]]]}', '{\"lines\":[[[104,183],[107,173],[112,168],[148,113],[151,106],[149,101],[139,96],[127,92],[124,92],[122,94],[121,94],[121,96],[121,100],[121,109],[125,117],[135,124],[159,121],[175,105],[205,82],[232,32],[234,24],[234,21],[233,21],[231,21],[226,21],[217,27],[205,54],[200,83],[200,101],[208,113],[223,114],[241,101],[273,80],[296,56],[307,36],[307,31],[304,28],[292,24],[278,23],[266,27],[257,37],[250,70],[249,85],[249,106],[253,109],[325,74],[363,52]]]}', NULL),
(8, NULL, 1, 1, '{\"lines\":[[[44,147],[45,146],[49,141],[71,115],[88,91],[99,70],[99,65],[98,67],[96,73],[91,102],[91,121],[91,127],[91,130],[95,130],[103,130],[115,120],[125,107],[126,106],[126,107],[126,108],[123,115],[117,127],[91,164],[80,176],[76,177],[76,173],[76,164],[78,137],[83,129],[89,119],[92,116],[93,115],[94,115],[97,115],[106,138],[116,156],[118,159],[121,160],[125,158],[137,137],[155,97],[176,53],[194,19],[198,10],[200,8],[197,34],[193,67],[191,97],[190,111],[190,117],[190,119],[193,119],[203,110],[211,99],[215,95],[215,96],[215,101],[210,126],[206,152],[206,158],[207,156],[217,144],[222,138],[225,136],[228,162],[237,193],[242,206],[242,208],[243,208],[245,198],[248,168],[249,118],[249,79],[247,71],[237,63],[224,62],[208,67],[205,69],[188,88],[176,115],[166,147],[166,159],[173,168],[200,173],[230,173],[263,162],[285,151],[317,128],[334,109],[334,112],[332,117],[323,137],[319,145],[319,146],[319,145],[321,143],[328,134],[331,132],[333,132],[335,132],[337,134],[340,143],[343,148],[347,150],[351,150],[361,145],[390,128],[415,111],[425,105],[428,104]]]}', '{\"lines\":[[[155,14.2],[155,20.2],[155,39.2],[155,62.2],[157,82.2],[161,99.2],[175,111.2],[189,118.2],[210,127.2],[218,131.2],[220,134.2],[220,135.2],[220,136.2],[205,138.2],[182,143.2],[148,139.2],[136,134.2],[130,129.2],[128,127.2],[127,124.2],[128,124.2],[158,120.2],[197,115.2],[240,111.2],[273,107.2],[299,100.2],[327,91.2],[336,83.2],[340,76.2],[336,67.2],[326,59.2],[300,47.2],[276,43.2],[271,47.2],[265,54.2],[262,60.2],[260,77.2],[260,87.2],[260,95.2],[260,99.2],[260,103.2],[260,116.2],[260,141.2]]]}', NULL),
(9, NULL, 1, 1, '{\"lines\":[[[273,142],[282,138],[301,124],[290,43],[285,43],[261,49],[239,68],[234,74],[232,77],[232,84],[237,107],[246,122],[258,129],[272,129],[278,129],[292,124],[323,108],[334,105],[355,107],[370,113],[373,115],[214,147],[151,147],[115,147],[108,147],[107,147],[107,146],[107,144],[114,138],[142,130],[188,121],[324,118],[409,120],[454,122],[463,123]]]}', '{\"lines\":[[[21,160.8],[26,155.8],[36,148.8],[71,127.8],[106,111.8],[138,97.8],[150,92.8],[166,83.8],[171,80.8],[172,78.8],[175,77.8],[176,76.8],[177,75.8],[177,74.8],[177,73.8],[177,72.8],[176,72.8],[167,70.8],[157,69.8],[133,69.8],[112,72.8],[100,76.8],[92,79.8],[85,83.8],[80,87.8],[79,92.8],[78,94.8],[78,96.8],[88,98.8],[105,100.8],[137,103.8],[192,110.8],[206,112.8],[216,117.8],[217,120.8],[217,122.8],[214,127.8],[201,133.8],[188,138.8],[177,140.8],[164,140.8],[151,140.8],[146,140.8],[144,136.8],[146,134.8],[159,124.8],[189,106.8],[252,75.8],[300,48.8],[306,42.8],[307,40.8],[307,39.8],[305,39.8],[293,41.8],[278,56.8],[272,68.8],[265,87.8],[265,96.8],[265,100.8],[266,103.8],[275,109.8],[292,110.8],[296,110.8],[300,109.8],[300,105.8],[296,96.8],[291,86.8],[287,82.8],[285,81.8],[284,81.8],[284,83.8],[292,96.8],[297,110.8],[302,123.8],[303,126.8],[303,131.8],[303,133.8],[301,132.8],[301,128.8],[300,126.8],[300,112.8],[299,110.8],[299,104.8],[299,104.8],[302,109.8],[305,120.8],[308,125.8],[312,131.8],[312,132.8],[313,133.8],[314,133.8],[315,132.8],[320,127.8],[323,124.8],[324,124.8],[325,124.8],[327,124.8],[336,130.8],[338,131.8],[341,132.8],[343,134.8]]]}', NULL),
(10, NULL, 0, 0, NULL, NULL, NULL),
(11, NULL, 0, 0, NULL, NULL, NULL),
(12, NULL, 0, 0, NULL, NULL, NULL),
(13, NULL, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblemployee`
--

DROP TABLE IF EXISTS `tblemployee`;
CREATE TABLE IF NOT EXISTS `tblemployee` (
  `intEmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `intECompanyID` int(11) DEFAULT NULL,
  `intEPositionID` int(11) NOT NULL,
  `intETeamID` int(11) DEFAULT NULL,
  `enumEmpType` enum('Regular','Reserved','On Call') DEFAULT NULL,
  `strFName` varchar(45) NOT NULL,
  `strMName` varchar(45) DEFAULT NULL,
  `strLName` varchar(45) NOT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `boolDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intEmployeeID`),
  KEY `fk_tblEmployee_tblPosition1_idx` (`intEPositionID`),
  KEY `fk_tblEmployee_tblTeam1_idx` (`intETeamID`),
  KEY `fk_tblemployee_tblcompany1_idx` (`intECompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblemployee`
--

INSERT INTO `tblemployee` (`intEmployeeID`, `intECompanyID`, `intEPositionID`, `intETeamID`, `enumEmpType`, `strFName`, `strMName`, `strLName`, `isActive`, `boolDeleted`) VALUES
(1, 1, 1, 1, 'Regular', 'Reign Emmanuel', 'Orillosa', 'Malto', 1, 0),
(2, 1, 2, 1, 'Regular', 'Levie Anne', 'Tan', 'Mariñas', 1, 0),
(3, 1, 3, 1, 'Regular', 'John Carlos', 'Estrada', 'Pagaduan', 1, 0),
(4, 1, 3, 1, 'Regular', 'Joshua', 'Jamarolin', 'Ganila', 1, 0),
(5, 1, 1, 2, 'Regular', 'Ben Hur Adrian Raphael', 'Grita', 'Tolentino', 1, 0),
(6, 1, 2, 2, 'Regular', 'Kristine Mae', NULL, 'Gamayo', 1, 0),
(7, 1, 3, 2, 'Regular', 'Jerevon', NULL, 'Carreon', 1, 0),
(8, 1, 3, 2, 'Regular', 'Keynie Mae', NULL, 'Orial', 1, 0),
(9, 2, 6, 3, 'Regular', 'Shirley Anne', 'Valencia', 'Tianan', 1, 0),
(10, 2, 7, 3, 'Regular', 'Michael', 'Dion', 'Villanueva', 1, 0),
(11, 2, 8, 3, 'Regular', 'Daniel', 'Benitez', 'Suello', 1, 0),
(12, 2, 8, 3, 'Regular', 'Bern Paul', 'Dela Cruz', 'San Diego', 1, 0),
(13, 1, 6, 4, 'Regular', 'John Carlo', 'Sy', 'Doronila', 1, 0),
(14, 1, 7, 4, 'Regular', 'John Homer', NULL, 'Cadena', 1, 0),
(15, 1, 8, 4, 'Regular', 'Danielle Nicole', 'Jordan', 'Casadores', 1, 0),
(16, 1, 8, 4, 'Regular', 'Vince Miguel', NULL, 'Oreta', 1, 0),
(17, 2, 8, 5, 'Regular', 'Sherwin', NULL, 'Aydalla', 1, 0),
(18, 2, 8, 5, 'Regular', 'Fritz Jerold', NULL, 'Santuico', 1, 0),
(19, 2, 7, 5, 'Regular', 'Gramar', NULL, 'Lacsina', 1, 0),
(20, 2, 6, 5, 'Regular', 'Froilan Sam', NULL, 'Malibiran', 1, 0),
(21, 1, 1, 6, 'Regular', 'Princes Joi', NULL, 'Isaac', 1, 0),
(22, 1, 2, 6, 'Regular', 'Matthew James', NULL, 'Victore', 1, 0),
(23, 1, 3, 6, 'Regular', 'Angelito', NULL, 'Casasis', 1, 0),
(24, 1, 3, 6, 'Regular', 'Reannie Danielle', NULL, 'Exiomo', 1, 0),
(25, 1, 1, NULL, 'Regular', 'Gloria', 'de Leon', 'Orillosa', 1, 0),
(26, 1, 2, NULL, 'Regular', 'Amalia', 'Orillosa', 'Bacar', 1, 0),
(28, 1, 13, NULL, 'Regular', 'Maria Cristina', 'Orillosa', 'Traballo', 1, 0),
(29, 1, 4, NULL, 'Regular', 'Ma. Lourdes', 'Orillosa', 'Mustapha', 1, 0),
(30, 1, 5, NULL, 'Regular', 'Marina', 'de Leon', 'Orillosa', 1, 0),
(31, 1, 3, NULL, 'Regular', 'Esperanza', 'Orillosa', 'Malto', 1, 0),
(32, 1, 3, NULL, 'Regular', 'Virginia', 'Orillosa', 'Madria', 1, 0),
(33, 1, 1, NULL, 'Regular', 'Algien', 'Orillosa', 'Orillosa', 1, 0),
(34, 1, 2, NULL, 'Regular', 'Aleksei Nikholai', 'Orillosa', 'Bacar', 1, 0),
(35, 1, 13, NULL, 'Regular', 'Esther Ma. Chronicles', 'Orillosa', 'Traballo', 1, 0),
(36, 1, 4, NULL, 'Regular', 'Aeshiera Nedriane', 'Orillosa', 'Bacar', 1, 0),
(37, 1, 5, NULL, 'Regular', 'Rhegynna', 'Orillosa', 'Mustapha', 1, 0),
(38, 1, 12, NULL, 'Regular', 'Rheigñer', 'Orillosa', 'Mustapha', 1, 0),
(39, 1, 3, NULL, 'Regular', 'Vince Ace', 'Orillosa', 'Madria', 1, 0),
(40, 1, 3, NULL, 'Regular', 'Chrysdane', 'Orillosa', 'Madria', 1, 0),
(41, 2, 7, 8, 'Regular', 'Mariecar', NULL, 'Oriel', 1, 0),
(42, 2, 6, 8, 'Regular', 'Jillmarie', NULL, 'Inocencio', 1, 0),
(43, 2, 8, 8, 'Regular', 'Jenhel', NULL, 'Santos', 1, 0),
(44, 2, 8, 8, 'Regular', 'Abigail', NULL, 'Del Rosario', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblfinalcontractfeesmatrix`
--

DROP TABLE IF EXISTS `tblfinalcontractfeesmatrix`;
CREATE TABLE IF NOT EXISTS `tblfinalcontractfeesmatrix` (
  `intFinalContractFeesID` int(11) NOT NULL AUTO_INCREMENT,
  `intFCFContractListID` int(11) DEFAULT NULL,
  `enumFCFServiceType` enum('Hauling','Tug Assist') CHARACTER SET latin1 DEFAULT NULL,
  `fltFCFStandardRate` float DEFAULT NULL,
  `fltFCFTugboatDelayFee` float DEFAULT NULL,
  `fltFCFViolationFee` float DEFAULT NULL,
  `fltFCFConsigneeLateFee` float DEFAULT NULL,
  `fltFCFMinDamageFee` float DEFAULT NULL,
  `fltFCFMaxDamageFee` float DEFAULT NULL,
  `intFCFDiscountFee` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`intFinalContractFeesID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblfinalcontractfeesmatrix`
--

INSERT INTO `tblfinalcontractfeesmatrix` (`intFinalContractFeesID`, `intFCFContractListID`, `enumFCFServiceType`, `fltFCFStandardRate`, `fltFCFTugboatDelayFee`, `fltFCFViolationFee`, `fltFCFConsigneeLateFee`, `fltFCFMinDamageFee`, `fltFCFMaxDamageFee`, `intFCFDiscountFee`) VALUES
(1, 1, 'Hauling', 2000, 1000, 1000, 1000, 3000, 5000, 20),
(2, 1, 'Tug Assist', 1000, 2000, 2000, 1000, 2000, 4000, 20),
(3, 2, 'Hauling', 2000, 1000, 1000, 1000, 3000, 5000, 1),
(4, 2, 'Tug Assist', 1000, 2000, 2000, 1000, 2000, 4000, 1),
(5, 3, 'Hauling', 2000, 1000, 1000, 1000, 3000, 5000, 20),
(6, 3, 'Tug Assist', 1000, 2000, 2000, 1000, 2000, 4000, 20),
(7, 6, 'Hauling', 2000, 1000, 1000, 1000, 3000, 5000, 10),
(8, 6, 'Tug Assist', 2000, 2000, 2000, 1000, 2000, 4000, 10),
(9, 7, 'Hauling', 2000, 1000, 1000, 1000, 3000, 5000, 20),
(10, 7, 'Tug Assist', 1000, 2000, 2000, 1000, 2000, 4000, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tblgoods`
--

DROP TABLE IF EXISTS `tblgoods`;
CREATE TABLE IF NOT EXISTS `tblgoods` (
  `intGoodsID` int(11) NOT NULL AUTO_INCREMENT,
  `strGoodsName` varchar(45) DEFAULT NULL,
  `fltRateperTon` float DEFAULT NULL,
  `fltGoodWeight` float DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `boolDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intGoodsID`),
  UNIQUE KEY `strGoodsName` (`strGoodsName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblgoods`
--

INSERT INTO `tblgoods` (`intGoodsID`, `strGoodsName`, `fltRateperTon`, `fltGoodWeight`, `isActive`, `boolDeleted`) VALUES
(1, 'Cooking Oil', 500, NULL, 1, 0),
(2, 'Metal Rolls', 500, NULL, 1, 0),
(3, 'Gravel', 700, NULL, 1, 0),
(4, 'Diesel', 700, NULL, 1, 0),
(5, 'Red Sand', 200, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblhauling`
--

DROP TABLE IF EXISTS `tblhauling`;
CREATE TABLE IF NOT EXISTS `tblhauling` (
  `intHaulingID` int(11) NOT NULL AUTO_INCREMENT,
  `intHJobSchedID` int(11) DEFAULT NULL,
  `intHLocationID` int(11) DEFAULT NULL,
  `intHServicesID` int(11) DEFAULT NULL,
  `intHAttachmentsID` int(11) DEFAULT NULL,
  `strHaulingDesc` varchar(45) DEFAULT NULL,
  `strDestinationPoint` varchar(45) DEFAULT NULL,
  `enumStatus` enum('Ongoing','Finished','Cancelled') DEFAULT NULL,
  `strPermitsAttachments` varchar(45) DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intHaulingID`),
  KEY `fk_tblDelivery_tblServices1_idx` (`intHServicesID`),
  KEY `fk_tblHauling_tblLocation1_idx` (`intHLocationID`),
  KEY `fk_tblHauling_tblAttachments1_idx` (`intHAttachmentsID`),
  KEY `fk_tblhauling_tbljobsched` (`intHJobSchedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoice`
--

DROP TABLE IF EXISTS `tblinvoice`;
CREATE TABLE IF NOT EXISTS `tblinvoice` (
  `intInvoiceID` int(11) NOT NULL,
  `intIDispatchTicketID` int(11) DEFAULT NULL,
  `intDTCompanyID` int(11) DEFAULT NULL,
  `intIBillID` int(11) NOT NULL,
  `enumStatus` enum('Processing','Paid','Rejected','Pending') NOT NULL,
  `strInvoiceDesc` varchar(45) DEFAULT NULL,
  `fltBalanceRemain` float DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intInvoiceID`),
  KEY `fk_tblInvoice_tblDispatchTicket1_idx` (`intIDispatchTicketID`),
  KEY `fk_tblInvoice_tblCompany1_idx` (`intDTCompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblinvoice`
--

INSERT INTO `tblinvoice` (`intInvoiceID`, `intIDispatchTicketID`, `intDTCompanyID`, `intIBillID`, `enumStatus`, `strInvoiceDesc`, `fltBalanceRemain`, `boolDeleted`) VALUES
(1, 6, 3, 1, 'Processing', 'processed', 53800, 0),
(2, 9, 33, 2, 'Processing', 'processed', 900, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbljoborder`
--

DROP TABLE IF EXISTS `tbljoborder`;
CREATE TABLE IF NOT EXISTS `tbljoborder` (
  `intJobOrderID` int(11) NOT NULL AUTO_INCREMENT,
  `strJOTitle` text,
  `strJODesc` varchar(45) DEFAULT NULL,
  `intJOBerthID` int(11) DEFAULT NULL,
  `strJOStartPoint` varchar(45) DEFAULT NULL,
  `strJODestination` varchar(45) DEFAULT NULL,
  `intJOBargeID` int(11) DEFAULT NULL,
  `intJOGoodsID` int(11) DEFAULT NULL,
  `intJOCompanyID` int(11) DEFAULT NULL,
  `intJOttachmentsID` int(11) DEFAULT NULL,
  `strJOVesselName` varchar(45) NOT NULL,
  `dtmETA` datetime DEFAULT NULL,
  `dtmETD` datetime DEFAULT NULL,
  `enumStatus` enum('Created','Pending','Accepted','Ready','Ready To Haul','Forwarded','For Rescheduling','Declined','Scheduled','Ongoing','Voided') DEFAULT NULL,
  `fltWeight` float DEFAULT NULL,
  `intJOVesselTypeID` int(11) DEFAULT NULL,
  `enumServiceType` enum('Hauling','Tug Assist','Salvage') DEFAULT NULL,
  `datStartDate` date DEFAULT NULL,
  `datEndDate` date DEFAULT NULL,
  `tmStart` time DEFAULT NULL,
  `tmEnd` time DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strRemarks` text,
  PRIMARY KEY (`intJobOrderID`,`strJOVesselName`),
  KEY `fk_tblSchedule_tblAttachments1_idx` (`intJOttachmentsID`),
  KEY `fk_tblSchedule_tblBarge1_idx` (`intJOBargeID`),
  KEY `fk_tblSchedule_tblCompany1_idx` (`intJOCompanyID`),
  KEY `fk_tblSchedule_tblBerth1` (`intJOBerthID`),
  KEY `fk_tblJoborder_tblGoods1_idx` (`intJOGoodsID`),
  KEY `fk_tblJoborder_tblVesselType1_idx` (`intJOVesselTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbljoborder`
--

INSERT INTO `tbljoborder` (`intJobOrderID`, `strJOTitle`, `strJODesc`, `intJOBerthID`, `strJOStartPoint`, `strJODestination`, `intJOBargeID`, `intJOGoodsID`, `intJOCompanyID`, `intJOttachmentsID`, `strJOVesselName`, `dtmETA`, `dtmETD`, `enumStatus`, `fltWeight`, `intJOVesselTypeID`, `enumServiceType`, `datStartDate`, `datEndDate`, `tmStart`, `tmEnd`, `boolDeleted`, `created_at`, `updated_at`, `strRemarks`) VALUES
(1, 'Donn JO', NULL, 3, 'Sta. Mesa, Manila', NULL, NULL, 2, 3, NULL, 'MT Alejandro', NULL, NULL, '', 300, NULL, 'Hauling', '2018-10-26', '2018-10-27', '08:00:00', '10:00:00', 0, '2018-10-26 23:06:05', '2018-10-26 23:06:05', NULL),
(2, 'Homie JO', 'nye', 1, '', 'Pandacan Manila', NULL, 1, 3, NULL, 'MT Buko', NULL, NULL, 'Ongoing', 500, NULL, 'Hauling', '2018-10-26', '2018-10-27', '15:00:00', '06:00:00', 0, '2018-10-26 23:08:07', '2018-10-26 23:08:07', NULL),
(4, 'Testing JO', 'Testing mo to', 5, 'asd', NULL, NULL, NULL, 3, NULL, 'MT Everest', NULL, NULL, '', 17, 2, 'Hauling', '2018-10-29', '2018-10-29', '03:15:00', '10:15:00', 0, '2018-10-26 23:18:06', '2018-10-26 23:18:06', NULL),
(12, 'Job Sample', 'Asd', 6, NULL, 'asd', NULL, 1, 33, NULL, 'adasd', NULL, NULL, '', 20, NULL, 'Hauling', '2018-10-30', '2018-11-02', '00:00:00', '03:00:00', 0, '2018-10-29 02:56:17', '2018-10-29 02:56:17', NULL),
(13, 'Job Order 2', 'asdf', NULL, 'Manila', 'Pandaca', NULL, 4, 33, NULL, 'E', NULL, NULL, 'Ongoing', 20, NULL, 'Hauling', '2018-10-31', '2018-11-02', '00:00:00', '02:59:00', 0, '2018-10-29 02:59:04', '2018-10-29 02:59:04', NULL),
(14, 'Job Order', 'qwe', 3, NULL, 'qwe', NULL, 3, 33, NULL, 'EE', NULL, NULL, '', 23, NULL, 'Hauling', '2018-10-30', '2018-11-02', '01:00:00', '02:00:00', 0, '2018-10-29 03:01:04', '2018-10-29 03:01:04', NULL),
(15, 'JO testing 2', 'Eyyyyy', 1, NULL, 'Pandacan, Manila', NULL, 2, 33, NULL, 'MT Heneral Luna Hauling', NULL, NULL, 'Ongoing', 3200, NULL, 'Hauling', '2018-10-29', '2018-10-29', '19:00:00', '20:00:00', 0, '2018-10-29 03:35:45', '2018-10-29 03:35:45', NULL),
(16, 'Job Order New 1', 'New', 3, NULL, 'Manila', NULL, 1, 33, NULL, 'Energy Vessel', NULL, NULL, 'Scheduled', 20, NULL, 'Hauling', '2018-10-29', '2018-10-30', '20:00:00', '05:00:00', 0, '2018-10-29 04:05:17', '2018-10-29 04:05:17', NULL),
(17, 'Job Order New 2', 'aqwe', 9, NULL, 'Pandacam', NULL, 3, 33, NULL, 'Enrgy 2', NULL, NULL, 'Ongoing', 20, NULL, 'Hauling', '2018-10-29', '2018-10-31', '20:05:00', '22:05:00', 0, '2018-10-29 04:06:11', '2018-10-29 04:06:11', NULL),
(18, 'Job Order Test 1', 'oct 31 9am', 9, NULL, 'Manila', NULL, 2, 33, NULL, 'Vessel Sample', NULL, NULL, 'Ongoing', 200, NULL, 'Hauling', '2018-10-30', '2018-10-31', '09:00:00', '09:00:00', 0, '2018-10-29 04:15:58', '2018-10-29 04:15:58', NULL),
(19, 'Job Order Test 2', 'Nov 2 9 am', 6, NULL, 'Manila', NULL, 3, 33, NULL, 'Vessel 2', NULL, NULL, 'Ready', 30, NULL, 'Hauling', '2018-11-02', '2018-11-03', '09:00:00', '09:00:00', 0, '2018-10-29 04:17:48', '2018-10-29 04:17:48', NULL),
(20, 'Job Order New 3', 'Nov 15 9 am', 5, NULL, 'Manila', NULL, 3, 33, NULL, 'Vessel 3', NULL, NULL, 'Ready', 300, NULL, 'Hauling', '2018-11-15', '2018-11-15', '09:00:00', '09:30:00', 0, '2018-10-29 04:19:25', '2018-10-29 04:19:25', NULL),
(21, 'Job Order Test 4', 'Nov 15 9 30 am', 5, NULL, 'Manila', NULL, 2, 33, NULL, 'asd', NULL, NULL, 'Ready', 300, NULL, 'Hauling', '2018-11-15', '2018-11-16', '09:30:00', '20:30:00', 0, '2018-10-29 04:21:12', '2018-10-29 04:21:12', NULL),
(22, 'AA', 'October 30', 8, NULL, 'Manila', NULL, 3, 33, NULL, 'Vessel 6', NULL, NULL, 'Voided', 300, NULL, 'Hauling', '2018-10-30', '2018-11-02', '09:00:00', '12:00:00', 0, '2018-10-29 04:33:12', '2018-10-29 04:33:12', 'Good Day!\nWe humbly ask for your kind consideration, your desired Team or Tugboat is Unavailable for the schedule you requested,\nyour desired Team or Tugboat will be available at an ET (Estimated Time) of 11-10-2018 00:00:00,\nwe kindly offer that you recreate this joborder at this given time, looking forward to Serving you'),
(23, 'Job Order Title Testing 2', 'neol bomyeon jakku ireoke tto', 1, NULL, 'Pandacan, Manila', NULL, 1, 3, NULL, 'MT Space Sirius', NULL, NULL, 'Voided', 3200, NULL, 'Hauling', '2018-11-05', '2018-11-05', '13:00:00', '15:00:00', 1, '2018-11-04 19:03:40', '2018-11-04 19:03:40', 'Good Day!\nWe humbly ask for your kind consideration, your desired Team or Tugboat is Unavailable for the schedule you requested,\nyour desired Team or Tugboat will be available at an ET (Estimated Time) of MM-DD-YYYY --:--:--,\nwe kindly offer that you recreate this joborder at this given time, looking forward to Serving you.'),
(24, 'Hauling Sample 001', 'Sample 001', NULL, 'Pandacan', 'Sta. Mesa', NULL, 1, 3, NULL, 'Vessel 001', NULL, NULL, 'Voided', 200, NULL, 'Hauling', '2018-11-06', '2018-11-08', '14:00:00', '23:00:00', 0, '2018-11-05 22:50:05', '2018-11-05 22:50:05', 'Good Day!\nWe humbly ask for your kind consideration, your desired Team or Tugboat is Unavailable for the schedule you requested,\nyour desired Team or Tugboat will be available at an ET (Estimated Time) of 11-06-2018\nwe kindly offer that you recreate this joborder at this given time, looking forward to Serving you'),
(25, 'Testing Jo', 'Walang Kwenta', 1, NULL, NULL, NULL, NULL, 3, NULL, 'MT Alps', NULL, NULL, 'Voided', 3500, 1, 'Tug Assist', '2018-11-06', '2018-11-06', '15:00:00', '18:00:00', 0, '2018-11-05 23:17:11', '2018-11-05 23:17:11', 'Good Day!\nWe humbly ask for your kind consideration, your desired Team or Tugboat is Unavailable for the schedule you requested,\nyour desired Team or Tugboat will be available at an ET (Estimated Time) of MM-DD-YYYY --:--:--,\nwe kindly offer that you recreate this joborder at this given time, looking forward to Serving you');

-- --------------------------------------------------------

--
-- Table structure for table `tbljoborderforwardrequests`
--

DROP TABLE IF EXISTS `tbljoborderforwardrequests`;
CREATE TABLE IF NOT EXISTS `tbljoborderforwardrequests` (
  `intJOForwardRequestsID` int(11) NOT NULL AUTO_INCREMENT,
  `intJOFRJobOrderID` int(11) DEFAULT NULL,
  `intJOFRForwardCompanyID` int(11) DEFAULT NULL,
  `strJOFRDescription` text,
  `strRequestCompanyName` varchar(45) DEFAULT NULL,
  `enumStatus` enum('Pending','Accepted','Scheduled','Ready','Ready To Haul','Declined') DEFAULT 'Pending',
  `boolDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intJOForwardRequestsID`),
  KEY `fk_tblJOForwardRequests_tblJobOrder1_idx` (`intJOFRJobOrderID`),
  KEY `fk_tblJOForwardRequests_tblCompany1_idx` (`intJOFRForwardCompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbljobsched`
--

DROP TABLE IF EXISTS `tbljobsched`;
CREATE TABLE IF NOT EXISTS `tbljobsched` (
  `intJobSchedID` int(11) NOT NULL AUTO_INCREMENT,
  `intJSJobOrderID` int(11) DEFAULT NULL,
  `intJSSchedID` int(11) DEFAULT NULL,
  `intJSTugboatAssignID` int(11) DEFAULT NULL,
  `intJSTugboatID` int(11) DEFAULT NULL,
  `intJSTeamID` int(11) DEFAULT NULL,
  `enumStatus` enum('Pending','Ongoing','Delayed','Finished') DEFAULT 'Pending',
  `tmStarted` time DEFAULT NULL,
  `tmEnded` time DEFAULT NULL,
  `dateStarted` date DEFAULT NULL,
  `dateEnded` date DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  `intJSDispatchTicketID` int(11) DEFAULT NULL,
  `strJSCompanyAssigned` varchar(45) DEFAULT NULL,
  `isDelayed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intJobSchedID`),
  KEY `fk_tbljobsched_tbljoborder` (`intJSJobOrderID`),
  KEY `fk_tbljobsched_tblschedule` (`intJSSchedID`),
  KEY `fk_tbljobsched_tbltugboatassign` (`intJSTugboatAssignID`),
  KEY `fk_tbljobsched_tbltugboat_idx` (`intJSTugboatID`),
  KEY `fk_tbljobsched_tblteam_idx` (`intJSTeamID`),
  KEY `fk_tbljobsched_tbldispatchticket1_idx` (`intJSDispatchTicketID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbljobsched`
--

INSERT INTO `tbljobsched` (`intJobSchedID`, `intJSJobOrderID`, `intJSSchedID`, `intJSTugboatAssignID`, `intJSTugboatID`, `intJSTeamID`, `enumStatus`, `tmStarted`, `tmEnded`, `dateStarted`, `dateEnded`, `boolDeleted`, `intJSDispatchTicketID`, `strJSCompanyAssigned`, `isDelayed`) VALUES
(1, 1, 1, 2, 2, 8, 'Finished', '08:37:00', '09:03:00', '2018-10-27', '2018-10-27', 0, 7, NULL, 0),
(2, 4, 2, 2, 2, 4, 'Finished', '08:26:00', '17:29:00', '2018-10-28', '2018-10-29', 0, 6, NULL, 0),
(3, 4, 2, 4, 4, 1, 'Finished', '08:26:00', '17:29:00', '2018-10-28', '2018-10-29', 0, 6, NULL, 0),
(4, 2, 3, 5, 5, NULL, 'Ongoing', '08:48:00', NULL, '2018-10-27', NULL, 0, 8, NULL, 1),
(8, 13, 5, 2, 2, NULL, 'Ongoing', '11:20:00', NULL, '2018-11-06', NULL, 0, 13, NULL, 1),
(9, 12, 6, 2, 2, 2, 'Finished', '01:00:00', '03:00:00', '2018-10-29', '2018-10-29', 0, 8, NULL, 0),
(10, 12, 6, 4, 4, 3, 'Finished', '01:00:00', '03:00:00', '2018-10-29', '2018-10-29', 0, 8, NULL, 0),
(11, 14, 7, 5, 5, 4, 'Finished', '19:08:00', '19:43:00', '2018-10-29', '2018-10-29', 0, 9, NULL, 0),
(12, 15, 8, 2, 2, 6, 'Ongoing', '19:39:00', NULL, '2018-10-29', NULL, 0, 10, NULL, 0),
(13, 15, 8, 4, 4, 1, 'Ongoing', '19:39:00', NULL, '2018-10-29', NULL, 0, 10, NULL, 0),
(14, 17, 9, 2, 2, 6, 'Ongoing', '20:09:00', NULL, '2018-10-29', NULL, 0, 11, NULL, 0),
(15, 17, 9, 4, 4, 2, 'Ongoing', '20:09:00', NULL, '2018-10-29', NULL, 0, 11, NULL, 0),
(16, 19, 10, 4, 4, 2, 'Pending', NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
(17, 20, 11, 1, 1, 1, 'Pending', NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
(18, 20, 12, 4, 4, 2, 'Pending', NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
(19, 21, 13, 2, 2, 6, 'Pending', NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
(20, 18, 14, 2, 2, NULL, 'Ongoing', '20:31:00', NULL, '2018-10-29', NULL, 0, 12, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbllocation`
--

DROP TABLE IF EXISTS `tbllocation`;
CREATE TABLE IF NOT EXISTS `tbllocation` (
  `intLocationID` int(11) NOT NULL AUTO_INCREMENT,
  `intLDispatchTicketID` int(11) DEFAULT NULL,
  `strLocationDesc` text,
  `strLocation` varchar(45) DEFAULT NULL,
  `tmLocationTime` time DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intLocationID`),
  KEY `fk_tbllocation_tbldispatchticket1_idx` (`intLDispatchTicketID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbllocation`
--

INSERT INTO `tbllocation` (`intLocationID`, `intLDispatchTicketID`, `strLocationDesc`, `strLocation`, `tmLocationTime`, `boolDeleted`) VALUES
(3, 1, 'Waiting For Vessel to Enter the Bay', 'Manila Bay, Break Waters', '10:36:00', NULL),
(4, 1, 'Arriving to Pier 15', 'Inside South Harbor', '10:37:00', NULL),
(5, 2, 'asd', 'AAS', '06:14:00', NULL),
(6, 3, 'qwer', 'qwer', '09:26:00', NULL),
(7, 5, 'Waiting for Vessel to enter the bay', 'Manila Bay Break Waters', '15:52:00', NULL),
(8, 6, NULL, 'Manila', '08:27:00', NULL),
(9, 6, 'asd', 'Here at seashore atm', '17:29:00', NULL),
(10, 7, 'sample', 'Location 1', '08:37:00', NULL),
(11, 8, 'Start na mam ser', 'Pandacan', '19:09:00', NULL),
(12, 8, 'Dito na pu', 'Manila hihi', '22:01:00', NULL),
(13, 10, 'Hindi po', 'Pandak ka', '19:39:00', NULL),
(14, 9, 'Ilaw', 'Sa Ilalim ng Puting', '19:42:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblothersteamcomp`
--

DROP TABLE IF EXISTS `tblothersteamcomp`;
CREATE TABLE IF NOT EXISTS `tblothersteamcomp` (
  `intOTeamCompID` int(11) NOT NULL,
  `intOTeamCompPositionID` int(11) DEFAULT NULL,
  `intOTCTeamCompID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intOTeamCompID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpayment`
--

DROP TABLE IF EXISTS `tblpayment`;
CREATE TABLE IF NOT EXISTS `tblpayment` (
  `intPaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `intPCompanyID` int(11) DEFAULT NULL,
  `enumPaymentType` enum('Cash','Cheque','Bank Deposit') DEFAULT NULL,
  `strPaymentDesc` varchar(45) DEFAULT NULL,
  `strBankName` varchar(45) DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intPaymentID`),
  KEY `fk_tblPayment_tblCompany1_idx` (`intPCompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblpier`
--

DROP TABLE IF EXISTS `tblpier`;
CREATE TABLE IF NOT EXISTS `tblpier` (
  `intPierID` int(11) NOT NULL AUTO_INCREMENT,
  `strPierName` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `boolDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intPierID`),
  UNIQUE KEY `strPierName` (`strPierName`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblpier`
--

INSERT INTO `tblpier` (`intPierID`, `strPierName`, `isActive`, `boolDeleted`) VALUES
(1, 'Pier 3', 1, 0),
(2, 'Pier 5', 1, 0),
(3, 'Pier 9', 1, 0),
(4, 'Pier 12', 1, 0),
(5, 'Pier 4', 1, 0),
(6, 'Pier 151', 1, 1),
(7, 'Pier 10', 1, 0),
(8, 'Pier 65', 1, 1),
(9, 'Pier 2', 1, 0),
(10, 'Pier 19', 1, 0),
(11, 'Pier 18', 1, 0),
(15, 'Pier 20', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblpierhistory`
--

DROP TABLE IF EXISTS `tblpierhistory`;
CREATE TABLE IF NOT EXISTS `tblpierhistory` (
  `intPierHistoryID` int(11) NOT NULL,
  `strPHPierName` varchar(45) DEFAULT NULL,
  `intPHPierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intPierHistoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblposition`
--

DROP TABLE IF EXISTS `tblposition`;
CREATE TABLE IF NOT EXISTS `tblposition` (
  `intPositionID` int(11) NOT NULL AUTO_INCREMENT,
  `strPositionName` varchar(45) DEFAULT NULL,
  `intPCompanyID` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `boolDeleted` tinyint(1) DEFAULT '0',
  `intPositionCompNum` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intPositionID`),
  UNIQUE KEY `strPositionName` (`strPositionName`,`intPCompanyID`),
  KEY `fk_tblPosition_tblCompany1_idx` (`intPCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblposition`
--

INSERT INTO `tblposition` (`intPositionID`, `strPositionName`, `intPCompanyID`, `isActive`, `boolDeleted`, `intPositionCompNum`) VALUES
(1, 'Captain', 1, 1, 0, 1),
(2, 'Chief Engineer', 1, 1, 0, 1),
(3, 'Crew', 1, 1, 0, 2),
(4, 'First Mate', 1, 1, 0, 1),
(5, 'Second Mate', 1, 1, 0, 1),
(6, 'Captain', 2, 1, 0, 1),
(7, 'Chief Engineer', 2, 1, 0, 1),
(8, 'Crew', 2, 1, 0, 2),
(9, 'First Mate', 2, 1, 0, 0),
(10, 'Second Mate', 2, 1, 0, 0),
(11, 'Marine Engineer', 2, 1, 0, 0),
(12, 'Chief Marine Engineer', 1, 1, 0, 1),
(13, 'Marine Engineer', 1, 1, 0, 0),
(14, 'Third Mate', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblpostbillingticket`
--

DROP TABLE IF EXISTS `tblpostbillingticket`;
CREATE TABLE IF NOT EXISTS `tblpostbillingticket` (
  `intPostBillingTicketID` int(11) NOT NULL AUTO_INCREMENT,
  `intPBTAgreementID` int(11) DEFAULT NULL,
  `intPBTGoodsID` int(11) DEFAULT NULL,
  `intPBTDispatchTicketID` int(11) DEFAULT NULL,
  `intPBTPaymentID` int(11) DEFAULT NULL,
  `intPBTInvoiceID` int(11) DEFAULT NULL,
  `fltAdditionalCharges` float DEFAULT NULL,
  `strBillingHistory` varchar(45) DEFAULT NULL,
  `strPostBillingTicketDesc` varchar(45) DEFAULT NULL,
  `strPBTSOA` varchar(45) DEFAULT NULL,
  `enumStatus` enum('Pending','Finalized') DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intPostBillingTicketID`),
  KEY `fk_tblPostBillingTicket_tblGoods1_idx` (`intPBTGoodsID`),
  KEY `fk_tblPostBillingTicket_tblDispatchTicket1_idx` (`intPBTDispatchTicketID`),
  KEY `fk_tblPostBillingTicket_tblInvoice1_idx` (`intPBTInvoiceID`),
  KEY `fk_tblPostBillingTicket_tblPayment1_idx` (`intPBTPaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblquotation`
--

DROP TABLE IF EXISTS `tblquotation`;
CREATE TABLE IF NOT EXISTS `tblquotation` (
  `intQuotationID` int(11) NOT NULL AUTO_INCREMENT,
  `strQuotationTitle` varchar(45) DEFAULT NULL,
  `strQuotationDesc` text,
  `intQContractListID` int(11) DEFAULT NULL,
  `isAssigned` tinyint(1) DEFAULT '0',
  `fltQuotationTDelayFee` float DEFAULT NULL,
  `fltQuotationViolationFee` float DEFAULT NULL,
  `fltQuotationConsigneeLateFee` float DEFAULT NULL,
  `fltMinDamageFee` float DEFAULT NULL,
  `fltMaxDamageFee` float DEFAULT NULL,
  `intDiscount` int(11) DEFAULT NULL,
  `fltStandardRate` float DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  `enumServiceType` enum('Hauling','Tug Assist') DEFAULT NULL,
  PRIMARY KEY (`intQuotationID`),
  KEY `fk_tblQuotation_tblContractList1_idx` (`intQContractListID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblquotation`
--

INSERT INTO `tblquotation` (`intQuotationID`, `strQuotationTitle`, `strQuotationDesc`, `intQContractListID`, `isAssigned`, `fltQuotationTDelayFee`, `fltQuotationViolationFee`, `fltQuotationConsigneeLateFee`, `fltMinDamageFee`, `fltMaxDamageFee`, `intDiscount`, `fltStandardRate`, `boolDeleted`, `enumServiceType`) VALUES
(1, NULL, NULL, 1, 0, 1000, 1000, 1000, 3000, 5000, 20, 2000, 0, 'Hauling'),
(2, NULL, NULL, 1, 0, 2000, 2000, 1000, 2000, 4000, 20, 1000, 0, 'Tug Assist'),
(3, NULL, NULL, 2, 0, 1000, 1000, 1000, 3000, 5000, 1, 2000, 0, 'Hauling'),
(4, NULL, NULL, 2, 0, 2000, 2000, 1000, 2000, 4000, 1, 1000, 0, 'Tug Assist'),
(5, NULL, NULL, 3, 0, 1000, 1000, 1000, 3000, 5000, 20, 2000, 0, 'Hauling'),
(6, NULL, NULL, 3, 0, 2000, 2000, 1000, 2000, 4000, 20, 1000, 0, 'Tug Assist'),
(7, NULL, NULL, 4, 0, 1000, 1000, 1000, 3000, 5000, 1, 2000, 0, 'Hauling'),
(8, NULL, NULL, 4, 0, 2000, 2000, 1000, 2000, 4000, 1, 1000, 0, 'Tug Assist'),
(9, NULL, NULL, 6, 0, 1000, 1000, 1000, 3000, 5000, 10, 2000, 0, 'Hauling'),
(10, NULL, NULL, 6, 0, 2000, 2000, 1000, 2000, 4000, 10, 2000, 0, 'Tug Assist'),
(11, NULL, NULL, 7, 0, 1000, 1000, 1000, 3000, 5000, 20, 2000, 0, 'Hauling'),
(12, NULL, NULL, 7, 0, 2000, 2000, 1000, 2000, 4000, 20, 1000, 0, 'Tug Assist');

-- --------------------------------------------------------

--
-- Table structure for table `tblquotationhistory`
--

DROP TABLE IF EXISTS `tblquotationhistory`;
CREATE TABLE IF NOT EXISTS `tblquotationhistory` (
  `intQuotationHistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `fltQHStandardRate` float NOT NULL,
  `fltQHTugboatDelayFee` float NOT NULL,
  `fltQHViolationFee` float NOT NULL,
  `fltQHConsigneeLateFee` float NOT NULL,
  `fltQHMinDamageFee` float NOT NULL,
  `fltQHMaxDamageFee` float NOT NULL,
  `intQHDiscount` int(11) NOT NULL,
  `intQHQuotationID` int(11) NOT NULL,
  `strChangesAuthor` varchar(45) NOT NULL,
  PRIMARY KEY (`intQuotationHistoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblquotationshistory`
--

DROP TABLE IF EXISTS `tblquotationshistory`;
CREATE TABLE IF NOT EXISTS `tblquotationshistory` (
  `intQuotationHistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `fltQHStandardRate` float DEFAULT NULL,
  `fltQHTugboatDelayFee` float DEFAULT NULL,
  `fltQHViolationFee` float DEFAULT NULL,
  `fltQHConsigneeLateFee` float DEFAULT NULL,
  `fltQHMinDamageFee` float DEFAULT NULL,
  `fltQHMaxDamageFee` float DEFAULT NULL,
  `intQHDiscount` tinyint(3) DEFAULT NULL,
  `intQHQuotationID` int(11) DEFAULT NULL,
  `strChangesAuthor` text,
  `enumQHServiceType` enum('Tug Assist','Hauling') DEFAULT NULL,
  PRIMARY KEY (`intQuotationHistoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblrequest`
--

DROP TABLE IF EXISTS `tblrequest`;
CREATE TABLE IF NOT EXISTS `tblrequest` (
  `intRequestID` int(11) NOT NULL AUTO_INCREMENT,
  `strRequestDescription` text,
  `enumRequestType` enum('Forward Joborder','Request Team','Request Tugboat') CHARACTER SET latin1 DEFAULT NULL,
  `intRJobOrderID` int(11) DEFAULT NULL,
  `intRCompanyID` int(11) DEFAULT NULL,
  `intRForwardCompanyID` int(11) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `enumRequestStatus` enum('Pending','Accepted','Declined') CHARACTER SET latin1 DEFAULT 'Pending',
  `boolDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intRequestID`),
  KEY `fk_tblRequest_tblCompany1_idx` (`intRCompanyID`),
  KEY `fk_tblRequest_tblCompany2_idx` (`intRForwardCompanyID`),
  KEY `fk_tblRequest_tblJobOrder1_idx` (`intRJobOrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblrequest`
--

INSERT INTO `tblrequest` (`intRequestID`, `strRequestDescription`, `enumRequestType`, `intRJobOrderID`, `intRCompanyID`, `intRForwardCompanyID`, `updated_at`, `created_at`, `enumRequestStatus`, `boolDeleted`) VALUES
(1, '하는데', 'Request Team', NULL, 1, 2, '2018-09-16 04:55:47', '2018-09-15 20:55:47', 'Pending', 0),
(2, 'Send Heeeeeeeeeelp!', 'Request Tugboat', NULL, 1, 2, '2018-09-16 05:00:41', '2018-09-15 21:00:41', 'Pending', 0),
(3, 'need 4 employees of team only 1 captain 1 chief 2 crew', 'Request Team', NULL, 1, 2, '2018-09-17 05:13:17', '2018-09-16 21:13:17', 'Pending', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblreschedule`
--

DROP TABLE IF EXISTS `tblreschedule`;
CREATE TABLE IF NOT EXISTS `tblreschedule` (
  `intRescheduleID` int(11) NOT NULL,
  `intRJobOrderID` int(11) DEFAULT NULL,
  `intRDetails` text,
  `enumStatus` enum('Pending','Accepted','Declined') DEFAULT 'Pending',
  PRIMARY KEY (`intRescheduleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblreschedule`
--

INSERT INTO `tblreschedule` (`intRescheduleID`, `intRJobOrderID`, `intRDetails`, `enumStatus`) VALUES
(1, 23, 'Desired Team Unavailable for this specific date and time', 'Declined');

-- --------------------------------------------------------

--
-- Table structure for table `tblschedule`
--

DROP TABLE IF EXISTS `tblschedule`;
CREATE TABLE IF NOT EXISTS `tblschedule` (
  `intScheduleID` int(11) NOT NULL AUTO_INCREMENT,
  `strScheduleDesc` varchar(60) NOT NULL,
  `dttmETA` datetime DEFAULT NULL,
  `dttmETD` datetime DEFAULT NULL,
  `strColor` varchar(45) DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  `datScheduleDate` date DEFAULT NULL,
  `intScheduleCompanyID` int(11) DEFAULT NULL,
  `dateStart` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `tmEnd` time DEFAULT NULL,
  `tmStart` time DEFAULT NULL,
  PRIMARY KEY (`intScheduleID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblschedule`
--

INSERT INTO `tblschedule` (`intScheduleID`, `strScheduleDesc`, `dttmETA`, `dttmETD`, `strColor`, `boolDeleted`, `datScheduleDate`, `intScheduleCompanyID`, `dateStart`, `dateEnd`, `tmEnd`, `tmStart`) VALUES
(1, 'Donn JO', NULL, NULL, NULL, 0, NULL, 1, '2018-10-26', '2018-10-27', '10:00:00', '08:00:00'),
(2, 'Testing JO', NULL, NULL, NULL, 0, NULL, 1, '2018-10-29', '2018-10-29', '10:15:00', '03:15:00'),
(3, 'Homie JO', NULL, NULL, NULL, 0, NULL, 1, '2018-10-26', '2018-10-27', '06:00:00', '15:00:00'),
(4, 'Ben JO', NULL, NULL, NULL, 0, NULL, 1, '2018-10-26', '2018-10-27', '19:00:00', '15:08:00'),
(5, 'Job Order 2', NULL, NULL, NULL, 0, NULL, 1, '2018-10-31', '2018-11-02', '02:59:00', '00:00:00'),
(6, 'Job Sample', NULL, NULL, NULL, 0, NULL, 1, '2018-10-30', '2018-11-02', '03:00:00', '00:00:00'),
(7, 'Job Order', NULL, NULL, NULL, 0, NULL, 1, '2018-10-30', '2018-11-02', '02:00:00', '01:00:00'),
(8, 'JO testing 2', NULL, NULL, NULL, 0, NULL, 1, '2018-10-29', '2018-10-29', '20:00:00', '19:00:00'),
(9, 'Job Order New 2', NULL, NULL, NULL, 0, NULL, 1, '2018-10-29', '2018-10-31', '22:05:00', '20:05:00'),
(10, 'Job Order Test 2', NULL, NULL, NULL, 0, NULL, 1, '2018-11-02', '2018-11-03', '09:00:00', '09:00:00'),
(11, 'Job Order New 3', NULL, NULL, NULL, 0, NULL, 1, '2018-11-15', '2018-11-15', '09:30:00', '09:00:00'),
(12, 'Job Order New 3', NULL, NULL, NULL, 0, NULL, 1, '2018-11-15', '2018-11-15', '09:30:00', '09:00:00'),
(13, 'Job Order Test 4', NULL, NULL, NULL, 0, NULL, 1, '2018-11-15', '2018-11-16', '20:30:00', '09:30:00'),
(14, 'Job Order Test 1', NULL, NULL, NULL, 0, NULL, 1, '2018-10-30', '2018-10-31', '09:00:00', '09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblservices`
--

DROP TABLE IF EXISTS `tblservices`;
CREATE TABLE IF NOT EXISTS `tblservices` (
  `intServicesID` int(11) NOT NULL AUTO_INCREMENT,
  `strServicesName` varchar(45) DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intServicesID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblservices`
--

INSERT INTO `tblservices` (`intServicesID`, `strServicesName`, `boolDeleted`) VALUES
(1, 'Assisting', 0),
(2, 'Tugging', 0),
(3, 'Towing', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblteam`
--

DROP TABLE IF EXISTS `tblteam`;
CREATE TABLE IF NOT EXISTS `tblteam` (
  `intTeamID` int(11) NOT NULL AUTO_INCREMENT,
  `strTeamName` varchar(45) DEFAULT NULL,
  `intTCompanyID` int(11) DEFAULT NULL,
  `intTForwardCompanyID` int(11) DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  `enumStatus` enum('Available','Assigned','Forwarded') DEFAULT 'Available',
  PRIMARY KEY (`intTeamID`),
  KEY `fK_tblTeam_tblCompany1_idx` (`intTCompanyID`),
  KEY `fk_tblTeam_tblCompany2_idx` (`intTForwardCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblteam`
--

INSERT INTO `tblteam` (`intTeamID`, `strTeamName`, `intTCompanyID`, `intTForwardCompanyID`, `boolDeleted`, `enumStatus`) VALUES
(1, 'Team Energy Master', 1, NULL, 0, 'Available'),
(2, 'Team Energy Venus', 1, NULL, 0, 'Available'),
(3, 'Team Tugmaster Aleli', 2, 1, 0, 'Available'),
(4, 'Team Energy Pacific', 1, NULL, 0, 'Available'),
(5, 'Team Tugmaster Don Leon', 2, NULL, 0, 'Available'),
(6, 'Team Energy Andromeda', 1, NULL, 0, 'Available'),
(7, 'Team Energy Virgo', 1, NULL, 0, 'Available'),
(8, 'Team Tugmaster Oliver', 2, NULL, 0, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `tblteamcomp`
--

DROP TABLE IF EXISTS `tblteamcomp`;
CREATE TABLE IF NOT EXISTS `tblteamcomp` (
  `intTeamCompositionID` int(11) NOT NULL,
  `intTCCaptainNumber` int(11) DEFAULT '1',
  `intTCChiefEngineerNumber` int(11) DEFAULT '1',
  `intTCCrewNumber` int(11) DEFAULT '2',
  `intTCOthersNumber` int(11) DEFAULT '0',
  `intTCCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intTeamCompositionID`),
  KEY `fk_tblTeamComp_tblCompany_idx` (`intTCCompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbltermscondition`
--

DROP TABLE IF EXISTS `tbltermscondition`;
CREATE TABLE IF NOT EXISTS `tbltermscondition` (
  `intTermsConditionID` int(11) NOT NULL AUTO_INCREMENT,
  `strTermsConditionTitle` varchar(45) NOT NULL,
  `strTermsConditionDesc` text NOT NULL,
  PRIMARY KEY (`intTermsConditionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltermscondition`
--

INSERT INTO `tbltermscondition` (`intTermsConditionID`, `strTermsConditionTitle`, `strTermsConditionDesc`) VALUES
(1, '<h4>Terms and Condition </h4>', '<p><br></p><p>All shipments to or from the Customer, which term shall include the exporter, importer, sender, receiver, owner, consignor, consignee, transferor or transferee of the shipments, will be handled by Unitrans Worldwide, Inc, herein called the “Company”) on the following terms and conditions:</p><p>•1.&nbsp;<span style=\"font-weight: bolder;\">Services by Third Parties</span>. Unless the Company carries, stores or otherwise physically handles the shipment, and loss, damage, expense or delay occurs during such activity, the Company assumes no liability as a carrier and is not to be held responsible for any loss, damage, expense or delay to the goods to be forwarded or imported except as provided in paragraph 8 and subject to the limitations of paragraph 9 below, but undertakes only to use reasonable care in the selection of carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others to whom it may entrust the goods for transportation, cartage, handling and/or delivery and/or storage or otherwise. When the company carries, stores or otherwise physically handles the shipment, it does so subject to the limitation of liability set forth in paragraph 8 below unless a separate bill of lading, air waybill or other contract of carriage is issued by the Company, in which event the terms thereof shall govern.</p><p>•2.&nbsp;<span style=\"font-weight: bolder;\">Liability Limitations of Third Parties</span>. The Company is authorized to select and engage carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others, as required, to transport, store, deal with and deliver the goods, all of whom shall be considered as the agents of the Customer, and the goods may be entrusted to such agencies subject to all conditions as to limitation of liability for loss, damage, expense or delay and to all rules, regulations, requirements and conditions, whether printed, written or stamped, appearing in bills of lading, receipts or tariffs issued by such carriers, truck men, lightermen, forwarders, customs brokers, agents, warehousemen and others. The Company shall under no circumstances be liable for any loss, damage, expense or delay to the goods for any reason whatsoever when said goods are in custody, possession or control of third parties selected by the Company to forward, enter and clear, transport or render other services with respect to such goods.</p><p>•3.&nbsp;<span style=\"font-weight: bolder;\">Choosing Routes or Agents</span>. Unless express instructions in writing are received from the Customer, the Company has complete freedom in choosing the means, route and procedure to be followed in the handling, transportation and delivery of the goods. Advice by the Company to the Customer that a particular person or firm has been selected to render services with respect to the goods shall not be construed to mean that the Company warrants or represents that such person or firm will render such services.</p><p>•4.&nbsp;<span style=\"font-weight: bolder;\">Quotations Not Binding</span>. Quotations as to fees, rates of duty, freight charges, insurance premiums or other charges given by the Company to the Customer are for informational purposes only and are subject to change without notice and shall not under any circumstances be binding upon the Company unless the Company in writing specifically undertakes the handling or transportation of the shipment at a specific rate.</p><p>•5.&nbsp;<span style=\"font-weight: bolder;\">Duty to Furnish Information</span>.</p><p>(<span style=\"font-weight: bolder;\">a</span>) On an import at a reasonable time prior to entering of the goods for U.S. Customs, the Customer shall furnish to the Company invoices in proper form and other documents necessary or useful in the preparation of the U. S. Customs entry and, also, such further information as may be sufficient to establish, inter alia, the dutiable value, the classification, the country of origin, the genuineness of the merchandise and any mark or symbol associated with it, the Customer’s right to import and/or distribute the merchandise, and the merchandise’s admissibility, pursuant to U. S. law or regulation. If the Customer fails in a timely manner to furnish such information or documents, in whole or in part, as may be required to complete U. S. Customs entry or comply with U.S. laws or regulations, or if the information or documents furnished are inaccurate or incomplete, the Company shall be obligated only to use its best judgment in connection with the shipment and in no instance shall be charged with knowledge by the Customer of the true circumstances to which such inaccurate, incomplete, or omitted information or document pertains. Where a bond is required by U.S. Customs to be given for the production of any document or the performance of any act, the Customer shall be deemed bound by the terms of the bond notwithstanding the fact that the bond has been executed by the Company as principal, it being understood that the Company entered into such undertaking at the instance and on behalf of the Customer, and the Customer shall indemnify and hold the Company harmless for the consequences of any breach of the terms of the bond.</p><p>(<span style=\"font-weight: bolder;\">b</span>) On an export at a reasonable time prior to the exportation of the shipment the Customer shall furnish to the Company the commercial invoice in proper form and number, a proper consular declaration, weights, measures, values and other information in the language of and as may be required by the laws and regulations of U. S. and the country of destination of the goods.</p><p>(<span style=\"font-weight: bolder;\">c</span>) On an export or import the Company shall not in any way be responsible or liable for increased duty, penalty, fine or expense unless caused by the negligence or other fault of the Company, in which event its liability to the Customer shall be governed by the provisions of paragraphs 8-10 below. The Customer shall be bound by and warrant the accuracy of all invoices, documents and information furnished to the Company by the Customer or its agent for export, entry or other purposes and the Customer agrees to indemnify and hold harmless the Company against any increased duty, penalty, fine or expense including attorneys’ fees, resulting from any inaccuracy, incomplete statement, omission or any failure to make timely presentation, even if not due to any negligence of the Customer.</p><p>•6.&nbsp;<span style=\"font-weight: bolder;\">Declaring Higher Valuation</span>. Inasmuch as truckers, carriers, warehousemen and others to whom the goods are entrusted usually limit their liability for loss or damage unless a higher value is declared and a charge based on such higher value is agreed to by said truckers, etc., the Company must receive specific written instructions from the Customer to pay such higher charge based on valuation and the trucker, etc. must accept such higher declared value; otherwise the valuation placed by the Customer on the goods shall be considered solely for export or customs purposes and the goods will be delivered to the truckers, etc. subject to the limitation of liability set forth herein in paragraphs 8-10 below with respect to any claim against the Company and subject to the provisions of paragraph 2 above.</p><p>7.&nbsp;<span style=\"font-weight: bolder;\">Insurance</span>. The Company will make reasonable efforts to effect marine, fire, theft and other insurance upon the goods only after specific written instructions have been received by the Company in sufficient time prior to shipment from point of origin, and the Customer at the same time states specifically the kind and amount of insurance to be placed. The Company does not undertake or warrant that such insurance can or will be placed. Unless the Customer has its own open marine policy and instructs the Company to effect insurance under such policy, insurance is to be effected with one or more insurance companies or other underwriters to be selected by the Company. Any insurance placed shall be governed by the certificate or policy issued and will only be effective when accepted by such insurance companies or underwriters. Should an insurer dispute its liability for any reason, the insured shall have recourse against the insurer only and the Company shall not be under any responsibility or liability in relation thereto, notwithstanding that the premium upon the policy may not be at the same rates as that charged or paid to the Company by the Customer, or that the shipment was insured under a policy in the name of the Company. Insurance premiums and the charge of the Company for arranging the same shall be at the Customer’s expense. If for any reason the goods are held in warehouse, or elsewhere, the same will not be covered by any insurance, unless the Company receives written instructions from the Customer. Unless specifically agreed in writing, the Company assumes no responsibility to effect insurance on any export or import shipment which it does not handle.</p><p>•8.&nbsp;<span style=\"font-weight: bolder;\">Limitation of Liability for Loss, etc</span>.</p><p>(<span style=\"font-weight: bolder;\">a</span>) The Customer agrees that the Company shall only be liable for any loss, damage expense or delay to the goods resulting from the negligence or other fault of the Company; such liability shall be limited to an amount equal to the lesser of fifty dollars ($50.00) per entry or shipment or the fee(s) charged for services, provided that, in the case of partial loss, such amount will be adjusted, pro rata;</p><p>(<span style=\"font-weight: bolder;\">b</span>) Where the Company issues its own bill of lading and receives freight charges as its compensation, Customer has the option of paying a special compensation and increasing the limit of Company’s liability up to the shipment’s actual value; however, such option must be exercised by written agreement, entered into prior to any covered transaction(s),setting forth the limit of the Company’s liability and the compensation received;</p><p>(<span style=\"font-weight: bolder;\">c</span>) In instances other than in (b) above, unless the Customer makes specific written arrangements with the Company to pay special compensation and declare a higher value and Company agrees in writing, liability is limited to the amount set forth in (a) above;</p><p>(<span style=\"font-weight: bolder;\">d</span>) Customer agrees that the Company shall, in no event, be liable for consequential, punitive, statutory or special damages in excess of the monetary limit provided for above.</p><p>•9.&nbsp;<span style=\"font-weight: bolder;\">Presenting Claims</span>. Company shall not be liable under paragraph 8 for any claims not presented to it in writing within 90 days of either the date of loss or incident giving rise to the claim; no suit to recover for any claim or demand here under shall be maintained against the Company unless instituted within six (6) months after the presentation of the said claim or such longer period provided for under statute(s) of the State having jurisdiction of the matter.</p><p>•10.&nbsp;<span style=\"font-weight: bolder;\">Advancing Money</span>. The Company shall not be obliged to incur any expense, guarantee payment or advance any money in connection with the importing, forwarding, transporting, insuring, storing or coopering of the goods, unless the same is previously provided to the Company by the Customer on demand. The Company shall be under no obligation to advance freight charges, customs duties or taxes on any shipment, nor shall any advance by the Company be construed as a waiver of the provisions hereof.</p><p>•11.<span style=\"font-weight: bolder;\">&nbsp;Indemnification for Freight, Duties</span>. In the event that a carrier, other person or any governmental agency makes a claim or institutes legal action against the company for ocean or other freight, duties, fines, penalties, liquidated damages or other money due rising from a shipment of goods of the Customer, the Customer agrees to indemnify and hold harmless the Company for any amount the Company may be required to pay such carrier, other person or governmental agency together with reasonable expenses, including attorneys’ fees, incurred by the Company in connection with defending such claim or legal action and obtaining reimbursement from the Customer. The confiscation or detention of the goods by any governmental authority shall not affect or diminish the liability of the Customer to the Company to pay all charges or other money due promptly on demand.</p><p>•12.&nbsp;<span style=\"font-weight: bolder;\">C.O.D. Shipments</span>. Goods received with Customer’s or other person’s instructions to “Collect on Delivery” (C.O.D.) by drafts or otherwise, or to collect on any specified terms by time drafts or otherwise, are accepted by the Company only upon the express understanding that it will exercise reasonable care in the selection of a bank, correspondent, carrier or agent to whom it will send such item for collection, and the Company will not be responsible for any act, omission, default, suspension, insolvency or want of care, negligence, or fault of such bank, correspondent, carrier or agent, nor for any delay in remittance lost in exchange, or during transmission, or while in the course of collection.</p><p>•13.&nbsp;<span style=\"font-weight: bolder;\">General Lien on Any Property</span>. The Company shall have a general lien on any and all property (and documents relating thereto) of the customer, in its possession, custody or control or en route, for all claims for charges, expenses or advances incurred by the Company in connection with any shipments of the Customer and if such claim remains unsatisfied for thirty (30) days after demand for its payment is made, the Company may sell at public auction or private sale, upon ten (10) days written notice, registered mail(R.R.R.), to the Customer, the goods, wares and/or merchandise, or so much thereof as may be necessary to satisfy such lien, and apply the net proceeds of such sale to the payment of the amount due to the Company. Any surplus from such sale shall be transmitted to the Customer, and the Customer shall be liable for any deficiency in the sale.</p><p>•14.&nbsp;<span style=\"font-weight: bolder;\">Compensation of Company</span>. The compensation of the Company for its services shall be included with and is in addition to the rates and charges of all carriers and other agencies selected by the Company to transport and deal with the goods and such compensation shall be exclusive of any brokerage, commissions, dividends or other revenue received by the Company from carriers, insurers and others in connection with the shipment. On ocean exports, upon request, the Company shall provide a detailed breakout of the components of all charges assessed and a true copy of each pertinent document relating to these charges. In any referral for collection or action against the Customer for monies due the Company, upon recovery by the Company, the Customer shall pay the expenses of collection and/or litigation, including a reasonable attorney fee.</p><p>•15.&nbsp;<span style=\"font-weight: bolder;\">No Responsibility for Governmental Requirements</span>. It is the responsibility of the Customer to know and comply with the marking requirements of the U. S. Customs Service, the regulations of the U. S. Food and Drug Administration, and all other requirements, including regulations of Federal, state and/or local agencies pertaining to the merchandise. The Company shall not be responsible for action taken or fines or penalties assessed by any governmental agency against the shipment because of the failure of the Customer to comply with the law or the requirements or regulations of any governmental agency or with a notification issued to the Customer by any such agency.</p><p>•16.&nbsp;<span style=\"font-weight: bolder;\">Indemnity Against Liability Arising from the Importation of Merchandise</span>. The Customer agrees to indemnify and hold the Company harmless from any claims and/or liability arising from the importation of merchandise which violates any Federal, state and/or other laws or regulations and further agrees to indemnify and hold the Company harmless against any and all liability, loss, damages, costs, claims and/or expenses, including but not limited to attorney’s fees, which the Company may hereafter incur, suffer or be required to pay by reason of claims by any government agency or private party. In the event that any action, suit or proceeding is brought against the Company by any government agency or any private party, the Company shall give notice in writing to the Customer by mail at its address on file with the Company. Upon receipt of such notice, the Customer at its own expense shall defend against such action and take all steps as may be necessary or proper to prevent the obtaining of a judgment and/or order against the Company.</p><p>•17.&nbsp;<span style=\"font-weight: bolder;\">Loss, Damage or Expense Due to Delay</span>. Unless the services to be performed by the Company on behalf of the Customer are delayed by reason of the negligence or other fault of the Company, the Company shall not be responsible for any loss, damage or expense incurred by the Customer because of such delay. In the event the Company is at fault, as aforesaid, itsaa liability is limited in accordance with the provisions of paragraphs 8-9 above.</p><p>18.<span style=\"font-weight: bolder;\">&nbsp;Construction of Terms and Venue</span>. The foregoing terms and conditions shall be construed according to the laws of the State shown on the reverse side hereof. Unless otherwise consented to in writing by the Company, no legal proceeding against the Company may be instituted by the Customer, its assigns, or subrogee except in the City shown on the reverse side</p>');

-- --------------------------------------------------------

--
-- Table structure for table `tbltugboat`
--

DROP TABLE IF EXISTS `tbltugboat`;
CREATE TABLE IF NOT EXISTS `tbltugboat` (
  `intTugboatID` int(11) NOT NULL AUTO_INCREMENT,
  `intTTugboatMainID` int(11) DEFAULT NULL,
  `intTTugboatSpecsID` int(11) DEFAULT NULL,
  `intTTugboatClassID` int(11) DEFAULT NULL,
  `intTCompanyID` int(11) DEFAULT NULL,
  `intForwardCompanyID` int(11) DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  `enumTStatus` enum('Working','Under Repair') DEFAULT 'Working',
  PRIMARY KEY (`intTugboatID`),
  KEY `fk_tblTugboat_tblTugboatClass1_idx` (`intTTugboatClassID`),
  KEY `fk_tblTugboat_tblTugboatSpecs1_idx` (`intTTugboatSpecsID`),
  KEY `fk_tblTugboat_tblTugboatMain1_idx` (`intTTugboatMainID`),
  KEY `fk_tblTugboat_tblCompany1_idx` (`intTCompanyID`),
  KEY `fk_tblTugboat_tblCompany2_idx` (`intForwardCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbltugboat`
--

INSERT INTO `tbltugboat` (`intTugboatID`, `intTTugboatMainID`, `intTTugboatSpecsID`, `intTTugboatClassID`, `intTCompanyID`, `intForwardCompanyID`, `boolDeleted`, `enumTStatus`) VALUES
(1, 1, 1, 1, 1, NULL, 0, 'Working'),
(2, 2, 2, 2, 1, NULL, 0, 'Working'),
(3, 3, 3, 3, 2, NULL, 0, 'Working'),
(4, 4, 4, 4, 1, NULL, 0, 'Working'),
(5, 5, 5, 5, 1, NULL, 0, 'Working'),
(6, 6, 6, 6, 2, NULL, 0, 'Working'),
(7, 7, 7, 7, 1, NULL, 0, 'Working');

-- --------------------------------------------------------

--
-- Table structure for table `tbltugboatassign`
--

DROP TABLE IF EXISTS `tbltugboatassign`;
CREATE TABLE IF NOT EXISTS `tbltugboatassign` (
  `intTAssignID` int(11) NOT NULL AUTO_INCREMENT,
  `intTATugboatID` int(11) DEFAULT NULL,
  `intTATeamID` int(11) DEFAULT NULL,
  `strTADesc` varchar(45) DEFAULT NULL,
  `intTACompanyID` int(11) DEFAULT NULL,
  `intTAForwardCompanyID` int(11) DEFAULT NULL,
  `enumStatus` enum('Available','Occupied') DEFAULT 'Available',
  `boolDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intTAssignID`),
  KEY `fk_tblTugboatAssign_tblTugboat1_idx` (`intTATugboatID`),
  KEY `fk_tblTugboatAssign_tblTeam1_idx` (`intTATeamID`),
  KEY `fk_tblTugboatAssign_tblCompany1_idx` (`intTACompanyID`),
  KEY `fk_tblTugboatAssign_tblCompany2_idx` (`intTAForwardCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbltugboatassign`
--

INSERT INTO `tbltugboatassign` (`intTAssignID`, `intTATugboatID`, `intTATeamID`, `strTADesc`, `intTACompanyID`, `intTAForwardCompanyID`, `enumStatus`, `boolDeleted`) VALUES
(1, 1, NULL, 'Team Energy Venus', 1, NULL, 'Occupied', 0),
(2, 2, 4, 'Team Energy Pacific', 1, NULL, 'Occupied', 0),
(3, 3, 3, 'Team Tugmaster Aleli', 2, NULL, 'Occupied', 0),
(4, 4, 1, 'Team Energy Venus', 1, NULL, 'Occupied', 0),
(5, 5, 6, 'Team Energy New', 1, 2, 'Occupied', 0),
(6, 6, 5, 'Team Tugmaster Don Leon', 2, 1, 'Occupied', 0),
(7, 7, 2, 'Team Energy Venus', NULL, NULL, 'Available', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbltugboatclass`
--

DROP TABLE IF EXISTS `tbltugboatclass`;
CREATE TABLE IF NOT EXISTS `tbltugboatclass` (
  `intTugboatClassID` int(11) NOT NULL AUTO_INCREMENT,
  `strOwner` varchar(45) DEFAULT NULL,
  `strTugboatFlag` varchar(45) DEFAULT NULL,
  `intTCTugboatTypeID` int(11) DEFAULT NULL,
  `strClassNum` varchar(45) DEFAULT NULL,
  `strOfficialNum` varchar(45) DEFAULT NULL,
  `strIMONum` varchar(45) DEFAULT NULL,
  `strTradingArea` varchar(45) DEFAULT NULL,
  `strHomePort` varchar(45) DEFAULT NULL,
  `enumISPSCodeCompliance` enum('Yes','No') DEFAULT NULL,
  `enumISMCodeStandard` enum('Yes','No') DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intTugboatClassID`),
  KEY `fk_tugboatclass_tugboattype` (`intTCTugboatTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbltugboatclass`
--

INSERT INTO `tbltugboatclass` (`intTugboatClassID`, `strOwner`, `strTugboatFlag`, `intTCTugboatTypeID`, `strClassNum`, `strOfficialNum`, `strIMONum`, `strTradingArea`, `strHomePort`, `enumISPSCodeCompliance`, `enumISMCodeStandard`, `boolDeleted`) VALUES
(1, 'Hi Energy Marine Services INC.', 'Philippines', 1, 'ORS-12-0804', '10 0000746', '7419573', 'Coastwise', 'Cagayan De Oro', 'Yes', 'Yes', 0),
(2, 'Hi Energy Marine Services INC.', 'Philippines', 2, 'ORS-16-0901', '04-0005098', '7912939', 'Coastwise', 'Batangas', 'Yes', 'Yes', 0),
(3, 'Hi Energy Marine Services INC.', 'Philippines', 2, 'ORS-16-0903', '04-0005092', '7912934', 'Coastwise', 'Manila', 'Yes', 'Yes', 0),
(4, 'Hi Energy Marine Services INC.', 'Philippines', 2, 'ORS-16-0904', '04-0005498', '7912573', 'Coastwise', 'Manila', 'Yes', 'Yes', 0),
(5, 'Hi Energy Marine Services INC.', 'Philippines', 1, 'ORS-16-0901', '04-0005098', '7912939', 'Coastwise', 'Batangas', 'Yes', 'Yes', 0),
(6, 'Tugmaster & Barge Pool Inc.', 'Philippines', 1, 'ORS-16-0901', '04-0005098', '7912939', 'Coastwise', 'Batangas', 'Yes', 'Yes', 0),
(7, 'Hi Energy Marine Services INC.', 'Philippines', 4, 'ORS-16-0902', '04-0005075', '04-0000089', 'Coastwise', 'Batangas City', 'Yes', 'Yes', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbltugboatequip`
--

DROP TABLE IF EXISTS `tbltugboatequip`;
CREATE TABLE IF NOT EXISTS `tbltugboatequip` (
  `intTugboatEquipmentID` int(11) NOT NULL AUTO_INCREMENT,
  `strTugboatEquipmentDesc` int(11) DEFAULT NULL,
  `intTETugboatID` int(11) DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intTugboatEquipmentID`),
  KEY `fk_tblTugboatEquip_tblTugboat1_idx` (`intTETugboatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbltugboatinsurance`
--

DROP TABLE IF EXISTS `tbltugboatinsurance`;
CREATE TABLE IF NOT EXISTS `tbltugboatinsurance` (
  `intTugboatInsuranceID` int(11) NOT NULL AUTO_INCREMENT,
  `strTugboatInsuranceDesc` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `intTITugboatID` int(11) DEFAULT NULL,
  `boolDeleted` varchar(45) CHARACTER SET latin1 DEFAULT '0',
  PRIMARY KEY (`intTugboatInsuranceID`),
  KEY `fk_tblTugboatInsurance_tbTugboat1l_idx` (`intTITugboatID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbltugboatinsurance`
--

INSERT INTO `tbltugboatinsurance` (`intTugboatInsuranceID`, `strTugboatInsuranceDesc`, `intTITugboatID`, `boolDeleted`) VALUES
(3, 'Hull (Pioneer Insurance)', 1, '0'),
(4, 'P & I (Protective & Indemnity)', 1, '0'),
(5, 'Insurance 1', 2, '0'),
(6, 'Insurance 2', 2, '0'),
(7, 'Insurance 1', 3, '0'),
(8, 'Insurance 2', 3, '0'),
(9, 'Insurances', 4, '0'),
(10, 'Pioneer', 5, '0'),
(11, 'P & I', 5, '0'),
(12, 'P & I', 6, '0'),
(13, 'Pioneer', 6, '0'),
(14, 'P & I', 7, '0'),
(15, 'Pioneer Insurance', 7, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbltugboatmain`
--

DROP TABLE IF EXISTS `tbltugboatmain`;
CREATE TABLE IF NOT EXISTS `tbltugboatmain` (
  `intTugboatMainID` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(45) DEFAULT NULL,
  `strLength` varchar(45) DEFAULT NULL,
  `strBreadth` varchar(45) DEFAULT NULL,
  `strDepth` varchar(45) DEFAULT NULL,
  `strHorsePower` varchar(45) DEFAULT NULL,
  `strMaxSpeed` varchar(45) DEFAULT NULL,
  `strBollardPull` varchar(45) DEFAULT NULL,
  `strGrossTonnage` varchar(45) DEFAULT NULL,
  `strNetTonnage` varchar(45) DEFAULT NULL,
  `datLastDrydocked` date DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intTugboatMainID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbltugboatmain`
--

INSERT INTO `tbltugboatmain` (`intTugboatMainID`, `strName`, `strLength`, `strBreadth`, `strDepth`, `strHorsePower`, `strMaxSpeed`, `strBollardPull`, `strGrossTonnage`, `strNetTonnage`, `datLastDrydocked`, `boolDeleted`) VALUES
(1, 'MT Energy Masters', '29.43', '8.20', '3.59', '2200.38', '13.5', '36.931', '188', '55.79', '2015-08-06', 0),
(2, 'MT Energy Galaxy', '20', '9', '4', '3123.00', '20', '20', '20', '20', '2018-06-19', 0),
(3, 'MT Tugmaster Aleli ', '22', '20', '21', '2636.84', '200', '200', '200', '200', '2018-06-10', 0),
(4, 'MT Energy Venus', '15', '15', '3.59 M', '2636.84', '13.40 Knots', '43.63 Tons', '188.00 Tons', '56.00 Tons', '2018-03-12', 0),
(5, 'MT Energy Pacific', '12.5', '12', '4.00', '2403.86', '15', '45', '188.00', '55.79', '2015-10-20', 0),
(6, 'MT Tugmaster Don Leon', '12', '12', '4.00', '2636.84', '15', '45', '188.00', '45', '2015-10-01', 0),
(7, 'MT Energy Andromeda', '12.0', '8.00', '4.0', '3200.23', '15.23', '16.54', '155.54', '122.20', '2018-10-17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbltugboatmatrix`
--

DROP TABLE IF EXISTS `tbltugboatmatrix`;
CREATE TABLE IF NOT EXISTS `tbltugboatmatrix` (
  `intTugboatMatrixID` int(11) NOT NULL,
  `fltTMMinRange` float DEFAULT NULL,
  `fltTMMaxRange` float DEFAULT NULL,
  `intTMNumberofTugs` tinyint(1) DEFAULT NULL,
  `fltTMCapacityHorsePower` float DEFAULT NULL,
  PRIMARY KEY (`intTugboatMatrixID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbltugboatspecs`
--

DROP TABLE IF EXISTS `tbltugboatspecs`;
CREATE TABLE IF NOT EXISTS `tbltugboatspecs` (
  `intTugboatSpecsID` int(11) NOT NULL AUTO_INCREMENT,
  `strHullMaterial` varchar(45) DEFAULT NULL,
  `strBuilder` varchar(45) DEFAULT NULL,
  `strMakerPower` varchar(45) DEFAULT NULL,
  `strDrive` varchar(45) DEFAULT NULL,
  `strCylinderperCycle` varchar(45) DEFAULT NULL,
  `strAuxEngine` varchar(45) DEFAULT NULL,
  `strLocationBuilt` varchar(70) DEFAULT NULL,
  `datBuiltDate` date DEFAULT NULL,
  `enumAISGPSVHFRadar` enum('Yes','No') DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intTugboatSpecsID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbltugboatspecs`
--

INSERT INTO `tbltugboatspecs` (`intTugboatSpecsID`, `strHullMaterial`, `strBuilder`, `strMakerPower`, `strDrive`, `strCylinderperCycle`, `strAuxEngine`, `strLocationBuilt`, `datBuiltDate`, `enumAISGPSVHFRadar`, `boolDeleted`) VALUES
(1, 'Steel', 'Kanagahazosen', '2 Units Niigata Model 6L25BX', 'Niigata ZP-2', '9/4', '2 Units Yanmar 60 KVA 225 Volts', 'Japanaaaaaaaa', '1974-10-01', 'No', 0),
(2, 'Metal', 'Koreans', 'Korean Gold', 'Drive Thru', '2/5', 'Engine', 'Korea', '2017-11-23', 'Yes', 0),
(3, 'Metal', 'Russian', 'Power', 'Drive', '3/2', 'Engine', 'Russia', '2016-12-30', 'Yes', 0),
(4, 'Steel', 'Kanagahazosen', 'Niigata', 'Niigata ZP-2', '2/4', 'Yanmar', 'Philippines', '2017-11-07', 'Yes', 0),
(5, 'Steel', 'Kanagahazosen', 'Niigata', 'Niigata ZP-2', '8/4', 'Yanmar', 'Japan', '1970-10-30', 'Yes', 0),
(6, 'Steel', 'Kanagahazosen', 'Niigata', 'Niigata ZP-2', '8/4', 'Yanmar', 'Japan', '1970-08-10', 'Yes', 0),
(7, 'Steel', 'Kanagahazosen', 'Niigata', '7419573', '8/4', 'Yanmar Auxillary Engine 2', 'Japan', '2018-10-02', 'Yes', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbltugboattype`
--

DROP TABLE IF EXISTS `tbltugboattype`;
CREATE TABLE IF NOT EXISTS `tbltugboattype` (
  `intTugboatTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `strTugboatTypeName` varchar(45) CHARACTER SET latin1 NOT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `boolDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intTugboatTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbltugboattype`
--

INSERT INTO `tbltugboattype` (`intTugboatTypeID`, `strTugboatTypeName`, `isActive`, `boolDeleted`) VALUES
(1, 'Harbor Tug', 1, 0),
(2, 'River Tug', 1, 0),
(3, 'Deep Sea Tug', 1, 0),
(4, 'Harbor Tugs', 1, 0),
(5, 'Deep River Tug', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblvessel`
--

DROP TABLE IF EXISTS `tblvessel`;
CREATE TABLE IF NOT EXISTS `tblvessel` (
  `intVesselID` int(11) NOT NULL AUTO_INCREMENT,
  `intVGoodsID` int(11) DEFAULT NULL,
  `strVesselName` varchar(45) DEFAULT NULL,
  `strVesselDesc` varchar(45) DEFAULT NULL,
  `fltVesselWeight` float DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intVesselID`),
  KEY `fk_tblVessel_tblGoods1_idx` (`intVGoodsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblvesseltype`
--

DROP TABLE IF EXISTS `tblvesseltype`;
CREATE TABLE IF NOT EXISTS `tblvesseltype` (
  `intVesselTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `strVesselTypeName` varchar(45) DEFAULT NULL,
  `boolDeleted` tinyint(1) DEFAULT '0',
  `isActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`intVesselTypeID`),
  UNIQUE KEY `strVesselTypeName` (`strVesselTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvesseltype`
--

INSERT INTO `tblvesseltype` (`intVesselTypeID`, `strVesselTypeName`, `boolDeleted`, `isActive`) VALUES
(1, 'Barge', 0, 1),
(2, 'Cargo Ship', 0, 1),
(3, 'Container Ship', 0, 1),
(4, 'Auto Carrier', 0, 1),
(5, 'Tanker', 0, 1),
(6, 'Fishing Vessel', 0, 1),
(7, 'Oil Industry Vessel', 0, 1),
(8, 'Passenger Ship', 0, 1),
(9, 'Ferry Boat', 0, 1),
(10, 'Cruise Ship', 0, 1),
(11, 'Motor Boat Tanker', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intUCompanyID` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `enumUserType` enum('Admin','Affiliates','Captain','Consignee') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `boolDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `intUCompanyID`, `remember_token`, `created_at`, `updated_at`, `enumUserType`, `isVerified`, `isActive`, `boolDeleted`, `token`) VALUES
(1, 'HEMSI', 'hienergymarineservices@gmail.com', '$2y$10$EPf6MLFuhVXXVji1gE.vnONc2PdnoHSEkJ1H8wIPJcLbz2CE6.4de', 1, 'QbQvaGaikQ3YxW6zeKlx4CwimSz1FVQM1khMw1cUZnJQTvRMnLScIiU98C14', '2018-08-26 21:39:55', '2018-08-27 02:50:40', 'Admin', 0, 1, 0, NULL),
(2, 'Tugmasters', 'tugmaster@gmail.com', '$2y$10$uGDjz7KPIoaX5jCw/NN9NOC7AdruGebYbIYuIRn1xuSvss8vwA0l.', 2, 'niIPsGagSNPbRO0Pn1yj5LFRgNQr5tJrsovmokSFLtPDZT0aWWVqorrFEI4D', '2018-08-26 21:43:36', '2018-08-26 21:43:36', 'Affiliates', 0, 1, 0, NULL),
(3, 'Black Pink', 'blackpinkyg@gmail.com', '$2y$10$QeUnO0ypzktouf/19X6k3OEJkQ7iryv2Q24xrv7F1v.ohyQyLoYRW', 3, 'VSDqgdKSijJ9gCuUhYnUtvF07UQqiIPDOdEHFTqHmkgOE4WuGhwlu71nixwW', '2018-08-26 22:08:35', '2018-09-30 22:38:43', 'Consignee', 0, 1, 0, NULL),
(4, 'TWICE', 'twicejype@gmail.com', '$2y$10$7pFLHptgmpu00ZO534rUE.UVQkVp9Vq.cFfPhzGt9REt4lmrOVTAy', 4, 'eF2aWBHWjDL7i3xgaWEpQWQyAluvtEUUz8GYp2ZvF7krNgIpODBijGCs23zR', '2018-08-27 02:46:55', '2018-10-12 11:15:07', 'Consignee', 0, 1, 0, NULL),
(5, 'TWICE', 'twicesujype@gmail.com', '$2y$10$q9nlpjUEfEOKVgzmMAuVJeTx4XbYvGBpKth22ZaVlXKnjJRS0gVie', 5, 'xJVLr2FlnEoZUsPTwne6RjTEhF7tJ6Tff607ubCuxhMUuum0tm4x4fRvmt2Y', '2018-08-27 02:47:56', '2018-10-12 11:15:10', 'Consignee', 0, 1, 0, NULL),
(6, 'Isaac Tailoring Shop', 'isaac@gmail.com', '$2y$10$j8z4HECOGsHqXiBa1J5EueWk/e9PNIapA4TRrKvpPL9I46AelTNRK', 6, '7ZN2sDcHi2QHVevs0Z993JvhTusfB3Of3YC7qZD3dMOzmOsmZIfRZJ7eu4Sr', '2018-08-27 04:41:35', '2018-08-27 05:47:58', 'Consignee', 0, 1, 0, NULL),
(7, 'Eyenet Training', 'marinaslevie@gmail.com', '$2y$10$YIo5rGen4jkUMlrUxbaaNed78mN92q7bg2r8IcOBE32k.PqacvEHm', 7, 'Pw5GitIwNMTJBRlaRUvXmm5wGkmgopnFKw7se6IeXpJXqF8ZZjrytOipYjDk', '2018-08-27 06:16:04', '2018-08-27 17:49:55', 'Consignee', 0, 1, 0, NULL),
(13, 'akari', 'akari@gmail.com', '$2y$10$EPf6MLFuhVXXVji1gE.vnONc2PdnoHSEkJ1H8wIPJcLbz2CE6.4de', 8, '7HZA8yZ5BCrUja1oNHsplXQLCBsPLxBTbS91ktVHR6sIKsKpY7XNeeteyBXy', '2018-08-27 20:45:30', '2018-08-27 20:46:38', 'Consignee', 0, 1, 0, NULL),
(14, 'Timba', 'Timba@gmail.com', '$2y$10$WhBrPXcF/tQBMhnhlcGA7eN8GDNym8AUpIO6J9AfqfY/KQabVXAoW', 9, 'pNZhkUy5qsREel823qsLLJnPBmQD9l8gAsqsennPW7E5ilfIQuehIMS0dTDa', '2018-08-27 22:56:57', '2018-08-27 22:57:19', 'Consignee', 0, 1, 0, NULL),
(15, 'cmrecto', 'cmrecto@gmail.com', '$2y$10$j4tDnh2dRkk5wfEotn0hkuNuoQQUAfJNkgwLU.P0m.OMfUX9u.uqG', 10, '9RmJ20YflA7dFB4e13zMdRoBvQSXbqIFEueh0oiywVaZgbBBg6qLoMdb3QrF', '2018-09-30 22:35:51', '2018-09-30 22:38:36', 'Consignee', 0, 1, 0, NULL),
(21, 'Emmanuel', 'reignshirley@gmail.com', '$2y$10$fUgf2R6iPpOmaB6v5b3WseMU69oCxUkDth./.dro4.YPBRePLbYQa', 25, NULL, '2018-10-16 22:32:18', '2018-10-16 22:33:19', 'Consignee', 0, 1, 0, NULL),
(22, 'Sir Eli', 'e_a_austria@yahoo.com', '$2y$10$QET0Zu5iLvIktPRXdX0LxuwnRgby6JZqRoqnibWDLX72QoZeCsdES', 26, NULL, '2018-10-16 23:16:39', '2018-10-26 21:51:53', 'Consignee', 0, 1, 0, 'mMwOS6htFdUhtmhcZDsDD8SuH'),
(23, 'EMReign', 'clumsyreigny@gmail.com', '$2y$10$Cxob/uNaW.O6IWEJX/b2gOD1w71b.ARpwnAp61sfwIG6WnJGjF4Aq', 27, '41JWw6kr0daEFudKMb6Tylg5AopTcjCYgp5iMS8rgg5nJXkXPZ3wgg1uTCV1', '2018-10-16 23:18:40', '2018-10-16 23:20:40', 'Consignee', 0, 1, 0, 'mdvavpgrzaX6V2NgqhQnWsqPT'),
(24, 'qwerty', 'qwerty@gmail.com', '$2y$10$9DG8iRy35aSPWm.fbYR3y.mXvH4yvp7LnTe4/i9djz4ytkkAEi/oW', 28, 's7j8tNyevgrz5qg44Lpb0OanQ049zJAvBMUs0JaSNvowRq1JNXQ9fZP0r0eM', '2018-10-26 21:50:43', '2018-10-26 21:51:56', 'Consignee', 0, 1, 0, 'kQZ8OcnE27BYVfRTq7FXv9OxX'),
(25, 'zxc', 'zxc@gmail.com', '$2y$10$sc8RlC92MedxTTbiw2IO.e4QyYfmg/Bd.NDhbH.ehwM5yDLDwfJEC', 29, NULL, '2018-10-26 22:16:25', '2018-10-29 02:47:35', 'Consignee', 0, 1, 0, 'PUvzXSLjrINtxP4foAFNllXuj'),
(26, 'new', 'new@gmail.com', '$2y$10$tRjI.0yomDM/MdqQEyPH6uC4Dpal8nuqY0v1rPInokzP19MzmGFIS', 32, 'kWgB0ONGl9eX2JJnVxKZLuB1FTYWlQB6TPfQnOwPo3v7XUElAr03ZZtOyhqj', '2018-10-27 22:51:10', '2018-10-27 22:51:53', 'Consignee', 0, 1, 0, 'jb9GodsiQOMI3ICPLjgv8SFFC'),
(27, 'fewa', 'fewa@gmail.com', '$2y$10$Soq5KuvYhf.SuqudzMT4YOHpFjKick1EznBEakJiX/Tr7oZWA.zgC', 33, 'zTUtoI3UGo0S4iDXO4x78XtwTaLd5XcToQy7dtlgHfouYyoHT7j5dgHY1Jt5', '2018-10-29 02:45:53', '2018-10-29 02:48:43', 'Consignee', 0, 1, 0, 'vCOSZjrGIfJPc5zfJ5myqtVBn');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblbalance`
--
ALTER TABLE `tblbalance`
  ADD CONSTRAINT `fk_tblBalance_fk_tblcompany1` FOREIGN KEY (`intBalanceID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblbarge`
--
ALTER TABLE `tblbarge`
  ADD CONSTRAINT `fk_tblBarge_tblGoods1` FOREIGN KEY (`intBGoodsID`) REFERENCES `tblgoods` (`intGoodsID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblberth`
--
ALTER TABLE `tblberth`
  ADD CONSTRAINT `fk_tblBerth_tblPier1` FOREIGN KEY (`intBPierID`) REFERENCES `tblpier` (`intPierID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblcharges`
--
ALTER TABLE `tblcharges`
  ADD CONSTRAINT `fk_tblcharges_tblinvoice` FOREIGN KEY (`intChargeID`) REFERENCES `tblinvoice` (`intInvoiceID`);

--
-- Constraints for table `tblcheque`
--
ALTER TABLE `tblcheque`
  ADD CONSTRAINT `fk_tblcheque_tblbill` FOREIGN KEY (`intCBillID`) REFERENCES `tblbill` (`intBillID`);

--
-- Constraints for table `tblcompany`
--
ALTER TABLE `tblcompany`
  ADD CONSTRAINT `fk_tblCompany_tblGoods1` FOREIGN KEY (`intCGoodsID`) REFERENCES `tblgoods` (`intGoodsID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblCompany_tblPostBillingTicket1` FOREIGN KEY (`intCPostBillingTicketID`) REFERENCES `tblpostbillingticket` (`intPostBillingTicketID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblcontractlist`
--
ALTER TABLE `tblcontractlist`
  ADD CONSTRAINT `fk_tblContractList_tblCompany1` FOREIGN KEY (`intCCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblContractList_tblWaiver1` FOREIGN KEY (`intCAttachmentsID`) REFERENCES `tblattachments` (`intAttachmentsID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblContractList_tbquotation` FOREIGN KEY (`intCQuotationID`) REFERENCES `tblquotation` (`intQuotationID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD CONSTRAINT `fk_tblEmployee_tblPosition1` FOREIGN KEY (`intEPositionID`) REFERENCES `tblposition` (`intPositionID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblEmployee_tblTeam1` FOREIGN KEY (`intETeamID`) REFERENCES `tblteam` (`intTeamID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblemployee_tblcompany1` FOREIGN KEY (`intECompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblhauling`
--
ALTER TABLE `tblhauling`
  ADD CONSTRAINT `fk_tblDelivery_tblServices1` FOREIGN KEY (`intHServicesID`) REFERENCES `tblservices` (`intServicesID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblHauling_tblAttachments1` FOREIGN KEY (`intHAttachmentsID`) REFERENCES `tblattachments` (`intAttachmentsID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblHauling_tblLocation1` FOREIGN KEY (`intHLocationID`) REFERENCES `tbllocation` (`intLocationID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblhauling_tbljobsched` FOREIGN KEY (`intHJobSchedID`) REFERENCES `tbljobsched` (`intJobSchedID`);

--
-- Constraints for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  ADD CONSTRAINT `fk_tblInvoice_tblCompany1` FOREIGN KEY (`intDTCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblInvoice_tblDispatchTicket1` FOREIGN KEY (`intIDispatchTicketID`) REFERENCES `tbldispatchticket` (`intDispatchTicketID`) ON UPDATE CASCADE;

--
-- Constraints for table `tbljoborder`
--
ALTER TABLE `tbljoborder`
  ADD CONSTRAINT `fk_tblJoborder_tblGoods1` FOREIGN KEY (`intJOGoodsID`) REFERENCES `tblgoods` (`intGoodsID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblJoborder_tblVesselType1` FOREIGN KEY (`intJOVesselTypeID`) REFERENCES `tblvesseltype` (`intVesselTypeID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbljoborder_tblcompany` FOREIGN KEY (`intJOCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE;

--
-- Constraints for table `tbljoborderforwardrequests`
--
ALTER TABLE `tbljoborderforwardrequests`
  ADD CONSTRAINT `fk_tblJOForwardRequests_tblCompany1` FOREIGN KEY (`intJOFRForwardCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblJOForwardRequests_tblJobOrder1` FOREIGN KEY (`intJOFRJobOrderID`) REFERENCES `tbljoborder` (`intJobOrderID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblpayment`
--
ALTER TABLE `tblpayment`
  ADD CONSTRAINT `fk_tblPayment_tblCompany1` FOREIGN KEY (`intPCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblposition`
--
ALTER TABLE `tblposition`
  ADD CONSTRAINT `fk_tblPosition_tblCompany1` FOREIGN KEY (`intPCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblpostbillingticket`
--
ALTER TABLE `tblpostbillingticket`
  ADD CONSTRAINT `fk_tblPostBillingTicket_tblDispatchTicket1` FOREIGN KEY (`intPBTDispatchTicketID`) REFERENCES `tbldispatchticket` (`intDispatchTicketID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblPostBillingTicket_tblGoods1` FOREIGN KEY (`intPBTGoodsID`) REFERENCES `tblgoods` (`intGoodsID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblPostBillingTicket_tblInvoice1` FOREIGN KEY (`intPBTInvoiceID`) REFERENCES `tblinvoice` (`intInvoiceID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblPostBillingTicket_tblPayment1` FOREIGN KEY (`intPBTPaymentID`) REFERENCES `tblpayment` (`intPaymentID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblquotation`
--
ALTER TABLE `tblquotation`
  ADD CONSTRAINT `fk_tblQuotation_tblContractList1` FOREIGN KEY (`intQContractListID`) REFERENCES `tblcontractlist` (`intContractListID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblrequest`
--
ALTER TABLE `tblrequest`
  ADD CONSTRAINT `fk_tblRequest_tblCompany1` FOREIGN KEY (`intRCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblRequest_tblCompany2` FOREIGN KEY (`intRForwardCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblRequest_tblJobOrder1` FOREIGN KEY (`intRJobOrderID`) REFERENCES `tbljoborder` (`intJobOrderID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblteam`
--
ALTER TABLE `tblteam`
  ADD CONSTRAINT `fK_tblTeam_tblCompany1` FOREIGN KEY (`intTCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblTeam_tblCompany2` FOREIGN KEY (`intTForwardCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblteamcomp`
--
ALTER TABLE `tblteamcomp`
  ADD CONSTRAINT `fk_tblTeamComp_tblCompany` FOREIGN KEY (`intTCCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE;

--
-- Constraints for table `tbltugboat`
--
ALTER TABLE `tbltugboat`
  ADD CONSTRAINT `fk_tblTugboat_tblCompany1` FOREIGN KEY (`intTCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblTugboat_tblCompany2` FOREIGN KEY (`intForwardCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblTugboat_tblTugboatClass1` FOREIGN KEY (`intTTugboatClassID`) REFERENCES `tbltugboatclass` (`intTugboatClassID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblTugboat_tblTugboatMain1` FOREIGN KEY (`intTTugboatMainID`) REFERENCES `tbltugboatmain` (`intTugboatMainID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblTugboat_tblTugboatSpecs1` FOREIGN KEY (`intTTugboatSpecsID`) REFERENCES `tbltugboatspecs` (`intTugboatSpecsID`) ON UPDATE CASCADE;

--
-- Constraints for table `tbltugboatassign`
--
ALTER TABLE `tbltugboatassign`
  ADD CONSTRAINT `fk_tblTugboatAssign_tblCompany1` FOREIGN KEY (`intTACompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblTugboatAssign_tblCompany2` FOREIGN KEY (`intTAForwardCompanyID`) REFERENCES `tblcompany` (`intCompanyID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblTugboatAssign_tblTeam1` FOREIGN KEY (`intTATeamID`) REFERENCES `tblteam` (`intTeamID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblTugboatAssign_tblTugboat1` FOREIGN KEY (`intTATugboatID`) REFERENCES `tbltugboat` (`intTugboatID`) ON UPDATE CASCADE;

--
-- Constraints for table `tbltugboatclass`
--
ALTER TABLE `tbltugboatclass`
  ADD CONSTRAINT `fk_tugboatclass_tugboattype` FOREIGN KEY (`intTCTugboatTypeID`) REFERENCES `tbltugboattype` (`intTugboatTypeID`);

--
-- Constraints for table `tbltugboatequip`
--
ALTER TABLE `tbltugboatequip`
  ADD CONSTRAINT `fk_tblTugboatEquip_tblTugboat1` FOREIGN KEY (`intTETugboatID`) REFERENCES `tbltugboat` (`intTugboatID`) ON UPDATE CASCADE;

--
-- Constraints for table `tbltugboatinsurance`
--
ALTER TABLE `tbltugboatinsurance`
  ADD CONSTRAINT `fk_tblTugboatInsurance_tbTugboat1l` FOREIGN KEY (`intTITugboatID`) REFERENCES `tbltugboat` (`intTugboatID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblvessel`
--
ALTER TABLE `tblvessel`
  ADD CONSTRAINT `fk_tblVessel_tblGoods1` FOREIGN KEY (`intVGoodsID`) REFERENCES `tblgoods` (`intGoodsID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
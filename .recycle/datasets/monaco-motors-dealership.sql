
--
-- Database: `MONACO_MOTORS`
--
CREATE DATABASE IF NOT EXISTS `MONACO_MOTORS` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;

USE `MONACO_MOTORS`;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `CustomerID` char(8) NOT NULL,
  `AgentID` char(8) NOT NULL,
  `CustFirstName` varchar(15) NOT NULL,
  `CustLastName` varchar(15) NOT NULL,
  `PhoneNumber` varchar(12) NOT NULL,
  `Email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`CustomerID`, `AgentID`, `CustFirstName`, `CustLastName`, `PhoneNumber`, `Email`) VALUES
('24863197', '89324037', 'Mark', 'Hunt', '3347852143', 'markymark@gmail.com'),
('25463157', '85476932', 'Carly', 'Myers', '7897896325', 'carlyy478@gmail.com'),
('45682178', '85264532', 'John', 'Miller', '3568421479', 'johnboy@hotmail.com'),
('46525896', '32433468', 'Madison', 'Hart', '7892553001', 'lilmaddy@gmail.com'),
('52147932', '78932145', 'Megan', 'Sellers', '3345893321', 'megmeg@hotmail.com'),
('53247962', '85693248', 'Shelly', 'Jones', '4568423698', 'shellyjones@gmail.com'),
('63222478', '45879632', 'Connor', 'Kirk', '3346953214', 'kirkkconnor@yahoo.com'),
('64786233', '89324037', 'Logan', 'Hutchinson', '3345896789', 'loganhutch@yahoo.com'),
('74859612', '45879632', 'Barbara', 'Brown', '3348529654', 'bigbarb400@hotmail.com'),
('78527962', '54279634', 'Andrew', 'Jackson', '3345301438', 'andyjack@gmail.com'),
('78962583', '85693248', 'Morgan', 'Stanley', '4562314862', 'morgstan78@yahoo.com'),
('86321478', '85476932', 'Bill', 'Clark', '7892256541', 'bclrk@hotmail.com'),
('88895214', '74125852', 'William', 'Martin', '6502287512', 'willmart@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Deal`
--

CREATE TABLE `Deal` (
  `DealID` char(5) NOT NULL,
  `VehicleID` char(3) NOT NULL,
  `AgentID` char(8) NOT NULL,
  `CustomerID` char(8) NOT NULL,
  `InsuranceID` char(5) DEFAULT NULL,
  `DealDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Deal`
--

INSERT INTO `Deal` (`DealID`, `VehicleID`, `AgentID`, `CustomerID`, `InsuranceID`, `DealDate`) VALUES
('21115', '123', '32433468', '46525896', '78222', '2023-03-27'),
('25839', '328', '78932145', '52147932', '21444', '2024-04-18'),
('33658', '216', '74125852', '88895214', '26687', '2023-04-24'),
('45523', '377', '45879632', '63222478', '11478', '2023-04-01'),
('48624', '486', '54279634', '78527962', NULL, '2023-11-08'),
('48876', '729', '85693248', '53247962', NULL, '2024-04-16'),
('55896', '554', '45879632', '74859612', '44589', '2024-02-01'),
('58221', '456', '85264532', '45682178', '22268', '2023-02-11'),
('77885', '416', '85476932', '86321478', NULL, '2024-02-21'),
('95632', '265', '89324037', '24863197', '56482', '2023-01-17');

-- --------------------------------------------------------

--
-- Table structure for table `Dealership`
--

CREATE TABLE `Dealership` (
  `DealershipID` char(5) NOT NULL,
  `DistributorID` char(8) NOT NULL,
  `RegionID` char(3) NOT NULL,
  `RegionZIP` char(5) NOT NULL,
  `DealershipName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Dealership`
--

INSERT INTO `Dealership` (`DealershipID`, `DistributorID`, `RegionID`, `RegionZIP`, `DealershipName`) VALUES
('32569', '45632479', '578', '58203', 'Winged Lion Motors'),
('47823', '12347896', '334', '36081', 'Scuderia Speed'),
('59823', '45324895', '578', '58203', 'Velocity Auto Haus'),
('78962', '36589217', '334', '36081', 'Tridente Motors'),
('85632', '36521789', '356', '36079', 'Galleria Motors'),
('96523', '25863217', '356', '36079', 'Royal Stallion Motors');

-- --------------------------------------------------------

--
-- Table structure for table `Distributor`
--

CREATE TABLE `Distributor` (
  `DistributorID` char(8) NOT NULL,
  `DistributorName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Distributor`
--

INSERT INTO `Distributor` (`DistributorID`, `DistributorName`) VALUES
('12347896', 'Pfaff Reserve'),
('25863217', 'EuroCar'),
('36521789', 'Redline European'),
('36589217', 'Romans International'),
('45324895', 'European Exotic Center'),
('45632479', 'James Edition');

-- --------------------------------------------------------

--
-- Table structure for table `Insurance`
--

CREATE TABLE `Insurance` (
  `InsuranceID` char(5) NOT NULL,
  `PolicyType` varchar(15) NOT NULL,
  `RenewalDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Insurance`
--

INSERT INTO `Insurance` (`InsuranceID`, `PolicyType`, `RenewalDate`) VALUES
('11478', 'Full Coverage', '2024-04-01'),
('21444', 'Full Coverage', '2020-04-18'),
('22268', 'Liability', '2024-02-11'),
('26687', 'Liability', '2024-04-24'),
('44589', 'Full Coverage', '2020-02-01'),
('56482', 'Full Coverage', '2024-01-17'),
('78222', 'Full Coverage', '2024-03-27');

-- --------------------------------------------------------

--
-- Table structure for table `Manager`
--

CREATE TABLE `Manager` (
  `ManagerID` char(8) NOT NULL,
  `DealershipID` char(5) NOT NULL,
  `DistributorID` char(8) NOT NULL,
  `MngrFirstName` varchar(15) NOT NULL,
  `MngrLastName` varchar(15) NOT NULL,
  `MngrSalary` decimal(8,2) NOT NULL,
  `MngrBonus` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Manager`
--

INSERT INTO `Manager` (`ManagerID`, `DealershipID`, `DistributorID`, `MngrFirstName`, `MngrLastName`, `MngrSalary`, `MngrBonus`) VALUES
('12345678', '59823', '45324895', 'John', 'Boling', 87900.00, 5100.23),
('14458973', '96523', '25863217', 'Henry', 'Miller', 79025.99, 5200.60),
('32556978', '78962', '36589217', 'Rachel', 'Smith', 81500.10, 2400.00),
('45896324', '32569', '45632479', 'Sally', 'Mae', 75000.99, 4250.50),
('52689974', '85632', '36521789', 'Lamar', 'Jackson', 91250.10, NULL),
('58894123', '47823', '12347896', 'Kevin', 'Rogers', 71250.00, 8450.00);

-- --------------------------------------------------------

--
-- Table structure for table `Region`
--

CREATE TABLE `Region` (
  `RegionID` char(3) NOT NULL,
  `RegionZIP` char(5) NOT NULL,
  `RegionName` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Region`
--

INSERT INTO `Region` (`RegionID`, `RegionZIP`, `RegionName`) VALUES
('334', '36081', 'EMEA'),
('356', '36079', 'APJ'),
('578', '58203', 'AMS');

-- --------------------------------------------------------

--
-- Table structure for table `Sales_Agent`
--

CREATE TABLE `Sales_Agent` (
  `AgentID` char(8) NOT NULL,
  `ManagerID` char(8) NOT NULL,
  `DealershipID` char(5) NOT NULL,
  `AgentFirstName` varchar(15) NOT NULL,
  `AgentLastName` varchar(15) NOT NULL,
  `AgentSalary` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Sales_Agent`
--

INSERT INTO `Sales_Agent` (`AgentID`, `ManagerID`, `DealershipID`, `AgentFirstName`, `AgentLastName`, `AgentSalary`) VALUES
('28547962', '52689974', '85632', 'Jack', 'Hublot', 61258.00),
('32433468', '52689974', '85632', 'Jennifer', 'Martin', 57950.99),
('45698234', '12345678', '59823', 'Jordan', 'Myers', 43450.00),
('45879632', '32556978', '78962', 'Stacy', 'Diaz', 47600.50),
('54279634', '32556978', '78962', 'Marshall', 'Reese', 57180.00),
('74125852', '58894123', '47823', 'Allison', 'Garner', 54800.00),
('78932145', '14458973', '96523', 'Jasper', 'Sparks', 48650.99),
('79621463', '45896324', '32569', 'Hubert', 'Davis', 52081.32),
('85264532', '58894123', '47823', 'Paul', 'Werner', 51850.50),
('85476932', '14458973', '96523', 'Mitchell', 'Fields', 42600.00),
('85693248', '12345678', '59823', 'Alex', 'Smith', 47520.59),
('89324037', '45896324', '32569', 'Benjamin', 'Gonzales', 49250.90);

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle`
--

CREATE TABLE `Vehicle` (
  `VehicleID` char(3) NOT NULL,
  `DealershipID` char(5) NOT NULL,
  `DistributorID` char(8) NOT NULL,
  `Make` varchar(40) NOT NULL,
  `Model` varchar(40) NOT NULL,
  `BodyType` varchar(40) NOT NULL,
  `ModelYear` int(11) NOT NULL,
  `Price` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Vehicle`
--

INSERT INTO `Vehicle` (`VehicleID`, `DealershipID`, `DistributorID`, `Make`, `Model`, `BodyType`, `ModelYear`, `Price`) VALUES
('123', '85632', '36521789', 'Lamborghini', 'Aventador', 'Coupe', 2024, 421145.00),
('216', '47823', '12347896', 'Ferrari', 'Roma', 'Coupe', 2024, 220340.00),
('265', '32569', '45632479', 'Pagani', 'Huayra BC', 'Coupe', 2024, 2800000.00),
('328', '96523', '25863217', 'Bugatti', 'Chiron Super Sport 300+', 'Coupe', 2024, 5790000.00),
('349', '85632', '36521789', 'Lamborghini', 'Huracan STO', 'Coupe', 2024, 327835.00),
('377', '78962', '36589217', 'Maserati', 'MC20 Cielo', 'Spyder', 2024, 281000.00),
('416', '96523', '25863217', 'Rolls-Royce', 'Cullinan Black Badge', 'SUV', 2024, 388000.00),
('456', '47823', '12347896', 'Ferrari', 'SF90 Stradale', 'Coupe', 2024, 516000.00),
('486', '78962', '36589217', 'McLaren', 'Artura', 'Coupe', 2024, 185500.00),
('532', '59823', '45324895', 'Aston Martin', 'DBS', 'Coupe', 2024, 336000.00),
('554', '78962', '36589217', 'McLaren', 'GT', 'Coupe', 2024, 210000.00),
('729', '59823', '45324895', 'Bentley', 'Continental GT Speed', 'Coupe', 2024, 335000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `AgentID` (`AgentID`);

--
-- Indexes for table `Deal`
--
ALTER TABLE `Deal`
  ADD PRIMARY KEY (`DealID`),
  ADD KEY `VehicleID` (`VehicleID`),
  ADD KEY `AgentID` (`AgentID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `InsuranceID` (`InsuranceID`);

--
-- Indexes for table `Dealership`
--
ALTER TABLE `Dealership`
  ADD PRIMARY KEY (`DealershipID`),
  ADD KEY `DistributorID` (`DistributorID`),
  ADD KEY `RegionID` (`RegionID`,`RegionZIP`);

--
-- Indexes for table `Distributor`
--
ALTER TABLE `Distributor`
  ADD PRIMARY KEY (`DistributorID`);

--
-- Indexes for table `Insurance`
--
ALTER TABLE `Insurance`
  ADD PRIMARY KEY (`InsuranceID`);

--
-- Indexes for table `Manager`
--
ALTER TABLE `Manager`
  ADD PRIMARY KEY (`ManagerID`),
  ADD KEY `DealershipID` (`DealershipID`),
  ADD KEY `DistributorID` (`DistributorID`);

--
-- Indexes for table `Region`
--
ALTER TABLE `Region`
  ADD PRIMARY KEY (`RegionID`,`RegionZIP`);

--
-- Indexes for table `Sales_Agent`
--
ALTER TABLE `Sales_Agent`
  ADD PRIMARY KEY (`AgentID`),
  ADD KEY `ManagerID` (`ManagerID`),
  ADD KEY `DealershipID` (`DealershipID`);

--
-- Indexes for table `Vehicle`
--
ALTER TABLE `Vehicle`
  ADD PRIMARY KEY (`VehicleID`),
  ADD KEY `DealershipID` (`DealershipID`),
  ADD KEY `DistributorID` (`DistributorID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`AgentID`) REFERENCES `Sales_Agent` (`AgentID`);

--
-- Constraints for table `Deal`
--
ALTER TABLE `Deal`
  ADD CONSTRAINT `Deal_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `Vehicle` (`VehicleID`),
  ADD CONSTRAINT `Deal_ibfk_2` FOREIGN KEY (`AgentID`) REFERENCES `Sales_Agent` (`AgentID`),
  ADD CONSTRAINT `Deal_ibfk_3` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  ADD CONSTRAINT `Deal_ibfk_4` FOREIGN KEY (`InsuranceID`) REFERENCES `Insurance` (`InsuranceID`);

--
-- Constraints for table `Dealership`
--
ALTER TABLE `Dealership`
  ADD CONSTRAINT `Dealership_ibfk_1` FOREIGN KEY (`DistributorID`) REFERENCES `Distributor` (`DistributorID`),
  ADD CONSTRAINT `Dealership_ibfk_2` FOREIGN KEY (`RegionID`,`RegionZIP`) REFERENCES `Region` (`RegionID`, `RegionZIP`);

--
-- Constraints for table `Manager`
--
ALTER TABLE `Manager`
  ADD CONSTRAINT `Manager_ibfk_1` FOREIGN KEY (`DealershipID`) REFERENCES `Dealership` (`DealershipID`),
  ADD CONSTRAINT `Manager_ibfk_2` FOREIGN KEY (`DistributorID`) REFERENCES `Distributor` (`DistributorID`);

--
-- Constraints for table `Sales_Agent`
--
ALTER TABLE `Sales_Agent`
  ADD CONSTRAINT `Sales_Agent_ibfk_1` FOREIGN KEY (`ManagerID`) REFERENCES `Manager` (`ManagerID`),
  ADD CONSTRAINT `Sales_Agent_ibfk_2` FOREIGN KEY (`DealershipID`) REFERENCES `Dealership` (`DealershipID`);

--
-- Constraints for table `Vehicle`
--
ALTER TABLE `Vehicle`
  ADD CONSTRAINT `Vehicle_ibfk_1` FOREIGN KEY (`DealershipID`) REFERENCES `Dealership` (`DealershipID`),
  ADD CONSTRAINT `Vehicle_ibfk_2` FOREIGN KEY (`DistributorID`) REFERENCES `Distributor` (`DistributorID`);

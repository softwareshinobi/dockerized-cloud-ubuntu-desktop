DROP DATABASE monacomotors;

CREATE DATABASE monacomotors;

USE monacomotors;

CREATE TABLE Region
(	RegionID	CHAR(3)			NOT NULL,
	RegionZIP	CHAR(5)			NOT NULL,
	RegionName	VARCHAR(15)		NOT NULL,
	PRIMARY KEY (RegionID, RegionZIP) );

CREATE TABLE Distributor
(	DistributorID	CHAR(8)		NOT NULL,
	DistributorName	VARCHAR(15) NOT NULL,
	PRIMARY KEY (DistributorID) );

CREATE TABLE Dealership
(	DealershipID	CHAR(5)		NOT NULL,
	DistributorID	CHAR(8)		NOT NULL,
	RegionID		CHAR(3)		NOT NULL,
	RegionZIP		CHAR(5)		NOT NULL,
	DealershipName	VARCHAR(40)	NOT NULL,
	PRIMARY KEY	(DealershipID),
	FOREIGN KEY (DistributorID) REFERENCES Distributor(DistributorID),
	FOREIGN KEY (RegionID, RegionZIP) REFERENCES Region(RegionID, RegionZIP) );

CREATE TABLE Vehicle
(	VehicleID		CHAR(3)			NOT NULL,
	DealershipID	CHAR(5)			NOT NULL,
	DistributorID	CHAR(8)			NOT NULL,
	Make			VARCHAR(40)		NOT NULL,
	Model			VARCHAR(40)		NOT NULL,
	BodyType		VARCHAR(40)		NOT NULL,
	ModelYear		INT				NOT NULL,
	Price			NUMERIC(9,2)	NOT NULL,
	PRIMARY KEY (VehicleID),
	FOREIGN KEY (DealershipID) REFERENCES Dealership(DealershipID),
	FOREIGN KEY (DistributorID) REFERENCES Distributor(DistributorID) );

CREATE TABLE Manager
(	ManagerID		CHAR(8)			NOT NULL,
	DealershipID	CHAR(5)			NOT NULL,
	DistributorID	CHAR(8)			NOT NULL,
	MngrFirstName	VARCHAR(15)		NOT NULL,
	MngrLastName	VARCHAR(15)		NOT NULL,
	MngrSalary		NUMERIC(8,2)	NOT NULL,
	MngrBonus		NUMERIC(8,2),
	PRIMARY KEY (ManagerID),
	FOREIGN KEY (DealershipID) REFERENCES Dealership(DealershipID),
	FOREIGN KEY (DistributorID) REFERENCES Distributor(DistributorID) );

CREATE TABLE Sales_Agent
(	AgentID			CHAR(8)			NOT NULL,
	ManagerID		CHAR(8)			NOT NULL,
	DealershipID	CHAR(5)			NOT NULL,
	AgentFirstName	VARCHAR(15)		NOT NULL,
	AgentLastName	VARCHAR(15)		NOT NULL,
	AgentSalary		NUMERIC(9,2)	NOT NULL,
	PRIMARY KEY (AgentID),
	FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID),
	FOREIGN KEY (DealershipID) REFERENCES Dealership(DealershipID) );

CREATE TABLE Customer
(	CustomerID		CHAR(8)			NOT NULL,
	AgentID			CHAR(8)			NOT NULL,
	CustFirstName	VARCHAR(15)		NOT NULL,
	CustLastName	VARCHAR(15)		NOT NULL,
	PhoneNumber		VARCHAR(12)		NOT NULL,
	Email			VARCHAR(40)	NOT NULL,
	PRIMARY KEY (CustomerID),
	FOREIGN KEY (AgentID) REFERENCES Sales_Agent(AgentID) );

CREATE TABLE Insurance
(	InsuranceID CHAR(5)			NOT NULL,
	PolicyType	VARCHAR(15)		NOT NULL,
	RenewalDate	DATE			NOT NULL,
	PRIMARY KEY (InsuranceID) );

CREATE TABLE Deal
(	DealID			CHAR(5)		NOT NULL,
	VehicleID		CHAR(3)		NOT NULL,
	AgentID			CHAR(8)		NOT NULL,
	CustomerID		CHAR(8)		NOT NULL,
	InsuranceID		CHAR(5),
	DealDate		DATE		NOT NULL,
	PRIMARY KEY (DealID),
	FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
	FOREIGN KEY (AgentID) REFERENCES Sales_Agent(AgentID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (InsuranceID) REFERENCES Insurance(InsuranceID) );

INSERT INTO Region VALUES ('334', '36081', 'Troy');
INSERT INTO Region VALUES ('356', '36079', 'Montgomery');
INSERT INTO Region VALUES ('578', '58203', 'Auburn');

INSERT INTO Distributor (DistributorID, DistributorName) VALUES
  ('25863217', 'Lamborghini'),
  ('36521789', 'Ferrari'),
  ('12347896', 'Porsche'),
  ('45324895', 'Aston Martin'),
  ('36589217', 'Maserati'),    
  ('45632479', 'Bentley');

INSERT INTO Dealership (DealershipID, DistributorID, RegionID, RegionZip, DealershipName) VALUES
  ('85632', '36521789', '356', '36079', 'Galleria Motors'),  
  ('47823', '12347896', '334', '36081', 'Scuderia Speed'),  
  ('78962', '36589217', '334', '36081', 'Tridente Motors'),  
  ('59823', '45324895', '578', '58203', 'Velocity Auto Haus'), 
  ('32569', '45632479', '578', '58203', 'Winged Lion Motors'),  
  ('96523', '25863217', '356', '36079', 'Royal Stallion Motors'); 

INSERT INTO Vehicle VALUES ('123', '85632','36521789', 'Lamborghini', 'Aventador', 'Coupe', 2024, 421145.00);
INSERT INTO Vehicle VALUES ('456', '47823', '12347896', 'Ferrari', 'SF90 Stradale', 'Coupe', 2024, 516000.00);
INSERT INTO Vehicle VALUES ('532', '59823', '45324895', 'Aston Martin', 'DBS', 'Coupe', 2024, 336000.00);
INSERT INTO Vehicle VALUES ('328', '96523', '25863217', 'Bugatti', 'Chiron Super Sport 300+', 'Coupe', 2024, 5790000.00);
INSERT INTO Vehicle VALUES ('486', '78962', '36589217', 'McLaren', 'Artura', 'Coupe', 2024, 185500.00);
INSERT INTO Vehicle VALUES ('265', '32569', '45632479', 'Pagani', 'Huayra BC', 'Coupe', 2024, 2800000);
INSERT INTO Vehicle VALUES ('554', '78962', '36589217', 'McLaren', 'GT', 'Coupe', 2024, 210000.00);
INSERT INTO Vehicle VALUES ('416', '96523', '25863217', 'Rolls-Royce', 'Cullinan Black Badge', 'SUV', 2024, 388000.00);
INSERT INTO Vehicle VALUES ('729', '59823', '45324895', 'Bentley', 'Continental GT Speed', 'Coupe', 2024, 335000.00);
INSERT INTO Vehicle VALUES ('349', '85632','36521789', 'Lamborghini', 'Huracan STO', 'Coupe', 2024, 327835.00);
INSERT INTO Vehicle VALUES ('216', '47823', '12347896', 'Ferrari', 'Roma', 'Coupe', 2024, 220340.00);
INSERT INTO Vehicle VALUES ('377', '78962', '36589217', 'Maserati', 'MC20 Cielo', 'Spyder', 2024, 281000.00);
INSERT INTO Manager VALUES ('12345678', '59823', '45324895', 'John', 'Boling', 87900.00, 5100.23);
INSERT INTO Manager VALUES ('45896324', '32569', '45632479', 'Sally', 'Mae', 75000.99, 4250.50);
INSERT INTO Manager VALUES ('52689974', '85632', '36521789', 'Lamar', 'Jackson', 91250.10, NULL);
INSERT INTO Manager VALUES ('14458973', '96523', '25863217', 'Henry', 'Miller', 79025.99, 5200.60);
INSERT INTO Manager VALUES ('32556978', '78962', '36589217', 'Rachel', 'Smith', 81500.10, 2400.00);
INSERT INTO Manager VALUES ('58894123', '47823', '12347896', 'Kevin', 'Rogers', 71250.00, 8450.00);
INSERT INTO Sales_Agent VALUES ('85693248', '12345678', '59823', 'Alex', 'Smith', 47520.59);
INSERT INTO Sales_Agent VALUES ('79621463', '45896324', '32569', 'Hubert', 'Davis', 52081.32);
INSERT INTO Sales_Agent VALUES ('85264532', '58894123', '47823', 'Paul', 'Werner', 51850.50);
INSERT INTO Sales_Agent VALUES ('45698234', '12345678', '59823', 'Jordan', 'Myers', 43450.00);
INSERT INTO Sales_Agent VALUES ('89324037', '45896324', '32569', 'Benjamin', 'Gonzales', 49250.90);
INSERT INTO Sales_Agent VALUES ('74125852', '58894123', '47823', 'Allison', 'Garner', 54800.00);
INSERT INTO Sales_Agent VALUES ('32433468', '52689974', '85632', 'Jennifer', 'Martin', 57950.99);
INSERT INTO Sales_Agent VALUES ('78932145', '14458973', '96523', 'Jasper', 'Sparks', 48650.99);
INSERT INTO Sales_Agent VALUES ('85476932', '14458973', '96523', 'Mitchell', 'Fields', 42600.00);
INSERT INTO Sales_Agent VALUES ('45879632', '32556978', '78962', 'Stacy', 'Diaz', 47600.50);
INSERT INTO Sales_Agent VALUES ('54279634', '32556978', '78962', 'Marshall', 'Reese', 57180.00);
INSERT INTO Sales_Agent VALUES ('28547962', '52689974', '85632', 'Jack', 'Hublot', 61258.00);

INSERT INTO Customer VALUES ('53247962', '85693248', 'Shelly', 'Jones', '4568423698', 'shellyjones@gmail.com');
INSERT INTO Customer VALUES ('64786233', '89324037', 'Logan', 'Hutchinson', '3345896789', 'loganhutch@yahoo.com');
INSERT INTO Customer VALUES ('24863197', '89324037', 'Mark', 'Hunt', '3347852143', 'markymark@gmail.com');
INSERT INTO Customer VALUES ('45682178', '85264532', 'John', 'Miller', '3568421479', 'johnboy@hotmail.com');
INSERT INTO Customer VALUES ('86321478', '85476932', 'Bill', 'Clark', '7892256541', 'bclrk@hotmail.com');
INSERT INTO Customer VALUES ('25463157', '85476932', 'Carly', 'Myers', '7897896325', 'carlyy478@gmail.com');
INSERT INTO Customer VALUES ('78962583', '85693248', 'Morgan', 'Stanley', '4562314862', 'morgstan78@yahoo.com');
INSERT INTO Customer VALUES ('74859612', '45879632', 'Barbara', 'Brown', '3348529654', 'bigbarb400@hotmail.com');
INSERT INTO Customer VALUES ('63222478', '45879632', 'Connor', 'Kirk', '3346953214', 'kirkkconnor@yahoo.com');
INSERT INTO Customer VALUES ('46525896', '32433468', 'Madison', 'Hart', '7892553001', 'lilmaddy@gmail.com');
INSERT INTO Customer VALUES ('88895214', '74125852', 'William', 'Martin', '6502287512', 'willmart@gmail.com');
INSERT INTO Customer VALUES ('52147932', '78932145', 'Megan', 'Sellers', '3345893321', 'megmeg@hotmail.com');
INSERT INTO Customer VALUES ('78527962', '54279634', 'Andrew', 'Jackson', '3345301438', 'andyjack@gmail.com');

INSERT INTO Insurance VALUES ('26687', 'Liability', '2019-04-24');
INSERT INTO Insurance VALUES ('78222', 'Full Coverage', '2019-03-27');
INSERT INTO Insurance VALUES ('56482', 'Full Coverage', '2019-01-17');
INSERT INTO Insurance VALUES ('22268', 'Liability', '2019-02-11');
INSERT INTO Insurance VALUES ('11478', 'Full Coverage', '2019-04-01');
INSERT INTO Insurance VALUES ('44589', 'Full Coverage', '2020-02-01');
INSERT INTO Insurance VALUES ('21444', 'Full Coverage', '2020-04-18');

INSERT INTO Deal VALUES ('48876', '729', '85693248','53247962', NULL, '2019-04-16');
INSERT INTO Deal VALUES ('21115', '123', '32433468', '46525896', '78222', '2018-03-27');
INSERT INTO Deal VALUES ('33658', '216', '74125852', '88895214', '26687', '2018-04-24');
INSERT INTO Deal VALUES ('77885', '416', '85476932', '86321478', NULL, '2019-02-21');
INSERT INTO Deal VALUES ('95632', '265', '89324037', '24863197', '56482', '2018-01-17');
INSERT INTO Deal VALUES ('58221', '456', '85264532', '45682178', '22268', '2018-02-11' );
INSERT INTO Deal VALUES ('45523', '377', '45879632', '63222478', '11478', '2018-04-01');
INSERT INTO Deal VALUES ('48624', '486', '54279634', '78527962', NULL, '2018-11-08');
INSERT INTO Deal VALUES ('55896', '554', '45879632', '74859612', '44589', '2019-02-01');
INSERT INTO Deal VALUES ('25839', '328', '78932145', '52147932', '21444', '2019-04-18');

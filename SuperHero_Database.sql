DROP DATABASE IF EXISTS SuperHero_Database;

CREATE DATABASE IF NOT EXISTS SuperHero_Database;

USE SuperHero_Database;


CREATE TABLE IF NOT EXISTS location (
  LocationID INT(11) NOT NULL AUTO_INCREMENT,
  City VARCHAR(30) NULL,
  State VARCHAR(2) NULL,
  Country VARCHAR(20) NOT NULL,
  Description VARCHAR(50) NULL,
  Latitude DECIMAL(8,2) NOT NULL,
  LatitudeDirection CHAR(1) NOT NULL,
  Longitude DECIMAL(8,2) NOT NULL,
  LongitudeDirection CHAR(1) NOT NULL,
  PRIMARY KEY (LocationID));


CREATE TABLE IF NOT EXISTS sighting (
  SightingID INT(11) NOT NULL AUTO_INCREMENT,
  LocationID INT(11) NOT NULL,
  SightingDate DATE NOT NULL,
  PRIMARY KEY (SightingID),
  FOREIGN KEY (LocationID) 
	REFERENCES location(LocationID));


CREATE TABLE IF NOT EXISTS superHuman (
  SuperID INT(11) NOT NULL AUTO_INCREMENT,
  Hero BOOL NOT NULL,
  SuperName VARCHAR(30) NOT NULL,
  HeightInFeet INT(2) NULL,
  HeightInInches INT(2) NULL,
  Weight DECIMAL(5,2) NULL,
  Power VARCHAR(20) NOT NULL,
  PowerLevel INT(3) NOT NULL,
  PowerDescription VARCHAR(50) NULL, 
  PRIMARY KEY (SuperID));


CREATE TABLE IF NOT EXISTS organization (
  OrganizationID INT(11) NOT NULL AUTO_INCREMENT,
  OrganizationName VARCHAR(30) NOT NULL,
  Role VARCHAR(15) NOT NULL,
  City VARCHAR(30) NULL,
  State VARCHAR(2) NULL,
  Country VARCHAR(20) NOT NULL,
  Phone VARCHAR(10) NULL,
  Email VARCHAR(30) NULL,
  Description VARCHAR(50) NULL,
  PRIMARY KEY (OrganizationID));


CREATE TABLE IF NOT EXISTS organization_has_heroVillain(
  OrganizationID INT(11) NOT NULL,
  SuperID INT(11) NOT NULL,
  Relation TINYTEXT NULL,
  PRIMARY KEY (SuperID, OrganizationID),
  FOREIGN KEY (SuperID)
    REFERENCES superHuman(SuperID),
  FOREIGN KEY (OrganizationID)
    REFERENCES organization(OrganizationID));


CREATE TABLE IF NOT EXISTS heroVillain_sighting (
  SuperID INT(11) NOT NULL,
  SightingID INT(11) NOT NULL,
  PRIMARY KEY (SuperID, SightingID),
  FOREIGN KEY (SuperID)
    REFERENCES superHuman(SuperID),
  FOREIGN KEY (SightingID)
    REFERENCES sighting(SightingID));
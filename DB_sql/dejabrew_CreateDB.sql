CREATE DATABASE IF NOT EXISTS dejabrew;
USE dejabrew;


DROP TABLE IF EXISTS Tablist;
DROP TABLE IF EXISTS Pay;
DROP TABLE IF EXISTS Claim;
DROP TABLE IF EXISTS Buys;
DROP TABLE IF EXISTS Brews;
DROP TABLE IF EXISTS Bar;
CREATE TABLE Bar (
    BarID     INT NOT NULL AUTO_INCREMENT,
    Details   NVARCHAR(100),
    DateAdded DATE,
    Name      NVARCHAR(60),
    Rating    DOUBLE,
    Picture   NVARCHAR(60),
    Location  NVARCHAR(60),
    PRIMARY KEY (BarID)
);

DROP TABLE IF EXISTS Beer;
CREATE TABLE Beer (
    BeerID    INT NOT NULL AUTO_INCREMENT ,
    DateAdded DATE,
    Type      NVARCHAR(40),
    Cost      DOUBLE,
    Comments  NVARCHAR(100),
    Picture   NVARCHAR(60),
    Rating   DOUBLE,
    AlcVol    DOUBLE,
    Name      NVARCHAR(60),
    PRIMARY KEY (BeerID)
);

DROP TABLE IF EXISTS Brewery;
CREATE TABLE Brewery (
    BreweryID INT NOT NULL AUTO_INCREMENT,
    Name      NVARCHAR(60),
    Type      NVARCHAR(40),
    Picture   NVARCHAR(60),
    Location  NVARCHAR(60),
    DateAdded DATE,
    Rating   DOUBLE,
    Details   NVARCHAR(100),
    PRIMARY KEY ( BreweryID )
);

DROP TABLE IF EXISTS Person;
CREATE TABLE Person (
    PID     INT NOT NULL AUTO_INCREMENT,
    Name    NVARCHAR(60),
    Picture NVARCHAR(60),
    PRIMARY KEY ( PID )
);

DROP TABLE IF EXISTS Tab;
CREATE TABLE Tab (
    TabID INT NOT NULL AUTO_INCREMENT,
    Total INT,
    PRIMARY KEY ( TabID )
);

CREATE TABLE Brews (
    BrewID    INT NOT NULL AUTO_INCREMENT,
    BreweryID INT,
    FOREIGN KEY (BreweryID) REFERENCES Brewery (BreweryID),
    BeerID    INT ,
    FOREIGN KEY (BeerID) REFERENCES Beer (BeerID),
    PRIMARY KEY ( BrewID )
);

CREATE TABLE Buys (
    BuyID  INT NOT NULL AUTO_INCREMENT,
    BeerID INT ,
    FOREIGN KEY (BeerID) REFERENCES Beer (BeerID),
    BarID  INT ,
    FOREIGN KEY (BarID) REFERENCES Bar (BarID),
    PRIMARY KEY ( BuyID )
);

CREATE TABLE Claim (
    ClaimID INT NOT NULL AUTO_INCREMENT,
    BarID   INT ,
    FOREIGN KEY (BarID) REFERENCES Bar (BarID),
    TabID   INT ,
    FOREIGN KEY (TabID) REFERENCES Tab (TabID),
    PRIMARY KEY ( ClaimID )
);

CREATE TABLE Pay (
    PayID INT NOT NULL AUTO_INCREMENT,
    TabID INT,
    FOREIGN KEY (TabID) REFERENCES Tab (TabID),
    PID   INT ,
    FOREIGN KEY (PID) REFERENCES Person (PID),
    PRIMARY KEY ( PayID )
);

CREATE TABLE TabList (
    ListID   INT NOT NULL AUTO_INCREMENT,
    BeerID   INT ,
    FOREIGN KEY (BeerID) REFERENCES Beer (BeerID),
    TabID    INT ,
    FOREIGN KEY (TabID) REFERENCES Tab (TabID),
    Quantity INT,
    PRIMARY KEY ( ListID )
);

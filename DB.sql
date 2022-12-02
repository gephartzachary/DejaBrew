--
-- File generated with SQLiteStudio v3.3.3 on Fri Dec 2 16:30:53 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Bar
CREATE TABLE Bar (
    BarID     INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    Details   STRING,
    DateAdded DATE,
    Name      STRING,
    Rating    DECIMAL,
    Picture   STRING,
    Location  STRING
);


-- Table: Beer
CREATE TABLE Beer (
    BeerID    INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    DateAdded DATE,
    Type      STRING,
    Cost      DOUBLE,
    Comments  STRING,
    Picture   STRING,
    AlcVol    DOUBLE,
    Name      STRING
);


-- Table: Brewery
CREATE TABLE Brewery (
    BreweryID INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    Name      STRING,
    Type      STRING,
    Picture   STRING,
    Location  STRING,
    DateAdded DATE,
    Details   STRING
);


-- Table: Brews
CREATE TABLE Brews (
    BrewID    INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    BreweryID INTEGER REFERENCES Brewery (BreweryID),
    BeerID    INTEGER REFERENCES Beer (BeerID) 
);


-- Table: Buys
CREATE TABLE Buys (
    BuyID  INTEGER PRIMARY KEY
                   DEFAULT ( -1),
    BeerID INTEGER REFERENCES Beer (BeerID),
    BarID  INTEGER REFERENCES Bar (BarID) 
);


-- Table: Claim
CREATE TABLE Claim (
    ClaimID INTEGER PRIMARY KEY AUTOINCREMENT
                    NOT NULL,
    BarID   INTEGER REFERENCES Bar (BarID),
    TabID   INTEGER REFERENCES Tab (TabID) 
);


-- Table: Pay
CREATE TABLE Pay (
    PayID INTEGER PRIMARY KEY AUTOINCREMENT
                  NOT NULL,
    TabID INTEGER REFERENCES Tab (TabID),
    PID   INTEGER REFERENCES Person (PID) 
);


-- Table: Person
CREATE TABLE Person (
    PID     INTEGER PRIMARY KEY AUTOINCREMENT
                    NOT NULL,
    Name    STRING,
    Picture STRING
);


-- Table: Tab
CREATE TABLE Tab (
    TabID INTEGER PRIMARY KEY AUTOINCREMENT
                  NOT NULL,
    Total INTEGER
);


-- Table: TabList
CREATE TABLE TabList (
    ListID   INTEGER PRIMARY KEY AUTOINCREMENT
                     NOT NULL,
    BeerID   INTEGER REFERENCES Beer (BeerID),
    TabID    INTEGER REFERENCES Tab (TabID),
    Quantity INTEGER,
    Rating   DOUBLE
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

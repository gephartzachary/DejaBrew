--
-- File generated with SQLiteStudio v3.3.3 on Thu Dec 1 16:33:15 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Bar
CREATE TABLE Bar (
    BarID     INTEGER PRIMARY KEY
                      DEFAULT ( -1),
    Details,
    DateAdded,
    Name,
    Rating,
    Picture,
    Location
);


-- Table: Beer
CREATE TABLE Beer (
    BeerID    INTEGER PRIMARY KEY
                      DEFAULT ( -1),
    DateAdded,
    Type,
    Cost,
    Comments,
    Picture,
    AlcVol,
    Name
);


-- Table: Brewery
CREATE TABLE Brewery (
    BreweryID INTEGER PRIMARY KEY
                      DEFAULT ( -1),
    Name,
    Type,
    Picture,
    Location,
    DateAdded,
    Details
);


-- Table: Brews
CREATE TABLE Brews (
    BrewID    INTEGER PRIMARY KEY
                      DEFAULT ( -1),
    BreweryID         REFERENCES Brewery (BreweryID),
    BeerID            REFERENCES Beer (BeerID) 
);


-- Table: Buys
CREATE TABLE Buys (
    BuyID  INTEGER PRIMARY KEY
                   DEFAULT ( -1),
    BeerID         REFERENCES Beer (BeerID),
    BarID          REFERENCES Bar (BarID) 
);


-- Table: Claim
CREATE TABLE Claim (
    ClaimID INTEGER PRIMARY KEY
                    DEFAULT ( -1),
    BarID           REFERENCES Bar (BarID),
    TabID           REFERENCES Tab (TabID) 
);


-- Table: Pay
CREATE TABLE Pay (
    PayID INTEGER PRIMARY KEY
                  DEFAULT ( -1),
    TabID         REFERENCES Tab (TabID),
    PID           REFERENCES Person (PID) 
);


-- Table: Person
CREATE TABLE Person (
    PID     INTEGER PRIMARY KEY
                    DEFAULT ( -1),
    Name,
    Picture
);


-- Table: Tab
CREATE TABLE Tab (
    TabID INTEGER PRIMARY KEY
                  DEFAULT ( -1),
    Total
);


-- Table: TabList
CREATE TABLE TabList (
    ListID   INTEGER PRIMARY KEY
                     DEFAULT ( -1),
    BeerID           REFERENCES Beer (BeerID),
    TabID            REFERENCES Tab (TabID),
    Quantity,
    Rating
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;


CREATE TABLE Bar (
    BarID     INT NOT NULL AUTO_INCREMENT,
    Details   NVARCHAR,
    DateAdded DATE,
    Name      NVARCHAR,
    Rating    DECIMAL,
    Picture   NVARCHAR,
    Location  NVARCHAR,
    PRIMARY KEY (BarID)
);

CREATE TABLE Beer (
    BeerID    INT NOT NULL AUTO_INCREMENT ,
    DateAdded DATE,
    Type      NVARCHAR,
    Cost      DOUBLE,
    Comments  NVARCHAR,
    Picture   NVARCHAR,
    AlcVol    DOUBLE,
    Name      NVARCHAR,
    PRIMARY KEY (BeerID)
);

CREATE TABLE Brewery (
    BreweryID INT NOT NULL AUTO_INCREMENT,
    Name      NVARCHAR,
    Type      NVARCHAR,
    Picture   NVARCHAR,
    Location  NVARCHAR,
    DateAdded DATE,
    Details   NVARCHAR,
    PRIMARY KEY ( BreweryID )
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

CREATE TABLE Person (
    PID     INT NOT NULL AUTO_INCREMENT,
    Name    NVARCHAR,
    Picture NVARCHAR,
    PRIMARY KEY ( PID )
);

CREATE TABLE Tab (
    TabID INT NOT NULL AUTO_INCREMENT,
    Total INT,
    PRIMARY KEY ( TabID )
);

CREATE TABLE TabList (
    ListID   INT NOT NULL AUTO_INCREMENT,
    BeerID   INT ,
    FOREIGN KEY (BeerID) REFERENCES Beer (BeerID),
    TabID    INT ,
    FOREIGN KEY (TabID) REFERENCES Tab (TabID),
    Quantity INT,
    Rating   DOUBLE,
    PRIMARY KEY ( ListID )
);

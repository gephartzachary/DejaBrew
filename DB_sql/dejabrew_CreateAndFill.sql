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
    Likes     INT,
    Dislikes  INT,
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
    DateAdded DATE,
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


INSERT INTO Bar (Details,DateAdded,Name,Picture,Location)
VALUES
  ("in consectetuer ipsum nunc id","2022-09-12 13:33:29","piano opportunity malt","/picture","South Burlington"),
  ("gravida sit amet, dapibus id,","2022-12-11 23:17:52","green place","/picture","Pocatello"),
  ("faucibus. Morbi","2022-12-10 20:58:37","grey blue","/picture","Tuscaloosa"),
  ("Nullam vitae diam. Proin dolor. Nulla semper tellus id","2022-12-17 22:18:43","orange depth","/picture","North Las Vegas"),
  ("magna a","2022-09-24 22:33:32","ale combination owner","/picture","Bozeman"),
  ("orci tincidunt adipiscing.","2022-10-16 15:24:36","wealth strategy","/picture","Kansas City"),
  ("urna suscipit nonummy. Fusce fermentum","2022-12-23 01:57:00","opportunity malt","/picture","Wilmington"),
  ("bibendum sed, est. Nunc","2022-11-09 03:17:52","control piano opportunity","/picture","Chattanooga"),
  ("Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus","2022-09-14 19:24:27","law fortune","/picture","Huntsville"),
  ("malesuada malesuada. Integer id magna et","2022-09-25 22:18:24","combination owner","/picture","Louisville"),
  ("venenatis a, magna. Lorem ipsum dolor sit amet,","2022-09-06 06:18:52","grey blue","/picture","Lansing"),
  ("aliquet. Phasellus","2022-10-14 16:13:48","history dinner","/picture","Duluth"),
  ("a purus. Duis elementum, dui quis accumsan convallis,","2022-10-01 09:26:29","strategy bread","/picture","San Antonio"),
  ("vehicula aliquet libero. Integer in magna.","2022-11-05 06:44:56","red green","/picture","Gulfport"),
  ("risus. Donec egestas. Duis ac arcu. Nunc","2022-11-26 01:25:21","blue red","/picture","Kearney"),
  ("pede blandit congue. In scelerisque scelerisque dui. Suspendisse","2022-10-24 07:06:28","combination owner storage","/picture","Aurora"),
  ("posuere, enim nisl elementum purus, accumsan interdum libero","2022-11-21 12:44:46","place beers","/picture","Tampa"),
  ("purus mauris","2022-11-21 12:44:46","bread idea","/picture","Ketchikan"),
  ("egestas. Aliquam fringilla cursus purus. Nullam scelerisque","2022-11-30 20:56:24","brewing company","/picture","Erie"),
  ("tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris","2022-12-01 12:59:17","orange depth flight","/picture","Newark");

INSERT INTO Beer (DateAdded,Type,Cost,Comments,Picture,AlcVol,Likes,Dislikes,Name)
VALUES
  ("2022-10-17 11:08:36","Dunkel",6,"Integer mollis. Integer tincidunt aliquam arcu.","/picture",5,548,990,"eget"),
  ("2022-12-19 18:37:19","Amber-Ale",7,"urna convallis erat, eget","/picture",25,160,149,"semper"),
  ("2022-10-25 12:28:50","Doppelbock",9,"metus eu erat semper","/picture",23,361,607,"Mauris"),
  ("2022-10-10 21:11:36","Pale-Lager",9,"Duis dignissim tempor arcu.","/picture",18,451,426,"et magnis"),
  ("2022-12-06 05:21:59","Amber-Ale",13,"consectetuer ipsum nunc id","/picture",23,320,634,"Integer"),
  ("2022-12-03 00:01:36","Dunkel",8,"urna. Ut tincidunt vehicula","/picture",16,254,93,"Etiam ligula"),
  ("2022-09-22 22:42:00","Imperial-Stout",11,"in, hendrerit","/picture",20,887,293,"dapibus gravida."),
  ("2022-12-06 18:40:45","Fruit-bier",9,"tellus. Suspendisse","/picture",11,914,909,"dignissim. Maecenas"),
  ("2022-09-09 23:53:39","Bock",12,"urna convallis erat, eget tincidunt dui augue","/picture",24,929,41,"Cras eget"),
  ("2022-09-09 13:33:48","Helles",11,"orci, in consequat enim","/picture",21,416,553,"natoque"),
  ("2022-12-02 12:05:25","Pilsner",13,"amet,","/picture",8,301,334,"magna"),
  ("2022-09-07 13:17:29","Pilsner",11,"nec urna suscipit nonummy.","/picture",14,809,954,"sollicitudin a,"),
  ("2022-10-22 10:26:37","Bitter",6,"nonummy ut, molestie","/picture",24,522,698,"in,"),
  ("2022-10-11 21:52:16","Maerzen",13,"nonummy ac, feugiat","/picture",9,395,927,"ligula."),
  ("2022-09-07 19:23:33","Barley-Wine",13,"Sed nunc est, mollis non, cursus","/picture",5,172,783,"tellus non"),
  ("2022-09-14 07:28:10","IPA",11,"euismod mauris eu elit.","/picture",8,432,517,"augue,"),
  ("2022-10-27 17:00:59","Witbier",8,"scelerisque mollis. Phasellus libero","/picture",13,823,609,"ante."),
  ("2022-09-23 19:04:04","Barley-Wine",7,"sit","/picture",7,185,775,"quam, elementum"),
  ("2022-09-13 20:51:04","Pale-Lager",7,"ultricies sem magna nec quam.","/picture",15,308,146,"nascetur ridiculus"),
  ("2022-12-16 04:48:02","Tripel",10,"eu tempor erat neque non quam.","/picture",12,341,542,"massa lobortis"),
  ("2022-11-30 02:20:21","Ale",8,"eu, accumsan sed, facilisis","/picture",8,763,161,"Ut"),
  ("2022-10-18 14:15:40","Maerzen",10,"Cum","/picture",25,495,383,"Donec"),
  ("2022-09-23 02:15:02","Brown-Ale",11,"pede. Cras vulputate","/picture",11,987,75,"ligula. Nullam"),
  ("2022-10-30 04:17:39","Pale-Lager",12,"blandit at, nisi. Cum","/picture",19,789,384,"auctor odio"),
  ("2022-11-02 01:16:17","IPA",11,"id","/picture",3,135,443,"Mauris"),
  ("2022-10-04 00:29:56","Pilsner",8,"nibh dolor, nonummy","/picture",22,788,530,"fringilla"),
  ("2022-11-20 16:23:30","Imperial-Stout",13,"dolor","/picture",4,789,461,"elementum,"),
  ("2022-10-20 08:08:32","IPA",10,"gravida sit amet, dapibus","/picture",13,648,867,"risus"),
  ("2022-10-17 02:52:04","Amber-Ale",6,"non dui","/picture",14,570,493,"nec luctus"),
  ("2022-11-21 23:16:46","Pale-Lager",12,"Mauris vestibulum, neque sed","/picture",15,889,177,"congue,"),
  ("2022-09-14 02:33:47","Stout",5,"adipiscing non, luctus sit amet, faucibus","/picture",4,182,818,"sed dictum"),
  ("2022-09-12 00:20:50","Stout",7,"purus","/picture",24,723,867,"eros."),
  ("2022-12-02 01:58:42","Stout",9,"Nunc lectus","/picture",18,405,205,"tempus"),
  ("2022-09-08 19:45:00","Doppelbock",11,"urna justo faucibus lectus, a","/picture",9,975,384,"a,"),
  ("2022-09-26 20:29:21","Doppelbock",9,"ipsum sodales purus, in","/picture",20,131,434,"dapibus"),
  ("2022-09-03 20:01:06","Pale-Lager",10,"arcu","/picture",6,32,569,"ullamcorper. Duis"),
  ("2022-12-23 12:07:55","Maerzen",5,"odio tristique","/picture",12,411,610,"Curabitur"),
  ("2022-12-09 09:43:29","Helles",12,"Proin sed","/picture",22,492,985,"Cras"),
  ("2022-10-09 00:29:05","Maerzen",10,"In lorem. Donec elementum, lorem","/picture",24,863,908,"nec, leo."),
  ("2022-11-18 07:48:25","Brown-Ale",6,"risus a ultricies adipiscing, enim","/picture",19,173,114,"a feugiat"),
  ("2022-09-24 04:52:40","Barley-Wine",9,"varius","/picture",16,37,882,"habitant morbi"),
  ("2022-10-03 05:27:15","Tripel",11,"rhoncus. Donec est. Nunc ullamcorper, velit","/picture",22,806,671,"pede"),
  ("2022-09-05 15:52:54","Ale",8,"Phasellus vitae mauris","/picture",13,660,94,"Suspendisse non"),
  ("2022-12-23 22:31:38","Bitter",12,"tortor at risus. Nunc ac","/picture",10,333,823,"blandit at,"),
  ("2022-09-09 19:36:47","Pilsner",5,"eget, volutpat ornare, facilisis eget, ipsum.","/picture",22,567,715,"venenatis lacus."),
  ("2022-10-26 03:43:51","Pale-Lager",6,"felis. Nulla tempor augue ac ipsum.","/picture",18,324,25,"est"),
  ("2022-12-07 02:12:24","Pale-Lager",9,"Morbi sit amet massa. Quisque","/picture",17,791,882,"congue"),
  ("2022-11-02 19:14:24","Imperial-Stout",11,"fames ac turpis","/picture",5,484,807,"mauris"),
  ("2022-09-02 18:30:32","Bock",12,"nisi sem semper erat, in consectetuer ipsum","/picture",5,797,557,"enim nisl"),
  ("2022-10-09 18:20:55","Ale",12,"Integer tincidunt","/picture",12,241,856,"Nunc");

INSERT INTO Brewery (Name,Type,Picture,Location,DateAdded,Details)
VALUES
  ("tap the","taproom","/picture","Idaho Falls","2022-11-06 03:46:59","Donec tempor, est ac mattis semper, dui"),
  ("american special","regional","/picture","Honolulu","2022-11-27 07:36:15","Morbi neque tellus, imperdiet"),
  ("malt zebra amber","brewpub","/picture","West Valley City","2022-10-13 09:27:26","ullamcorper eu,"),
  ("brewers brewery tapper","brewpub","/picture","Atlanta","2022-12-02 10:44:55","Sed eu nibh vulputate"),
  ("malt zebra","micro","/picture","Meridian","2022-09-14 18:19:12","arcu. Sed et libero. Proin"),
  ("flanders new bar","micro","/picture","Gary","2022-12-17 12:59:50","non, dapibus rutrum, justo. Praesent luctus. Curabitur"),
  ("flanders new","taproom","/picture","Gresham","2022-11-06 15:18:41","a, magna. Lorem ipsum dolor sit"),
  ("flanders new","brewpub","/picture","Mobile","2022-10-01 03:33:03","dapibus quam quis diam."),
  ("new bar","brewpub","/picture","Chandler","2022-10-12 06:35:45","mi felis, adipiscing fringilla, porttitor vulputate, posuere"),
  ("brewing guiness tap","taproom","/picture","Montpelier","2022-10-31 16:41:06","ridiculus mus. Proin vel arcu eu odio tristique");

INSERT INTO Person (Name,Picture)
VALUES
  ("Boris Chen","/picture"),
  ("Jordan Carroll","/picture"),
  ("Olivia Burgess","/picture"),
  ("Alana Park","/picture"),
  ("Margaret Mosley","/picture"),
  ("Uma Meadows","/picture"),
  ("Isadora Crawford","/picture"),
  ("Quinn Pittman","/picture"),
  ("Shay Puckett","/picture"),
  ("Cole Mathis","/picture"),
  ("Basil Hanson","/picture"),
  ("Eve Thompson","/picture"),
  ("Ciaran Coffey","/picture"),
  ("Candace Sampson","/picture"),
  ("Miranda Mathews","/picture"),
  ("Yasir Benton","/picture"),
  ("Kato Lawrence","/picture"),
  ("Igor Sargent","/picture"),
  ("Sage Wallace","/picture"),
  ("Gloria Ochoa","/picture");

INSERT INTO Tab (DateAdded)
VALUES
  ("2022-12-30 20:24:14"),
  ("2022-10-27 23:03:06"),
  ("2022-09-24 21:01:28"),
  ("2022-11-04 23:01:57"),
  ("2022-10-16 23:52:40"),
  ("2022-11-10 12:06:19"),
  ("2022-10-20 15:03:30"),
  ("2022-11-14 09:58:05"),
  ("2022-12-28 15:46:05"),
  ("2022-10-30 08:23:37"),
  ("2022-10-10 23:35:23"),
  ("2022-11-03 00:20:54"),
  ("2022-09-21 05:15:42"),
  ("2022-12-14 17:54:19"),
  ("2022-11-09 13:03:34"),
  ("2022-11-15 15:52:30"),
  ("2022-11-06 15:27:13"),
  ("2022-10-08 11:04:47"),
  ("2022-12-30 16:50:30"),
  ("2022-11-17 12:10:43"),
  ("2022-12-14 08:29:55"),
  ("2022-10-27 03:40:56"),
  ("2022-09-11 21:48:10"),
  ("2022-10-13 16:25:42"),
  ("2022-11-21 17:11:59"),
  ("2022-11-05 19:31:44"),
  ("2022-11-16 13:12:34"),
  ("2022-11-08 18:45:49"),
  ("2022-10-14 15:15:18"),
  ("2022-12-24 08:59:40"),
  ("2022-09-17 07:31:43"),
  ("2022-10-29 05:33:11"),
  ("2022-12-23 01:36:00"),
  ("2022-09-09 21:04:00"),
  ("2022-11-29 19:57:55"),
  ("2022-10-15 06:31:55"),
  ("2022-09-22 00:14:55"),
  ("2022-12-01 02:21:07"),
  ("2022-11-14 05:10:34"),
  ("2022-12-08 20:46:44"),
  ("2022-09-24 02:26:07"),
  ("2022-11-16 12:42:11"),
  ("2022-11-05 18:42:39"),
  ("2022-10-26 19:32:55"),
  ("2022-10-11 20:29:47");

INSERT INTO Pay (TabID,PID)
VALUES
  (22,15),
  (40,18),
  (16,14),
  (14,16),
  (39,4),
  (17,7),
  (40,16),
  (4,2),
  (35,5),
  (27,6),
  (41,18),
  (12,4),
  (5,4),
  (8,20),
  (6,3),
  (27,11),
  (31,15),
  (6,10),
  (44,10),
  (4,16),
  (42,14),
  (42,8),
  (42,19),
  (13,8),
  (4,9),
  (8,5),
  (41,5),
  (33,8),
  (42,14),
  (5,1),
  (18,3),
  (5,6),
  (40,14),
  (44,7),
  (8,6),
  (15,9),
  (12,7),
  (26,2),
  (34,4),
  (14,16),
  (13,4),
  (43,6),
  (20,7),
  (21,7),
  (42,7),
  (13,6),
  (9,17),
  (40,2),
  (45,11),
  (35,11);

INSERT INTO Tablist (BeerID,TabID,Quantity)
VALUES
  (45,32,2),
  (33,38,4),
  (47,27,4),
  (20,21,3),
  (17,30,2),
  (30,45,1),
  (11,44,4),
  (3,27,3),
  (31,33,3),
  (4,32,2),
  (9,44,4),
  (6,23,2),
  (17,9,4),
  (9,35,5),
  (14,23,4),
  (49,28,5),
  (33,28,4),
  (11,6,4),
  (24,15,3),
  (34,34,5),
  (44,27,5),
  (47,25,1),
  (38,20,2),
  (20,5,4),
  (47,4,2),
  (36,20,2),
  (31,7,3),
  (43,40,4),
  (36,42,4),
  (44,43,2),
  (5,13,3),
  (38,45,2),
  (44,45,3),
  (10,27,4),
  (27,32,1),
  (6,20,3),
  (25,32,2),
  (36,6,5),
  (23,3,3),
  (5,12,3),
  (20,19,5),
  (49,3,3),
  (38,41,2),
  (32,39,3),
  (3,26,1),
  (17,4,3),
  (36,10,1),
  (10,1,2),
  (48,7,2),
  (31,34,3);

INSERT INTO Claim (TabID,BarID)
VALUES
  (21,17),
  (40,15),
  (26,16),
  (41,5),
  (37,9),
  (2,7),
  (32,11),
  (20,9),
  (5,10),
  (14,7),
  (15,2),
  (7,11),
  (17,17),
  (35,11),
  (43,9),
  (37,19),
  (14,13),
  (41,16),
  (10,6),
  (21,15),
  (45,11),
  (12,14),
  (45,3),
  (29,10),
  (11,18),
  (45,19),
  (40,18),
  (17,1),
  (39,9),
  (37,1),
  (10,5),
  (36,19),
  (35,5),
  (45,10),
  (5,3),
  (23,14),
  (18,7),
  (22,4),
  (33,7),
  (7,3),
  (7,1),
  (45,17),
  (20,1),
  (34,20),
  (32,13),
  (15,9),
  (21,2),
  (44,5),
  (20,13),
  (25,11);

INSERT INTO Buys (BeerID,BarID)
VALUES
  (3,11),
  (35,9),
  (15,10),
  (36,3),
  (24,19),
  (7,2),
  (5,12),
  (39,6),
  (24,18),
  (25,6),
  (41,10),
  (49,11),
  (37,18),
  (34,10),
  (47,2),
  (33,6),
  (38,4),
  (46,8),
  (33,6),
  (15,11),
  (7,17),
  (25,4),
  (42,13),
  (40,6),
  (22,10),
  (17,14),
  (8,8),
  (36,14),
  (3,20),
  (41,9),
  (7,19),
  (10,16),
  (32,7),
  (13,17),
  (46,8),
  (21,18),
  (16,5),
  (39,14),
  (25,10),
  (6,4),
  (49,7),
  (14,16),
  (22,13),
  (15,3),
  (49,11),
  (22,19),
  (29,17),
  (45,8),
  (32,1),
  (42,10);
INSERT INTO Buys (BeerID,BarID)
VALUES
  (40,15),
  (45,11),
  (39,8),
  (32,3),
  (10,7),
  (37,7),
  (19,13),
  (6,18),
  (9,4),
  (12,6),
  (30,15),
  (45,15),
  (7,8),
  (39,1),
  (34,11),
  (12,14),
  (27,6),
  (41,19),
  (39,4),
  (16,9),
  (26,10),
  (6,18),
  (36,16),
  (2,6),
  (4,7),
  (41,3),
  (29,16),
  (17,10),
  (8,10),
  (33,10),
  (12,20),
  (45,17),
  (34,3),
  (17,11),
  (7,4),
  (10,3),
  (13,8),
  (16,16),
  (13,6),
  (24,13),
  (40,9),
  (20,15),
  (34,6),
  (24,10),
  (39,1),
  (47,15),
  (34,11),
  (35,14),
  (23,19),
  (7,19);


INSERT INTO Brews (BreweryID,BeerID)
VALUES
  (6,25),
  (3,2),
  (7,29),
  (2,36),
  (8,21),
  (8,34),
  (4,37),
  (1,7),
  (5,3),
  (5,40),
  (9,4),
  (7,22),
  (7,3),
  (5,19),
  (6,35),
  (9,23),
  (1,39),
  (7,40),
  (8,14),
  (7,19),
  (5,2),
  (8,29),
  (8,35),
  (3,17),
  (4,4),
  (7,21),
  (6,40),
  (7,42),
  (9,44),
  (6,8),
  (2,34),
  (8,25),
  (8,35),
  (6,10),
  (10,24),
  (1,50),
  (10,25),
  (3,37),
  (5,15),
  (4,2),
  (6,22),
  (2,30),
  (3,34),
  (9,31),
  (2,50),
  (9,33),
  (5,35),
  (6,26),
  (6,44),
  (5,44);
INSERT INTO Brews (BreweryID,BeerID)
VALUES
  (6,1),
  (9,31),
  (3,26),
  (3,49),
  (9,36),
  (10,24),
  (2,40),
  (7,46),
  (5,34),
  (9,12),
  (4,3),
  (2,18),
  (6,24),
  (3,22),
  (7,47),
  (5,19),
  (6,25),
  (8,21),
  (2,42),
  (9,40),
  (7,14),
  (10,33),
  (2,42),
  (5,25),
  (4,10),
  (3,6),
  (6,1),
  (8,13),
  (9,47),
  (7,8),
  (4,40),
  (8,9),
  (7,49),
  (7,43),
  (7,21),
  (1,47),
  (5,29),
  (6,30),
  (2,17),
  (8,23),
  (4,35),
  (5,26),
  (6,12),
  (3,50),
  (9,37),
  (3,1),
  (4,36),
  (3,22),
  (8,35),
  (2,20);
INSERT INTO Brews (BreweryID,BeerID)
VALUES
  (2,10),
  (5,27),
  (7,38),
  (10,2),
  (5,44),
  (8,29),
  (4,46),
  (5,8),
  (8,10),
  (5,36),
  (2,12),
  (9,49),
  (9,2),
  (3,29),
  (4,27),
  (7,47),
  (4,44),
  (3,37),
  (6,4),
  (5,2),
  (10,9),
  (4,28),
  (2,33),
  (4,33),
  (2,28),
  (10,11),
  (8,27),
  (6,33),
  (9,13),
  (2,4),
  (4,15),
  (7,9),
  (9,34),
  (6,10),
  (5,47),
  (5,24),
  (7,50),
  (5,8),
  (1,33),
  (10,7),
  (8,47),
  (2,27),
  (6,12),
  (3,39),
  (7,6),
  (5,47),
  (2,31),
  (8,15),
  (4,26),
  (6,14);
INSERT INTO Brews (BreweryID,BeerID)
VALUES
  (6,30),
  (1,22),
  (2,42),
  (2,16),
  (9,48),
  (7,31),
  (2,22),
  (2,49),
  (9,41),
  (9,7),
  (9,14),
  (5,48),
  (5,36),
  (8,26),
  (5,35),
  (3,12),
  (3,3),
  (6,17),
  (10,21),
  (5,21),
  (4,46),
  (6,14),
  (2,28),
  (3,45),
  (4,16),
  (5,16),
  (1,40),
  (6,9),
  (9,47),
  (8,21),
  (1,34),
  (7,9),
  (1,12),
  (5,37),
  (8,20),
  (6,30),
  (10,13),
  (7,31),
  (9,30),
  (8,4),
  (4,31),
  (4,20),
  (5,48),
  (6,29),
  (6,41),
  (7,6),
  (8,43),
  (4,2),
  (3,18),
  (1,11);

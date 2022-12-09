DELETE FROM Buys WHERE BeerID = ? 
DELETE FROM Brews WHERE BeerID = ? 
DELETE FROM TabList WHERE BeerID = ? 
DELETE FROM Beer WHERE BeerID = ?

UPDATE BEER SET Likes = ? WHERE BeerID = ? 
UPDATE BEER SET Dislikes = ? WHERE BeerID = ? 

INSERT INTO Beer (Name, DateAdded, Type, Cost, Picture, Likes, Dislikes, AlcVol)
VALUES(?, ?, ?, ?, ?, ?, ?, ?) 
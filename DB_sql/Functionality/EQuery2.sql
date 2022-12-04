Select TabID, sum(Quantity*Cost) AS Price
FROM Tablist JOIN Beer
ON TabList.BeerID = Beer.BeerID 
GROUP BY TabID
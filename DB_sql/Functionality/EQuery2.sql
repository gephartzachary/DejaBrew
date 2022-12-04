Select TabID, sum(Quantity*Cost) AS Price
FROM Tablist JOIN Beer
ON TabList.BeerID = Beer.BeerID 
GROUP BY TabID
--HAVING TabID = 'variable = TabID from Pay.PID = Person.PID Where PID is from specific Person'
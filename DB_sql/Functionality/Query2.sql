SELECT Person.Name as Name, Tab.TabID as TabID, Tab.DateAdded as Date, Tabs.Price as Price 
FROM ( 
	SELECT Tablist.TabID as TabID, sum(Quantity*Cost) AS Price
	FROM Tablist JOIN Beer
	ON TabList.BeerID = Beer.BeerID 
	GROUP BY TabID 
) as Tabs 
JOIN Tab JOIN Pay JOIN Person
ON Tabs.TabID = Tab.TabID AND Tabs.TabID = Pay.TabID AND Pay.PID = Person.PID
ORDER BY Name ASC, Date ASC, Price DESC

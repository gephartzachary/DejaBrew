SELECT * 
FROM ( 
SELECT Bar.BarID as BarID, count(Beer.BeerID) as Beers FROM Bar 
	JOIN Buys JOIN Beer 
	ON Bar.BarID = Buys.BarID AND Buys.BeerID = Beer.BeerID 
	GROUP BY Bar.BarID 
	HAVING Beers > ? 
    ) as BeerAmount JOIN Bar 
ON Bar.BarID = BeerAmount.BarID
WHERE Name LIKE ?
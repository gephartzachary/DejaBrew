SELECT Bar.name as Name, count(Beer.BeerID) as Beers FROM Bar
JOIN Buys JOIN Beer
ON Bar.BarID = Buys.BarID AND Buys.BeerID = Beer.BeerID
GROUP BY Bar.BarID
HAVING Beers > ?

SELECT Beer.name as Name, count(Bar.BarID) as Bars FROM Bar
JOIN Buys JOIN Beer
ON Bar.BarID = Buys.BarID AND Buys.BeerID = Beer.BeerID
GROUP BY Beer.BeerID

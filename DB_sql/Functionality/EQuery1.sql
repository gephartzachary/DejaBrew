SELECT Bar.name as Name, Bar.Location as Location FROM Bar
JOIN Buys JOIN Beer
ON Bar.BarID = Buys.BarID AND Buys.BeerID = Beer.BeerID
--Where Beer.Name LIKE 'variable Beer.Name = selected Beer'

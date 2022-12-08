SELECT *, (Ratings.rating/beers) as barRating
FROM (
	SELECT sum(Beer.Rating) as rating, count(Beer.BeerID) as beers, Buys.BarID as BarID 
	FROM Beer JOIN Buys 
	ON Beer.BeerID = Buys.BeerID
	GROUP BY Buys.BarID
    ) as Ratings
JOIN Bar ON Ratings.BarID = Bar.BarID
Order by barRating desc
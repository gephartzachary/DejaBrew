SELECT Brewery.Name as Name, (Ratings.rating/beers) as breweryRating
FROM (
	SELECT sum(Beer.Rating) as rating, count(Beer.BeerID) as beers, brews.BreweryID as BreweryID 
	FROM Beer JOIN Brews 
	ON Beer.BeerID = Brews.BeerID
	GROUP BY brews.BreweryID
    ) as Ratings
JOIN Brewery ON Ratings.BreweryID = Brewery.BreweryID
Order by breweryRating desc
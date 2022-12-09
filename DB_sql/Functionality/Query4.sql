SELECT *, (Ratings.rating/beers) as breweryRating
FROM (
	SELECT sum(((Beer.Likes/(Beer.Likes+Beer.Dislikes))*100)) as rating, count(Beer.BeerID) as beers, brews.BreweryID as BreweryID 
	FROM Beer JOIN Brews 
	ON Beer.BeerID = Brews.BeerID
	GROUP BY brews.BreweryID
    ) as Ratings
JOIN Brewery ON Ratings.BreweryID = Brewery.BreweryID
ORDER BY breweryRating DESC 
LIMIT 5 OFFSET 0
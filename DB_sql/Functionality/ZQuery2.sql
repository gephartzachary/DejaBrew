SELECT sum(Beer.Rating) as rating, count(Beer.BeerID) as beers, brews.BreweryID as BreweryID 
FROM Beer JOIN Brews 
ON Beer.BeerID = Brews.BeerID
GROUP BY brews.BreweryID
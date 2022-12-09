SELECT *,((Beer.Likes/(Beer.Likes+Beer.Dislikes))*100) as Rating 
FROM Beer 
ORDER BY Rating DESC 
LIMIT 5 OFFSET ?
SELECT *, ((Likes/(Likes+Dislikes))*100) as Rating 
FROM Beer 
ORDER BY Rating DESC
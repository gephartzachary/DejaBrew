SELECT *, ((Likes/(Likes+Dislikes))*100) as Rating FROM Beer WHERE Name LIKE ?

SELECT 
    comments.sender_id AS person_id,
    people.name AS person_name
FROM 
    people
INNER JOIN 
    comments ON people.id = comments.sender_id
INNER JOIN 
    articles ON comments.article_id = articles.id
WHERE 
    articles.title = $1;

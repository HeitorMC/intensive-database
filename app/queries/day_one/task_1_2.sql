SELECT 
    people.id AS person_id,
    people.name AS person_name,
    COALESCE(COUNT(articles.id), 0) AS article_count
FROM 
    people
LEFT JOIN 
    articles ON people.id = articles.author_id
GROUP BY 
    people.id
ORDER BY
    people.id

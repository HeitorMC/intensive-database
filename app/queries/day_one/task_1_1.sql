SELECT 
    articles.id AS article_id,
    people.name AS person_name,
    articles.title AS article_title,
    SUBSTRING(articles.body, 1, 150) AS article_body,
    articles.updated_at AS article_updated_at
FROM 
    articles
JOIN 
    people ON articles.author_id = people.id;

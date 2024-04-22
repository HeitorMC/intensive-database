SELECT
	articles.id AS article_id,
	people.name AS author_name,
	articles.title AS article_title,
	SUBSTRING(articles.body, 1, 150) AS article_body,
	COUNT(comments.id) AS comment_count
FROM
	articles
JOIN
	people ON
	people.id = articles.author_id
LEFT JOIN 
  COMMENTS ON
	articles.id = COMMENTS.article_id
GROUP BY
	articles.id,
	people.name
ORDER BY
	articles.id

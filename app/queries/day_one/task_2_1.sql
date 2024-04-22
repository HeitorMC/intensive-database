SELECT
	comments.sender_id AS person_id,
	articles.id AS article_id,
	COUNT(comments.id) AS comment_count
FROM
	articles
JOIN 
  COMMENTS ON
	articles.id = COMMENTS.article_id
GROUP BY
	articles.id ,
	COMMENTS.sender_id
ORDER BY
	articles.id

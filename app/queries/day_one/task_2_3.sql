SELECT
	articles.id AS article_id,
	articles.title AS article_title,
  COUNT(comments.id) AS comment_count
FROM
	articles
LEFT JOIN COMMENTS ON
	articles.id = comments.article_id
GROUP BY
	articles.id
ORDER BY
	comment_count DESC;

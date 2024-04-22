SELECT
	people.id AS author_id,
	people.name AS top_commenter,
	COUNT(comments.id) comments_count
FROM
	people
JOIN
	COMMENTS ON
	people.id = COMMENTS.sender_id
GROUP BY
	people.id
ORDER BY
	comments_count DESC
LIMIT 1

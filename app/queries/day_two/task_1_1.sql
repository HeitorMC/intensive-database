BEGIN TRANSACTION;

WITH comment_data AS (
INSERT
	INTO
		COMMENTS (
    article_id,
		sender_id,
		body,
		created_at,
		updated_at
  )
	VALUES (
    '793',
	'2',
	'20elo étop',
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP
  )
  RETURNING id,
	sender_id,
	article_id,
	created_at,
	updated_at
)
INSERT
	INTO
	reactions (
  kind,
	person_id,
	reactionable_id,
	reactionable_type,
	created_at,
	updated_at
)
SELECT
	'loved',
	sender_id,
	id,
	'Comment',
	created_at,
	updated_at
FROM
	comment_data
UNION ALL
SELECT
	'hated',
	sender_id,
	article_id,
	'Article',
	created_at,
	updated_at
FROM
	comment_data;
END TRANSACTION;

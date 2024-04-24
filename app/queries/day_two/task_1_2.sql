BEGIN

DELETE FROM
	COMMENTS
WHERE
	comments.id = 150;

DELETE FROM
	reactions
WHERE
	reactions.reactionable_id = 150
	AND reactions.reactionable_type = 'Comment';

COMMIT

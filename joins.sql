

SELECT *
FROM users;

SELECT *
FROM posts
WHERE posts.users_id = 100;

SELECT p.id, p.title, p.url, p.content, p.created_at, p.updated_at, u.first_name, u.last_name
FROM posts p
INNER JOIN users u ON u.id = 200;
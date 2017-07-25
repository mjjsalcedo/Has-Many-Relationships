/*SELECT *
FROM users;


SELECT *
FROM posts
WHERE posts.users_id = 100;


SELECT p.id, p.title, p.url, p.content, p.created_at, p.updated_at, u.first_name, u.last_name
FROM posts p
INNER JOIN users u ON u.id = 200;


SELECT p.id, p.title, p.url, p.content, p.created_at, p.updated_at, u.first_name
FROM posts p
INNER JOIN users u ON u.first_name = 'Norene' AND u.last_name = 'Schmitt';


SELECT u.username
FROM users u
INNER JOIN posts p ON p.users_id = u.id
WHERE p.created_at > '2015-01-01';


SELECT p.title, p.content, u.username
FROM posts p
INNER JOIN users u ON u.id = p.users_id
WHERE u.created_at < '2015-01-01';


SELECT c.id, c.body, c.created_at, c.updated_at, p.title as "Post Title"
FROM posts p
RIGHT JOIN comments c ON c.posts_id = p.id;


SELECT c.id, c.body as "comment body", c.created_at, c.updated_at, p.title as "post title", p.url as "post url"
FROM comments c
LEFT JOIN posts p ON p.id = c.posts_id
WHERE p.created_at < '2015-01-01';


SELECT c.id, c.body as "comment body", c.created_at, c.updated_at, p.title as "post title", p.url as "post url"
FROM comments c
LEFT JOIN posts p ON p.id = c.posts_id
WHERE p.created_at > '2015-01-01';


SELECT c.id, c.body as "comment body", c.created_at, c.updated_at, p.title as "post title", p.url as "post url"
FROM comments c
LEFT JOIN posts p ON c.posts_id = p.id
WHERE c.body LIKE '%USB%';


SELECT p.title as "post title", u.first_name, u.last_name, c.body as "comment_body"
FROM users u
INNER JOIN posts p ON p.users_id = u.id
INNER JOIN comments c ON c.posts_id = p.id
WHERE c.body LIKE '%matrix%';


SELECT c.body as "comment_body", u.first_name, u.last_name
FROM users u
INNER JOIN posts p ON p.users_id = u.id
INNER JOIN comments c ON c.posts_id = p.id
WHERE c.body LIKE '%SSL%' AND p.content LIKE '%dolorum%';


SELECT u.first_name as "post_author_first_name", u.last_name as "post_author_last_name", p.title as "post_title", u.username as "comment_author_username", c.body as "comment_body"
FROM users u
INNER JOIN posts p ON p.users_id = u.id
INNER JOIN comments c ON c.posts_id = p.id
WHERE p.content LIKE '%nemo%' AND c.body IN
      (SELECT c.body
       FROM comments c
       WHERE c.body LIKE '%SSL%' OR c.body LIKE '%firewall%');*/

SELECT u.username
FROM users u
INNER JOIN posts p ON p.users_id = u.id
INNER JOIN comments c ON c.posts_id = p.id
WHERE c.body LIKE '%programming%';
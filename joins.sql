-- 1. Create a query to get all fields from the users table
SELECT *
FROM users;

--2. Create a query to get all fields from the posts table where the user_id is 100
SELECT *
FROM posts
WHERE posts.users_id = 100;

--3. Create a query to get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200
SELECT p.id, p.title, p.url, p.content, p.created_at, p.updated_at, u.first_name, u.last_name
FROM posts p
INNER JOIN users u ON u.id = 200;

--4. Create a query to get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'
SELECT p.id, p.title, p.url, p.content, p.created_at, p.updated_at, u.first_name
FROM posts p
INNER JOIN users u ON u.first_name = 'Norene' AND u.last_name = 'Schmitt';

--5. Create a query to get usernames from the users table where the user has created a post after January 1, 2015
SELECT u.username
FROM users u
INNER JOIN posts p ON p.users_id = u.id
WHERE p.created_at > '2015-01-01';

--6. Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015
SELECT p.title, p.content, u.username
FROM posts p
INNER JOIN users u ON u.id = p.users_id
WHERE u.created_at < '2015-01-01';

--7. Create a query to get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comment's fields
SELECT c.id, c.body, c.created_at, c.updated_at, p.title as "Post Title"
FROM posts p
RIGHT JOIN comments c ON c.posts_id = p.id;

--8. Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015
SELECT c.id, c.body as "comment body", c.created_at, c.updated_at, p.title as "post title", p.url as "post url"
FROM comments c
LEFT JOIN posts p ON p.id = c.posts_id
WHERE p.created_at < '2015-01-01';

--9. Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015
SELECT c.id, c.body as "comment body", c.created_at, c.updated_at, p.title as "post title", p.url as "post url"
FROM comments c
LEFT JOIN posts p ON p.id = c.posts_id
WHERE p.created_at > '2015-01-01';

--10. Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'
SELECT c.id, c.body as "comment body", c.created_at, c.updated_at, p.title as "post title", p.url as "post url"
FROM comments c
LEFT JOIN posts p ON c.posts_id = p.id
WHERE c.body LIKE '%USB%';

--.11 Create a query to get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix' ( should have 855 results )
SELECT p.title as "post title", u.first_name, u.last_name, c.body as "comment_body"
FROM users u
INNER JOIN posts p ON p.users_id = u.id
INNER JOIN comments c ON c.posts_id = p.id
WHERE c.body LIKE '%matrix%';

--12. Create a query to get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )
SELECT c.body as "comment_body", u.first_name, u.last_name
FROM users u
INNER JOIN posts p ON p.users_id = u.id
INNER JOIN comments c ON c.posts_id = p.id
WHERE c.body LIKE '%SSL%' AND p.content LIKE '%dolorum%';

--13. Create a query to get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 218 results )
SELECT u.first_name as "post_author_first_name", u.last_name as "post_author_last_name", p.title as "post_title", u.username as "comment_author_username", c.body as "comment_body"
FROM users u
INNER JOIN posts p ON p.users_id = u.id
INNER JOIN comments c ON c.posts_id = p.id
WHERE p.content LIKE '%nemo%' AND c.body IN
      (SELECT c.body
       FROM comments c
       WHERE c.body LIKE '%SSL%' OR c.body LIKE '%firewall%');


--Additional Queries --


--1. Find the post id, post title, and user id of all posts where the post author commented on his/her own post. ( should have 2 results )
SELECT p.id, p.title, u.id
FROM posts p
INNER JOIN users u ON u.id = p.users_id
INNER JOIN comments c ON c.users_id = u.id
WHERE c.posts_id = p.id;

--2. Count how many comments have been written on posts that have been created after July 14, 2015 ( should have one result, the value of the count should be 25)
SELECT COUNT(c.id) AS comment_count
FROM comments c
INNER JOIN posts p ON p.id = c.posts_id
WHERE p.created_at > '2015-07-14';

-- 3. Find all users who comment about 'programming' ( should have 337 results)
SELECT u.username
FROM users u
INNER JOIN posts p ON p.users_id = u.id
INNER JOIN comments c ON c.posts_id = p.id
WHERE c.body LIKE '%programming%';
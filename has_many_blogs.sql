/*\c postgres

DROP DATABASE IF EXISTS has_many_blogs;
DROP USER IF EXISTS has_many_user;


CREATE USER has_many_user;
CREATE DATABASE has_many_blogs WITH OWNER has_many_user;
\c has_many_blogs*/

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(90) NOT NULL,
  first_name VARCHAR(90) DEFAULT NULL,
  last_name VARCHAR(90) DEFAULT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp without time zone NOT NULL DEFAULT NOW()
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(180) DEFAULT NULL,
  url VARCHAR(510) DEFAULT NULL,
  content TEXT DEFAULT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp without time zone NOT NULL DEFAULT NOW(),
  users_id INT REFERENCES users(id) NOT NULL
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  body VARCHAR(510) DEFAULT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp without time zone NOT NULL DEFAULT NOW(),
  users_id INT REFERENCES users(id) NOT NULL,
  posts_id INT REFERENCES posts(id) NOT NULL
);

\i scripts/blog_data.sql;
\i joins.sql;
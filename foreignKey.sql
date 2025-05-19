CREATE TABLE "User" (
    id SERIAL PRIMARY KEY NOT NULL,
    user_name VARCHAR(20) NOT NULL
);

CREATE TABLE Post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INT REFERENCES "User" (id)
);

INSERT INTO
    "User" (user_name)
VALUES ('akash'),
    ('batash'),
    ('sagor'),
    ('nodi');

SELECT * FROM "User";

INSERT INTO
    Post (title, user_id)
VALUES (
        'Enjoying a sunny day with Ash! 🎆',
        2
    ),
    (
        'Bash just shared an amazing recipe! 🪕',
        1
    ),
    (
        'Exploring adventure with Sago! 🎍',
        4
    ),
    (
        'Nodi wisdom always leaves me inspired! 🎡',
        3
    );

SELECT * FROM Post;

INSERT INTO Post (title, user_id) VALUES ('test', NULL);

ALTER TABLE Post alter COLUMN user_id set NOT NULL;

SELECT * FROM "User";

DELETE FROM "User" WHERE id = 4;

DROP TABLE Post;

DROP TABLE "User";

SELECT title, user_name
FROM Post
    JOIN "User" ON Post.user_id = "User".id;

SELECT * FROM post JOIN "User" ON post.user_id = "User".id;

SELECT p.id FROM Post AS p JOIN "User" AS u ON p.user_id = u.id;

SELECT u.id FROM Post AS p JOIN "User" AS u ON p.id = u.id;

SELECT * FROM post AS p JOIN "User" AS u ON p.id = u.id;

INSERT INTO
    post (id, title, user_id)
VALUES (5, 'This is the test post', NULL);
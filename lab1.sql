CREATE DATABASE social_media_db;
USE social_media_db;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    followers INT,
    following INT,
    profile_visits INT
);

CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    post_date DATE,
    likes INT,
    comments INT,
    shares INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users (username, followers, following, profile_visits)
VALUES
('alice', 1200, 300, 5000),
('bob', 800, 400, 3200),
('charlie', 1500, 200, 6700),
('diana', 600, 500, 2100);

INSERT INTO posts (user_id, post_date, likes, comments, shares)
VALUES
(1, '2025-01-10', 300, 40, 20),
(1, '2025-01-15', 500, 60, 45),
(2, '2025-01-11', 150, 20, 10),
(2, '2025-01-18', 200, 35, 15),
(3, '2025-01-12', 800, 120, 70),
(3, '2025-01-20', 900, 150, 90),
(4, '2025-01-13', 100, 10, 5);

#total likes, shares, comments per user
SELECT 
    u.username,
    SUM(p.likes) AS total_likes,
    SUM(p.comments) AS total_comments,
    SUM(p.shares) AS total_shares
FROM users u
JOIN posts p ON u.user_id = p.user_id
GROUP BY u.username;

SELECT 
    u.username,
    SUM(p.likes) AS total_likes
FROM users u
JOIN posts p ON u.user_id = p.user_id
GROUP BY u.username
ORDER BY total_likes DESC
LIMIT 3;


SELECT 
    AVG(likes) AS avg_likes,
    AVG(comments) AS avg_comments,
    AVG(shares) AS avg_shares
FROM posts;

SELECT username, profile_visits
FROM users
ORDER BY profile_visits DESC
LIMIT 1;

SELECT 
    post_id,
    (likes + comments + shares) AS engagement_score
FROM posts
ORDER BY engagement_score DESC;













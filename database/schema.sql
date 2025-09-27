-- Database schema for Javilla app
-- Create database (run this first if database doesn't exist)
-- CREATE DATABASE javilla_db;

-- Use the database
-- USE javilla_db;

-- Example of tables you might need for your app
-- CREATE TABLE IF NOT EXISTS posts (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     title VARCHAR(255) NOT NULL,
--     content TEXT,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- );

-- CREATE TABLE IF NOT EXISTS comments (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     post_id INT NOT NULL,
--     content TEXT NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
-- );

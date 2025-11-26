-- ---------------------CREATE TABLE----------------------------------------------
-- 1. pilih Database
USE db_diStreaming;

-- 2. Buat Tabel Users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Buat Tabel Categories
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- 4. Buat Tabel Movies
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_year YEAR NOT NULL,
    duration_minutes INT DEFAULT NULL,
    poster_url VARCHAR(500) DEFAULT NULL
);

-- 5. Buat Tabel WatchHistory
CREATE TABLE WatchHistory (
    watch_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    watched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_completed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE
);

-- 6. Buat Tabel Ratings
CREATE TABLE Ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    score DECIMAL(3,1) NOT NULL CHECK (score >= 0 AND score <= 10),
    review_text TEXT,
    rated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_movie_rating (user_id, movie_id)
);

-- 7. Buat Tabel Movie_Categories
CREATE TABLE Movie_Categories (
    movie_category_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE,
    UNIQUE KEY unique_movie_category (movie_id, category_id)
);

-- cek tabel
DESCRIBE users;
DESCRIBE categories;
DESCRIBE movies;
DESCRIBE watchHistory;
DESCRIBE ratings;
DESCRIBE movie_categories;

-- -----------------------------------------INSERT DATA----------------------------------------
-- 1. Insert Data User
INSERT INTO Users (username, email, password) VALUES
('johndoe', 'john@example.com', 'hashed_password_1'),
('janedoe', 'jane@example.com', 'hashed_password_2'),
('alice', 'alice@example.com', 'hashed_password_3'),
('bob', 'bob@example.com', 'hashed_password_4'),
('charlie', 'charlie@example.com', 'hashed_password_5'),
('diana', 'diana@example.com', 'hashed_password_6'),
('eve', 'eve@example.com', 'hashed_password_7'),
('frank', 'frank@example.com', 'hashed_password_8'),
('grace', 'grace@example.com', 'hashed_password_9'),
('henry', 'henry@example.com', 'hashed_password_10'),
('ivy', 'ivy@example.com', 'hashed_password_11'),
('jack', 'jack@example.com', 'hashed_password_12'),
('karen', 'karen@example.com', 'hashed_password_13'),
('leo', 'leo@example.com', 'hashed_password_14'),
('mia', 'mia@example.com', 'hashed_password_15');

-- 2. Insert Data Tabel Categories
INSERT INTO Categories (category_name, description) VALUES
('Action', 'Film bergenre aksi dengan adegan laga'),
('Comedy', 'Film yang menghibur dan lucu'),
('Drama', 'Film dengan cerita emosional'),
('Sci-Fi', 'Film fiksi ilmiah'),
('Horror', 'Film yang menakutkan'),
('Romance', 'Film bergenre percintaan'),
('Thriller', 'Film tegang dan penuh ketegangan'),
('Adventure', 'Film dengan petualangan seru'),
('Fantasy', 'Film dengan dunia imajinasi'),
('Documentary', 'Film dokumenter nyata'),
('Animation', 'Film animasi'),
('Crime', 'Film tentang kejahatan'),
('Mystery', 'Film misteri'),
('History', 'Film berdasarkan sejarah'),
('War', 'Film perang');


-- 3. Insert Data Tabel Movies
INSERT INTO Movies (title, description, release_year, duration_minutes, poster_url) VALUES
('Inception', 'A thief who steals corporate secrets through dream-sharing technology.', 2010, 148, 'http://example.com/posters/inception.jpg'),
('The Matrix', 'A computer programmer discovers reality is a simulation.', 1999, 136, 'http://example.com/posters/matrix.jpg'),
('Interstellar', 'A team of explorers travel through a wormhole in space.', 2014, 169, 'http://example.com/posters/interstellar.jpg'),
('Parasite', 'A poor family schemes to become employed by a wealthy family.', 2019, 132, 'http://example.com/posters/parasite.jpg'),
('The Godfather', 'The aging patriarch of an organized crime dynasty transfers control.', 1972, 175, 'http://example.com/posters/godfather.jpg'),
('Pulp Fiction', 'The lives of two mob hitmen intertwine in four tales of violence.', 1994, 154, 'http://example.com/posters/pulp_fiction.jpg'),
('Forrest Gump', 'The story of a man with a low IQ who witnesses historic events.', 1994, 142, 'http://example.com/posters/forrest_gump.jpg'),
('The Dark Knight', 'Batman faces the Joker in a battle for Gotham.', 2008, 152, 'http://example.com/posters/dark_knight.jpg'),
('Fight Club', 'An insomniac forms an underground fight club.', 1999, 139, 'http://example.com/posters/fight_club.jpg'),
('Goodfellas', 'The story of Henry Hill and his life in the mob.', 1990, 146, 'http://example.com/posters/goodfellas.jpg'),
('Titanic', 'A romance set against the sinking of the RMS Titanic.', 1997, 194, 'http://example.com/posters/titanic.jpg'),
('The Lion King', 'A young lion prince flees his kingdom.', 1994, 88, 'http://example.com/posters/lion_king.jpg'),
('Avengers: Endgame', 'The Avengers assemble once more to reverse Thanos actions.', 2019, 181, 'http://example.com/posters/avengers_endgame.jpg'),
('Spirited Away', 'A girl enters a world ruled by gods and witches.', 2001, 125, 'http://example.com/posters/spirited_away.jpg'),
('Whiplash', 'A student and instructor push each other to the limits.', 2014, 106, 'http://example.com/posters/whiplash.jpg');

-- Tambahan
INSERT INTO Movies (title, description, release_year, duration_minutes, poster_url)
VALUES
('Love in Paris', 'Romantic drama set in the heart of Paris.', 2018, 120, 'http://example.com/posters/love_in_paris.jpg'),
('Endless Love', 'A touching story about young lovers who face many challenges.', 2014, 105, 'http://example.com/posters/endless_love.jpg'),
('Love & Destiny', 'A fantasy love story between two worlds.', 2020, 130, 'http://example.com/posters/love_and_destiny.jpg');

-- 4.Insert Data Tabel WatchHistory
INSERT INTO WatchHistory (user_id, movie_id, is_completed) VALUES
(1, 1, TRUE),
(1, 2, FALSE),
(2, 3, TRUE),
(2, 4, TRUE),
(3, 5, FALSE),
(3, 6, TRUE),
(4, 7, TRUE),
(4, 8, TRUE),
(5, 9, FALSE),
(5, 10, TRUE),
(6, 11, TRUE),
(6, 12, FALSE),
(7, 13, TRUE),
(7, 14, TRUE),
(8, 15, FALSE);

-- TambaHan
INSERT INTO WatchHistory (user_id, movie_id, is_completed) VALUES
(1, 16, TRUE),
(2, 16, FALSE),
(3, 17, TRUE),
(4, 17, TRUE),
(5, 18, FALSE),
(6, 18, TRUE);

-- 5.Insert DAta Tabel Ratings
INSERT INTO Ratings (user_id, movie_id, score, review_text) VALUES
(1, 1, 9.0, 'Mind-blowing concept and execution.'),
(2, 2, 9.2, 'Revolutionary in storytelling and action.'),
(3, 3, 9.1, 'Beautiful and emotional journey.'),
(4, 4, 8.6, 'A masterpiece of cinema.'),
(5, 5, 9.3, 'The greatest film ever made.'),
(6, 6, 8.9, 'Iconic dialogue and characters.'),
(7, 7, 8.8, 'Heartwarming and inspirational.'),
(8, 8, 9.4, 'One of the best superhero movies.'),
(9, 9, 8.8, 'A dark and twisted masterpiece.'),
(10, 10, 8.7, 'Realistic portrayal of mob life.'),
(11, 11, 7.8, 'Epic romance and tragedy.'),
(12, 12, 8.5, 'A timeless animated classic.'),
(13, 13, 8.4, 'Epic conclusion to the saga.'),
(14, 14, 9.0, 'A beautiful and imaginative story.'),
(15, 15, 8.5, 'Intense and gripping.');

-- Tambahan
INSERT INTO Ratings (user_id, movie_id, score, review_text) VALUES
(1, 16, 8.2, 'Beautiful romantic storyline.'),
(3, 17, 7.9, 'A classic love story with emotional depth.'),
(5, 18, 8.5, 'Fantasy and romance blended perfectly.');

-- Tambahan Pakai Ignore biar ga duplikat
INSERT IGNORE INTO Movie_Categories (movie_id, category_id) VALUES
(9, 1),  -- Action
(9, 3),  -- Drama
(9, 7),  -- Thriller
(10, 3), -- Drama
(10, 12),-- Crime
(11, 6), -- Romance
(11, 3), -- Drama
(12, 11),-- Animation
(12, 8), -- Adventure
(13, 1), -- Action
(13, 4), -- Sci-Fi
(14, 11),-- Animation
(14, 9), -- Fantasy
(15, 3), -- Drama
(15, 7), -- Thriller
(17, 6), -- Romance
(17, 3), -- Drama
(18, 6), -- Romance
(18, 9), -- Fantasy
(18, 3); -- Drama

-- 6. INsert Data Tabel Movie_Categories
INSERT INTO Movie_Categories (movie_id, category_id) VALUES
(1, 1),  -- Inception - Action
(1, 4),  -- Inception - Sci-Fi
(2, 1),  -- The Matrix - Action
(2, 4),  -- The Matrix - Sci-Fi
(3, 4),  -- Interstellar - Sci-Fi
(3, 8),  -- Interstellar - Adventure
(4, 3),  -- Parasite - Drama
(4, 12), -- Parasite - Crime
(5, 3),  -- The Godfather - Drama
(5, 12), -- The Godfather - Crime
(6, 12), -- Pulp Fiction - Crime
(6, 1),  -- Pulp Fiction - Action
(7, 3),  -- Forrest Gump - Drama
(7, 14), -- Forrest Gump - History
(8, 1);  -- The Dark Knight - Action

-- tambahan
-- love in Paris
INSERT INTO Movie_Categories (movie_id, category_id) VALUES
(16, 6),  -- Romance
(16, 3);  -- Drama


-- ---------------Create Index ------------------------------------------------
CREATE INDEX idx_mc_category_id ON Movie_Categories(category_id); -- mencari film berdasarkan kategori
CREATE INDEX idx_ratings_movie_id ON Ratings(movie_id); -- mencari rating berdasarkan film.
CREATE INDEX idx_ratings_user_id ON Ratings(user_id); -- mencari rating yang diberikan oleh user tertentu

-- -----------------------TEST Pake INDEX --------------
-- Test index: idx_mc_category_id
EXPLAIN
SELECT *
FROM Movie_Categories
WHERE category_id = 3;
-- Test index: idx_mc_category_id (pakai index yang dibikin)
EXPLAIN
SELECT *
FROM Movie_Categories FORCE INDEX (idx_mc_category_id)
WHERE category_id = 3;

-- Test index: idx_ratings_movie_id
EXPLAIN
SELECT *
FROM Ratings
WHERE movie_id = 7;

-- Test index: idx_ratings_movie_id (pakai index yang dibikin)
EXPLAIN
SELECT *
FROM Ratings FORCE INDEX (idx_ratings_movie_id)
WHERE movie_id = 7;

-- cek data

SELECT * FROM users;
SELECT * FROM categories;
SELECT * FROM movies;
SELECT * FROM watchHistory;
SELECT * FROM ratings;
SELECT * FROM movie_categories;


-- -------------------------SQL FUNDAMENTALS-------------------------------
-- 1. Tampilkan seluruh film dari tabel Movies.
SELECT * FROM Movies;

-- 2. tampilkan film dengan rating diatas 8.0
SELECT m.title, m.release_year, r.score
FROM Movies m
JOIN Ratings r ON m.movie_id = r.movie_id
WHERE r.score > 8.0;

-- 3, Tampilkan 5 user pertama berdasarkan nama (A–Z)
SELECT * FROM Users
ORDER BY username ASC
LIMIT 5;

-- 4. Tampilkan film yang judulnya mengandung kata “Love”
SELECT * FROM Movies
WHERE title LIKE '%Love%';

-- 5. Tampilkan film yang rilis pada tahun tertentu (1994)
SELECT * FROM Movies
WHERE release_year = 1994;

-- -------------------------Aggregate & Conditional Logic-------------------------------
-- 1. Hitung total user yang terdaftar.
SELECT COUNT(*) AS total_users FROM Users;

-- 2. Hitung jumlah film per kategori (COUNT + GROUP BY category_id).
SELECT c.category_name, COUNT(mc.movie_id) AS jumlah_film
FROM Categories c
LEFT JOIN Movie_Categories mc ON c.category_id = mc.category_id
GROUP BY c.category_id, c.category_name;

-- 3. Buat kategori film (kolom baru) berdasarkan rating menggunakan CASE WHEN:
SELECT m.title, r.score,
    CASE
        WHEN r.score >= 8.5 THEN 'Top Rated'
        WHEN r.score >= 7.0 AND r.score <= 8.4 THEN 'Popular'
        ELSE 'Regular'
    END AS rating_kategori
FROM Movies m
JOIN Ratings r ON m.movie_id = r.movie_id;

-- -------------------------Join Statements-------------------------------
-- 1. Tampilkan daftar film lengkap (kategori film, rating(score), release year) Tambahan(title, reviewer)
SELECT
    m.title,
    m.release_year,
    c.category_name,
    r.score,
    u.username AS reviewer
FROM Movies m
LEFT JOIN Movie_Categories mc ON m.movie_id = mc.movie_id
LEFT JOIN Categories c ON mc.category_id = c.category_id
LEFT JOIN Ratings r ON m.movie_id = r.movie_id
LEFT JOIN Users u ON r.user_id = u.user_id;

-- 2. Tampilkan kategori yang belum memiliki film sama sekali
SELECT c.category_name
FROM Categories c
LEFT JOIN Movie_Categories mc ON c.category_id = mc.category_id
WHERE mc.category_id IS NULL;

-- Tambahan EXPLAIN Statement
EXPLAIN
SELECT
    m.title,
    m.release_year,
    c.category_name,
    r.score,
    u.username AS reviewer
FROM Movies m
LEFT JOIN Movie_Categories mc ON m.movie_id = mc.movie_id
LEFT JOIN Categories c ON mc.category_id = c.category_id
LEFT JOIN Ratings r ON m.movie_id = r.movie_id
LEFT JOIN Users u ON r.user_id = u.user_id;
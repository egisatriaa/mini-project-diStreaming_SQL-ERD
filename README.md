# 🎬 diStreaming — Mini Project Database MySQL

Mini project diStreaming adalah sistem sederhana untuk manajemen data pengguna, film, kategori film, riwayat tontonan, serta rating. Proyek ini dirancang untuk mempraktikkan pembuatan ERD, DDL, DML, query SQL fundamental, join operations, agregasi, conditional logic, indexing, dan optimasi query menggunakan EXPLAIN.

[Klik disini untuk melihat ERD](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=ERD_diStreaming_Final.drawio&dark=auto#Uhttps%3A%2F%2Fraw.githubusercontent.com%2Fegisatriaa%2Fmini-project-diStreaming_SQL-ERD%2Fmaster%2FERD_diStreaming_Final.drawio)

## ERD & Database Design

Proyek ini memiliki 3 entitas utama:

#### 1. Users : Menyimpan data pengguna aplikasi.

| Field      | Type                 | Description          | Key    |
| ---------- | -------------------- | -------------------- | ------ |
| user_id    | INT (Auto Increment) | ID user              | PK     |
| username   | VARCHAR(50)          | Nama user, unik      | UNIQUE |
| email      | VARCHAR(100)         | Email user, unik     | UNIQUE |
| password   | VARCHAR(255)         | Password terenkripsi | -      |
| created_at | TIMESTAMP            | Waktu registrasi     | -      |

#### 2. Movies : Menyimpan data film yang tersedia di platform.

| Field            | Type                 | Description         | Key |
| ---------------- | -------------------- | ------------------- | --- |
| movie_id         | INT (Auto Increment) | ID film             | PK  |
| title            | VARCHAR(255)         | Judul film          | -   |
| description      | TEXT                 | Deskripsi film      | -   |
| release_year     | YEAR                 | Tahun rilis         | -   |
| duration_minutes | INT                  | Durasi film (menit) | -   |
| poster_url       | VARCHAR(500)         | URL poster          | -   |

#### 3. Categories : Menyimpan daftar kategori/genre film.

| Field         | Type                 | Description         | Key    |
| ------------- | -------------------- | ------------------- | ------ |
| category_id   | INT (Auto Increment) | ID kategori         | PK     |
| category_name | VARCHAR(100)         | Nama kategori, unik | UNIQUE |
| description   | TEXT                 | Deskripsi kategori  | -      |

### Relasi Tambahan

#### 4. Movie_Categories : Many-to-Many antara Movies ↔ Categories

| Field                 | Type                 | Description                            | Key                           |
| --------------------- | -------------------- | -------------------------------------- | ----------------------------- |
| movie_category_id     | INT (Auto Increment) | ID hubungan movie–kategori             | PK                            |
| movie_id              | INT                  | ID film                                | FK → Movies(movie_id)         |
| category_id           | INT                  | ID kategori                            | FK → Categories(category_id)  |
| unique_movie_category | -                    | Mencegah duplikasi kategori untuk film | UNIQUE(movie_id, category_id) |

#### 5. Ratings : Menyimpan rating dan ulasan user untuk film

| Field                    | Type                 | Description                        | Key                       |
| ------------------------ | -------------------- | ---------------------------------- | ------------------------- |
| rating_id                | INT (Auto Increment) | ID rating                          | PK                        |
| user_id                  | INT                  | User pemberi rating                | FK → Users(user_id)       |
| movie_id                 | INT                  | Film yang diberi rating            | FK → Movies(movie_id)     |
| score                    | DECIMAL(3,1)         | Nilai rating (0–10)                | CHECK                     |
| review_text              | TEXT                 | Review                             | -                         |
| rated_at                 | TIMESTAMP            | Waktu rating diberikan             | -                         |
| unique_user_movie_rating | -                    | Mencegah user merating film 2 kali | UNIQUE(user_id, movie_id) |

#### 6. WatchHistory : Menyimpan riwayat tontonan user (watch).

| Field        | Type                 | Description       | Key                   |
| ------------ | -------------------- | ----------------- | --------------------- |
| watch_id     | INT (Auto Increment) | ID riwayat nonton | PK                    |
| user_id      | INT                  | ID user           | FK → Users(user_id)   |
| movie_id     | INT                  | ID film           | FK → Movies(movie_id) |
| watched_at   | TIMESTAMP            | Waktu ditonton    | -                     |
| is_completed | BOOLEAN              | Status selesai    | -                     |

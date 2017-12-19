USE news;

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32) UNIQUE NOT NULL,
    password VARCHAR(32) NOT NULL,
    priority TINYINT UNSIGNED NOT NULL
);

CREATE TABLE category (
    cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(16) NOT NULL
);

CREATE TABLE news (
    news_id INT AUTO_INCREMENT PRIMARY KEY,
    cat_id INT,
    user_id INT,
    title VARCHAR(128) NOT NULL,
    title_img TEXT,
    synopsis TEXT,
    content TEXT NOT NULL,
    attachment TEXT,
    time TIMESTAMP,
    clicks INT,
    CONSTRAINT fk_news_cat FOREIGN KEY(cat_id) REFERENCES category(cat_id) ON DELETE CASCADE,
    CONSTRAINT fk_news_user FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

CREATE TABLE review (
    rev_id INT AUTO_INCREMENT PRIMARY KEY,
    news_id INT,
    content TEXT NOT NULL,
    time TIMESTAMP,
    state VARCHAR(16),
    ip VARCHAR(32),
    CONSTRAINT fk_review_news FOREIGN KEY(news_id) REFERENCES news(news_id) ON DELETE CASCADE
);

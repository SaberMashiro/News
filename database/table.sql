USE news;

CREATE TABLE user (
    username VARCHAR(32) PRIMARY KEY,
    password VARCHAR(32) NOT NULL,
    priority TINYINT UNSIGNED NOT NULL
);

CREATE TABLE category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(16)
);

CREATE TABLE news (
    news_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(128) NOT NULL,
    icon TEXT,
    synopsis TEXT,
    content TEXT NOT NULL,
    time TIMESTAMP DEFAULT now(),
    username VARCHAR(32),
    clicks INT,
    CONSTRAINT fk_news_user FOREIGN KEY(username) REFERENCES user(username) ON DELETE CASCADE
);

CREATE TABLE category_news (
    category_id INT,
    news_id INT,
    CONSTRAINT fk_category_news_category FOREIGN KEY(category_id) REFERENCES category(category_id) ON DELETE CASCADE,
    CONSTRAINT fk_category_news_news FOREIGN KEY(news_id) REFERENCES news(news_id) ON DELETE CASCADE
);

CREATE TABLE comment (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    news_id INT,
    guestname VARCHAR(32) DEFAULT '匿名',
    content TEXT NOT NULL,
    time TIMESTAMP DEFAULT now(),
    ip VARCHAR(32),
    CONSTRAINT fk_review_news FOREIGN KEY(news_id) REFERENCES news(news_id) ON DELETE CASCADE
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    password VARCHAR(32)
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
    content TEXT,
    attachment TEXT,
    time TIMESTAMP,
    clicks INT,
    CONSTRAINT fk_news_cat FOREIGN KEY(cat_id) REFERENCES category(cat_id),
    CONSTRAINT fk_news_user FOREIGN KEY(user_id) REFERENCES user(user_id)
);

CREATE TABLE review (
    rev_id INT AUTO_INCREMENT PRIMARY KEY,
    news_id INT,
    content TEXT,
    time TIMESTAMP,
    state VARCHAR(16),
    ip VARCHAR(32),
    CONSTRAINT fk_review_news FOREIGN KEY(news_id) REFERENCES news(news_id)
);

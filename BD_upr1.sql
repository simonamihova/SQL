CREATE TABLE users (
  user_id INT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  is_admin BOOLEAN NOT NULL
);

CREATE TABLE news_categories (
  category_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE news (
  news_id INT PRIMARY KEY,
  category_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  image_url VARCHAR(255),
  video_url VARCHAR(255),
  FOREIGN KEY (category_id) REFERENCES news_categories(category_id)
);

CREATE TABLE comments (
  comment_id INT PRIMARY KEY,
  news_id INT NOT NULL,
  user_id INT NOT NULL,
  content TEXT NOT NULL,
  created_at DATETIME NOT NULL,
  FOREIGN KEY (news_id) REFERENCES news(news_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);
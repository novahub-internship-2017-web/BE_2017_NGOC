DROP DATABASE IF EXISTS `book-management`;
CREATE DATABASE `book-management` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `book-management`;

DROP TABLE IF EXISTS role;
CREATE TABLE IF NOT EXISTS role(id INT NOT NULL AUTO_INCREMENT, name CHAR(255) NOT NULL, PRIMARY KEY (id));

DROP TABLE IF EXISTS user;
CREATE TABLE IF NOT EXISTS user(id INT NOT NULL AUTO_INCREMENT, email CHAR(50) NOT NULL UNIQUE, password CHAR(255) NOT NULL, first_name VARCHAR(50), last_name VARCHAR(50), enabled BIT NOT NULL DEFAULT FALSE, avatar CHAR(255), role_id INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (role_id) REFERENCES role(id));

DROP TABLE IF EXISTS book;
CREATE TABLE IF NOT EXISTS book(id INT NOT NULL AUTO_INCREMENT, title VARCHAR(200) NOT NULL, author VARCHAR(80) NOT NULL, description VARCHAR(5000), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, image CHAR(255), enabled BIT NOT NULL DEFAULT FALSE, user_id INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (user_id) REFERENCES user(id));

DROP TABLE IF EXISTS comment;
CREATE TABLE IF NOT EXISTS comment(id INT NOT NULL AUTO_INCREMENT, book_id INT NOT NULL, user_id INT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, message VARCHAR(200), PRIMARY KEY (id), FOREIGN KEY (user_id) REFERENCES user(id), FOREIGN KEY (book_id) REFERENCES book(id));

# roles
INSERT INTO role (name) VALUE ("ADMIN");
INSERT INTO role (name) VALUE ("USER");
INSERT INTO role (name) VALUE ("USER");

# users
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("admin@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "admin", "account", true, null, 1);
# password : username
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("ngoc@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "ngoc", "quang", true, null, 2);
# password : username
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("hai@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "thanh", "hai", true, null, 3);

# books
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Harry Potter", 
	"J. K. Rowling", 
	"Harry Potter is a series of fantasy novels written by British author J. K. Rowling. The novels chronicle the life of a young wizard, Harry Potter, and his friends Hermione Granger and Ron Weasley, all of whom are students at Hogwarts School of Witchcraft and Wizardry. The main story arc concerns Harry's struggle against Lord Voldemort, a dark wizard who intends to become immortal, overthrow the wizard governing body known as the Ministry of Magic, and subjugate all wizards and muggles, a reference term that means non-magical people.", 
	now(), now(), "image", true, 1);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Doraemon", 
	"Fujiko Fujio", 
	"Doraemon (ドラえもん Doraemon?), tên thường gọi tại Việt Nam là Đôrêmon, là một nhân vật thuộc loại robot phỏng hình mèo trong bộ truyện và phim hoạt hình cùng tên. Doraemon sinh ngày 3 tháng 9 năm 2112 (thuộc thế kỉ XXII). Cậu có thân hình béo tròn, da màu xanh lam (thực ra khi mới sinh cậu có da màu vàng), không có tai do bị chuột gặm mất. Ban đầu, cậu đến sống và giúp đỡ cho Nobi Sewashi (Nôbitô). Do thắc mắc hoàn cảnh sa sút của gia đình Sewashi, Doraemon dùng Cỗ máy thời gian quay lại quá khứ vào thế kỉ XX (20) để tìm hiểu lý do. Cậu đã phát hiện ra nguyên nhân là Nobi Nobita - cụ tổ của Sewashi - do hậu đậu vụng về nên sau này khiến cho đời sống con cháu cũng khó khăn theo. Vậy là Doraemon quyết định đến sống cùng Nobita để giúp đỡ, hướng dẫn và chăm sóc cậu ta trong những lúc khó khăn. Nhưng cũng hay thương Nobita. Cậu là 1 người hiền lành,hòa đồng với bạn bè mình.", 
	now(), now(), "image1", true, 1);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Crayon Shin-chan", 
	"Yoshito Usui", 
	"Crayon Shin-chan (Japanese: クレヨンしんちゃん Hepburn: Kureyon Shin-chan), also known as Shin Chan, is a Japanese manga series written and illustrated by Yoshito Usui. It follows the adventures of the five-year-old Shinnosuke \"Shin\" Nohara and his parents, baby sister, dog, neighbours, and friends and is set in Kasukabe, Saitama Prefecture.", 
	now(), now(), "image2", false , 1);

INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("title1_2", "chi pheo", "description1", now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("title2_2", "ngo tat to", "description2", now(), now(), "image2", false , 2);

INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("title_3", "chi dau 3", "description", now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("title1_3", "chi pheo 3", "description1", now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("title2_3", "ngo tat to 3", "description2", now(), now(), "image2", true, 3);

# comments
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 1, now(), now(), "sach hay day");
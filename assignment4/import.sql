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
INSERT INTO role (name) VALUE ("USER");
INSERT INTO role (name) VALUE ("USER");
INSERT INTO role (name) VALUE ("USER");
INSERT INTO role (name) VALUE ("USER");
INSERT INTO role (name) VALUE ("USER");
INSERT INTO role (name) VALUE ("USER");
INSERT INTO role (name) VALUE ("USER");
INSERT INTO role (name) VALUE ("USER");
INSERT INTO role (name) VALUE ("USER");
INSERT INTO role (name) VALUE ("USER");

# users
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("admin@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "admin", "account", true, null, 1);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("ngoc@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "ngoc", "quang", true, null, 2);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("hai@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "thanh", "hai", true, null, 3);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("huong@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "huong", "quan", true, null, 4);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("hung@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "hung", "duc", true, null, 5);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("hieu@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "hieu", "minh", true, null, 6);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("thanh@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "thanh", "vien", true, null, 7);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("hoang@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "hoang", "nguyen", true, null, 8);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("tien@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "tien", "dinh", true, null, 9);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("toan@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "toan", "tran", true, null, 10);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("hung1@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "hung", "van", true, null, 11);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("ny@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "Ny", "dieu", true, null, 12);
# password : password
INSERT INTO user (email, password, first_name, last_name, enabled, avatar, role_id) VALUE ("bao@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "bao", "le", true, null, 13);

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
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Anpanman", 
	"Takashi Yanase", 
	"Anpanman (アンパンマン) is a Japanese picture book series written by Takashi Yanase, running from 1973 until the author's death in 2013. The series has been adapted into an anime entitled Soreike! Anpanman (それいけ!アンパンマン, Let's Go! Anpanman), which is one of the most popular anime series among young children in Japan. The series follows the adventures of Anpanman, a superhero with an anpan (a bean-jam filled pastry) for a head, who protects the world from an evil anthropomorphic germ named Baikinman.", 
	now(), now(), "image", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Chibi Maruko-chan", 
	"ちびまる子ちゃん", 
	"The first story under the title \"Chibi Maruko-chan\" was published in the August 1986 edition of the shōjo manga magazine Ribon. Other semi-autobiographical stories by the author had appeared in Ribon and Ribon Original in 1984 and 1985, and were included in the first \"Chibi Maruko-chan\" tankōbon in 1987. The author first began writing and submitting strips in her final year of senior high school, although Shueisha (the publisher of Ribon and Ribon Original) did not decide to run them until over a year later. The author's intent was to write \"essays in manga form\";[1] many stories are inspired by incidents from her own life, and some characters are based on her family and friends. The nostalgic, honest and thoughtful tone of the strip led to its becoming popular among a wider audience.", 
	now(), now(), "image1", true, 2);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Dragon Ball", 
	"Akira Toriyama", 
	"Dragon Ball (Japanese: ドラゴンボール Hepburn: Doragon Bōru) is a Japanese media franchise created by Akira Toriyama in 1984. The initial manga, written and illustrated by Toriyama, was serialized in Weekly Shōnen Jump from 1984 to 1995, with the 519 individual chapters collected into 42 tankōbon volumes by its publisher Shueisha. Dragon Ball was initially inspired by the classical Chinese novel Journey to the West. The series follows the adventures of the protagonist, Son Goku, from his childhood through adulthood as he trains in martial arts and explores the world in search of the seven orbs known as the Dragon Balls, which summon a wish-granting dragon when gathered. Along his journey, Goku makes several friends and battles a wide variety of villains, many of whom also seek the Dragon Balls.", 
	now(), now(), "image2", false , 2);


INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 3);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 3);

INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 4);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 4);


INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 5);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 5);


INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 6);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 6);


INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 7);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 7);


INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 8);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 8);


INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 9);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 9);


INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 10);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 10);


INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 11);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 11);


INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 12);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 12);


INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("One Piece", 
	"Eiichiro Oda", 
	"One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected in 88 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King.", 
	now(), now(), "image", true, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Attack on Titan", 
	"Hajime Isayama", 
	"Attack on Titan (Japanese: 進撃の巨人 Hepburn: Shingeki no Kyojin, lit. \"Advancing Giant\") is a Japanese manga series written and illustrated by Hajime Isayama. The series began in Kodansha's Bessatsu Shōnen Magazine on September 9, 2009, and has been collected into 24 tankōbon volumes as of December 2017. It is set in a world where humanity lives in cities surrounded by enormous walls; a defense against the Titans, gigantic humanoids that eat humans seemingly without reason. The story initially centers on Eren Yeager and his childhood friends Mikasa Ackerman and Armin Arlert, who join the military to fight the Titans after their hometown is invaded and Eren's mother is eaten and Eren swears to avenge her. However, as the story progresses and the truths about the Titans are slowly revealed to the reader, the narrative shifts to encompass Historia Reiss, squad leader Levi, Eren's father Grisha, and other supporting characters.", 
	now(), now(), "image1", false, 13);
INSERT INTO book (title, author, description, created_at, updated_at, image, enabled, user_id) VALUE ("Naruto", 
	"Masashi Kishimoto", 
	"Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997).", 
	now(), now(), "image2", true, 13);


# comments
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (2 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (2 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (2 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (2 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (2 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (2 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (3 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (3 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (3 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (3 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (3 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (3 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (4 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (4 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (4 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (4 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (4 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (4 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (5 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (5 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (5 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (5 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (5 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (5 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (6 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (6 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (6 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (6 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (6 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (6 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (7 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (7 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (7 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (7 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (7 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (7 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (8 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (8 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (8 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (8 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (8 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (8 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (9 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (9 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (9 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (9 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (9 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (9 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (10 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (10 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (10 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (10 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (10 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (10 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (11 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (11 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (11 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (11 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (11 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (11 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (12 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (12 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (12 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (12 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (12 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (12 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (13 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (13 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (13 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (13 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (13 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (13 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (14 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (14 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (14 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (14 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (14 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (14 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (15 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (15 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (15 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (15 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (15 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (15 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (16 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (16 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (16 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (16 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (16 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (16 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (17 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (17 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (17 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (17 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (17 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (17 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (18 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (18 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (18 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (18 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (18 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (18 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (19 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (19 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (19 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (19 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (19 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (19 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (20 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (20 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (20 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (20 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (20 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (20 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (21 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (21 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (21 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (21 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (21 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (21 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (22 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (22 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (22 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (22 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (22 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (22 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (23 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (23 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (23 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (23 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (23 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (23 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (24 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (24 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (24 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (24 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (24 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (24 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (25 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (25 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (25 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (25 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (25 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (25 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (26 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (26 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (26 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (26 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (26 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (26 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (27 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (27 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (27 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (27 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (27 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (27 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (28 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (28 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (28 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (28 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (28 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (28 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (29 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (29 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (29 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (29 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (29 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (29 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (30 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (30 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (30 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (30 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (30 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (30 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (31 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (31 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (31 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (31 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (31 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (31 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (32 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (32 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (32 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (32 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (32 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (32 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (33 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (33 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (33 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (33 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (33 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (33 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (34 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (34 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (34 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (34 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (34 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (34 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (35 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (35 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (35 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (35 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (35 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (35 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (36 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (36 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (36 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (36 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (36 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (36 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (37 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (37 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (37 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (37 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (37 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (37 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (38 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (38 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (38 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (38 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (38 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (38 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (39 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (39 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (39 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (39 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (39 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (39 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (40 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (40 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (40 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (40 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (40 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (40 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (41 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (41 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (41 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (41 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (41 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (41 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (42 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (42 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (42 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (42 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (42 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (42 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (43 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (43 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (43 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (43 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (43 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (43 , 6, now(), now(), "The book is a good resource for learning");
 

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (45 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (45 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (45 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (45 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (45 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (45 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (46 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (46 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (46 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (46 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (46 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (46 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (47 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (47 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (47 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (47 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (47 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (47 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (48 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (48 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (48 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (48 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (48 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (48 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (49 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (49 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (49 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (49 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (49 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (49 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (50 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (50 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (50 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (50 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (50 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (50 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (51 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (51 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (51 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (51 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (51 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (51 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (52 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (52 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (52 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (52 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (52 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (52 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (53 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (53 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (53 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (53 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (53 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (53 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (54 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (54 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (54 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (54 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (54 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (54 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (55 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (55 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (55 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (55 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (55 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (55 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (56 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (56 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (56 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (56 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (56 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (56 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (57 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (57 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (57 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (57 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (57 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (57 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (58 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (58 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (58 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (58 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (58 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (58 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (59 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (59 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (59 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (59 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (59 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (59 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (60 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (60 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (60 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (60 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (60 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (60 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (61 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (61 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (61 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (61 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (61 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (61 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (62 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (62 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (62 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (62 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (62 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (62 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (63 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (63 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (63 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (63 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (63 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (63 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (64 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (64 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (64 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (64 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (64 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (64 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (65 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (65 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (65 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (65 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (65 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (65 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (66 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (66 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (66 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (66 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (66 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (66 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (67 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (67 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (67 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (67 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (67 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (67 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (68 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (68 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (68 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (68 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (68 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (68 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (69 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (69 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (69 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (69 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (69 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (69 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (70 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (70 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (70 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (70 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (70 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (70 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (71 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (71 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (71 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (71 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (71 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (71 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (72 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (72 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (72 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (72 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (72 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (72 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (73 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (73 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (73 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (73 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (73 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (73 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (74 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (74 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (74 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (74 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (74 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (74 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (75 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (75 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (75 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (75 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (75 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (75 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (76 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (76 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (76 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (76 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (76 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (76 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (77 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (77 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (77 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (77 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (77 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (77 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (78 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (78 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (78 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (78 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (78 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (78 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (79 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (79 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (79 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (79 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (79 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (79 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (80 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (80 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (80 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (80 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (80 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (80 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (81 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (81 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (81 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (81 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (81 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (81 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (82 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (82 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (82 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (82 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (82 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (82 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (83 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (83 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (83 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (83 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (83 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (83 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (84 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (84 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (84 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (84 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (84 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (84 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (85 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (85 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (85 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (85 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (85 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (85 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (86 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (86 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (86 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (86 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (86 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (86 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (87 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (87 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (87 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (87 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (87 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (87 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (88 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (88 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (88 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (88 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (88 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (88 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (89 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (89 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (89 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (89 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (89 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (89 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (90 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (90 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (90 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (90 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (90 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (90 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (91 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (91 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (91 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (91 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (91 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (91 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (92 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (92 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (92 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (92 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (92 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (92 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (93 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (93 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (93 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (93 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (93 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (93 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (94 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (94 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (94 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (94 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (94 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (94 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (95 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (95 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (95 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (95 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (95 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (95 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (96 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (96 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (96 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (96 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (96 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (96 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (97 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (97 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (97 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (97 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (97 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (97 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (98 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (98 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (98 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (98 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (98 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (98 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (99 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (99 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (99 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (99 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (99 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (99 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (100 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (100 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (100 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (100 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (100 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (100 , 6, now(), now(), "The book is a good resource for learning");

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (101 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (101 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (101 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (101 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (101 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (101 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (102 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (102 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (102 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (102 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (102 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (102 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (103 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (103 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (103 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (103 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (103 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (103 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (104 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (104 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (104 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (104 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (104 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (104 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (105 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (105 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (105 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (105 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (105 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (105 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (106 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (106 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (106 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (106 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (106 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (106 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (107 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (107 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (107 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (107 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (107 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (107 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (108 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (108 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (108 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (108 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (108 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (108 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (109 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (109 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (109 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (109 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (109 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (109 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (110 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (110 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (110 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (110 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (110 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (110 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (111 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (111 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (111 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (111 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (111 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (111 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (112 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (112 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (112 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (112 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (112 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (112 , 6, now(), now(), "The book is a good resource for learning");

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (113 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (113 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (113 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (113 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (113 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (113 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (114 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (114 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (114 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (114 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (114 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (114 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (115 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (115 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (115 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (115 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (115 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (115 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (116 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (116 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (116 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (116 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (116 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (116 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (117 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (117 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (117 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (117 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (117 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (117 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (118 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (118 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (118 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (118 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (118 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (118 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (119 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (119 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (119 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (119 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (119 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (119 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (120 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (120 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (120 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (120 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (120 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (120 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (121 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (121 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (121 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (121 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (121 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (121 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (122 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (122 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (122 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (122 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (122 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (122 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (123 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (123 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (123 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (123 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (123 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (123 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (124 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (124 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (124 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (124 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (124 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (124 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (125 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (125 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (125 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (125 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (125 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (125 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (126 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (126 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (126 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (126 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (126 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (126 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (127 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (127 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (127 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (127 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (127 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (127 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (128 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (128 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (128 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (128 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (128 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (128 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (129 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (129 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (129 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (129 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (129 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (129 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (130 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (130 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (130 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (130 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (130 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (130 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (131 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (131 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (131 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (131 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (131 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (131 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (132 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (132 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (132 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (132 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (132 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (132 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (133 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (133 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (133 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (133 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (133 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (133 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (134 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (134 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (134 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (134 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (134 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (134 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (135 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (135 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (135 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (135 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (135 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (135 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (136 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (136 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (136 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (136 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (136 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (136 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (137 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (137 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (137 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (137 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (137 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (137 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (138 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (138 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (138 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (138 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (138 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (138 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (139 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (139 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (139 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (139 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (139 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (139 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (140 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (140 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (140 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (140 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (140 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (140 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (141 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (141 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (141 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (141 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (141 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (141 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (142 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (142 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (142 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (142 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (142 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (142 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (143 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (143 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (143 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (143 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (143 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (143 , 6, now(), now(), "The book is a good resource for learning");
 

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (145 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (145 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (145 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (145 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (145 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (145 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (146 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (146 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (146 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (146 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (146 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (146 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (147 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (147 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (147 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (147 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (147 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (147 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (148 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (148 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (148 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (148 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (148 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (148 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (149 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (149 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (149 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (149 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (149 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (149 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (150 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (150 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (150 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (150 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (150 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (150 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (151 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (151 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (151 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (151 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (151 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (151 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (152 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (152 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (152 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (152 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (152 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (152 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (153 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (153 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (153 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (153 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (153 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (153 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (154 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (154 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (154 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (154 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (154 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (154 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (155 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (155 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (155 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (155 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (155 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (155 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (156 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (156 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (156 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (156 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (156 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (156 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (157 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (157 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (157 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (157 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (157 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (157 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (158 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (158 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (158 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (158 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (158 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (158 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (159 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (159 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (159 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (159 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (159 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (159 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (160 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (160 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (160 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (160 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (160 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (160 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (161 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (161 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (161 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (161 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (161 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (161 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (162 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (162 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (162 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (162 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (162 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (162 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (163 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (163 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (163 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (163 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (163 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (163 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (164 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (164 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (164 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (164 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (164 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (164 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (165 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (165 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (165 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (165 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (165 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (165 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (166 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (166 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (166 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (166 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (166 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (166 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (167 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (167 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (167 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (167 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (167 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (167 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (168 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (168 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (168 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (168 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (168 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (168 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (169 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (169 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (169 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (169 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (169 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (169 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (170 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (170 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (170 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (170 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (170 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (170 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (171 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (171 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (171 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (171 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (171 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (171 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (172 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (172 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (172 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (172 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (172 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (172 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (173 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (173 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (173 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (173 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (173 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (173 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (174 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (174 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (174 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (174 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (174 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (174 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (175 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (175 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (175 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (175 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (175 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (175 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (176 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (176 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (176 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (176 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (176 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (176 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (177 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (177 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (177 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (177 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (177 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (177 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (178 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (178 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (178 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (178 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (178 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (178 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (179 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (179 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (179 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (179 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (179 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (179 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (180 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (180 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (180 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (180 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (180 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (180 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (181 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (181 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (181 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (181 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (181 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (181 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (182 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (182 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (182 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (182 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (182 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (182 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (183 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (183 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (183 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (183 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (183 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (183 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (184 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (184 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (184 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (184 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (184 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (184 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (185 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (185 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (185 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (185 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (185 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (185 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (186 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (186 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (186 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (186 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (186 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (186 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (187 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (187 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (187 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (187 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (187 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (187 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (188 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (188 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (188 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (188 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (188 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (188 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (189 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (189 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (189 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (189 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (189 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (189 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (190 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (190 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (190 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (190 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (190 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (190 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (191 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (191 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (191 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (191 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (191 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (191 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (192 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (192 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (192 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (192 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (192 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (192 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (193 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (193 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (193 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (193 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (193 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (193 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (194 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (194 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (194 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (194 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (194 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (194 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (195 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (195 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (195 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (195 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (195 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (195 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (196 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (196 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (196 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (196 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (196 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (196 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (197 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (197 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (197 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (197 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (197 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (197 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (198 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (198 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (198 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (198 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (198 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (198 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (199 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (199 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (199 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (199 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (199 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (199 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (200 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (200 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (200 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (200 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (200 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (200 , 6, now(), now(), "The book is a good resource for learning");

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (201 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (201 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (201 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (201 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (201 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (201 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (202 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (202 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (202 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (202 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (202 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (202 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (203 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (203 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (203 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (203 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (203 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (203 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (204 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (204 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (204 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (204 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (204 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (204 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (205 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (205 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (205 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (205 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (205 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (205 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (206 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (206 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (206 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (206 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (206 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (206 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (207 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (207 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (207 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (207 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (207 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (207 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (208 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (208 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (208 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (208 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (208 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (208 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (209 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (209 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (209 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (209 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (209 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (209 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (210 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (210 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (210 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (210 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (210 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (210 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (211 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (211 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (211 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (211 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (211 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (211 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (212 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (212 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (212 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (212 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (212 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (212 , 6, now(), now(), "The book is a good resource for learning");

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (213 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (213 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (213 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (213 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (213 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (213 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (214 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (214 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (214 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (214 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (214 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (214 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (215 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (215 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (215 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (215 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (215 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (215 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (216 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (216 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (216 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (216 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (216 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (216 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (217 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (217 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (217 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (217 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (217 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (217 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (218 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (218 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (218 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (218 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (218 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (218 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (219 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (219 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (219 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (219 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (219 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (219 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (220 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (220 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (220 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (220 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (220 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (220 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (221 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (221 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (221 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (221 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (221 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (221 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (222 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (222 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (222 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (222 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (222 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (222 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (223 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (223 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (223 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (223 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (223 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (223 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (224 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (224 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (224 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (224 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (224 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (224 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (225 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (225 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (225 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (225 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (225 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (225 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (226 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (226 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (226 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (226 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (226 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (226 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (227 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (227 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (227 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (227 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (227 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (227 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (228 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (228 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (228 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (228 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (228 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (228 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (229 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (229 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (229 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (229 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (229 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (229 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (230 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (230 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (230 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (230 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (230 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (230 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (231 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (231 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (231 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (231 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (231 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (231 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (232 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (232 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (232 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (232 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (232 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (232 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (233 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (233 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (233 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (233 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (233 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (233 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (234 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (234 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (234 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (234 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (234 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (234 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (235 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (235 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (235 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (235 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (235 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (235 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (236 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (236 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (236 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (236 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (236 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (236 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (237 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (237 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (237 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (237 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (237 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (237 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (238 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (238 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (238 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (238 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (238 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (238 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (239 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (239 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (239 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (239 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (239 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (239 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (240 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (240 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (240 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (240 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (240 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (240 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (241 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (241 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (241 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (241 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (241 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (241 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (242 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (242 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (242 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (242 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (242 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (242 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (243 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (243 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (243 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (243 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (243 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (243 , 6, now(), now(), "The book is a good resource for learning");
 

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (245 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (245 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (245 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (245 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (245 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (245 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (246 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (246 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (246 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (246 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (246 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (246 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (247 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (247 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (247 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (247 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (247 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (247 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (248 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (248 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (248 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (248 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (248 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (248 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (249 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (249 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (249 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (249 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (249 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (249 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (250 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (250 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (250 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (250 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (250 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (250 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (251 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (251 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (251 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (251 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (251 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (251 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (252 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (252 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (252 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (252 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (252 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (252 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (253 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (253 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (253 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (253 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (253 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (253 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (254 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (254 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (254 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (254 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (254 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (254 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (255 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (255 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (255 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (255 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (255 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (255 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (256 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (256 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (256 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (256 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (256 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (256 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (257 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (257 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (257 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (257 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (257 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (257 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (258 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (258 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (258 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (258 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (258 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (258 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (259 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (259 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (259 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (259 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (259 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (259 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (260 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (260 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (260 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (260 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (260 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (260 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (261 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (261 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (261 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (261 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (261 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (261 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (262 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (262 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (262 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (262 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (262 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (262 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (263 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (263 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (263 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (263 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (263 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (263 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (264 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (264 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (264 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (264 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (264 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (264 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (265 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (265 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (265 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (265 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (265 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (265 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (266 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (266 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (266 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (266 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (266 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (266 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (267 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (267 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (267 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (267 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (267 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (267 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (268 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (268 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (268 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (268 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (268 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (268 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (269 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (269 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (269 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (269 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (269 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (269 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (270 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (270 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (270 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (270 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (270 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (270 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (271 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (271 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (271 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (271 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (271 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (271 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (272 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (272 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (272 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (272 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (272 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (272 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (273 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (273 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (273 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (273 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (273 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (273 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (274 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (274 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (274 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (274 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (274 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (274 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (275 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (275 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (275 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (275 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (275 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (275 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (276 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (276 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (276 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (276 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (276 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (276 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (277 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (277 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (277 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (277 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (277 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (277 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (278 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (278 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (278 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (278 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (278 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (278 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (279 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (279 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (279 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (279 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (279 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (279 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (280 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (280 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (280 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (280 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (280 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (280 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (281 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (281 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (281 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (281 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (281 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (281 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (282 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (282 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (282 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (282 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (282 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (282 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (283 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (283 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (283 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (283 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (283 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (283 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (284 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (284 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (284 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (284 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (284 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (284 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (285 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (285 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (285 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (285 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (285 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (285 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (286 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (286 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (286 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (286 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (286 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (286 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (287 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (287 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (287 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (287 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (287 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (287 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (288 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (288 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (288 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (288 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (288 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (288 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (289 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (289 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (289 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (289 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (289 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (289 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (290 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (290 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (290 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (290 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (290 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (290 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (291 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (291 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (291 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (291 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (291 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (291 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (292 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (292 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (292 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (292 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (292 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (292 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (293 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (293 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (293 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (293 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (293 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (293 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (294 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (294 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (294 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (294 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (294 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (294 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (295 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (295 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (295 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (295 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (295 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (295 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (296 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (296 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (296 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (296 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (296 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (296 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (297 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (297 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (297 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (297 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (297 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (297 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (298 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (298 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (298 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (298 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (298 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (298 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (299 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (299 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (299 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (299 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (299 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (299 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (300 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (300 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (300 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (300 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (300 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (300 , 6, now(), now(), "The book is a good resource for learning");

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (301 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (301 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (301 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (301 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (301 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (301 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (302 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (302 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (302 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (302 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (302 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (302 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (303 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (303 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (303 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (303 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (303 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (303 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (304 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (304 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (304 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (304 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (304 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (304 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (305 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (305 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (305 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (305 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (305 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (305 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (306 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (306 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (306 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (306 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (306 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (306 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (307 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (307 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (307 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (307 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (307 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (307 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (308 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (308 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (308 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (308 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (308 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (308 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (309 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (309 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (309 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (309 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (309 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (309 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (310 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (310 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (310 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (310 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (310 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (310 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (311 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (311 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (311 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (311 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (311 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (311 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (312 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (312 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (312 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (312 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (312 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (312 , 6, now(), now(), "The book is a good resource for learning");

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (313 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (313 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (313 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (313 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (313 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (313 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (314 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (314 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (314 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (314 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (314 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (314 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (315 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (315 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (315 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (315 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (315 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (315 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (316 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (316 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (316 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (316 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (316 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (316 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (317 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (317 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (317 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (317 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (317 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (317 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (318 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (318 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (318 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (318 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (318 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (318 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (319 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (319 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (319 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (319 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (319 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (319 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (320 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (320 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (320 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (320 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (320 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (320 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (321 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (321 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (321 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (321 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (321 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (321 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (322 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (322 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (322 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (322 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (322 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (322 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (323 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (323 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (323 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (323 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (323 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (323 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (324 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (324 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (324 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (324 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (324 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (324 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (325 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (325 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (325 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (325 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (325 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (325 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (326 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (326 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (326 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (326 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (326 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (326 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (327 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (327 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (327 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (327 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (327 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (327 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (328 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (328 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (328 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (328 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (328 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (328 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (329 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (329 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (329 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (329 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (329 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (329 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (330 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (330 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (330 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (330 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (330 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (330 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (331 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (331 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (331 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (331 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (331 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (331 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (332 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (332 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (332 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (332 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (332 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (332 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (333 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (333 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (333 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (333 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (333 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (333 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (334 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (334 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (334 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (334 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (334 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (334 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (335 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (335 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (335 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (335 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (335 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (335 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (336 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (336 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (336 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (336 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (336 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (336 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (337 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (337 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (337 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (337 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (337 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (337 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (338 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (338 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (338 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (338 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (338 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (338 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (339 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (339 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (339 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (339 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (339 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (339 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (340 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (340 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (340 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (340 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (340 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (340 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (341 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (341 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (341 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (341 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (341 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (341 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (342 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (342 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (342 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (342 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (342 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (342 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (343 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (343 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (343 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (343 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (343 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (343 , 6, now(), now(), "The book is a good resource for learning");
 

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (345 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (345 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (345 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (345 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (345 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (345 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (346 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (346 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (346 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (346 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (346 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (346 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (347 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (347 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (347 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (347 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (347 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (347 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (348 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (348 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (348 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (348 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (348 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (348 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (349 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (349 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (349 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (349 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (349 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (349 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (350 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (350 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (350 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (350 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (350 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (350 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (351 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (351 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (351 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (351 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (351 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (351 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (352 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (352 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (352 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (352 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (352 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (352 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (353 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (353 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (353 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (353 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (353 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (353 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (354 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (354 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (354 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (354 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (354 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (354 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (355 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (355 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (355 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (355 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (355 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (355 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (356 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (356 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (356 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (356 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (356 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (356 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (357 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (357 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (357 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (357 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (357 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (357 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (358 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (358 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (358 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (358 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (358 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (358 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (359 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (359 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (359 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (359 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (359 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (359 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (360 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (360 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (360 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (360 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (360 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (360 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (361 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (361 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (361 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (361 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (361 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (361 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (362 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (362 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (362 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (362 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (362 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (362 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (363 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (363 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (363 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (363 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (363 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (363 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (364 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (364 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (364 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (364 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (364 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (364 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (365 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (365 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (365 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (365 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (365 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (365 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (366 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (366 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (366 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (366 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (366 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (366 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (367 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (367 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (367 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (367 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (367 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (367 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (368 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (368 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (368 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (368 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (368 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (368 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (369 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (369 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (369 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (369 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (369 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (369 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (370 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (370 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (370 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (370 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (370 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (370 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (371 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (371 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (371 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (371 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (371 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (371 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (372 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (372 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (372 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (372 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (372 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (372 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (373 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (373 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (373 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (373 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (373 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (373 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (374 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (374 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (374 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (374 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (374 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (374 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (375 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (375 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (375 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (375 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (375 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (375 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (376 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (376 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (376 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (376 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (376 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (376 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (377 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (377 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (377 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (377 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (377 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (377 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (378 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (378 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (378 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (378 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (378 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (378 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (379 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (379 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (379 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (379 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (379 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (379 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (380 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (380 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (380 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (380 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (380 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (380 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (381 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (381 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (381 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (381 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (381 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (381 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (382 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (382 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (382 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (382 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (382 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (382 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (383 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (383 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (383 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (383 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (383 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (383 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (384 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (384 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (384 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (384 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (384 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (384 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (385 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (385 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (385 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (385 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (385 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (385 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (386 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (386 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (386 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (386 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (386 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (386 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (387 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (387 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (387 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (387 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (387 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (387 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (388 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (388 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (388 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (388 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (388 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (388 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (389 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (389 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (389 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (389 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (389 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (389 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (390 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (390 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (390 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (390 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (390 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (390 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (391 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (391 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (391 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (391 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (391 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (391 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (392 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (392 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (392 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (392 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (392 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (392 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (393 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (393 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (393 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (393 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (393 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (393 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (394 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (394 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (394 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (394 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (394 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (394 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (395 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (395 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (395 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (395 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (395 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (395 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (396 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (396 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (396 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (396 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (396 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (396 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (397 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (397 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (397 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (397 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (397 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (397 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (398 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (398 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (398 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (398 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (398 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (398 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (399 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (399 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (399 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (399 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (399 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (399 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (400 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (400 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (400 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (400 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (400 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (400 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (401 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (401 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (401 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (401 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (401 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (401 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (402 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (402 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (402 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (402 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (402 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (402 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (403 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (403 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (403 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (403 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (403 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (403 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (404 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (404 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (404 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (404 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (404 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (404 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (405 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (405 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (405 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (405 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (405 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (405 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (406 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (406 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (406 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (406 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (406 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (406 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (407 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (407 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (407 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (407 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (407 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (407 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (408 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (408 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (408 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (408 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (408 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (408 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (409 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (409 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (409 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (409 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (409 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (409 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (410 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (410 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (410 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (410 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (410 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (410 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (411 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (411 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (411 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (411 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (411 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (411 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (412 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (412 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (412 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (412 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (412 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (412 , 6, now(), now(), "The book is a good resource for learning");

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (413 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (413 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (413 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (413 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (413 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (413 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (414 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (414 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (414 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (414 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (414 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (414 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (415 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (415 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (415 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (415 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (415 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (415 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (416 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (416 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (416 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (416 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (416 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (416 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (417 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (417 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (417 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (417 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (417 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (417 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (418 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (418 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (418 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (418 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (418 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (418 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (419 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (419 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (419 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (419 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (419 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (419 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (420 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (420 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (420 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (420 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (420 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (420 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (421 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (421 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (421 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (421 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (421 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (421 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (422 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (422 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (422 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (422 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (422 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (422 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (423 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (423 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (423 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (423 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (423 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (423 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (424 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (424 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (424 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (424 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (424 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (424 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (425 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (425 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (425 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (425 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (425 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (425 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (426 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (426 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (426 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (426 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (426 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (426 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (427 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (427 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (427 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (427 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (427 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (427 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (428 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (428 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (428 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (428 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (428 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (428 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (429 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (429 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (429 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (429 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (429 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (429 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (430 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (430 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (430 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (430 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (430 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (430 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (431 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (431 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (431 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (431 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (431 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (431 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (432 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (432 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (432 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (432 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (432 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (432 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (433 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (433 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (433 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (433 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (433 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (433 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (434 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (434 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (434 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (434 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (434 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (434 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (435 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (435 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (435 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (435 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (435 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (435 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (436 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (436 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (436 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (436 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (436 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (436 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (437 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (437 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (437 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (437 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (437 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (437 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (438 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (438 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (438 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (438 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (438 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (438 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (439 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (439 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (439 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (439 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (439 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (439 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (440 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (440 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (440 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (440 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (440 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (440 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (441 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (441 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (441 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (441 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (441 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (441 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (442 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (442 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (442 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (442 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (442 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (442 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (443 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (443 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (443 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (443 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (443 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (443 , 6, now(), now(), "The book is a good resource for learning");
 

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (445 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (445 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (445 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (445 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (445 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (445 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (446 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (446 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (446 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (446 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (446 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (446 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (447 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (447 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (447 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (447 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (447 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (447 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (448 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (448 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (448 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (448 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (448 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (448 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (449 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (449 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (449 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (449 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (449 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (449 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (450 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (450 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (450 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (450 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (450 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (450 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (451 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (451 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (451 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (451 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (451 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (451 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (452 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (452 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (452 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (452 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (452 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (452 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (453 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (453 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (453 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (453 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (453 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (453 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (454 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (454 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (454 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (454 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (454 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (454 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (455 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (455 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (455 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (455 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (455 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (455 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (456 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (456 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (456 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (456 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (456 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (456 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (457 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (457 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (457 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (457 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (457 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (457 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (458 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (458 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (458 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (458 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (458 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (458 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (459 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (459 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (459 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (459 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (459 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (459 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (460 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (460 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (460 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (460 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (460 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (460 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (461 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (461 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (461 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (461 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (461 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (461 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (462 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (462 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (462 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (462 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (462 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (462 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (463 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (463 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (463 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (463 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (463 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (463 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (464 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (464 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (464 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (464 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (464 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (464 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (465 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (465 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (465 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (465 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (465 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (465 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (466 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (466 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (466 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (466 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (466 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (466 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (467 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (467 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (467 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (467 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (467 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (467 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (468 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (468 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (468 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (468 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (468 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (468 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (469 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (469 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (469 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (469 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (469 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (469 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (470 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (470 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (470 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (470 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (470 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (470 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (471 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (471 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (471 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (471 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (471 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (471 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (472 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (472 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (472 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (472 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (472 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (472 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (473 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (473 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (473 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (473 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (473 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (473 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (474 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (474 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (474 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (474 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (474 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (474 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (475 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (475 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (475 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (475 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (475 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (475 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (476 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (476 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (476 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (476 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (476 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (476 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (477 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (477 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (477 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (477 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (477 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (477 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (478 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (478 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (478 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (478 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (478 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (478 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (479 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (479 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (479 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (479 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (479 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (479 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (480 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (480 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (480 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (480 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (480 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (480 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (481 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (481 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (481 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (481 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (481 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (481 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (482 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (482 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (482 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (482 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (482 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (482 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (483 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (483 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (483 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (483 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (483 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (483 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (484 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (484 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (484 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (484 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (484 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (484 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (485 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (485 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (485 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (485 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (485 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (485 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (486 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (486 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (486 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (486 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (486 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (486 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (487 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (487 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (487 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (487 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (487 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (487 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (488 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (488 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (488 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (488 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (488 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (488 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (489 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (489 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (489 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (489 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (489 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (489 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (490 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (490 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (490 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (490 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (490 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (490 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (491 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (491 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (491 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (491 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (491 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (491 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (492 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (492 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (492 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (492 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (492 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (492 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (493 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (493 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (493 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (493 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (493 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (493 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (494 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (494 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (494 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (494 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (494 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (494 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (495 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (495 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (495 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (495 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (495 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (495 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (496 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (496 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (496 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (496 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (496 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (496 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (497 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (497 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (497 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (497 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (497 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (497 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (498 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (498 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (498 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (498 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (498 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (498 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (499 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (499 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (499 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (499 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (499 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (499 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (500 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (500 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (500 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (500 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (500 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (500 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (501 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (501 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (501 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (501 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (501 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (501 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (502 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (502 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (502 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (502 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (502 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (502 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (503 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (503 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (503 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (503 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (503 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (503 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (504 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (504 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (504 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (504 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (504 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (504 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (505 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (505 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (505 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (505 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (505 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (505 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (506 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (506 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (506 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (506 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (506 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (506 , 6, now(), now(), "The book is a good resource for learning");


INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (507 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (507 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (507 , 3, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (507 , 4, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (507 , 5, now(), now(), "Thats good!");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (507 , 6, now(), now(), "The book is a good resource for learning");
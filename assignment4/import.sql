DROP DATABASE IF EXISTS `book-management`;
CREATE DATABASE `book-management` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `book-management`;

DROP TABLE IF EXISTS role;
CREATE TABLE IF NOT EXISTS role(id INT NOT NULL AUTO_INCREMENT, name CHAR(255) NOT NULL, PRIMARY KEY (id));

DROP TABLE IF EXISTS user;
CREATE TABLE IF NOT EXISTS user(id INT NOT NULL AUTO_INCREMENT, email CHAR(50) NOT NULL UNIQUE, password CHAR(255) NOT NULL, first_name VARCHAR(50), last_name VARCHAR(50), enabled BIT NOT NULL DEFAULT FALSE, avatar CHAR(255), role_id INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE);

DROP TABLE IF EXISTS book;
CREATE TABLE IF NOT EXISTS book(id INT NOT NULL AUTO_INCREMENT, title VARCHAR(200) NOT NULL, author VARCHAR(80) NOT NULL, description VARCHAR(5000), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, image CHAR(255), enabled BIT NOT NULL DEFAULT FALSE, user_id INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE);

DROP TABLE IF EXISTS comment;
CREATE TABLE IF NOT EXISTS comment(id INT NOT NULL AUTO_INCREMENT, book_id INT NOT NULL, user_id INT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, message VARCHAR(200), PRIMARY KEY (id), FOREIGN KEY (user_id) REFERENCES user(id), FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE);

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

# comments
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 1, now(), now(), "sach hay");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (1 , 1, now(), now(), "sach hay day");

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (2 , 1, now(), now(), "It's nice, but I wish the pages were thicker for writing on the front and back.");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (2 , 2, now(), now(), "Excellent book your review");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (2 , 1, now(), now(), "Thats good!");

INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (3 , 1, now(), now(), "The book is a good resource for learning");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (3 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (3 , 1, now(), now(), "sach hay day");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (3 , 1, now(), now(), "sach hay day");
INSERT INTO comment (book_id, user_id, created_at, updated_at, message) VALUE (3 , 1, now(), now(), "sach hay day chu nhi");
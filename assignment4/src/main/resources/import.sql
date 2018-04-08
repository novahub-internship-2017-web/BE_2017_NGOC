CREATE DATABASE IF NOT EXISTS `book-management`;

USE `book-management`;

CREATE TABLE IF NOT EXISTS `user`(`id` INT NOT NULL AUTO_INCREMENT,`email` CHAR(50) NOT NULL UNIQUE ,`password` CHAR(255) NOT NULL,`first_name` VARCHAR(50),`last_name` VARCHAR(50),`enabled` BIT NOT NULL DEFAULT FALSE,`avatar` CHAR(255),`role_id` INT NOT NULL,PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `role`(`id` INT NOT NULL AUTO_INCREMENT,`name` CHAR(255) NOT NULL,PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `book`(`id` INT NOT NULL AUTO_INCREMENT,`title` VARCHAR(200) NOT NULL,`author` VARCHAR(80) NOT NULL,`description` VARCHAR(1000),`created_at` DATETIME NOT NULL,`updated_at` DATETIME NOT NULL,`image` CHAR(255),`enabled` BIT NOT NULL DEFAULT FALSE,`user_id` INT NOT NULL,PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `comment`(`id` INT NOT NULL AUTO_INCREMENT,`book_id` INT NOT NULL,`user_id` INT NOT NULL,`created_at` DATETIME NOT NULL,`updated_at` DATETIME NOT NULL,`message` VARCHAR(200),PRIMARY KEY (`id`))

// roles
INSERT INTO `role` (`name`) VALUE ("ADMIN");
INSERT INTO `role` (`name`) VALUE ("USER");

// users
// password : password
INSERT INTO `user` (`email`, `password`, `first_name`, `last_name`, `enabled`, `avatar`, `role_id`) VALUE ("admin@gmail.com", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", "firstname", "lastname", false, null, 1);
// password : username
INSERT INTO `user` (`email`, `password`, `first_name`, `last_name`, `enabled`, `avatar`, `role_id`) VALUE ("user@gmail.com", "16F78A7D6317F102BBD95FC9A4F3FF2E3249287690B8BDAD6B7810F82B34ACE3", "firstname", "lastname", false, null, 2);

// books
INSERT INTO `book` (`title`, `author`, `description`, `created_at`, `updated_at`, `image`, `enabled`, `user_id`) VALUE ("title", "tình yêu màu n", "description", now(), now(), "image", true, 1);
INSERT INTO `book` (`title`, `author`, `description`, `created_at`, `updated_at`, `image`, `enabled`, `user_id`) VALUE ("title1", "nguyen anh dung", "description1", now(), now(), "image1", true, 1);
INSERT INTO `book` (`title`, `author`, `description`, `created_at`, `updated_at`, `image`, `enabled`, `user_id`) VALUE ("title2", "author2", "description2", now(), now(), "image2", false , 1);

// comments
INSERT INTO `comment` (`book_id`, `user_id`, `created_at`, `updated_at`, `message`) VALUE (1 , 1, now(), now(), "sach hay");
INSERT INTO `comment` (`book_id`, `user_id`, `created_at`, `updated_at`, `message`) VALUE (1 , 2, now(), now(), "sach hay tot ghe");
INSERT INTO `comment` (`book_id`, `user_id`, `created_at`, `updated_at`, `message`) VALUE (1 , 1, now(), now(), "sach hay day");
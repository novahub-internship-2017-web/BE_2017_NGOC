CREATE DATABASE IF NOT EXISTS `book-management`;

USE `book-management`;

CREATE TABLE IF NOT EXISTS `book-management`.`user`(`id` INT NOT NULL AUTO_INCREMENT,`email` CHAR(50) NOT NULL UNIQUE ,`password` CHAR(50) NOT NULL,`first_name` VARCHAR(50),`last_name` VARCHAR(50),`enabled` BIT NOT NULL DEFAULT FALSE,`avatar` CHAR(255),`role_id` INT NOT NULL,PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `book-management`.`role`(`id` INT NOT NULL AUTO_INCREMENT,`name` CHAR(255) NOT NULL,PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `book-management`.`book`(`id` INT NOT NULL AUTO_INCREMENT,`title` VARCHAR(200) NOT NULL,`author` VARCHAR(80) NOT NULL,`description` VARCHAR(1000),`created_at` DATETIME NOT NULL,`updated_at` DATETIME NOT NULL,`image` CHAR(255),`enabled` BIT NOT NULL DEFAULT FALSE,`user_id` INT NOT NULL,PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `book-management`.`comment`(`id` INT NOT NULL AUTO_INCREMENT,`book_id` INT NOT NULL,`user_id` INT NOT NULL,`created_at` DATETIME NOT NULL,`updated_at` DATETIME NOT NULL,`content` VARCHAR(200),PRIMARY KEY (`id`))

// users

INSERT INTO `book-management`.`book` (`title`, `author`, `description`, `created_at`, `updated_at`, `image`, `enabled`, `user_id`) VALUE ("title", "author", "description", now(), now(), "image", true, 1);
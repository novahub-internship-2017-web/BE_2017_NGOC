CREATE DATABASE IF NOT EXISTS `spring-boot-hibernate` ;

USE `spring-boot-hibernate`;

CREATE TABLE IF NOT EXISTS `spring-boot-hibernate`.`customer`(`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, `name` VARCHAR(45) NULL, `address` VARCHAR(255) NULL);
create user 'ngoc'@'localhost' identified by 'Quangngoc430';
grant all on *.* to 'ngoc'@'localhost' identified by 'Quangngoc430';

create database EmployeeDB;

use EmployeeDB;

CREATE TABLE `User` (
  `id_user` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(40) NOT NULL DEFAULT '',
  `password` char(20) NOT NULL DEFAULT '',
  `access` int(11) NOT NULL DEFAULT '1',
  `active` boolean NOT NULL DEFAULT TRUE,
  PRIMARY KEY (`id_user`)
); 

CREATE TABLE `User_info` (
  `id_user` int(11) unsigned NOT NULL,
  `fullname` nvarchar(50) NOT NULL DEFAULT '',
  `year_of_birth` int(11) NOT NULL DEFAULT '1970',
  `country` nvarchar(50) NOT NULL DEFAULT 'Viet Nam',
  `allowance` double NOT NULL DEFAULT '0',
  `coefficientsSalary` double NOT NULL DEFAULT '0',
  `level` int NOT NULL DEFAULT '0',
  FOREIGN KEY (`id_user`) REFERENCES User(`id_user`) 
);

CREATE TABLE `Teacher` (
  `id_teacher` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) unsigned NOT NULL,
  `major` nvarchar(50) NOT NULL DEFAULT '',
  `number_of_lessons` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_teacher`),
  FOREIGN KEY (`id_user`) REFERENCES User(`id_user`) 
);

CREATE TABLE `Staff` (
  `id_staff` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) unsigned NOT NULL,
  `department` nvarchar(50) NOT NULL DEFAULT '',
  `days_of_work` int DEFAULT '0',
  PRIMARY KEY (`id_staff`),
  FOREIGN KEY (`id_user`) REFERENCES User(`id_user`) 
);

insert into EmployeeDB.User (username, password, access) 
value ('administrator', 'password', 0),
('staff1', 'password', 1),
('teacher', 'password', 2);

insert into EmployeeDB.User_info
values (1, 'admin', 1990, 'Viet Nam', 1000, 4.5, 4),
(2, 'staff', 2000, 'Viet Nam', 600, 3.4, 2),
(3, 'teacher', 1970, 'USA', 300, 5.0, 1);

insert into EmployeeDB.Staff (id_user, department, days_of_work)
values (1, 'I.T', 30);
insert into EmployeeDB.Teacher (id_user, major, number_of_lessons)
values (1, '', 0);

insert into EmployeeDB.Staff (id_user, department, days_of_work)
values (2, 'K.T', 40);
insert into EmployeeDB.Teacher (id_user, major, number_of_lessons)
values (2, '', 0);

insert into EmployeeDB.Teacher (id_user, major, number_of_lessons)
values (3, 'English', 30);
insert into EmployeeDB.Staff (id_user, department, days_of_work)
values (3, '', 0);


SELECT * FROM EmployeeDB.User;

CREATE DATABASE SCHOOL_SPORT_CLUBS;
USE SCHOOL_SPORT_CLUBS;

CREATE TABLE students(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
egn VARCHAR(10) NOT NULL UNIQUE,
address VARCHAR(255) NOT NULL,
phone VARCHAR(20) NULL DEFAULT NULL,
class VARCHAR(10) NULL DEFAULT NULL   
);

CREATE TABLE sportGroups(
id INT AUTO_INCREMENT PRIMARY KEY,
location VARCHAR(255) NOT NULL,
dayOfWeek ENUM('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
hourOfTraining TIME NOT NULL,
UNIQUE KEY(location,dayOfWeek,hourOfTraining)
);

CREATE TABLE student_sport(
student_id int not null,  
CONSTRAINT FOREIGN KEY (student_id) REFERENCES students(id),
sportGroup_id int not null,
CONSTRAINT FOREIGN KEY (sportGroup_id) REFERENCES sportGroups(id),
PRIMARY KEY(student_id,sportGroup_id)
);

CREATE TABLE sports(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL
);

ALTER TABLE sportGroups
ADD sport_id INT NOT NULL;

ALTER TABLE sportGroups
ADD CONSTRAINT FOREIGN KEY(sport_id) REFERENCES sports(id);

CREATE TABLE coaches(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
egn VARCHAR(10) NOT NULL UNIQUE
);

ALTER TABLE sportGroups
ADD coach_id INT;

ALTER TABLE sportGroups
ADD CONSTRAINT FOREIGN KEY (coach_id) REFERENCES coaches(id);


USE school_sport_clubs;
INSERT INTO `sports` (`name`) VALUES ('Football');
INSERT INTO `sports` (`name`) VALUES ('Volleyball');

INSERT INTO `coaches` (`name`, `egn`) 
VALUES ('Иван Петков', '7509041245'),
('Георги Иванов Тодоров', '8010091245'),
('Илиян Тодоров Георгиев', '8407106352');


INSERT INTO `coaches` (`name`, `egn`) VALUES ('Петър Славков Йорданов', '7010102045');
INSERT INTO  `coaches` (`name`, `egn`) VALUES ('Слави Петков Петков', '7106041278');

INSERT INTO students (name, egn, address, phone, class) 
VALUES ('Iliyan Ivanov', '9401150045', 'Sofia-Mladost 1', '0893452120', '10'),
('Ivan Iliev Georgiev', '9510104512', 'Sofia-Liylin', '0894123456', '11'),
('Elena Petrova Petrova', '9505052154', 'Sofia-Mladost 3', '0897852412', '11'),
('Ivan Iliev Iliev', '9510104542', 'Sofia-Mladost 3', '0894123457', '11'),
('Maria Hristova Dimova', '9510104547', 'Sofia-Mladost 4', '0894123442', '11'),
('Antoaneta Ivanova Georgieva', '9411104547', 'Sofia-Krasno selo', '0874526235', '10');

INSERT INTO sportgroups (location, dayOfWeek, hourOfTraining, sport_id, coach_id)
VALUES ('Sofia-Mladost 1', 'Monday','08:00:00',1,1),
('Sofia-Mladost 1', 'Monday','09:30:00',2,3);

INSERT INTO `school_sport_clubs`.`student_sport` (`student_id`, `sportGroup_id`) 
VALUES (1, 1),
		(2, 1),
		(3, 1),
		(4, 2),
		(5, 2),
		(6, 2);	
        
        
SELECT sportgroups.location,
sportgroups.dayOfWeek,
sportgroups.hourOfTraining,
sportgroups.dayOfWeek,
sports.name
FROM sportgroups JOIN sports
ON sportgroups.sport_id = sports.id;

INSERT  INTO sportgroups(location,dayOfWeek,hourOfTraining,sport_id,coach_id)
VALUES('Sofia- Liylin 7','Sunday','09:00:00',2,2);
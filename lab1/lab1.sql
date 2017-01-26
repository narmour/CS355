USE armourn;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE student(student_number INT PRIMARY KEY, first_name VARCHAR(100), last_name
VARCHAR(100), class VARCHAR(50),major VARCHAR(50));




INSERT INTO student(student_number,first_name,last_name,class,major)
VALUES(1,'Michael','Haderman','Super Senior','CS');

SELECT * FROM student;

SELECT first_name,last_name,student_number FROM student;

INSERT INTO student(student_number,first_name,last_name,class,major)
VALUES(2,'Michael','Jordan','Senior','NBA');

INSERT INTO student(student_number,first_name,last_name,class,major)
VALUES(3,'Michelle','Haderman','Senior','CS');

INSERT INTO student(student_number,first_name,last_name,class,major)
VALUES(4,'Mich','Hader','Senior','CS');

INSERT INTO student(student_number,first_name,last_name,class,major)
VALUES(5,'Nick','Armour','Junior','CS');

SELECT * FROM student;

UPDATE student SET first_name ='mike',student_number=123456789
WHERE student_number=1;

DELETE FROM student WHERE student_number=123456789;


CREATE TABLE course(course_number INT,course_name VARCHAR(100),units INT);

INSERT INTO course(course_number,course_name,units)
VALUES(69,'CS420',1);

INSERT INTO course(course_number,course_name,units)
VALUES(60,'CS40',2);

SELECT * FROM course;

SELECT course_name,course_number FROM course WHERE course_name = 'CS420';

UPDATE course SET course_name ='CS101' WHERE course_number =60;

DELETE FROM course WHERE course_name = 'CS101';





CREATE TABLE department(dept_id INT,dept_name VARCHAR(100));

INSERT INTO department(dept_id,dept_name)
VALUES(101011010,'COMPUTER SCIENCE');

SELECT * FROM department WHERE dept_name = 'COMPUTER SCIENCE';

UPDATE department SET dept_id ='222' WHERE dept_name='COMPUTER SCIENCE';

DELETE FROM department WHERE dept_id =222;






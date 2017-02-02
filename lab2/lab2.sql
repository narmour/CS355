USE armourn;
CREATE TABLE department (department_id INT AUTO_INCREMENT PRIMARY KEY,
department_name VARCHAR(50) UNIQUE);

INSERT INTO department (department_name) VALUES('CS');
INSERT INTO department (department_name) VALUES('Math');

SELECT * FROM department;

UPDATE department SET department_name='Mathematics' WHERE department_name='Math';

UPDATE department SET department_name='Computer Science' WHERE department_name ='CS';

INSERT INTO department(department_name) VALUES('Geology');
INSERT INTO department(department_name) VALUES('Geography');
INSERT INTO department(department_name) VALUES('Physics');
INSERT INTO department(department_name) VALUES('Biology');
INSERT INTO department(department_name) VALUES('Criminal Justice');


DELETE FROM department WHERE department_name='Physics';
DELETE FROM department WHERE department_name='Biology';

DROP TABLE IF EXISTS course;

CREATE TABLE course (
	course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    course_number VARCHAR(3),
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES department(department_id) );
    
 SELECT * FROM course;   
    
INSERT INTO course(course_name,course_number,department_id)
VALUES("Databases",355,1); 

INSERT INTO course(course_name,course_number,department_id)
VALUES("Algorithms",415,1);

INSERT INTO course(course_name,course_number,department_id)
VALUES("Cool Rocks",69,4);

INSERT INTO course(course_name,course_number,department_id)
VALUES("World Maps",12,5);

SELECT * FROM course;

CREATE TABLE section(
	section_id INT AUTO_INCREMENT PRIMARY KEY,
    section_number INT,
    course_id INT,
    semester VARCHAR(100) NOT NULL,
    year INT NOT NULL,
    UNIQUE(course_id,section_number,semester,year),
    FOREIGN KEY(course_id) REFERENCES course(course_id) );
    
INSERT INTO section(section_number,course_id,semester,year)
VALUES(1,1,"fall",2017);

INSERT INTO section(section_number,course_id,semester,year)
VALUES(2,2,'fall',2017);

INSERT INTO section(section_number,course_id,semester,year)
VALUES(3,3,'fall',2017);

INSERT INTO section(section_number,course_id,semester,year)
VALUES(4,4,'spring',2016);

    
DROP TABLE IF EXISTS student;

CREATE TABLE student(
	student_number INT UNIQUE,
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    class VARCHAR(50),
    major VARCHAR(50) );
    
INSERT INTO student(student_number,first_name,last_name,class,major)
VALUES(69,'nick','armour','junior','Computer Science');

INSERT INTO student(student_number,first_name,last_name,class,major)
VALUES(1,'john','snow','senior','Wall Defense');

INSERT INTO student(student_number,first_name,last_name,class,major)
VALUES(2,'scotty','mitchell','freshman','geography');

INSERT INTO student(student_number,first_name,last_name,class,major)
VALUES(3,'jimmy','page','sophomore','music');

SELECT * FROM student;

CREATE TABLE grade_report(
	student_id INT,
    section_id INT,
    grade_letter VARCHAR(2),
    PRIMARY KEY(student_id,section_id), 
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(section_id) REFERENCES section(section_id) );
    
INSERT INTO grade_report(student_id,section_id,grade_letter)
VALUES(1,1,'B+');

INSERT INTO grade_report(student_id,section_id,grade_letter)
VALUES(2,1,'C+');

INSERT INTO grade_report(student_id,section_id,grade_letter)
VALUES(3,1,'A+');

INSERT INTO grade_report(student_id,section_id,grade_letter)
VALUES(1,2,'A');


CREATE TABLE prerequisite(
	course_id INT,
    prerequisite_course_id INT,
    PRIMARY KEY(course_id,prerequisite_course_id),
    FOREIGN KEY(course_id) REFERENCES course(course_id),
    FOREIGN KEY(prerequisite_course_id) REFERENCES course(course_id) );

INSERT INTO prerequisite(course_id,prerequisite_course_id)
VALUES(1,2);

INSERT INTO prerequisite(course_id,prerequisite_course_id)
VALUES(1,3);

INSERT INTO prerequisite(course_id,prerequisite_course_id)
VALUES(2,3);

INSERT INTO prerequisite(course_id,prerequisite_course_id)
VALUES(1,4);
    

SELECT department_name,course_name FROM department
JOIN course ON department.department_id=course.department_id;

SELECT department_name,course_name FROM department
LEFT JOIN course ON department.department_id=course.department_id;

SELECT department_name,course_name FROM course
RIGHT JOIN department ON department.department_id=course.department_id;

SELECT department_name as DeptName, course_name as CourseName, section_number as SectionNumber
FROM department d
JOIN course c ON d.department_id = c.department_id
LEFT JOIN section s ON c.course_id = s.course_Id
WHERE d.department_id = 1;


    


    
    


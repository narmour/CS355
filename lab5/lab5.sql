use armourn;

CREATE TABLE account(account_id INT AUTO_INCREMENT PRIMARY KEY,email VARCHAR(50) UNIQUE,
first_name VARCHAR(50),last_name VARCHAR (50));

CREATE TABLE resume(resume_id INT AUTO_INCREMENT PRIMARY KEY, account_id INT,resume_name VARCHAR(50),
FOREIGN KEY (account_id) REFERENCES account(account_id), UNIQUE(account_id,resume_name) );

CREATE TABLE school(school_id INT AUTO_INCREMENT PRIMARY KEY, school_name VARCHAR(50) UNIQUE,address_id INT,
FOREIGN KEY(address_id) REFERENCES address(address_id) );

CREATE TABLE address(address_id INT AUTO_INCREMENT PRIMARY KEY, street VARCHAR(50), zip_code INT);

CREATE TABLE company(company_id INT AUTO_INCREMENT PRIMARY KEY, company_name VARCHAR(50) UNIQUE);

CREATE TABLE skill(skill_id INT AUTO_INCREMENT PRIMARY KEY,skill_name VARCHAR(50) UNIQUE,description VARCHAR(50));


CREATE TABLE company_address(company_id INT,address_id INT, PRIMARY KEY(company_id,address_id),
FOREIGN KEY(company_id) REFERENCES company(company_id),
FOREIGN KEY(address_id) REFERENCES address(address_id) );

CREATE TABLE account_company(account_id INT,company_id INT, PRIMARY KEY(account_id,company_id),
FOREIGN KEY(account_id) REFERENCES account(account_id),
FOREIGN KEY(company_id) REFERENCES company(company_id));

CREATE TABLE resume_company(resume_id INT,company_id INT,date_shared TIMESTAMP,was_hired BOOL,
PRIMARY KEY(resume_id,company_id),
FOREIGN KEY(resume_id) REFERENCES resume(resume_id),
FOREIGN KEY(company_id) REFERENCES company(company_id) );

CREATE TABLE resume_school(resume_id INT,school_id INT,PRIMARY KEY(resume_id,school_id),
FOREIGN KEY(resume_id) REFERENCES resume(resume_id),
FOREIGN KEY(school_id) REFERENCES school(school_id) );


CREATE TABLE account_skill(account_id INT,skill_id INT,PRIMARY KEY(account_id,skill_id),
FOREIGN KEY (account_id) REFERENCES account(account_id),
FOREIGN KEY (skill_id) REFERENCES skill(skill_id) );

CREATE TABLE resume_skill(skill_id INT,resume_id INT,PRIMARY KEY(skill_id,resume_id),
FOREIGN KEY (skill_id) REFERENCES skill(skill_id),
FOREIGN KEY (resume_id) REFERENCES resume(resume_id) );

CREATE TABLE account_school(account_id INT,school_id INT, PRIMARY KEY(account_id,school_id),start_date TIMESTAMP,
end_date TIMESTAMP, gpa FLOAT,
FOREIGN KEY(account_id) REFERENCES account(account_id),
FOREIGN KEY (school_id) REFERENCES school(school_id ) );




INSERT INTO account(email,first_name,last_name)
VALUES("sqlsucks@gmail.com","nick","armour");

INSERT INTO account(email,first_name,last_name)
VALUES("myhandshurt@gmail.com","rick","blarmour");

INSERT INTO account(email,first_name,last_name)
VALUES("fromtypingthismuch@gmail.com","mick","jagger");

INSERT INTO account(email,first_name,last_name)
VALUES("hunter33@msn.com","john","adams");

INSERT INTO account(email,first_name,last_name)
VALUES("bear1@gmail.com","scotty","mitchell");




INSERT INTO address(street,zip_code)
VALUES("school1/company1","1");

INSERT INTO address(street,zip_code)
VALUES("school2/company2","2");

INSERT INTO address(street,zip_code)
VALUES("school3/company3","3");

INSERT INTO address(street,zip_code)
VALUES("school4/company4","4");

INSERT INTO address(street,zip_code)
VALUES("school5/company5","5");




INSERT INTO company(company_name)
VALUES("google");

INSERT INTO company(company_name)
VALUES("microsoft");

INSERT INTO company(company_name)
VALUES("apple");

INSERT INTO company(company_name)
VALUES("android");

INSERT INTO company(company_name)
VALUES("oracle");

SELECT * FROM company;

INSERT INTO company_address(company_id,address_id)
VALUES(1,1);

INSERT INTO company_address(company_id,address_id)
VALUES(2,2);

INSERT INTO company_address(company_id,address_id)
VALUES(3,3);

INSERT INTO company_address(company_id,address_id)
VALUES(4,4);

INSERT INTO company_address(company_id,address_id)
VALUES(5,5);



INSERT INTO school(school_name,address_id)
VALUES("SSU",1);

INSERT INTO school(school_name,address_id)
VALUES("USC",2);

INSERT INTO school(school_name,address_id)
VALUES("UCLA",3);

INSERT INTO school(school_name,address_id)
VALUES("UCBerkeley",4);

INSERT INTO school(school_name,address_id)
VALUES("Humboldt State",5);

SELECT * FROM school;


INSERT INTO account_school(account_id,school_id,start_date,end_date,gpa)
VALUES(1,1,'2015-01-01 12:00','2017-01-01 12:00',3.2);

INSERT INTO account_school(account_id,school_id,start_date,end_date,gpa)
VALUES(2,3,'2015-01-01 12:00','2017-01-01 12:00',2.2);

INSERT INTO account_school(account_id,school_id,start_date,end_date,gpa)
VALUES(3,5,'2015-01-01 12:00','2017-01-01 12:00',4.20);

INSERT INTO account_school(account_id,school_id,start_date,end_date,gpa)
VALUES(4,1,'2015-01-01 12:00','2017-01-01 12:00',3.5);

INSERT INTO account_school(account_id,school_id,start_date,end_date,gpa)
VALUES(5,4,'2015-01-01 12:00','2017-01-01 12:00',3.0);

SELECT * from account_school;


INSERT INTO resume(account_id,resume_name)
VALUES(1,"fire resume");

INSERT INTO resume(account_id,resume_name)
VALUES(1,"dope resume");

INSERT INTO resume(account_id,resume_name)
VALUES(2,"super fire resume");

INSERT INTO resume(account_id,resume_name)
VALUES(3,"clean resume");

INSERT INTO resume(account_id,resume_name)
VALUES(4,"simple resume");

INSERT INTO resume(account_id,resume_name)
VALUES(5,"a resume");

SELECT * from resume;



INSERT INTO skill(skill_name)
VALUES("programmin");

INSERT INTO skill(skill_name)
VALUES("rappin");

INSERT INTO skill(skill_name)
VALUES("smokin");

INSERT INTO skill(skill_name)
VALUES("dancin");

INSERT INTO skill(skill_name)
VALUES("java");



INSERT INTO account_skill(account_id,skill_id)
VALUES(1,1);

INSERT INTO account_skill(account_id,skill_id)
VALUES(2,2);

INSERT INTO account_skill(account_id,skill_id)
VALUES(3,1);

INSERT INTO account_skill(account_id,skill_id)
VALUES(4,2);

INSERT INTO account_skill(account_id,skill_id)
VALUES(5,3);



INSERT INTO account_company(account_id,company_id)
VALUES(1,3);

INSERT INTO account_company(account_id,company_id)
VALUES(2,3);

INSERT INTO account_company(account_id,company_id)
VALUES(3,1);

INSERT INTO account_company(account_id,company_id)
VALUES(4,2);

INSERT INTO account_company(account_id,company_id)
VALUES(5,4);


INSERT INTO resume_skill(skill_id,resume_id)
VALUES(1,1);

INSERT INTO resume_skill(skill_id,resume_id)
VALUES(2,2);

INSERT INTO resume_skill(skill_id,resume_id)
VALUES(3,3);

INSERT INTO resume_skill(skill_id,resume_id)
VALUES(4,4);

INSERT INTO resume_skill(skill_id,resume_id)
VALUES(5,5);



INSERT INTO resume_school(resume_id,school_id)
VALUES(1,1);

INSERT INTO resume_school(resume_id,school_id)
VALUES(2,2);

INSERT INTO resume_school(resume_id,school_id)
VALUES(3,3);

INSERT INTO resume_school(resume_id,school_id)
VALUES(4,4);

INSERT INTO resume_school(resume_id,school_id)
VALUES(5,5);



INSERT INTO resume_company(resume_id,company_id,date_shared,was_hired)
VALUES(1,1,'2015-02-01 12:00',false);


INSERT INTO resume_company(resume_id,company_id,date_shared,was_hired)
VALUES(2,1,'2015-03-01 12:00' ,false);


INSERT INTO resume_company(resume_id,company_id,date_shared,was_hired)
VALUES(3,1,'2015-04-01 12:00' ,true);


INSERT INTO resume_company(resume_id,company_id,date_shared,was_hired)
VALUES(4,1,'2015-05-01 12:00' , true);


INSERT INTO resume_company(resume_id,company_id,date_shared,was_hired)
VALUES(5,2,'2015-06-01 12:00' , true);






SELECT company_name, AVG(GPA) AS average_gpa FROM company c
LEFT JOIN resume_company rc ON c.company_id =rc.company_id
LEFT JOIN resume r ON r.resume_id = rc.resume_id
LEFT JOIN resume_school rs ON rs.resume_id = r.resume_id
LEFT JOIN account_school as1 ON as1.account_id = r.account_id
WHERE rc.was_hired =1
GROUP BY company_name;


SELECT first_name, last_name
FROM account a
JOIN resume r ON r.account_id = a.account_id
JOIN resume_company rc ON rc.resume_id =r.resume_id
WHERE rc.was_hired =1;




















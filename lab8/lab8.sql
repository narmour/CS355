use armourn;


select * from resume;
select * from account;
select * from school;
select * from resume_school;
select * from resume_company order by company_id;
select * from account_school;
select * from account_company;


update account_school
set gpa = 1.5
where account_id = 1;


delete from account where
account_id = 2;

insert into resume_company(resume_id,company_id,date_shared,was_hired)
values(5,3,'2015-02-01 12:00:00',0);
-- question 1--
select email from account 
where exists(select * from resume where account.account_id=resume.account_id);

-- question 2--
select email from account
where account.account_id in (select account_id from resume);

-- question 3--
select email from account
where not exists(select * from resume where account.account_id=resume.account_id);

-- question 4--
select email from account
where account.account_id not in (select account_id from resume);

-- question 5--
select a.*,sc.*, r.resume_id,r.resume_name from account a
left join resume r on r.account_id = a.account_id
left join resume_school rs on rs.resume_id = r.resume_id
left join school sc on sc.school_id = rs.school_id
group by resume_id;

-- question 6--
SELECT firstN,lastN,resumeN,schoolN 
from(select a.first_name as firstN,a.last_name as lastN,a.account_id as aid,sc.school_name as schoolN,
r.resume_id,r.resume_name as resumeN from account a
left join resume r on r.account_id = a.account_id
left join resume_school rs on rs.resume_id = r.resume_id
left join school sc on sc.school_id = rs.school_id
group by resume_id) as stuff
join account a on a.account_id = 1;


-- question 7--
select count(resume_id) as resumes_submitted, a.account_id from account a
left join resume r on r.account_id = a.account_id
group by (account_id);

-- question 8--
select avg(resumes_submitted) from
(select count(resume_id) as resumes_submitted, a.account_id from account a
left join resume r on r.account_id = a.account_id
group by (account_id)) as averages;

-- question 9--
select account_id,resumes_submitted from
(
select count(resume_id) as resumes_submitted, a.account_id from account a
left join resume r on r.account_id = a.account_id
group by (account_id)
)a
having resumes_submitted >=
(
select avg(resumes_submitted) from
(select count(resume_id) as resumes_submitted, a.account_id from account a
left join resume r on r.account_id = a.account_id
group by (account_id)) as averages
);

-- question 10--
select  company_id,count(resume_id) as resumes_submitted from resume_company
group by company_id;

-- question 11--
select company_id,count(resume_id) as resumes_submitted from resume_company
where was_hired =1
group by company_id;

-- question 12--
select a.company_id from
(
select  company_id,count(resume_id) as resumes_submitted from resume_company rc
group by company_id
) a
join
(
select company_id,count(resume_id) as resumes_submitted from resume_company
where was_hired =1
group by company_id
) b
on a.company_id = b.company_id
where b.resumes_submitted > a.resumes_submitted/2;


-- question 13--
select * from account a
where (
select count(resume_id) from resume r
where r.account_id = a.account_id
) > 1;



-- part 2--


create table user_avg_gpa(email varchar(50) primary key,avg_gpa int);

-- question 1--
select * from user_avg_gpa;


select a.email, avg(s.gpa) from account a
join account_school s on a.account_id = s.account_id
group by a.account_id;


insert into user_avg_gpa(email,avg_gpa)
select a.email, avg(s.gpa) from account a
join account_school s on a.account_id = s.account_id
group by a.account_id;


-- question 2--
set SQL_SAFE_UPDATES =0;

update user_avg_gpa us
left join(
select a.email,avg(s.gpa)as avg_gpa from account a
join account_school s on a.account_id = s.account_id
group by a.account_id) u
on us.email = u.email
SET us.avg_gpa = u.avg_gpa;

-- question 3--
delete from user_avg_gpa
where not exists(select * from account a where a.email=user_avg_gpa.email);


-- question 4--
insert into user_avg_gpa(email,avg_gpa)
select u.email,u.avg_gpa
from (
select a.email, avg(s.gpa) as avg_gpa from account a
join account_school s on a.account_id = s.account_id
group by a.account_id)u
where not exists(select * from user_avg_gpa a where a.email = u.email);








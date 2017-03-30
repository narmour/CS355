use armourn;


select * from resume;
select * from account;
select * from school;
select * from resume_school;
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
(select count(resume_id) as resumes_submitted,a.account_id from 
account a
left join resume r on r.account_id = a.account_id
group by (a.account_id)
)as d 
HAVING resumes_submitted >=avg(
(select count((resume_id)) from account a
left join resume r on r.account_id = a.account_id
));

select count((resume_id)) from account a
left join resume r on r.account_id = a.account_id
group by(a.account_id);

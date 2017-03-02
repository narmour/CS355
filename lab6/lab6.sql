use armourn;


select * from account;
select * from company;
select * from resume_company;
select * from resume;

select * from resume where account_id=1;

select * from resume_company where resume_id in (1,2);

select company_name from company c
join resume_company rc on rc.company_id = c.company_id
join resume r on r.resume_id = rc.resume_id
join account a on a.account_id = r.account_id
where a.account_id =1;


select count(*) as num_shared from company c
join resume_company rc on rc.company_id = c.company_id
join resume r on r.resume_id = rc.resume_id
join account a on a.account_id = r.account_id
where a.account_id =1;


select count(*) as num_shared, a.first_name, a.last_name from company c
left join resume_company rc on rc.company_id = c.company_id
left join resume r on r.resume_id = rc.resume_id
join account a on a.account_id = r.account_id
group by a.first_name;


select count(*) as num_shared, a.first_name, a.last_name from company c
join resume_company rc on rc.company_id = c.company_id
join resume r on r.resume_id = rc.resume_id
join account a on a.account_id = r.account_id
group by a.first_name
having count(num_shared) >1;


select count(c.company_id) as num_shared, a.first_name, a.last_name from company c
left join resume_company rc on rc.company_id = c.company_id
left join resume r on r.resume_id = rc.resume_id
left join account a on a.account_id = r.account_id
group by rc.resume_id;

select count(c.company_id) as num_shared, a.first_name,a.last_name from account a
left join resume r on r.account_id = a.account_id
left join resume_company rc on rc.resume_id = r.resume_id
left join company c on c.company_id = rc.company_id
group by rc.resume_id
order by a.last_name;

select count(c.company_id) as num_shared, a.first_name,a.last_name from account a
left join resume r on r.account_id = a.account_id
left join resume_company rc on rc.resume_id = r.resume_id
left join company c on c.company_id = rc.company_id
group by a.account_id;







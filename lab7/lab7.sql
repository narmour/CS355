use armourn;

select * from company;
select * from account;
select * from resume;
select * from school;
select * from grade_report;
select * from account_school;





select count(*) from company;

select count(*) from account;

#PART 1

select a.first_name, a.last_name, count(resume_name) from account a
left join resume r on r.account_id =a.account_id
group by (a.email); 


select s.school_id, s.school_name,avg(accs.gpa) as average_gpa from school s
left join account_school accs on accs.school_id = s.school_id
left join account a on a.account_id = accs.account_id
group by(s.school_id);

select s.school_id, s.school_name,avg(accs.gpa) as average_gpa from school s
left join account_school accs on accs.school_id = s.school_id
left join account a on a.account_id = accs.account_id
group by(s.school_id)
having average_gpa > 2.0;

select s.school_id, s.school_name,avg(accs.gpa) as average_gpa from school s
left join account_school accs on accs.school_id = s.school_id
left join account a on a.account_id = accs.account_id
group by(s.school_id)
having average_gpa < 2.0;

select s.school_id, s.school_name,avg(accs.gpa) as average_gpa from school s
left join account_school accs on accs.school_id = s.school_id
left join account a on a.account_id = accs.account_id
group by(s.school_id)
order by(s.school_name);

select s.school_id, s.school_name,avg(accs.gpa) as average_gpa from school s
left join account_school accs on accs.school_id = s.school_id
left join account a on a.account_id = accs.account_id
group by(s.school_id)
order by(average_gpa)desc;


drop view average_gpa;

#VIEWS
create view average_gpa as
select s.school_id, s.school_name,avg(accs.gpa) as av from school s
join account_school accs on accs.school_id = s.school_id
join account a on a.account_id = accs.account_id
group by (s.school_id);

select * from average_gpa
where av > 2.0;


create view account_gpa as
select a.account_id, a.email,a.first_name,a.last_name,avg(accs.gpa) as av from account a
join account_school accs on accs.account_id = a.account_id
group by(a.email);

select * from account_gpa;

drop view num_resume;
create view num_resume as
select  a.account_id,count(r.account_id) as nr from account a
join resume r on r.account_id = a.account_id
group by (r.account_id);

select * from num_resume;




#PROCEDURES
drop procedure if exists school_get_gpa;
delimiter //
	create procedure school_get_gpa(gpa int)
    begin
    select * from average_gpa where av >=gpa;
    end //
    delimiter ;
    
call school_get_gpa(4.0);


drop procedure if exists account_info_gpa;
delimiter //
	create procedure account_info_gpa(gpa int)
    begin
		select * from account_gpa where av >=gpa;
    end //
    delimiter ;
    
call account_info_gpa(3);




#FUNCTIONS

drop function if exists fn_get_avg_gpa;
delimiter //
create function fn_get_avg_gpa(acc_id int) returns float
begin
declare ret_av float;
SELECT av from account_gpa where account_id = acc_id into ret_av;
return ret_av;
end //
delimiter ;

select account_id, email, first_name,last_name, fn_get_avg_gpa(account_id) as av from account;


drop function if exists fn_num_resumes;
delimiter // 
create function fn_num_resumes(acc_id int) returns int
begin
declare ret_num_resumes int;
select nr from num_resume r where r.account_id = acc_id into ret_num_resumes;
return ret_num_resumes;
end //
delimiter ;

select account_id, email, first_name,last_name, fn_num_resumes(account_id) as num_resumes from account;














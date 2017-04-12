use armourn;


-- create and insert some data into pro bowlers table --
drop table if exists ProfessionalBowlers;
create table ProfessionalBowlers(age INT,fname varchar(50),lname varchar(50),main_sponsor varchar(50),
season_avg float,bowler_id int auto_increment primary key,l_or_r_handed varchar(5),season_earnings float,num_titles int,
foreign key (main_sponsor) references BowlingCompanies(name));

insert into ProfessionalBowlers(age,fname,lname,main_sponsor,season_avg,l_or_r_handed,season_earnings,num_titles)
values(47,'chris','barnes','columbia 300',216.39,'right',38007.00,18);

insert into ProfessionalBowlers(age,fname,lname,main_sponsor,season_avg,l_or_r_handed,season_earnings,num_titles)
values(33,'Jason','Belmonte','Storm',224.75,'right',95345.000,14);

insert into ProfessionalBowlers(age,fname,lname,main_sponsor,season_avg,l_or_r_handed,season_earnings,num_titles)
values(53,'Norm','Duke','Storm',221.80,'right',67565.00,39);

insert into ProfessionalBowlers(age,fname,lname,main_sponsor,season_avg,l_or_r_handed,season_earnings,num_titles)
values(38,'Tommy','Jones','Ebonite',218.66,'right',99267.00,18);

insert into ProfessionalBowlers(age,fname,lname,main_sponsor,season_avg,l_or_r_handed,season_earnings,num_titles)
values('40','Wes','Mallot','Roto Grip',221.19,'right',64300.00,9);

insert into ProfessionalBowlers(age,fname,lname,main_sponsor,season_avg,l_or_r_handed,season_earnings,num_titles)
values('26','Gary','Faulkner','Motiv',210.10,'left',7825.0,1);




-- create and insert some data into bowling companies table--
drop table if exists BowlingCompanies;
create table BowlingCompanies(name varchar(50) primary key,YearStarted int);

insert into BowlingCompanies
values ('Ebonite',1920);

insert into BowlingCompanies
values ('columbia 300',2007);

insert into BowlingCompanies
values ('Storm', 1984);

insert into BowlingCompanies
values ('Roto Grip',1998);

insert into BowlingCompanies
values ('Motiv',1994);

insert into BowlingCompanies
values('Dexter',1990);

insert into BowlingCompanies
values('Brunswick',1950);

-- create and insert some data into bowling balls table--
drop table if exists BowlingBalls;
create table BowlingBalls(name varchar(50) primary key, company_name varchar(50),coverstock varchar(50),
color varchar(50) );

select * from BowlingBalls;

insert into BowlingBalls(name,company_name,coverstock,color)
values('Timeless','Storm','R2S Hybrid Reactive','Silver');

insert into BowlingBalls(name,company_name,coverstock,color)
values('Sure Lock','Storm','GI-17','Orange');

insert into BowlingBalls(name,company_name,coverstock,color)
values('Snap Lock','Storm','GI-17','Blue');

insert into BowlingBalls(name,company_name,coverstock,color)
values('Jackal Ghost','Motiv','Coercion HFS','Orange');

insert into BowlingBalls(name,company_name,coverstock,color)
values('Sure Lock','Storm','GI-17','Orange');

insert into BowlingBalls(name,company_name,coverstock,color)
values('Maverick','Ebonite','GB 13.3 Pearl','Dark Blue');

insert into BowlingBalls(name,company_name,coverstock,color)
values('SwerveFx','columbia 300','Reflex Pearl','Dark Blue');

insert into BowlingBalls(name,company_name,coverstock,color)
values('Hectic','Roto Grip','50ML Pearl','Pink');


-- create and insert some data into ProBowler Ball Lookup table --
drop table BallLookup;
create table BallLookup(bowler_id int, ball_name varchar(50),
primary key(bowler_id,ball_name),
foreign key(bowler_id) references ProfessionalBowlers(bowler_id),
foreign key (ball_name) references BowlingBalls(name)
);
select * from ProfessionalBowlers;
select * from BallLookup;

insert into BallLookup
values(1,'SwerveFx');

insert into BallLookup
values(2,'Sure Lock');

insert into BallLookup
values(2,'Snap Lock');

insert into BallLookup
values(3,'Sure Lock');

insert into BallLookup
values(4,'Maverick');

insert into BallLookup
values(5,'Hectic');

insert into BallLookup
values(6,'Jackal Ghost');




-- queries--


-- 6 this query returns the balls used by professional bowlers that are made by their main sponsor
select bb.name,bb.company_name, pb.Lname,pb.main_sponsor from ProfessionalBowlers pb 
left join BowlingCompanies bc on pb.main_sponsor = bc.name
left join BowlingBalls bb on bc.name = bb.company_name
left join BallLookup bl on bl.ball_name = bb.name;

-- 7 this query returns all balls in the bowlingballs table that are not used by a pro--
select bb.name from BowlingBalls bb
where bb.name not in(select ball_name from BallLookup);

-- 8 This query returns the bowlers that have more than 1 ball in the BallLookup table--
select pb.Fname,pb.Lname,pb.main_sponsor,pb.bowler_id,count(bl.bowler_id) as num_balls from ProfessionalBowlers pb
join BallLookup bl on bl.bowler_id = pb.bowler_id
group by bl.bowler_id
having num_balls >1; 

-- 9 this query resturns all balls in bowlingballs table not used by a pro using a not exists clause--
select bb.name from BowlingBalls bb
where not exists(select bl.ball_name from BallLookup bl where bb.name = bl.ball_name);


-- 10 this query grabs all of the bowling companies that sponsor pro players and other bowling companies that do not sponsor players --
select distinct bc.name from BowlingCompanies bc
union
select distinct pb.main_sponsor from ProfessionalBowlers pb;



-- 11 this returns a list of all bowling companies that are sponsoring pro players, no duplicates--
select distinct pb.main_sponsor from ProfessionalBowlers pb; 

-- 12 FINISH THIS ONE--



-- 13 --
create view above_average_earnings as
select pb.Fname,pb.Lname,pb.season_earnings from ProfessionalBowlers pb having
pb.season_earnings >(select avg(season_earnings) from ProfessionalBowlers);

select * from above_average_earnings;


-- 14--
delimiter //
create function fn_get_main_sponsor(b_id int) returns varchar(50)
begin
declare ret_sponsor varchar(50);
select pb.main_sponsor from ProfessionalBowlers pb
where pb.bowler_id = b_id into ret_sponsor;
return ret_sponsor;
end //
delimiter ;



-- 15--
delimiter //
create procedure specific_color_balls(c varchar(50))
begin
select * from BowlingBalls where color = c;
end //
delimiter ;

call specific_color_balls('pink')































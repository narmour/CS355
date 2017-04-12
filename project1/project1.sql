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

-- create and insert some data into bowling balls table--
drop table if exists BowlingBalls;
create table BowlingBalls(name varchar(50) primary key, company_name varchar(50),coverstock varchar(50),
color varchar(50) );

insert into BowlingBalls(name,company_name,coverstock,color)
values('Timeless','Storm','R2S Hybrid Reactive','Silver');

insert into BowlingBalls(name,company_name,coverstock,color)
values('Sure Lock','Storm','GI-17','Orange');

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

insert into BallLookup
values(1,'SwerveFx');

insert into BallLookup
values(2,'Sure Lock');

insert into BallLookup
values(3,'Sure Lock');

insert into BallLookup
values(4,'Maverick');

insert into BallLookup
values(5,'Hectic');

insert into BallLookup
values(6,'Jackal Ghost');




-- queries--





























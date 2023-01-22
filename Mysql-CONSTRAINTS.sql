use kirandb;
show databases;
create database customer;
use customer;
#----------------------------------------------------------------------------------------
#Tut-4
#CONSTRAINTS-NOT NULL,UNIQUE,PRIMARY KEY
create table student(
id int not null,
first_name varchar(25) not null ,
last_name varchar(25) not null,
age int );

show tables;
desc student;
alter table student modify age int  not null; 

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int not null,
unique(id)
);


drop table person;
desc person;

insert into person values(1,'Krish3','Naik3',33);
select * from person;
alter table person add unique (first_name);

create table person1(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
constraint pk_person1 primary key(first_name,last_name)
);

alter table person1 add primary key (id);

desc person1;

alter table person1 drop primary key;
 
drop table person1;

show tables;
#===============================================================================
#Tut-5
#CONSTRAINTS-PRIMARY KEY,FOREIGN KEY,CHECK,DEFAULT,INDEX
#3.CONSTRAINTS-PRIMARY KEY
#------------------------------------------------------------------------------
show databases;
use customer;
show tables;
select * from person;
drop tables person;

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
primary key(id)
);

desc person;

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
constraint pk_person primary key(id,last_name)
);

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int
);

alter table person add primary key(id,last_name);
desc person;
alter table person drop primary key;
alter table person add constraint pk_person primary key(id,last_name);
#============================================================================================
#4.CONSTRAINTS-FORIEGN KEY
#---------------------------------------------------------------------------------
drop tables person;
show tables;

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
salary int,
primary Key(id)
);

desc person;

create table department(
id int not null,
department_id int not null,
department_name varchar(25) not null,
primary key(department_id),
constraint fk_persondepartment foreign key(id) references person(id)
);
show tables;
drop tables department;
desc department;

create table department(
id int not null,
department_id int not null,
department_name varchar(25) not null,
primary key(department_id)
);
alter table department add foreign key(id) references person(id);
desc department;
#--------------------------------------------------------------------------------------------------------
#5.CONSTRAINTS-CHECK 
#===============================================================================================
show tables;
drop tables department;
drop tables person;

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
salary int,
primary Key(id),
check(salary<50000)
);
insert into person values(1,'Krish','Naik',31,45000);
select * from person;
#---------------------------------------------------------------------------------------------
#6.CONSTRAINTS-DEFAULT
#=============================================================================================
show tables;
drop table person;

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
city_name varchar(25) default 'Banglore'
);
desc person;
alter table person alter city_name drop default;
#---------------------------------------------------------------------------------------------------------------
#7.CONSTRAINTS-INDEX
#===========================================================================================================
show databases;
use customer;
show tables;
select * from person;
desc person;
alter table person drop city_name;
alter table person add age int not null;
desc person; 

create table student(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int
);

create index index_age on student(age);
select * from student;
desc student;
select * from student;

create index index_age_first_name on student(age,first_name);
drop table student;
show tables;

alter table student drop index index_age_first_name;
alter table student drop index index_age;
desc student;
#--------------------------------------------------------------------------------------------------------------
#Tut-7 -VIEWS
#================================================================================================
show databases;
use customer;
show tables;
drop table student;
desc student;

create table student(
studentid int auto_increment,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
primary key(studentid)
);

select * from student;

insert into student values(1,'Krish','Naik',31),
(2,'Ram','Sharma',32),
(3,'Sam','Joe',33);

create table department(
studentid int auto_increment,
department_name varchar(25) not null,
foreign key(studentid) references student(studentid)
);

desc department;
insert into department values(1,'Computer Science'),(2,'Electronics'),(3,'Mechanical');

select * from department;
drop table department;
select * from student;

create view student_info as
select first_name,last_name,age from student inner join department using(studentid);
select * from student_info;

show databases;
create database krish;
drop database krish;
use kirandb;
show tables;
use mysql;

#1.Creating Database customers
create database customers;

#2.DROP- drop db customers

#3.Use db
use customers;

#4.Creating a table customer_info
create table customer_info(id integer,first_name varchar(10),
last_name varchar(10));

#5.show tables
show tables;

#6.Select all from customer_info
select * from customer_info;

#7.inserting values into customer_info table
insert into customer_info(id,first_name,last_name) values (1,'Krish','Naik');
insert into customer_info(id,first_name,last_name) values (2,'Deepak','Sharma');

#8.Droping customer_info table
drop table customer_info; 

#9.Showing all tables
show tables;

#10.Dropping  Database customers
drop database customers;

#11.Showing all Databases
show databases;
#-------------------------------------------------------------------------------------------------
create database customers;
use customers;

#1.Creating a table with auto_increment and primary key(id)
create table customer_info(id integer auto_increment,first_name varchar(25),last_name varchar(25)
,salary integer,primary key(id));

#2.show all tables
show tables;

#3.droping table customer_info
drop tables customer_info;

#4.Insert into custoemr_info values
insert into customer_info(first_name,last_name,salary)values('John','Daniel',50000),
('Krish','Naik',60000),
('Darius','Bengali',70000),
('Chandan','Kumar',40000),
('Ankit','Sharma',NULL);

#5.Select all from customer_info
select * from customer_info;

#6.Select a selected row having NULL using is NULL,is not NULL
select id,first_name,last_name from customer_info where salary is not NULL;

select id,first_name,last_name from customer_info where salary is null;

#7.UPDATE Statement - sql update statement to replace null values
update customer_info set salary=50000 where id=5;

#Select all from customer_info
select * from customer_info;

#8.DELETE statement
delete from customer_info where id=5;

#9.ALTER table -1.Add a Column in Existing column
alter table customer_info add email varchar(25);

alter table customer_info add dob date;


#10.ALTER table -2.Modify Column
alter table customer_info modify dob year;

#11.Describe Table
desc customer_info;

#12.ALTER table-3.Drop Column
alter table customer_info drop column email;
select * from customer_info;
#---------------------------------------------------------------------------------













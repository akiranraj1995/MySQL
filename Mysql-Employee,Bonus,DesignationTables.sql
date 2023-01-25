show databases;
use kirandb;
show tables;
drop table employee;

#EMPLOYEE TABLE-employee
create table employee(
empid int not null primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int,
joining_date datetime ,
department_name varchar(25) 
);

#Checking schemas
desc employee;
desc bonus;
desc designation;

#BONUS TABLE-bonus
create table bonus( 
emp_ref_id int,
bonus_amt int,
bonus_date datetime ,
foreign key(emp_ref_id) references employee(empid)
on delete cascade
);
#=====================================================================================================
#EMPLOYEE DESIGNATION-designation
create table designation(
emp_ref_id int,
designation varchar(25) ,
designation_date datetime ,
foreign key(emp_ref_id) references employee(empid)
on delete cascade
);
#======================================================================================================
#--------------------------------------------------------------------------------------------------------
insert into employee values
(0001,'Krish','Naik',50000,'14-12-11 09.00.00','Development'),
(0002,'Sudhanshu','Kumar',60000,'14-12-11 09.00.00','Development'),
(0003,'Sanket', 'Kumar',70000,'15-12-12 09.00.00','HR'),
(0004,'Darius','Bengali',70000,'15-12-13 09.00.00','HR'),
(0005,'Satish','Bhansal',30000,'17-10-21 09.00.00','Accountant'),
(0006,'Shaktiman','Hero',50000,'17-10-15 09.00.00','Accountant');

select * from employee;
#----------------------------------------------------------------------------------------------------------
insert into bonus values (0001, 5000,'16-03-12'),
(0001,5000,'16-03-14'),
(0002,5000,'16-03-13'),
(0003,5000,'17-03-15'),
(0001,5000,'18-03-17'),
(0004,3500,'16-03-19'),
(0005,7000,'16-03-20'),
(0002,8500,'20-03-21');

#-----------------------------------------------------------------------------------------------------------
insert  into  designation values
(0001,'Manager','2016-02-5 00:00:00'),
(0002,'Executive','2016-06-11 00:00:00'),
(0003,'Executive','2016-06-11 00:00:00');

select * from employee;
select * from bonus;
select * from designation;
#======================================================================================================
### Easy Queries
#1. Write an sql query to retreive all details where first name from employee
#table hich starts with 'k* - (LIKE %k, k%, %k%)
select * from employee where first_name like 'k%' ;
#=======================================================================================================
# 2. Write an Sql query to print all details of the employees whose salary
#between 10000 to 35000
##fetch Employee name
select * from employee where salary<55000 and salary>10000;
select * from employee where salary between 10000 and 35000;

select concat(first_name,' ',last_name) as employee_name,salary from employee where empid in 
(select empid from employee where salary between 10000 and 55000);
#=========================================================================================================
## 3. SQL query to retrieve details of the employees who have joined on a date
select * from employee;
select * from employee where year(joining_date)=2015 and month(joining_date)=12 ;
#============================================================================================
## 4. SQL query to fetch number of employees in every department
select count(*) from employee group by department_name; 
#---------------------------------------------------------------------------------------------------------
#*Intermedlate
#=========================================================================================
#5. SQL query to print details of the employee who are also Executives
select * from employee;
select * from designation;

select concat(employee.first_name,' ',employee.last_name) as Employee_name,designation.designation
from employee 
inner join 
designation 
on 
employee.empid=designation.emp_ref_id
and
designation.designation='Manager';

#====================================================================================
#6. SQL query to clone a new table from another table
create table clone_employee like employee;
desc clone_employee;
show tables;
select * from clone_employee;
#------------------------------------------------------------------------------------
#7. SQL query to show topn salary of employees
select * from employee order by salary desc limit 5; 

#-------------------------------------------------------------------------------------------
###Increasin complexity
#=========================================================================================
# 8. sQL query to determine the 4th highest salary =(n-1,1)
select * from employee;
select salary from employee order by salary desc limit 3,1;

#-------------------------------------------------------------------------------------------
##9 Assignment for you
#======================================================================================
## sQL query to determine the 6th highest salary without using Limit
select * from employee order by salary desc limit 2,1; 
select salary from employee order by salary desc limit 5,1;

#without using Limit
with employee as 
(
    select salary, ROW_NUMBER() OVER (ORDER BY salary DESC) as row_num
    FROM employee
)
SELECT salary
FROM employee
WHERE row_num = 6;


#======================================================================================

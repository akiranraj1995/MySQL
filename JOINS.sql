#ALL TYPES OF - JOINS
#===================================================================
show databases;
use customer;
show tables;
select * from student;
select * from department;

insert into student values(4,'Ankit','Kumar',27),(5,'Ramesh','Singh',27);

select * from student inner join department on student.studentid=department.studentid;

#1.INNER JOIN
select student.first_name,student.last_name,student.age,department.department_name from student
inner join department on student.studentid=department.studentid;
#----------------------------------------------------------------------------------------------------------
#2.LEFT JOIN
select * from student;
select * from department;

select student.first_name,student.last_name,student.age,department.department_name from student left join department
on student.studentid=department.studentid;
#-----------------------------------------------------------------------------------------------------------
#3.RIGHT JOIN
select * from student;
select * from department;

select student.first_name,student.last_name,student.age,department.department_name from student right join department
on student.studentid=department.studentid;
#---------------------------------------------------------------------------------------------------------
#4.FULL OUTER JOIN 
#FULL OUTER JOIN = LEFT JOIN + UNION + RIGHT JOIN
#-----------------------------------------------------------------------------------------------------------
select student.first_name,student.last_name,student.age,department.department_name from student left join department
on student.studentid=department.studentid 
union
select student.first_name,student.last_name,student.age,department.department_name from student right join department
on student.studentid=department.studentid;
#-----------------------------------------------------------------------------------------------------------
#5.CROSS JOIN
#-------------------------------------------------------------------------------------------------------
select student.first_name,student.last_name,student.age,department.department_name 
from student cross join department;
#-------------------------------------------------------------------------------------------------------
#6.NATURAL JOIN
#---------------------------------------------------------------------------------------------------------
select * from student;
select * from department;
select student.first_name,student.last_name,student.age,department.department_name
from student natural join department; 
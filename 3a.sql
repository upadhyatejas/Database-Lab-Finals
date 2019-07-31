Create table aircraft(
aid varchar(9) primary key,
aname varchar(10),
crange int
);
 
Create table employees(
eid varchar(9) primary key,
ename varchar(10),
salary int
);
 
Create table certified(
eid varchar(9)references employees(eid),
aid varchar(9)references aircraft(aid)
);

insert into aircraft values('B001','Boeing',4000);
insert into aircraft values('B002','Boeing',2500);
insert into aircraft values('BB003','Blackbeard',6000);
insert into aircraft values('S004','Supermarine',8000);
insert into aircraft values('L005','Lockheed',2100);

insert into employees values(1,'Johnny',40000);
insert into employees values(2,'Timmy',60000);
insert into employees values(3,'Lawrence',70000);
insert into employees values(4,'Zuzu',90000);
insert into employees values(5,'Matt',80000);

insert into certified values(1,'B001');
insert into certified values(1,'B002');
insert into certified values(3,'S004');
insert into certified values(4,'S004');
insert into certified values(5,'L005');
insert into certified values(2,'B002');
insert into certified values(4,'BB003');
insert into certified values(3,'BB003');
insert into certified values(4,'L005');

//Find Emp ID of employee who makes highest salary

SELECT eid
FROM employees
WHERE salary=(SELECT MAX(salary) FROM employees);

//Find the name of aircrafts such that all pilots certified to operate them earn more than 50000

SELECT	DISTINCT aname 
FROM	aircraft a, certified c, employees e 
WHERE	a.aid=c.aid and c.eid=e.eid and e.salary>50000;
 
//Find the employees who are certified for the maximum number of aircrafts.

SELECT ename,max(c)
FROM (SELECT eid,count(*) as c FROM certified GROUP BY eid) natural join employees;

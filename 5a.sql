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

//Find names of pilots certified to fly Boeing

SELECT DISTINCT E.ename
FROM employees E, certified C, aircraft A
WHERE E.eid = C.eid AND C.aid = A.aid AND A.aname='Boeing';

//Arrange flight no with respect to ascending order of distance

SELECT aid
FROM aircraft
ORDER BY crange ASC;

//Find the name of pilots who can operate flights with a range greater than 3000 miles but are not certified on any Boeing aircraft.

SELECT DISTINCT E.ename
FROM Employees E
WHERE E.eid IN ((SELECT C.eid  FROM Certified C WHERE EXISTS (SELECT A.aid FROM Aircraft A WHERE A.aid = C.aid AND A.cruisingrange > 3000) 
AND
NOT EXISTS (SELECT A1.aid FROM Aircraft A1 WHERE A1.aid = C.aid AND A1.aname LIKE ‘Boeing%’));

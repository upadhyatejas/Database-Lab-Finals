create table Sailors (
	sid integer primary key,
	name varchar(100),
	rating integer,
	age integer
);

create table Boats (
	bid integer primary key,
	name varchar(100),
	color varchar(100)
);

create table Reserves (
	sid integer,
	bid integer,
	day datetime,
	foreign key (sid) references Sailors (sid),
	foreign key (bid) references Boats (bid)
);

insert into Sailors values (1,'Jack Sparrow', 10, 40);
insert into Sailors values (2,'Will Turner', 6, 26);
insert into Sailors values (3,'Elizabeth Swann', 7, 24);
insert into Sailors values (4,'Mr. Gibbs', 9, 51);
insert into Sailors values (5,'Davey Jones', 10, 420);

insert into Boats values (1,'Black Pearl', 'black');
insert into Boats values (2,'Queen Annes Revenge', 'brown');
insert into Boats values (3,'Blackbeards Delight', 'black');
insert into Boats values (4,'Redbeards Delight', 'red');
insert into Boats values (5,'Oceans Dagger', 'blue');

insert into Reserves values (1, 1, '05-Jan-2018');
insert into Reserves values (1, 1, '05-Jan-2018');
insert into Reserves values (2, 1, '20-Jun-2018');
insert into Reserves values (2, 4, '19-May-2018');
insert into Reserves values (3, 2, '31-Jan-2018');
insert into Reserves values (3, 2, '26-Jan-2018');
insert into Reserves values (3, 2, '27-Jan-2018');
insert into Reserves values (5, 1, '07-Dec-2018');
insert into Reserves values (5, 2, '13-Dec-2018');
insert into Reserves values (5, 3, '06-Dec-2018');
insert into Reserves values (5, 4, '21-Jan-2019');
insert into Reserves values (5, 5, '28-Jan-2019');

//Find the names of sailors who have reserved at least one boat.

SELECT name
FROM Sailors S, Reserves R
WHERE S.sid = R.sid

//Find the ids of sailors who have reserved a red boat or a green boat.

SELECT R.sid
FROM Boats B, Reserves R
WHERE R.bid = B.bid AND B.color = 'red'
UNION
SELECT R1.sid
FROM Boats B1, Reserves R1
WHERE R1.bid = B1.bid AND B1.color = 'green'

//Find the Sid’s of sailors who have not reserved a boat.

(SELECT sid FROM Sailors ) minus (SELECT sid FROM Reserves);

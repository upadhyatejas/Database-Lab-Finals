create table PLAYER (
Pid int, 
Lname varchar(10), 
Fname varchar(10), 
Country varchar(10), 
Yborn varchar(10), 
Bplace varchar(10),
primary key (Pid)
);

create table MATCH (
MatchID int, 
Team1 varchar(10),
Team2 varchar(10), 
Ground varchar(10), 
Date date, 
Winner varchar(10),
primary key(MatchID)
);

create table BATTING (
MatchID int, 
Pid int, 
Nruns int, 
Fours int, 
Sixes int,
primary key(MatchID,Pid),foreign key(MatchID) references MATCH(MatchID),foreign key(Pid) references PLAYER(Pid)
);

create table BOWLING (
MatchID int, 
Pid int, 
Novers int, 
Maidens varchar(10), 
Nruns int, 
Nwickets int,
primary key(MatchID,Pid),foreign key(MatchID) references MATCH(MatchID),foreign key(Pid) references PLAYER(Pid)
);

//Display the sorted list of ground names where Australia has played as team1.
SELECT Ground 
FROM MATCH 
WHERE Team1='Australia' 
ORDER BY Ground;

//Find the match information of all matches in which Dhoni did batting.
SELECT *
FROM (PLAYER natural join MATCH) natural join BATTING 
WHERE Fname='Dhoni';

//Find the names of players who did batting in match 2689.
SELECT Fname,Lname 
FROM (PLAYER natural join MATCH) natural join BATTING 
WHERE MatchID=2686;

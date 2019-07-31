create table sailors(
    sid integer primary key,
    name varchar(200),
    rating integer,
    age integer,
)

create table boats(
    bid integer primary key,
    name varchar(100),
    color varchar(100)
)

create table reserves(
    sid integer,
    pid integer,
    day datetime,
    foriegn key (sid) references sailors (sid)
    foriegn key (bid) references Boats (bid)
)

insert into sailor values(1,"balack beard,10,45)
insert into boats values(1,'oro jackson, brown)

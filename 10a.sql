//create tables

Create table CUSTOMER(
Cno INT,
Cname VARCHAR(50),
Ccity VARCHAR(50),
Primary key(Cno)
);
 
Create table ORDER1(
Ono INT,
Odate DATE,
Ocno INT,
Oamt INT, 
Primary key(Ono),
Foreign Key(Ocno) references CUSTOMER(Cno) on delete cascade
);
 
Create table ITEM(
Ino INT ,
Uprice INT, 
Primary key(Ino)
);
 
Create table ORDER_ITEM(
Iono INT,
Oino  INT,
Qty INT, 
Primary key(Iono,Oino),
Foreign Key(Iono) references ORDER1(Ono) on delete cascade, 
Foreign Key(Oino) references ITEM(Ino) on delete cascade
);
 
Create table SHIPMENT(
Sono INT,
Shipdate DATE,
Primary key(Sono), 
Foreign Key(Sono) references ORDER1(Ono) on delete cascade, 
);

//insert values

Insert into CUSTOMER values (1,'Archie','Bangalore');
Insert into CUSTOMER values (2,'Veronica','Bangalore');
Insert into CUSTOMER values (3,'Betty','Mysore');
Insert into CUSTOMER values (4,'Jughead','Bangalore');
Insert into CUSTOMER values (5,'Cheryl','Mysore');
Insert into CUSTOMER values (6,'Jason','Mangalore');
 
Insert into ORDER1 values (1, '01-Jun-2016',1,1000);
Insert into ORDER1 values (2, '03-Jun-2016',1,2000);
Insert into ORDER1 values (3, '03-Jun-2016',3,3000);
Insert into ORDER1 values (4, '05-Jun-2016',4,4000);
Insert into ORDER1 values (5, '06-Jun-2017',5,5000);
 
Insert into ITEM values(1,100);
Insert into ITEM values(2,200);
Insert into ITEM values(3,300);
Insert into ITEM values(4,400);
Insert into ITEM values(10,500);
 
Insert into ORDER_ITEM values(1,1,2);
Insert into ORDER_ITEM values(1,2,1);
Insert into ORDER_ITEM values(2,3,2);
Insert into ORDER_ITEM values(3,4,3);
Insert into ORDER_ITEM values(4,3,1);
Insert into ORDER_ITEM values(5,2,1);
 
Insert into SHIPMENT values(1,1,'03-Jun-2016');
Insert into SHIPMENT values(2,1,'03-Jun-2016');
Insert into SHIPMENT values(3,2,'05-Jun-2016');
Insert into SHIPMENT values(4,3,'05-Jun-2016');
Insert into SHIPMENT values(5,4,'06-Jun-2016');

//List name of customer, no. of orders placed by each customer residing in Bangalore city.

Select Cname,count(Ono) 
from CUSTOMER,ORDER1 
where Ocno=Cno and Ccity=’Bangalore’ 
group by Cname;

//List the names of customers who have ordered at least 10 items.

Select Cname,count(*) 
from CUSTOMER,ORDER1
where Ocno=Cno group by Cname having count(*)>=10;

//List the customer names who have not ordered for item no. 10

Select distinct(Cname) 
from ORDER1,CUSTOMER,ORDER_ITEM 
where  Ono=Iono and Ocno=Cno and Iono!=10;

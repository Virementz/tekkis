-- Create Table


/*Customer Table*/ 

CREATE TABLE customer(
c_id VARCHAR(20),
first_name VARCHAR(20) NOT NULL DEFAULT '',
last_name VARCHAR(20) NOT NULL DEFAULT '',
gender VARCHAR(10) NOT NULL DEFAULT '',
date_of_birth VARCHAR(20) NOT NULL DEFAULT '',
country VARCHAR(10) NOT NULL DEFAULT '',
PRIMARY KEY(c_id)
);

/*Insert test data into Customer Table*/
insert into customer values('1' , 'Jason' , 'Smith' , 'Male' , '1982-05-28' , 'USA');
insert into customer values('2' , 'Max' , 'Mustermann' , 'Male' , '1980-07-18' , 'Germany');
insert into customer values('3' , 'Will' , 'Myer' , 'Male' , '1981-03-30' , 'England');
insert into customer values('4' , 'Christin' , 'Dawm' , 'Female' , '1978-08-02' , 'USA');
insert into customer values('5' , 'Angela' , 'Gutierez' , 'Female' , '1986-01-16' , 'Spain');
insert into customer values('6' , 'Peter' , 'Jackson' , 'Male' , '1958-12-05' , 'USA');

select * from customer;

/*Order Table*/ 

CREATE TABLE OrderTable(
o_id VARCHAR(20),
order_nr VARCHAR(20) NOT NULL DEFAULT '',
sum VARCHAR(20) NOT NULL DEFAULT '',
fk_customer VARCHAR(20) NOT NULL DEFAULT '',
PRIMARY KEY(o_id)
);

/*Insert test data into Order Table*/
insert into OrderTable values('1' , '2783292423' , '100.85' , '2');
insert into OrderTable values('2' , '4784232411' , '77.34' , '3');
insert into OrderTable values('3' , '3783292423' , '30.99' , '5');
insert into OrderTable values('4' , '9368315313' , '33.55' , '2');

select * from OrderTable;

/*Order Item Table*/ 

CREATE TABLE OrderItemTable(
oi_id VARCHAR(20),
sku VARCHAR(20) NOT NULL DEFAULT '',
fk_order VARCHAR(10) NOT NULL DEFAULT '',
PRIMARY KEY(oi_id)
);

/*Insert test data into Order Item Table*/
insert into OrderItemTable values('1' , 'ABCDEF' , '1');
insert into OrderItemTable values('2' , 'ABCDEF' , '1');
insert into OrderItemTable values('3' , 'OHSDLF' , '1');
insert into OrderItemTable values('4' , '1737234' , '2');
insert into OrderItemTable values('5' , 'KLSHA' , '3');
insert into OrderItemTable values('6' , 'OHSDLF' , '3');
insert into OrderItemTable values('7' , 'GHJSK' , '4');


select * from OrderItemTable;


--Answering the question given for the assestment

SELECT 'A: Write a query which select all female customers.';

SELECT * FROM customer WHERE gender == 'Female';




SELECT 'B: Write a query which prints out all customer names with the number of orders they did';

SELECT customer.first_name, customer.last_name, COUNT(OrderTable.fk_customer)  AS "total number of order"
FROM customer 
LEFT OUTER JOIN OrderTable
ON customer.c_id = OrderTable.fk_customer
GROUP BY customer.c_id
;






SELECT 'C: Write a query which prints out customers with the money they spend excluding customers
without any orders';


SELECT customer.first_name, customer.last_name, SUM(OrderTable.sum)  AS "total purchase"
FROM customer 
LEFT OUTER JOIN OrderTable
ON customer.c_id = OrderTable.fk_customer
GROUP BY customer.c_id
HAVING SUM(OrderTable.sum)>0;

SELECT 'D: Write a query which prints out the order nr of all orders with at least 2 items';

SELECT OrderTable.order_nr, Count(OrderItemTable.fk_order)  AS "total item"
FROM OrderTable 
LEFT OUTER JOIN OrderItemTable
ON OrderTable.o_id = OrderItemTable.fk_order
GROUP BY OrderTable.o_id
HAVING count(OrderTable.sum)>=2;
--UC1: Creating database
create database addressbook_services;
use addressbook_services;

--UC2: Creating AddressBook Table with 
--first andlast names, address, city, state, zip, phone number and email as its attributes
create table addressBook_Table
(firstName varchar(50) not null,
 secondName varchar(50) not null,
 address varchar(50) not null,
 city varchar(50) not null,
 state varchar(50) not null,
 zip bigint not null,
 phoneNumber bigint not null,
 emailId varchar(50) not null);

 --UC3: Inserting Values in AddressBook Table
 insert into addressBook_Table (firstName, secondName, address, city, state, zip, phoneNumber, emailId)
 values
 ('Ravi', 'Kumar', 'Sec-17', 'Karnal', 'Haryana', 9988776655, 136119, 'ravi@gmail.com'),
 ('Raja', 'Verma', 'Main Street', 'Kanpur', 'UP', 991144552, 211136, 'raja@gmail.com'),
 ('Shubham', 'Singh', 'Sec-3', 'Chandigarh', 'Punjab', 954684552, 217336, 'shubham@gmail.com'),
 ('Raj', 'Kapoor', 'Sec-4', 'Mumbai', 'Maharastra', 969684552, 217336, 'raj@gmail.com'),
 ('Prakhar', 'Kumar', 'Sec-17', 'Karnal', 'Haryana', 9988775655, 136119, 'prakhar@gmail.com');

 --UC4: Editing existing entry of table
 update addressBook_Table set address = 'Film City'
 where firstName = 'Raj' and secondName = 'Kapoor';
 select * from addressBook_Table;

 --UC5: Deleting an entry from table
 delete from addressBook_Table
 where firstName = 'Ravi' and state = 'Haryana';
 select * from addressBook_Table;

 --UC6: Ability to retrieve a person belonging to a city or state
 select * from addressBook_Table
 where city = 'Mumbai' or state = 'UP';

 --UC7: Size of Address Book Table by city or state
select city, COUNT(city) as contacts_count
FROM addressBook_Table
GROUP BY city;

--UC8: Retrieve entries sorted alphabetically 
select * from addressBook_Table
order by firstName+secondName;

--UC9: Ability to identify address book with name and type
alter table addressBook_Table add addressBookType varchar(30), addressBookName varchar(50);
update addressBook_Table set addressBookName = 'MyContacts';
update addressBook_Table set addressBookType = 'Friends' where firstName = 'Raja' or firstName = 'Shubham';
update addressBook_Table set addressBookType = 'Family' where addressBookType is null;
select * from addressBook_Table order by addressBookType;

--UC10: Count by type
select addressBookType, COUNT(*) as 'Number Of Contacts'
from addressBook_Table group by addressBookType;

--UC11: Entering contact to both friends and family addressBookType
--data redundancy
insert into addressBook_Table (firstName, secondName, address, city, state, zip, phoneNumber, emailId, addressBookType, addressBookName)
 values
('Shubham', 'Singh', 'Sec-3', 'Chandigarh', 'Punjab', 954684552, 217336, 'shubham@gmail.com', 'Family', 'MyContacts');
select * from addressBook_Table order by firstName+secondName;

--UC12: Implementing ER Diagram for Address Book DB
--Creating entities
use addressbook_services;
CREATE TABLE contacts
(
first_name VARCHAR(20),
last_name VARCHAR(20),
address VARCHAR(50),
city VARCHAR(20),
state VARCHAR(20),
zip VARCHAR(10),
phone_number VARCHAR(15),
email VARCHAR(100),
CONSTRAINT PK_contacts_name PRIMARY KEY (first_name, last_name)
);
select * from contacts;

CREATE TABLE contacts_type
(
first_name VARCHAR(20),
last_name VARCHAR(20),
type VARCHAR(20),
CONSTRAINT FK_type FOREIGN KEY(first_name,last_name) REFERENCES contacts(first_name,last_name)
);
select * from contacts_type;

CREATE TABLE contacts_name
(
first_name VARCHAR(20),
last_name VARCHAR(20),
name VARCHAR(20),
CONSTRAINT FK_name FOREIGN KEY(first_name,last_name) REFERENCES contacts(first_name,last_name)
);
select * from contacts_name;

--Copying data from original table as per requirement
select * from addressBook_Table;
INSERT INTO contacts
SELECT firstName,secondName,address,city,state,zip,phoneNumber,emailId
FROM addressBook_Table;

INSERT INTO contacts_type
SELECT firstName,secondName,addressBookType
FROM addressBook_Table;
select * from contacts_type;

INSERT INTO contacts_name
SELECT firstName,secondName,addressBookName
FROM addressBook_Table;
select * from contacts_type;

--UC13: Ensure all retrieve queries done especially in UC 6, UC 7, UC 8 and UC 10 
--are working with new table structure
USE addressbook_services;
select * from contacts;

--UC6: retrive contact by city or state
SELECT c.first_name,c.last_name,c.email,type,name 
FROM contacts  c, contacts_name c_n, contacts_type c_t
WHERE (c.first_name+c.last_name) = (c_n.first_name+c_n.last_name) AND 
		(c.first_name+c.last_name) = (c_t.first_name+c_t.last_name) AND
		c.state='Punjab';

--UC7: Size of address book by city or state
SELECT c.city, COUNT(c.first_name) AS contacts_count
FROM contacts  c, contacts_name c_n, contacts_type c_t
WHERE (c.first_name+c.last_name) = (c_n.first_name+c_n.last_name) AND 
		(c.first_name+c.last_name) = (c_t.first_name+c_t.last_name)
GROUP BY c.city;

SELECT c.state, COUNT(c.first_name) AS contacts_count
FROM contacts  c, contacts_name c_n, contacts_type c_t
WHERE (c.first_name+c.last_name) = (c_n.first_name+c_n.last_name) AND 
		(c.first_name+c.last_name) = (c_t.first_name+c_t.last_name)
GROUP BY c.state;

--UC8: retrive Contacts sorted alphabetically
SELECT c.first_name,c.last_name,c.city ,c_n.name,c_t.type
FROM contacts  c, contacts_name c_n, contacts_type c_t
WHERE (c.first_name+c.last_name) = (c_n.first_name+c_n.last_name) AND 
		(c.first_name+c.last_name) = (c_t.first_name+c_t.last_name)
ORDER BY (c.first_name+c.last_name);

--UC10: Count contacts by type
SELECT c_t.type, COUNT(c.first_name) AS contacts_count
FROM contacts  c, contacts_name c_n, contacts_type c_t
WHERE (c.first_name+c.last_name) = (c_n.first_name+c_n.last_name) AND 
		(c.first_name+c.last_name) = (c_t.first_name+c_t.last_name)
GROUP BY c_t.type;

SELECT * from contacts;
SELECT * from contacts_type;
SELECT * from contacts_name;



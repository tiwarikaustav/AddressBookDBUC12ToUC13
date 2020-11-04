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



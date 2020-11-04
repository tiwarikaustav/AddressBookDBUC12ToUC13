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

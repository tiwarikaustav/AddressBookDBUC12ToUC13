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


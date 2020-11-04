--UC11: Entering contact to both friends and family addressBookType
--data redundancy
insert into addressBook_Table (firstName, secondName, address, city, state, zip, phoneNumber, emailId, addressBookType, addressBookName)
 values
('Shubham', 'Singh', 'Sec-3', 'Chandigarh', 'Punjab', 954684552, 217336, 'shubham@gmail.com', 'Family', 'MyContacts');
select * from addressBook_Table order by firstName+secondName;
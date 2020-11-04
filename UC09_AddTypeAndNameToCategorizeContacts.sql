--UC9: Ability to identify address book with name and type
alter table addressBook_Table add addressBookType varchar(30), addressBookName varchar(50);
update addressBook_Table set addressBookName = 'MyContacts';
update addressBook_Table set addressBookType = 'Friends' where firstName = 'Raja' or firstName = 'Shubham';
update addressBook_Table set addressBookType = 'Family' where addressBookType is null;
select * from addressBook_Table order by addressBookType;
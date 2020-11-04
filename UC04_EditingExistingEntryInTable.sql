--UC4: Editing existing entry of table
 update addressBook_Table set address = 'Film City'
 where firstName = 'Raj' and secondName = 'Kapoor';
 select * from addressBook_Table;
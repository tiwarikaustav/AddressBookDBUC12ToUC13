--UC10: Count by type
select addressBookType, COUNT(*) as 'Number Of Contacts'
from addressBook_Table group by addressBookType;
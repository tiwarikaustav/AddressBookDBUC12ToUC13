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
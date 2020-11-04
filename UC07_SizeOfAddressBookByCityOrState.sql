--UC7: Size of Address Book Table by city or state
select city, COUNT(city) as contacts_count
FROM addressBook_Table
GROUP BY city;
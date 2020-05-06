/*
11) Return item 2's results in XML.
Expected Result:
<Contacts CompanyName="UK Co 1" LastName="Brown" FirstName="Tom"/><Contacts CompanyName="US Co 1" LastName="Milton" FirstName="Frank"/><Contacts CompanyName="US Co 1" LastName="Mulberry" FirstName="Mike"/><Contacts CompanyName="US Co 2" LastName="Francis" FirstName="Stephanie"/>
*/


SELECT 
	comp.CompanyName
	,cont.LastName
	,cont.FirstName 
FROM 
	Contacts cont 
INNER JOIN 
	Companies comp ON  comp.CompanyId = cont.CompanyId
FOR XML RAW ('Contacts');
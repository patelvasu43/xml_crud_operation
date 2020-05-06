/*
12) Return a 2-level xml of companies and any associated contacts.
Expected Result:
<Companies CompanyName="CA Co 1"/><Companies CompanyName="UK Co 1"><Contacts LastName="Brown" FirstName="Tom"/></Companies><Companies CompanyName="US Co 1"><Contacts LastName="Milton" FirstName="Frank"/><Contacts LastName="Mulberry" FirstName="Mike"/></Companies><Companies CompanyName="US Co 2"><Contacts LastName="Francis" FirstName="Stephanie"/></Companies>
*/

SELECT Companies.CompanyName, Contacts.LastName, 
   Contacts.FirstName
FROM Companies AS Companies 
   left JOIN Contacts AS Contacts 
   ON Contacts.CompanyId = Companies.CompanyId
FOR XML AUTO 
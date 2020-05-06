
/*1) Return a list of all companies and their users. Alphabetize by CompanyName, LastName, then FirstName.
Expected Result:
CA Co 1	NULL	NULL
UK Co 1	Brown	Tom
US Co 1	Milton	Frank
US Co 1	Mulberry	Mike
US Co 2	Francis	Stephanie

Answer :
SELECT 
	comp.CompanyName
	,cont.LastName
	,cont.FirstName 
FROM 
	Companies comp 
LEFT JOIN 
	Contacts cont ON  comp.CompanyId = cont.CompanyId


2) Return a list of all users and their company name.
Expected Result:
UK Co 1	Brown	Tom
US Co 1	Milton	Frank
US Co 1	Mulberry	Mike
US Co 2	Francis	Stephanie

Answer :
SELECT 
	comp.CompanyName
	,cont.LastName
	,cont.FirstName 
FROM 
	Contacts cont 
INNER JOIN 
	Companies comp ON  comp.CompanyId = cont.CompanyId

3) Return first and last names of contacts whose last name starts with 'M'.
Expected Result:
Milton	Frank
Mulberry	Mike

Answer :
SELECT 
	cont.LastName
	,cont.FirstName 
FROM 
	Contacts cont 
WHERE 
	cont.LastName like 'M%'

4) Return a unique list of countries from the companies table.
Expected Result:
CA
UK
US

Answer :
SELECT 
	comp.Country
FROM 
	Companies comp 
GROUP BY 
	Country

5) Return a number of contacts per country with more than 2 contacts.
Expected Result:
3	US

Answer :
SELECT 
		COUNT(1) AS ContactNo
		,comp.Country
FROM 
		Contacts cont 
INNER JOIN 
		Companies comp ON  comp.CompanyId = cont.CompanyId
GROUP BY 
		comp.Country HAVING COUNT(ContactId) >2

6) Sum the Salary by country.
Expected Results:
CA	NULL
UK	30000.00
US	110000.00

Answer :
SELECT 
		comp.Country
		,SUM(Salary) AS Salary
FROM 
		Contacts cont 
RIGHT JOIN 
		Companies comp ON  comp.CompanyId = cont.CompanyId
GROUP BY 
		comp.Country

7) Use PIVOT to return the sum of Salary by Country for CA, UK, and US in a single row.
Expected Result:
CA	UK		US
--------------------
0	30000	110000

Answer : 7.sql

8) Use UNPIVOT to return the 3 phone numbers on separate rows per contact.
Expected Result:
Brown		Tom			OfficePhone	111-111-1111
Brown		Tom			MobilePhone	122-122-1222
Brown		Tom			HomePhone	133-133-1333
Milton		Frank		OfficePhone	211-211-2111
Milton		Frank		MobilePhone	222-222-2222
Milton		Frank		HomePhone	233-233-2333
Mulberry	Mike		OfficePhone	311-311-3111
Mulberry	Mike		MobilePhone	322-322-3222
Mulberry	Mike		HomePhone	333-333-3333
Francis		Stephanie	OfficePhone	411-411-4111
Francis		Stephanie	MobilePhone	422-422-4222
Francis		Stephanie	HomePhone	433-433-4333

Answer : 8.sql

9) Write a function "fn_GetCompanyName" that returns CompanyName given a CompanyId.

Answer : 9.sql


10) Write a stored procedure "usp_ContactBoard" that returns item 2's results given a CompanyId.

Answer : 10.sql

11) Return item 2's results in XML.
Expected Result:
<Contacts CompanyName="UK Co 1" LastName="Brown" FirstName="Tom"/><Contacts CompanyName="US Co 1" LastName="Milton" FirstName="Frank"/><Contacts CompanyName="US Co 1" LastName="Mulberry" FirstName="Mike"/><Contacts CompanyName="US Co 2" LastName="Francis" FirstName="Stephanie"/>

Answer : 11.sql

12) Return a 2-level xml of companies and any associated contacts.
Expected Result:
<Companies CompanyName="CA Co 1"/><Companies CompanyName="UK Co 1"><Contacts LastName="Brown" FirstName="Tom"/></Companies><Companies CompanyName="US Co 1"><Contacts LastName="Milton" FirstName="Frank"/><Contacts LastName="Mulberry" FirstName="Mike"/></Companies><Companies CompanyName="US Co 2"><Contacts LastName="Francis" FirstName="Stephanie"/></Companies>

Answwer :12.sql

13) Given an XML text string parameter '<Contacts LastName="Repoli"/>', select LastName from the string in a stored procedure.

Answwer :13.sql

14) Performance Tuning:
Given the following query, make recommendations for improvements from performance and functional perspectives.

-- Get the prior row id with the same MinId for certain classes of business.
SELECT TT.TempId, Q_Prior.PriorTempId
FROM TT with(nolock)
INNER JOIN (SELECT MAX(priorTemp.TempId) PriorTempId, curTemp.TempId
			FROM @PremTemp curTemp
			INNER JOIN @PremTemp priorTemp ON curTemp.MinId = priorTemp.MinId
			WHERE curTemp.TempId > priorTemp.TempId
			GROUP BY curTemp.TempId
			) Q_Prior ON TT.TempId = Q_Prior.TempId
WHERE tt.LOB = 'COMMERCIAL PROPERTY' 
OR tt.ConstructionType = 'WOOD FRAME'
OR tt.OccupancyType not in (select OccupancyType from zTypes where OccupancyType like '%commercial%')

Answer : 14.sql

15) Generate a row number for the list of companies and their users. Alphabetize by CompanyName, LastName, then FirstName.
Expected Result:
RowNum		CompanyName		LastName		FirstName 
--------    ----------		---------		---------- 
1			CA Co 1			NULL			NULL
2			UK Co 1			Brown			Tom
3			US Co 1			Milton			Frank
4			US Co 1			Mulberry		Mike
5			US Co 2			Francis			Stephanie

Answer : 15.sql

16) Find the employee with the 3rd maximum salary. Output the CompanyName, LastName, FirstName  and salary 
Expected Result:

CompanyName		LastName		FirstName	Salary 
-----------     ---------       ---------    ------
UK Co 1			Brown			Tom			30000.00

Answer : 16.sql

*/





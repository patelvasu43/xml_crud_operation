/*
15) Generate a row number for the list of companies and their users. Alphabetize by CompanyName, LastName, then FirstName.
Expected Result:
RowNum		CompanyName		LastName		FirstName 
--------    ----------		---------		---------- 
1			CA Co 1			NULL			NULL
2			UK Co 1			Brown			Tom
3			US Co 1			Milton			Frank
4			US Co 1			Mulberry		Mike
5			US Co 2			Francis			Stephanie

*/

SELECT 
	ROW_NUMBER() OVER(ORDER BY CompanyName) AS RowNum
	,comp.CompanyName
	,cont.LastName
	,cont.FirstName
FROM 
	Companies comp
	Left JOIN Contacts cont ON comp.CompanyId = cont.CompanyId
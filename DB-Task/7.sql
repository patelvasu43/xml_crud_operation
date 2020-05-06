/*
7) Use PIVOT to return the sum of Salary by Country for CA, UK, and US in a single row.
Expected Result:
CA	UK		US
--------------------
0	30000	110000
*/

WITH SalaryData
AS (
	SELECT 
		comp.Country,
		ISNULL(cont.Salary,0) as Salary
	
	FROM 
		Companies comp 
	LEFT JOIN 
		Contacts cont ON  comp.CompanyId = cont.CompanyId
	)

SELECT *
FROM
   SalaryData
   PIVOT (
			Sum(SalaryData.salary)
			FOR Country IN (CA, UK, US)
		) P

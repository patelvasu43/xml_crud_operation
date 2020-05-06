/*
16) Find the employee with the 3rd maximum salary. Output the CompanyName, LastName, FirstName  and salary 
Expected Result:

CompanyName		LastName		FirstName	Salary 
-----------     ---------       ---------    ------
UK Co 1			Brown			Tom			30000.00


*/

--Note : We can Use DENSE_RANK to get all retrive user for 3rd highest salary.
WITH CTE AS
(
	SELECT 
		ROW_NUMBER() OVER(ORDER BY cont.salary DESC) AS RowNum
		,comp.CompanyName
		,cont.LastName
		,cont.FirstName
		,cont.salary
	FROM 
		Companies comp
		INNER JOIN Contacts cont ON comp.CompanyId = cont.CompanyId
)

SELECT 
		CompanyName
		,LastName
		,FirstName
		,salary
FROM
		CTE
WHERE 
	CTE.RowNum = 3

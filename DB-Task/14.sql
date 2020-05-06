/*
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
*/

Answer :
1) we can create one temp table and insert sub quey data into it 
2) Add apply index in new created temp table and use inner join with TT table
3) 	We can use NOT EXISTS instead of NOT IN  for OccupancyType WHERE Clause 
	We can also use TT left join with create CTE OF zTypes Table Query.

/*
10) Write a stored procedure "usp_ContactBoard" that returns item 2's results given a CompanyId.
*/

IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'[dbo].[usp_ContactBoard]')
                    AND type IN (N'P')
		  ) 
	BEGIN
			DROP PROCEDURE [dbo].[usp_ContactBoard]
	END
GO
-- =============================================
-- Author:		Vasu Patel
-- Create date: 03-30-2020
-- Description:	Contact Detail With Company
-- =============================================
CREATE PROCEDURE usp_ContactBoard
	@CompanyId NUMERIC
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;

    SELECT 
			comp.CompanyName
			,cont.LastName
			,cont.FirstName 
	FROM 
			Contacts cont 
			INNER JOIN 	Companies comp ON  comp.CompanyId = cont.CompanyId
	WHERE Comp.CompanyId = @CompanyId
END

GO

Exec usp_ContactBoard 2
/*
9) Write a function "fn_GetCompanyName" that returns CompanyName given a CompanyId.
*/

IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'[dbo].[fn_GetCompanyName]')
                    AND type IN (N'FN')
		  ) 
	BEGIN
			DROP FUNCTION [dbo].[fn_GetCompanyName]
	END
GO

-- =============================================
-- Author:		Vasu Patel
-- Create date: 03-30-2020
-- Description:	Get Company Name By CompanyId
-- =============================================
CREATE FUNCTION [dbo].[fn_GetCompanyName] 
(
	@CompanyId NUMERIC
)
RETURNS VARCHAR(50)
AS
BEGIN

DECLARE @CompanyName VARCHAR(50)

SET @CompanyName  = ( 
						SELECT 
								CompanyName 
						FROM 
								Companies 
						WHERE 
								CompanyId = @CompanyId
					)

RETURN @CompanyName
END

GO

SELECT dbo.fn_GetCompanyName(2)
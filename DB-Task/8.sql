/*
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
*/


	SELECT 
		LastName, FirstName, PhoneType, Number
	FROM 
		Contacts 
		 UNPIVOT (
			Number
			FOR PhoneType IN (OfficePhone, MobilePhone, HomePhone)
		) P
	


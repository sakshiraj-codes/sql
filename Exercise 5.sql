--Exercise 5

CREATE PROCEDURE getPersonNameInfo
@name nvarchar(50)
AS 
BEGIN
	IF (@name = '') BEGIN 
		SELECT * FROM Person.Person ORDER BY FirstName;
	END 
	ELSE BEGIN
		SELECT * FROM Person.Person where FirstName = @name ORDER BY FirstName;
	END 
END 

-- by name 
DECLARE @First nvarchar(50)
set @First = 'Eren'
execute getPersonNameInfo @First
GO

--default 
DECLARE @FirstName nvarchar(50)
set @FirstName=''
execute getPersonNameInfo @FirstName
--Exercise 6

CREATE TRIGGER [Production].[trgLimitPriceChanges]
ON [Production].[Product]
FOR UPDATE
AS
IF EXISTS (
	SELECT * FROM inserted i
	JOIN deleted d
	ON i.ProductID = d.ProductID
	WHERE i.ListPrice > (d.ListPrice * 1.15)
)
BEGIN
	RAISERROR('Price increased should not be greater than 15%. Hence, Transaction Failed.',16,1)
	ROLLBACK TRAN
END
GO


ALTER TRIGGER [Production].[trgLimitPriceChanges]
ON [Production].[Product]
FOR UPDATE
AS
IF UPDATE(ListPrice)
BEGIN
	IF EXISTS(
	SELECT *
		FROM inserted i
		JOIN deleted d
		ON i.ProductID = d.ProductID
		WHERE i.ListPrice > (d.ListPrice * 1.15)
	)
	BEGIN 
		RAISERROR('Price increased should not be greater than 15%. Hence, Transaction Failed.',16,1)
		ROLLBACK TRAN
	END
END
GO
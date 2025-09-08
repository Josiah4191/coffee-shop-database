CREATE TRIGGER LastUpdatedIngredientsTrigger
ON Ingredients
AFTER INSERT, UPDATE
AS
BEGIN

    UPDATE Ingredients
    SET LastUpdated = GETDATE()
    FROM Ingredients i
    JOIN Inserted ins ON i.IngredientID = ins.IngredientID;
END;

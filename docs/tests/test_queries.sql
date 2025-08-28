/* Stored Procedure Test */
EXEC GetEmployeeSchedule @FromDate = '2025-08-01';

/* View Test */
SELECT TOP 15 * 
FROM WeeklyHoursWorked;

/* Trigger Test */

/* 
This trigger automatically updates the LastUpdated column whenever a row in the Ingredients table is inserted or modified.
Notice that Skim Milk, the new ingredient, already has a date, even though no value was provided in the INSERT statement and no default date was set when the table was created. The trigger is adding the date for us.
This is a good example of using a trigger when you need to keep track of when records are added or updated in a table.
*/

UPDATE Ingredients
SET QuantityOnHand = 14300
WHERE IngredientID = 1;

INSERT INTO Ingredients (IngredientName, UnitOfMeasure, QuantityOnHand, IsTracked)
VALUES ('Skim Milk', 'ounces', '1000', 1);





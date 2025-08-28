/* ************************************************************/
/* ProductManagementMC Role Creation Script                   */
/* Coded by: Matthew Culpepper                                */
/* Coded on: 07/25/25                                         */
/* ************************************************************/

USE JKGPDatabase;

GO

CREATE ROLE ProductManagementMC;

GO

GRANT UPDATE 
ON MenuItems 
TO ProductManagementMC;

GRANT UPDATE 
ON  Ingredients
TO ProductManagementMC;

GRANT UPDATE 
ON RecipeIngredients
TO ProductManagementMC;

GRANT UPDATE
ON Recipes
TO ProductManagementMC;

GRANT SELECT 
ON Employees 
TO ProductManagementMC;

GRANT SELECT 
ON ShiftAssignments 
TO ProductManagementMC;

GRANT SELECT
ON Shifts
TO ProductManagementMC;

GRANT SELECT
ON ShiftTypes
TO ProductManagementMC;

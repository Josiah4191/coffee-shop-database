CREATE DATABASE JKGPDatabase;

GO

USE JKGPDatabase;

GO

CREATE TABLE Employees (
    EmployeeID INT IDENTITY PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Position VARCHAR(30) NOT NULL,
    HireDate DATE NOT NULL,
    CHECK (LEN(Phone) >= 10)
);

GO

CREATE TABLE ShiftTypes (
	ShiftTypeID INT IDENTITY PRIMARY KEY,
	ShiftTypeName VARCHAR(15) NOT NULL,
	StartTime TIME NOT NULL,
	EndTime TIME NOT NULL
);

GO

CREATE TABLE Shifts (
    ShiftID INT IDENTITY PRIMARY KEY,
    ShiftTypeID INT NOT NULL,
    ShiftDate DATE,
    FOREIGN KEY (ShiftTypeID) REFERENCES ShiftTypes(ShiftTypeID)
);

GO

CREATE TABLE ShiftAssignments (
    AssignmentID INT IDENTITY PRIMARY KEY,
    ShiftID INT NOT NULL,
    EmployeeID INT NOT NULL,
    FOREIGN KEY (ShiftID) REFERENCES Shifts(ShiftID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    UNIQUE (ShiftID, EmployeeID)
);

GO
 


CREATE TABLE Ingredients (
    IngredientID INT IDENTITY PRIMARY KEY,
    IngredientName VARCHAR(100) NOT NULL UNIQUE,
    UnitOfMeasure VARCHAR(20) NOT NULL,
    QuantityOnHand DECIMAL(10,2) NOT NULL,
    IsTracked BIT NOT NULL DEFAULT 1,
    LastUpdated DATE,
    CHECK (QuantityOnHand >= 0),
    CHECK (IsTracked IN (0, 1))
);

GO


CREATE TABLE MenuItems (
    MenuItemID INT IDENTITY PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL UNIQUE,
    Price DECIMAL(6,2) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Description VARCHAR(255),
    IsAvailable INT NOT NULL DEFAULT 0,
    CHECK (Price >= 0),
    CHECK (IsAvailable IN (0, 1))
);

GO


CREATE TABLE Recipes (
    RecipeID INT IDENTITY PRIMARY KEY,
    MenuItemID INT NOT NULL UNIQUE,
    Directions VARCHAR(MAX) NOT NULL,
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

GO


CREATE TABLE RecipeIngredients (
    RecipeIngredientID INT IDENTITY PRIMARY KEY,	
    RecipeID INT NOT NULL,
    IngredientID INT NOT NULL,
    QuantityNeeded DECIMAL(10,2) NOT NULL,
    UnitOfMeasure VARCHAR(20) NOT NULL,
    FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID),
    CHECK (QuantityNeeded > 0)
);

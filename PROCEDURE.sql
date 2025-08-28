CREATE PROCEDURE GetEmployeeSchedule
    @FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @FromDate DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @FromDate IS NULL
        SET @FromDate = CAST(GETDATE() AS DATE);

    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        e.Position,
        st.ShiftTypeName,
        s.ShiftDate
    FROM Employees e
    JOIN ShiftAssignments sa ON sa.EmployeeID = e.EmployeeID
    JOIN Shifts s ON sa.ShiftID = s.ShiftID
    JOIN ShiftTypes st ON s.ShiftTypeID = st.ShiftTypeID
    WHERE s.ShiftDate >= @FromDate
      AND (@FirstName IS NULL OR e.FirstName = @FirstName)
      AND (@LastName IS NULL OR e.LastName = @LastName)
    ORDER BY s.ShiftDate, st.ShiftTypeName, e.LastName, e.FirstName;
END;

EXEC GetEmployeeSchedule;
EXEC GetEmployeeSchedule @FromDate = '2025-08-01';
EXEC GetEmployeeSchedule @FirstName = 'Josiah';

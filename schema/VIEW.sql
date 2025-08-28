CREATE VIEW WeeklyHoursWorked AS
SELECT 
  e.EmployeeID,
  e.FirstName,
  e.LastName,
  DATEADD(DAY, -DATEPART(WEEKDAY, s.ShiftDate) + 1, CAST(s.ShiftDate AS DATE)) AS WeekStartDate,
  SUM(
    CASE 
      WHEN st.EndTime < st.StartTime THEN 
        DATEDIFF(MINUTE, CAST(st.StartTime AS DATETIME), DATEADD(DAY, 1, CAST(st.EndTime AS DATETIME))) / 60.0
      ELSE 
        DATEDIFF(MINUTE, CAST(st.StartTime AS DATETIME), CAST(st.EndTime AS DATETIME)) / 60.0
    END
  ) AS TotalHoursWorked
FROM Employees e
JOIN ShiftAssignments sa ON sa.EmployeeID = e.EmployeeID
JOIN Shifts s ON sa.ShiftID = s.ShiftID
JOIN ShiftTypes st ON st.ShiftTypeID = s.ShiftTypeID
GROUP BY 
  e.EmployeeID,
  e.FirstName,
  e.LastName,
  DATEADD(DAY, -DATEPART(WEEKDAY, s.ShiftDate) + 1, CAST(s.ShiftDate AS DATE));
SELECT * FROM WeeklyHoursWorked;


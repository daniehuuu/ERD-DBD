SELECT 
    e.EmployeeID AS EmployeeID,
    e.LastName AS EmployeeLastName,
    e.FirstName AS EmployeeFirstName,
    e.ReportsTo AS ReportsToID,
    jefe.LastName AS BossLastName,
    jefe.FirstName AS BossFirstName
FROM 
    Employees e
LEFT JOIN Employees jefe ON e.ReportsTo = jefe.EmployeeID
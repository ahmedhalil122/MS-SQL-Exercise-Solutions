GO

USE SoftUni

GO

--Problem 1

SELECT TOP 5
 EmployeeID
,JobTitle
,a.AddressID
,a.AddressText
FROM Employees AS e
JOIN Addresses AS a ON e.AddressID=a.AddressID
ORDER BY a.AddressID

--Problem 2

SELECT TOP 50
 FirstName
,LastName
,t.[Name] AS Town
,a.AddressText
FROM Employees AS e
JOIN Addresses AS a ON e.AddressID=a.AddressID
JOIN Towns AS t ON a.TownID = t.TownID
ORDER BY FirstName, LastName

--Problem 3

SELECT
 EmployeeID
,FirstName
,LastName
,d.[Name] AS DepartmentName
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE d.[Name] = 'Sales'
ORDER BY EmployeeID

--Problem 4

SELECT TOP 5
 EmployeeID
,FirstName
,Salary
,d.[Name] AS [DepartmentName]
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE Salary>15000
ORDER BY e.DepartmentID

--Problem 5

SELECT TOP 3
 e.EmployeeID
,FirstName
FROM Employees AS e
LEFT JOIN EmployeesProjects AS ep ON e.EmployeeID=ep.EmployeeID
WHERE ProjectID IS NULL
ORDER BY EmployeeID

--Problem 6

SELECT
 FirstName
,LastName
,HireDate
,d.[Name] AS DeptName
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE HireDate > '1.1.1999' AND d.[Name] IN ('Sales','Finance')
ORDER BY HireDate


--Problem 7

SELECT TOP 5
 e.EmployeeID
,FirstName
,p.[Name] AS ProjectName
FROM Employees AS e
JOIN EmployeesProjects AS ep ON e.EmployeeID=ep.EmployeeID
JOIN Projects AS p ON p.ProjectID=ep.ProjectID
WHERE p.EndDate IS NULL AND StartDate> '2002-08-13'
ORDER BY EmployeeID

--Problem 9

SELECT 
    e.EmployeeID,
    e.FirstName,
    e.ManagerID,
    m.FirstName AS ManagerName
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE e.ManagerID IN (3, 7)
ORDER BY e.EmployeeID;

--Problem 10

SELECT TOP 50
 e.EmployeeID
,CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName
,CONCAT(m.FirstName, ' ', m.LastName) AS ManagerName
,d.[Name] AS DepartmentName
FROM Employees AS e
JOIN Employees AS m ON e.ManagerID=m.EmployeeID
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID

--Problem 11

SELECT MIN(AvgSalary) AS MinAverageSalary
FROM (
    SELECT DepartmentID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
) AS DeptAvgSalaries;


GO

USE Geography

GO

--Problem 12

SELECT
 c.CountryCode
,m.MountainRange
,p.PeakName
,p.Elevation
FROM Countries AS c
JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
JOIN Mountains AS m ON m.Id = mc.MountainId
JOIN Peaks AS p ON p.MountainId = m.Id
WHERE c.CountryName = 'Bulgaria' AND p.Elevation > 2835
ORDER BY p.Elevation DESC

--Problem 13

SELECT 
 c.CountryCode
,COUNT(m.MountainRange)
FROM Countries AS c
JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
JOIN Mountains AS m ON m.Id = mc.MountainId
WHERE c.CountryName IN ('United States', 'Russia', 'Bulgaria')
GROUP BY c.CountryCode

--Problem 14

SELECT TOP 5
 c.CountryName
,r.RiverName
 FROM Countries AS c
 LEFT JOIN Continents AS ct ON c.ContinentCode = ct.ContinentCode
 LEFT JOIN CountriesRivers AS cr ON c.CountryCode=cr.CountryCode
 LEFT JOIN Rivers AS r ON r.Id=cr.RiverId
WHERE ct.ContinentName = 'Africa'
ORDER BY CountryName

--Problem 15*

--TODO

--Problem 16

SELECT
 COUNT(*) AS [Count]
 FROM Countries AS c
 LEFT JOIN MountainsCountries AS mc ON c.CountryCode=mc.CountryCode
 LEFT JOIN Mountains AS m ON m.Id=mc.MountainId
WHERE m.MountainRange IS NULL

--Problem 17

SELECT TOP 5
a.Country
,MAX(a.Elevation) AS HighestPeakElevation
,MAX(a.[Length])  AS LongestRiverLength
FROM
(
SELECT 
 CountryName AS Country
,p.Elevation AS Elevation
,r.[Length]  AS [Length]
FROM Countries AS c
JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
JOIN Rivers AS r ON r.Id = cr.RiverId
JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
JOIN Mountains AS m ON m.Id = mc.MountainId
JOIN Peaks AS p ON p.MountainId = m.Id
) AS a
GROUP BY 
    a.Country
ORDER BY
	MAX(a.Elevation) DESC,
	MAX(a.Length) DESC

--Problem 18
-- Criando a view para número de empregados por departamento e localidade
CREATE VIEW empregados_por_departamento AS
SELECT d.DepartmentID, d.DepartmentName, l.City, COUNT(e.EmployeeID) AS numero_empregados
FROM ecommercedb.departments d
JOIN ecommercedb.locations l ON d.LocationID = l.LocationID
LEFT JOIN ecommercedb.employees e ON d.ManagerID = e.EmployeeID
GROUP BY d.DepartmentID, d.DepartmentName, l.City;

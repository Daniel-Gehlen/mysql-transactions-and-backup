-- Criando a view para lista de departamentos e seus gerentes
CREATE VIEW departamentos_e_gerentes AS
SELECT d.DepartmentID, d.DepartmentName, e.EmployeeID AS gerente_id, CONCAT(e.FirstName, ' ', e.LastName) AS gerente_nome
FROM ecommercedb.departments d
LEFT JOIN ecommercedb.employees e ON d.ManagerID = e.EmployeeID;

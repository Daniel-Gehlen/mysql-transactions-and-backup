-- Criando a view para lista de projetos, departamentos e gerentes
CREATE VIEW lista_projetos_departamentos_gerentes AS
SELECT p.ProjectID, p.ProjectName, d.DepartmentName, CONCAT(e.FirstName, ' ', e.LastName) AS gerente_nome
FROM ecommercedb.departments d
JOIN ecommercedb.projects p ON d.DepartmentID = p.DepartmentID
LEFT JOIN ecommercedb.employees e ON d.ManagerID = e.EmployeeID;

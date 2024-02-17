-- Criando a view para projetos com maior número de empregados
CREATE VIEW projetos_com_maior_numero_empregados AS
SELECT p.ProjectID, p.ProjectName, COUNT(pe.EmployeeID) AS numero_empregados
FROM ecommercedb.projects p
JOIN ecommercedb.project_employees pe ON p.ProjectID = pe.ProjectID
GROUP BY p.ProjectID, p.ProjectName
ORDER BY COUNT(pe.EmployeeID) DESC;

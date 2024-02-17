-- Criando a view empregados_com_dependentes
CREATE VIEW empregados_com_dependentes AS
SELECT e.EmployeeID, e.FirstName, e.LastName,
    CASE
        WHEN e.ManagerID IS NOT NULL THEN 'Sim'
        ELSE 'Não'
    END AS e_gerente,
    CASE
        WHEN d.DependentID IS NOT NULL THEN 'Sim'
        ELSE 'Não'
    END AS possui_dependentes
FROM ecommercedb.employees e
LEFT JOIN ecommercedb.dependents d ON e.EmployeeID = d.EmployeeID;

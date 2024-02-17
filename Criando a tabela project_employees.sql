-- Criando a tabela project_employees no banco de dados ecommercedb
CREATE TABLE IF NOT EXISTS ecommercedb.project_employees (
    ProjectID INT NOT NULL,
    EmployeeID INT NOT NULL,
    FOREIGN KEY (ProjectID) REFERENCES ecommercedb.projects(ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES ecommercedb.employees(EmployeeID)
);

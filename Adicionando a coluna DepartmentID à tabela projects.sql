-- Adicionando a coluna DepartmentID à tabela projects
ALTER TABLE ecommercedb.projects
ADD COLUMN DepartmentID INT NOT NULL,
ADD FOREIGN KEY (DepartmentID) REFERENCES ecommercedb.departments(DepartmentID);

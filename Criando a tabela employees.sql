-- Criando a tabela employees no banco de dados ecommercedb
CREATE TABLE IF NOT EXISTS ecommercedb.employees (
    EmployeeID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    PRIMARY KEY (EmployeeID)
);

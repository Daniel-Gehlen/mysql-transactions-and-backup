-- Criando a tabela dependents no banco de dados ecommercedb
CREATE TABLE IF NOT EXISTS ecommercedb.dependents (
    DependentID INT NOT NULL AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    PRIMARY KEY (DependentID),
    FOREIGN KEY (EmployeeID) REFERENCES ecommercedb.employees(EmployeeID)
);

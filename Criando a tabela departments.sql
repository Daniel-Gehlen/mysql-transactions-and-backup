-- Criando a tabela departments no banco de dados ecommercedb
CREATE TABLE IF NOT EXISTS ecommercedb.departments (
    DepartmentID INT NOT NULL AUTO_INCREMENT,
    DepartmentName VARCHAR(255) NOT NULL,
    LocationID INT NOT NULL,
    ManagerID INT,
    PRIMARY KEY (DepartmentID),
    FOREIGN KEY (LocationID) REFERENCES ecommercedb.locations(LocationID),
    FOREIGN KEY (ManagerID) REFERENCES ecommercedb.employees(EmployeeID)
);

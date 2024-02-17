-- Criando a tabela projects no banco de dados ecommercedb
CREATE TABLE IF NOT EXISTS ecommercedb.projects (
    ProjectID INT NOT NULL AUTO_INCREMENT,
    ProjectName VARCHAR(255) NOT NULL,
    PRIMARY KEY (ProjectID)
);

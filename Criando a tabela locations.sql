-- Criando a tabela locations no banco de dados ecommercedb
CREATE TABLE IF NOT EXISTS ecommercedb.locations (
    LocationID INT NOT NULL AUTO_INCREMENT,
    City VARCHAR(255) NOT NULL,
    PRIMARY KEY (LocationID)
);

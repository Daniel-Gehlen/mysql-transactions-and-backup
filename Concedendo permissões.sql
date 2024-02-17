-- Concedendo permissões para o usuário gerente
GRANT SELECT ON ecommercedb.employees TO 'gerente'@'localhost';
GRANT SELECT ON ecommercedb.departments TO 'gerente'@'localhost';

-- Concedendo permissões para o usuário employee
CREATE USER 'employee'@'localhost' IDENTIFIED BY 'senha_employee';
GRANT SELECT ON ecommercedb.employees TO 'employee'@'localhost';

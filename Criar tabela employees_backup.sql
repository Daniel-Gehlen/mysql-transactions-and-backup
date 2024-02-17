-- Criar tabela employees_backup se ela não existir
CREATE TABLE IF NOT EXISTS employees_backup (
    employee_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
    -- Adicione outras colunas necessárias aqui
);

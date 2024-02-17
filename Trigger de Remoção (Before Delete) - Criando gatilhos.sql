DELIMITER $$
CREATE TRIGGER before_delete_employee
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    -- Código para manipulação antes da remoção
    -- Por exemplo, salvar dados relacionados em uma tabela de backup
    INSERT INTO employees_backup (employee_id, first_name, last_name, email)
    VALUES (employee_id, first_name, last_name, email);
END$$
DELIMITER ;

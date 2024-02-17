DELIMITER $$
CREATE TRIGGER before_update_employee BEFORE UPDATE ON employees FOR EACH ROW 
BEGIN
    -- Declaração de variáveis para armazenar os salários antigo e novo
    DECLARE old_salary DECIMAL(10, 2);
    DECLARE new_salary DECIMAL(10, 2);

    -- Obtendo o salário antigo do funcionário que está sendo atualizado
    SELECT salary INTO old_salary FROM employees WHERE employee_id = OLD.EmployeeID;

    -- Obtendo o novo salário do funcionário que está sendo atualizado
    SELECT salary INTO new_salary FROM employees WHERE employee_id = NEW.EmployeeID;

    -- Verificando se o novo salário é menor que o antigo
    IF new_salary < old_salary THEN
        -- Ajustando o novo salário para ser igual ao antigo
        SET NEW.salary = old_salary; -- Impedir que o salário seja reduzido
    END IF;
END$$
DELIMITER ;

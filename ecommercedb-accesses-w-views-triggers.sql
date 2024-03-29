-- MySQL Script generated by MySQL Workbench
-- Fri Feb 16 20:46:56 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ecommercedb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecommercedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommercedb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ecommercedb` ;

-- -----------------------------------------------------
-- Table `ecommercedb`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`clientes` (
  `ClienteID` INT NOT NULL AUTO_INCREMENT,
  `TipoCliente` ENUM('Pessoa Física', 'Pessoa Jurídica') NULL DEFAULT NULL,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Endereco` VARCHAR(255) NULL DEFAULT NULL,
  `CPF` VARCHAR(14) NULL DEFAULT NULL,
  `CNPJ` VARCHAR(18) NULL DEFAULT NULL,
  PRIMARY KEY (`ClienteID`),
  UNIQUE INDEX `CPF` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `CNPJ` (`CNPJ` ASC) VISIBLE,
  INDEX `idx_numero_pessoas_departamento` (`TipoCliente` ASC, `Nome` ASC) VISIBLE,
  INDEX `idx_departamento_cidade` (`Endereco` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`locations` (
  `LocationID` INT NOT NULL AUTO_INCREMENT,
  `City` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`LocationID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`employees` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(255) NOT NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `ManagerID` INT NULL DEFAULT NULL,
  `salary` DECIMAL(10,2) NULL DEFAULT '0.00',
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`departments` (
  `DepartmentID` INT NOT NULL AUTO_INCREMENT,
  `DepartmentName` VARCHAR(255) NOT NULL,
  `LocationID` INT NOT NULL,
  `ManagerID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`),
  INDEX `LocationID` (`LocationID` ASC) VISIBLE,
  INDEX `ManagerID` (`ManagerID` ASC) VISIBLE,
  CONSTRAINT `departments_ibfk_1`
    FOREIGN KEY (`LocationID`)
    REFERENCES `ecommercedb`.`locations` (`LocationID`),
  CONSTRAINT `departments_ibfk_2`
    FOREIGN KEY (`ManagerID`)
    REFERENCES `ecommercedb`.`employees` (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`dependents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`dependents` (
  `DependentID` INT NOT NULL AUTO_INCREMENT,
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(255) NOT NULL,
  `LastName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`DependentID`),
  INDEX `EmployeeID` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `dependents_ibfk_1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `ecommercedb`.`employees` (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`employees_backup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`employees_backup` (
  `employee_id` INT NULL DEFAULT NULL,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`pedidos` (
  `PedidoID` INT NOT NULL AUTO_INCREMENT,
  `ClienteID` INT NULL DEFAULT NULL,
  `DataPedido` DATETIME NULL DEFAULT NULL,
  `Status` ENUM('Pendente', 'Processando', 'Enviado', 'Entregue') NULL DEFAULT NULL,
  PRIMARY KEY (`PedidoID`),
  INDEX `idx_empregados_departamento` (`ClienteID` ASC) VISIBLE,
  CONSTRAINT `pedidos_ibfk_1`
    FOREIGN KEY (`ClienteID`)
    REFERENCES `ecommercedb`.`clientes` (`ClienteID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`entregas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`entregas` (
  `EntregaID` INT NOT NULL AUTO_INCREMENT,
  `PedidoID` INT NULL DEFAULT NULL,
  `Status` ENUM('Pendente', 'Processando', 'Enviado', 'Entregue') NULL DEFAULT NULL,
  `CodigoRastreio` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`EntregaID`),
  INDEX `PedidoID` (`PedidoID` ASC) VISIBLE,
  CONSTRAINT `entregas_ibfk_1`
    FOREIGN KEY (`PedidoID`)
    REFERENCES `ecommercedb`.`pedidos` (`PedidoID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`produtos` (
  `ProdutoID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Descricao` TEXT NULL DEFAULT NULL,
  `Preco` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ProdutoID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`estoque` (
  `EstoqueID` INT NOT NULL AUTO_INCREMENT,
  `ProdutoID` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`EstoqueID`),
  INDEX `fk_estoque_produtos` (`ProdutoID` ASC) VISIBLE,
  CONSTRAINT `fk_estoque_produtos`
    FOREIGN KEY (`ProdutoID`)
    REFERENCES `ecommercedb`.`produtos` (`ProdutoID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`fornecedores` (
  `FornecedorID` INT NOT NULL AUTO_INCREMENT,
  `ClienteID` INT NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`FornecedorID`),
  INDEX `fk_fornecedores_clientes` (`ClienteID` ASC) VISIBLE,
  CONSTRAINT `fk_fornecedores_clientes`
    FOREIGN KEY (`ClienteID`)
    REFERENCES `ecommercedb`.`clientes` (`ClienteID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`itenspedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`itenspedido` (
  `ItemID` INT NOT NULL AUTO_INCREMENT,
  `PedidoID` INT NULL DEFAULT NULL,
  `ProdutoID` INT NULL DEFAULT NULL,
  `Quantidade` INT NULL DEFAULT NULL,
  `PrecoUnitario` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  INDEX `PedidoID` (`PedidoID` ASC) VISIBLE,
  INDEX `ProdutoID` (`ProdutoID` ASC) VISIBLE,
  CONSTRAINT `itenspedido_ibfk_1`
    FOREIGN KEY (`PedidoID`)
    REFERENCES `ecommercedb`.`pedidos` (`PedidoID`),
  CONSTRAINT `itenspedido_ibfk_2`
    FOREIGN KEY (`ProdutoID`)
    REFERENCES `ecommercedb`.`produtos` (`ProdutoID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`pagamentos` (
  `PagamentoID` INT NOT NULL AUTO_INCREMENT,
  `PedidoID` INT NULL DEFAULT NULL,
  `FormaPagamento` VARCHAR(100) NULL DEFAULT NULL,
  `Valor` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`PagamentoID`),
  INDEX `PedidoID` (`PedidoID` ASC) VISIBLE,
  CONSTRAINT `pagamentos_ibfk_1`
    FOREIGN KEY (`PedidoID`)
    REFERENCES `ecommercedb`.`pedidos` (`PedidoID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`projects` (
  `ProjectID` INT NOT NULL AUTO_INCREMENT,
  `ProjectName` VARCHAR(255) NOT NULL,
  `DepartmentID` INT NOT NULL,
  PRIMARY KEY (`ProjectID`),
  INDEX `DepartmentID` (`DepartmentID` ASC) VISIBLE,
  CONSTRAINT `projects_ibfk_1`
    FOREIGN KEY (`DepartmentID`)
    REFERENCES `ecommercedb`.`departments` (`DepartmentID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`project_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`project_employees` (
  `ProjectID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  INDEX `ProjectID` (`ProjectID` ASC) VISIBLE,
  INDEX `EmployeeID` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `project_employees_ibfk_1`
    FOREIGN KEY (`ProjectID`)
    REFERENCES `ecommercedb`.`projects` (`ProjectID`),
  CONSTRAINT `project_employees_ibfk_2`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `ecommercedb`.`employees` (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommercedb`.`vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`vendedores` (
  `VendedorID` INT NOT NULL AUTO_INCREMENT,
  `ClienteID` INT NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`VendedorID`),
  UNIQUE INDEX `ClienteID_UNIQUE` (`ClienteID` ASC) VISIBLE,
  CONSTRAINT `fk_vendedores_clientes`
    FOREIGN KEY (`ClienteID`)
    REFERENCES `ecommercedb`.`clientes` (`ClienteID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `ecommercedb` ;

-- -----------------------------------------------------
-- Placeholder table for view `ecommercedb`.`departamentos_e_gerentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`departamentos_e_gerentes` (`DepartmentID` INT, `DepartmentName` INT, `gerente_id` INT, `gerente_nome` INT);

-- -----------------------------------------------------
-- Placeholder table for view `ecommercedb`.`empregados_com_dependentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`empregados_com_dependentes` (`EmployeeID` INT, `FirstName` INT, `LastName` INT, `e_gerente` INT, `possui_dependentes` INT);

-- -----------------------------------------------------
-- Placeholder table for view `ecommercedb`.`empregados_por_departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`empregados_por_departamento` (`DepartmentID` INT, `DepartmentName` INT, `City` INT, `numero_empregados` INT);

-- -----------------------------------------------------
-- Placeholder table for view `ecommercedb`.`lista_projetos_departamentos_gerentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`lista_projetos_departamentos_gerentes` (`ProjectID` INT, `ProjectName` INT, `DepartmentName` INT, `gerente_nome` INT);

-- -----------------------------------------------------
-- Placeholder table for view `ecommercedb`.`projetos_com_maior_numero_empregados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`projetos_com_maior_numero_empregados` (`ProjectID` INT, `ProjectName` INT, `numero_empregados` INT);

-- -----------------------------------------------------
-- procedure ManipularDados
-- -----------------------------------------------------

DELIMITER $$
USE `ecommercedb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManipularDados`(
    IN opcao INT,
    IN cliente_id INT,
    IN nome_cliente VARCHAR(100),
    IN email_cliente VARCHAR(100),
    IN endereco_cliente VARCHAR(255),
    IN cpf_cliente VARCHAR(14),
    IN cnpj_cliente VARCHAR(18)
)
BEGIN
    CASE opcao
        WHEN 1 THEN
            -- Inserção de dados
            INSERT INTO clientes (Nome, Email, Endereco, CPF, CNPJ)
            VALUES (nome_cliente, email_cliente, endereco_cliente, cpf_cliente, cnpj_cliente);
        
        WHEN 2 THEN
            -- Atualização de dados
            UPDATE clientes
            SET Nome = nome_cliente, Email = email_cliente, Endereco = endereco_cliente, CPF = cpf_cliente, CNPJ = cnpj_cliente
            WHERE ClienteID = cliente_id;
        
        WHEN 3 THEN
            -- Remoção de dados
            DELETE FROM clientes
            WHERE ClienteID = cliente_id;
            
        ELSE
            -- Opção inválida
            SELECT 'Opção inválida';
    END CASE;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `ecommercedb`.`departamentos_e_gerentes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`departamentos_e_gerentes`;
USE `ecommercedb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ecommercedb`.`departamentos_e_gerentes` AS select `d`.`DepartmentID` AS `DepartmentID`,`d`.`DepartmentName` AS `DepartmentName`,`e`.`EmployeeID` AS `gerente_id`,concat(`e`.`FirstName`,' ',`e`.`LastName`) AS `gerente_nome` from (`ecommercedb`.`departments` `d` left join `ecommercedb`.`employees` `e` on((`d`.`ManagerID` = `e`.`EmployeeID`)));

-- -----------------------------------------------------
-- View `ecommercedb`.`empregados_com_dependentes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`empregados_com_dependentes`;
USE `ecommercedb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ecommercedb`.`empregados_com_dependentes` AS select `e`.`EmployeeID` AS `EmployeeID`,`e`.`FirstName` AS `FirstName`,`e`.`LastName` AS `LastName`,(case when (`e`.`ManagerID` is not null) then 'Sim' else 'Não' end) AS `e_gerente`,(case when (`d`.`DependentID` is not null) then 'Sim' else 'Não' end) AS `possui_dependentes` from (`ecommercedb`.`employees` `e` left join `ecommercedb`.`dependents` `d` on((`e`.`EmployeeID` = `d`.`EmployeeID`)));

-- -----------------------------------------------------
-- View `ecommercedb`.`empregados_por_departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`empregados_por_departamento`;
USE `ecommercedb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ecommercedb`.`empregados_por_departamento` AS select `d`.`DepartmentID` AS `DepartmentID`,`d`.`DepartmentName` AS `DepartmentName`,`l`.`City` AS `City`,count(`e`.`EmployeeID`) AS `numero_empregados` from ((`ecommercedb`.`departments` `d` join `ecommercedb`.`locations` `l` on((`d`.`LocationID` = `l`.`LocationID`))) left join `ecommercedb`.`employees` `e` on((`d`.`ManagerID` = `e`.`EmployeeID`))) group by `d`.`DepartmentID`,`d`.`DepartmentName`,`l`.`City`;

-- -----------------------------------------------------
-- View `ecommercedb`.`lista_projetos_departamentos_gerentes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`lista_projetos_departamentos_gerentes`;
USE `ecommercedb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ecommercedb`.`lista_projetos_departamentos_gerentes` AS select `p`.`ProjectID` AS `ProjectID`,`p`.`ProjectName` AS `ProjectName`,`d`.`DepartmentName` AS `DepartmentName`,concat(`e`.`FirstName`,' ',`e`.`LastName`) AS `gerente_nome` from ((`ecommercedb`.`departments` `d` join `ecommercedb`.`projects` `p` on((`d`.`DepartmentID` = `p`.`DepartmentID`))) left join `ecommercedb`.`employees` `e` on((`d`.`ManagerID` = `e`.`EmployeeID`)));

-- -----------------------------------------------------
-- View `ecommercedb`.`projetos_com_maior_numero_empregados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`projetos_com_maior_numero_empregados`;
USE `ecommercedb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ecommercedb`.`projetos_com_maior_numero_empregados` AS select `p`.`ProjectID` AS `ProjectID`,`p`.`ProjectName` AS `ProjectName`,count(`pe`.`EmployeeID`) AS `numero_empregados` from (`ecommercedb`.`projects` `p` join `ecommercedb`.`project_employees` `pe` on((`p`.`ProjectID` = `pe`.`ProjectID`))) group by `p`.`ProjectID`,`p`.`ProjectName` order by count(`pe`.`EmployeeID`) desc;
USE `ecommercedb`;

DELIMITER $$
USE `ecommercedb`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `ecommercedb`.`before_delete_employee`
BEFORE DELETE ON `ecommercedb`.`employees`
FOR EACH ROW
BEGIN
    -- Código para manipulação antes da remoção
    -- Por exemplo, salvar dados relacionados em uma tabela de backup
    INSERT INTO employees_backup (employee_id, first_name, last_name, email)
    VALUES (employee_id, first_name, last_name, email);
END$$

USE `ecommercedb`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `ecommercedb`.`before_update_employee`
BEFORE UPDATE ON `ecommercedb`.`employees`
FOR EACH ROW
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

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

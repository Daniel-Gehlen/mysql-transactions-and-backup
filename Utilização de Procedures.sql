-- Criação da procedure para manipulação de dados
DELIMITER $$

CREATE PROCEDURE ManipularDados (
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

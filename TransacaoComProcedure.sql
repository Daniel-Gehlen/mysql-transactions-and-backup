DELIMITER $$

CREATE PROCEDURE TransacaoComProcedure(
    IN cliente_nome VARCHAR(100),
    IN novo_email VARCHAR(100)
)
BEGIN
    DECLARE rollback_error CONDITION FOR SQLSTATE '45000';

    -- Definindo a condição de erro
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    -- Desabilitando o autocommit para iniciar uma transação
    SET autocommit=0;

    -- Iniciando a transação
    START TRANSACTION;

    -- Tentando realizar as modificações
    BEGIN
        -- Execute as modificações necessárias
        UPDATE clientes SET Email = novo_email WHERE Nome = cliente_nome;

        -- Confirmando a transação (commit) se estiver tudo correto
        COMMIT;
    -- Em caso de erro, reverta as modificações (rollback)
    END;
END$$

DELIMITER ;

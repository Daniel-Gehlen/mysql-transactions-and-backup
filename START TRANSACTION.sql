-- Desabilitar o modo de atualização segura temporariamente
SET SQL_SAFE_UPDATES = 0;

-- Execute sua instrução UPDATE
UPDATE clientes SET Email = 'novoemail@example.com' WHERE Nome = 'Nome do Cliente';

-- Restaurar o modo de atualização segura para o valor anterior (opcional)
SET SQL_SAFE_UPDATES = 1;

-- Execute sua instrução UPDATE com uma cláusula WHERE que utilize uma coluna chave
UPDATE clientes SET Email = 'novoemail@example.com' WHERE ClienteID = 123;

-- Substitua '123' pelo ID do cliente que você deseja atualizar

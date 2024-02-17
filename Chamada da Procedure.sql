-- Chamada da procedure para inserir um novo cliente
CALL ManipularDados(1, NULL, 'Novo Cliente', 'novo@email.com', 'Rua Nova, 123', '123.456.789-00', NULL);

-- Chamada da procedure para atualizar um cliente existente
CALL ManipularDados(2, 1, 'Novo Nome Cliente', 'novo@email.com', 'Nova Rua, 456', '123.456.789-00', NULL);

-- Chamada da procedure para excluir um cliente existente
CALL ManipularDados(3, 1, NULL, NULL, NULL, NULL, NULL);

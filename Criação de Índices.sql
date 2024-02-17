-- Índices para consultas

-- Índice para consulta do departamento com maior número de pessoas
CREATE INDEX idx_numero_pessoas_departamento ON clientes (TipoCliente, Nome);

-- Índice para consulta dos departamentos por cidade
CREATE INDEX idx_departamento_cidade ON clientes (Endereco);

-- Índice para consulta da relação de empregados por departamento
CREATE INDEX idx_empregados_departamento ON pedidos (ClienteID);

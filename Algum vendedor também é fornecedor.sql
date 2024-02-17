SELECT 
    c.Nome AS NomeCliente,
    IFNULL(v.Nome, 'Não é vendedor') AS NomeVendedor,
    IFNULL(f.Nome, 'Não é fornecedor') AS NomeFornecedor
FROM 
    clientes c
LEFT JOIN 
    vendedores v ON c.ClienteID = v.ClienteID
LEFT JOIN 
    fornecedores f ON c.ClienteID = f.ClienteID;

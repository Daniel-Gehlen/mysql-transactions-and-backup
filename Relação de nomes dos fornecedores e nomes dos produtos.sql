SELECT 
    f.Nome AS NomeFornecedor,
    GROUP_CONCAT(p.Nome ORDER BY p.Nome ASC SEPARATOR ', ') AS ProdutosFornecidos
FROM 
    fornecedores f
LEFT JOIN 
    clientes c ON f.ClienteID = c.ClienteID
LEFT JOIN 
    pedidos pd ON c.ClienteID = pd.ClienteID
LEFT JOIN 
    itenspedido ip ON pd.PedidoID = ip.PedidoID
LEFT JOIN 
    produtos p ON ip.ProdutoID = p.ProdutoID
GROUP BY 
    f.Nome;

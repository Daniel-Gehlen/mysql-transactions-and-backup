SELECT 
    p.Nome AS NomeProduto,
    f.Nome AS NomeFornecedor,
    SUM(e.Quantidade) AS QuantidadeEmEstoque
FROM 
    produtos p
LEFT JOIN 
    estoque e ON p.ProdutoID = e.ProdutoID
LEFT JOIN 
    itenspedido ip ON p.ProdutoID = ip.ProdutoID
LEFT JOIN 
    pedidos pd ON ip.PedidoID = pd.PedidoID
LEFT JOIN 
    clientes c ON pd.ClienteID = c.ClienteID
LEFT JOIN 
    fornecedores f ON c.ClienteID = f.ClienteID
GROUP BY 
    p.Nome, f.Nome;

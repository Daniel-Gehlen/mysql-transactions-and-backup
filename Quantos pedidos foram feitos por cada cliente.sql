SELECT 
    c.ClienteID,
    c.Nome AS NomeCliente,
    COUNT(p.PedidoID) AS TotalPedidos
FROM
    clientes c
        LEFT JOIN
    pedidos p ON c.ClienteID = p.ClienteID
GROUP BY c.ClienteID , c.Nome;

-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
	pedidos.id,
	pedidos.status,
	pedidos.cliente_id,
	produtos.id,
	produtos.nome,
	produtos.tipo,
	produtos.preço,
	produtos.pts_de_lealdade	
FROM 
	pedidos 
	JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
	JOIN produtos ON produtos_pedidos.produto_id  = produtos.id;
-- 2)
SELECT 
	pedidos.id
FROM 
	pedidos 
	JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
	JOIN produtos ON produtos_pedidos.produto_id  = produtos.id
WHERE produtos.nome ILIKE ('%fritas%');
-- 3)
SELECT 
	clientes.nome gostam_de_fritas
FROM 
	clientes 
	JOIN pedidos ON clientes.id = pedidos.cliente_id 
	JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
	JOIN produtos ON produtos_pedidos.produto_id  = produtos.id
WHERE produtos.nome ILIKE ('%fritas%');
-- 4)
SELECT 
	sum(produtos.preço)
FROM 
	produtos 
	JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id  
	JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
	JOIN clientes ON pedidos.cliente_id  = clientes.id
WHERE clientes.nome ILIKE ('%laura%');
-- 5)
SELECT 
	produtos.nome,
	count(produtos.id)
FROM 
	produtos 
	JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
	JOIN pedidos ON produtos_pedidos.pedido_id  = pedidos.id	
GROUP BY produtos.nome;
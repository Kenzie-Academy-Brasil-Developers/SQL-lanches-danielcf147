-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO clientes (nome, lealdade)
values('Georgia', 0)
RETURNing clientes;

-- 2)

INSERT INTO pedidos (status, cliente_id)
values ('Recebido', 6)
RETURNING pedidos;

-- 3)

INSERT INTO produtos_pedidos (pedido_id, produto_id)
VALUES (6,1),
	   (6,2),
	   (6,6),
	   (6,8),
	   (6,8)
RETURNING produtos_pedidos;

-- Leitura

-- 1)

SELECT 
	clientes.id,
	clientes.nome,
	clientes.lealdade,
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
	JOIN produtos ON produtos_pedidos.produto_id  = produtos.id
	JOIN clientes ON clientes.id = pedidos.cliente_id
WHERE clientes.nome = 'Georgia';

-- Atualização

-- 1)

UPDATE clientes 
SET lealdade = 48
WHERE clientes.nome = 'Georgia'
RETURNING clientes;

-- Deleção


-- 1)

DELETE FROM clientes
WHERE id  = 4;



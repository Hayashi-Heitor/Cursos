-- ############## EXERCÍCIOS FEITOS EM AULA ##############


-- Exemplo 01: Exiba o nome completo do vendedor e o email dele em uma consulta.
SELECT nome || ' ' || sobrenome as "Nome Completo",
	email as "Email"
FROM vendedor;


-- Exemplo 02: Crie as seguintes consultas:
	-- Liste o nome, preço e estoque dos produtos em promoção (percentual_desconto > 0)
    -- Liste o nome, vendedor_id dos produtos que não possuem validade_desconto definida
SELECT nome, preco, estoque FROM produto WHERE percentual_desconto > 0;

SELECT nome, vendedor_id FROM produto WHERE validade_desconto IS NULL;


-- Exemplo 03: Liste os endereços dos estados 'CE', 'SP' e 'MG'
SELECT * from endereco WHERE uf = 'CE' or uf = 'SP' or uf = 'MG'


-- Exemplo 04: Crie consultas que:
	-- Liste o nome dos vendedores 1, 3 e 5
    -- Liste o nome dos vendedores nascidoss entre 01/01/1990 e 31/12/1996 (datas ISO yyyy-mm-dd)
select nome from vendedor where id_vendedor in (1, 3, 5);

SELECT nome from vendedor where data_nascimento BETWEEN '1990/01/01' and '1996/12/31';


-- Exemplo 05: Listar os produtos com desconto acima de 50%. Ordene pelo percentual e pelo preço.
SELECT * 
FROM produto
where percentual_desconto > 0.5
order by percentual_desconto, preco desc;


-- ############## EXERCÍCIOS DESAFIO ##############


-- Parte 1 – Criação das Tabelas (DDL)
-- Crie as seguintes tabelas com as restrições solicitadas:

-- Tabela: cliente

    -- id_cliente (chave primária, autoincremento)
    -- nome (texto, obrigatório)
    -- email (único, obrigatório)
    -- data_nascimento (date)

CREATE TABLE if not exists cliente(
  id_cliente INTEGER PRIMARY key AUTOINCREMENT,
  nome TEXT not NULL,
  email TEXT unique not null,
  data_nascimento DATE 
);


-- Tabela: categoria

 	-- id_categoria (chave primária, autoincremento)
    -- nome (único, obrigatório)

create TABLE if not exists categoria(
  id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT unique not NULL
);


-- Tabela: produto

    -- id_produto (chave primária, autoincremento)
    -- nome (obrigatório)
    -- preco (obrigatório, maior que 0 - usar CHECK)
    -- percentual_desconto (padrão 0, obrigatório)
    -- validade_desconto (pode ser nulo)
    -- estoque (obrigatório, maior ou igual a 0 - usar CHECK)
    -- categoria_id (chave estrangeira, obrigatória)

create table if not EXISTS produto(
  id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT not null,
  preco REAL not null check(preco > 0),
  percentual_desconto REAL not null DEFAULT 0,
  validade_desconto TEXT,
  estoque INTEGER NOT NULL check(estoque >= 0),
  categoria_id INT not NULL,
  FOREIGN key (categoria_id) REFERENCES categoria(id_categoria)
);


-- Tabela: pedido

    -- id_pedido (chave primária, autoincremento)
    -- data_pedido (date, obrigatório)
    -- cliente_id (chave estrangeira, obrigatória, com ON DELETE CASCADE)

create table if not exists pedido(
  id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
  data_pedido DATE NOT NULL,
  cliente_id INT NOT NULL,
  FOREIGN key (cliente_id) references cliente(id_cliente) ON DELETE CASCADE
);


-- Tabela: item_pedido

    -- id_item (chave primária, autoincremento)
    -- quantidade (obrigatório, maior que 0 - usar CHECK)
    -- pedido_id (chave estrangeira, obrigatória, com ON DELETE CASCADE)
    -- produto_id (chave estrangeira, obrigatória)

create table if not exists item_pedido(
  id_item INTEGER PRIMARY key AUTOINCREMENT,
  quantidade INTEGER not null check(quantidade > 0),
  pedido_id INTEGER not NULL,
  produto_id INTEGER NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES pedido(id_pedido) ON DELETE CASCADE,
  FOREIGN KEY (produto_id) REFERENCES produto(id_produto)
);


-- Parte 2 – Manipulação de Dados (DML)
-- Regras:

    -- Insira pelo menos 5 clientes.
    -- Insira pelo menos 3 categorias.
    -- Insira pelo menos 10 produtos (alguns com desconto válido para os próximos dias e outros sem desconto).
    -- Crie pelo menos 4 pedidos diferentes, cada um com múltiplos produtos.
    -- Atualize os estoques conforme os pedidos realizados.

INSERT INTO cliente (nome, email, data_nascimento) VALUES
    ('João', 'joao.silva@gmail.com', '1990-01-01'),
    ('Maria', 'maria.santos@hotmail.com', '1991-02-02'),
    ('Pedro', 'pedro.ferreira@yahoo.com', '1992-03-03'),
    ('Ana', 'ana.gomes@outlook.com', '1993-06-04'),
    ('Lucas', 'lucas.rodrigues@domain.com', '1994-05-05');

insert into categoria (nome) VALUES
    ('Eletrônicos'),
    ('Roupas'),
    ('Alimentos');
    
INSERT INTO produto (nome, preco, percentual_desconto, validade_desconto, estoque, categoria_id) VALUES
    ('Celular', 1500.00, 0.0, NULL, 100, 1),
    ('Notebook', 3500.00, 0.15, '2025-06-25', 50, 1),
    ('Camiseta', 59.90, 0.2, '2025-06-20', 200, 2),
    ('Calça Jeans', 129.90, 0.25, NULL, 150, 2),
    ('Arroz 5kg', 22.90, 0.1, '2025-06-30', 300, 3),
    ('Feijão 1kg', 8.90, 0.0, NULL, 250, 3),
    ('TV LED 50"', 2199.00, 0.3, '2025-06-22', 30, 1),
    ('Tênis Esportivo', 199.90, 0.15, '2025-06-18', 80, 2),
    ('Azeite de Oliva', 19.90, 0.0, NULL, 120, 3),
    ('Fone de Ouvido', 129.90, 0.4, '2025-06-28', 60, 1);

INSERT INTO pedido (data_pedido, cliente_id) VALUES
    ('2025-06-01', 1),
    ('2025-06-02', 2),
    ('2025-06-03', 3),
    ('2025-06-04', 4);

INSERT INTO item_pedido (quantidade, pedido_id, produto_id) VALUES

    (1, 1, 1),
    (2, 1, 5),
    (3, 1, 7),
    
    (1, 2, 2),
    (1, 2, 9),
    
    (2, 3, 3),
    (1, 3, 4),
    (5, 3, 10),
    
    (1, 4, 6),
    (2, 4, 8);

UPDATE produto SET estoque = estoque - 1 WHERE id_produto = 1;
UPDATE produto SET estoque = estoque - 2 WHERE id_produto = 5;
UPDATE produto SET estoque = estoque - 3 WHERE id_produto = 7;
UPDATE produto SET estoque = estoque - 1 WHERE id_produto = 2;
UPDATE produto SET estoque = estoque - 1 WHERE id_produto = 9;
UPDATE produto SET estoque = estoque - 2 WHERE id_produto = 3;
UPDATE produto SET estoque = estoque - 1 WHERE id_produto = 4;
UPDATE produto SET estoque = estoque - 5 WHERE id_produto = 10;
UPDATE produto SET estoque = estoque - 1 WHERE id_produto = 6;
UPDATE produto SET estoque = estoque - 2 WHERE id_produto = 8;


-- Parte 3 – Consultas e Análises (DQL)
-- Consultas obrigatórias (use ordenação e limite onde for interessante):

    -- Liste todos os produtos, exibindo o nome, o preço (com alias preco_unitario) e o estoque.
    -- Exiba apenas os produtos com percentual de desconto maior que 0.2.
    -- Exiba os produtos cujo estoque está entre 50 e 200 unidades.
    -- Exiba os produtos cujo nome começa com a letra 'C' ou 'M'.
    -- Exiba os produtos ordenados do maior para o menor preço.
    -- Exiba os 5 produtos mais baratos.
    -- Calcule a média de preços de todos os produtos.
    -- Mostre o produto mais caro.
    -- Mostre o produto mais barato.
    -- Exiba os produtos com preço acima da média geral dos produtos.

-- Liste todos os produtos, exibindo o nome, o preço (com alias preco_unitario) e o estoque.
select nome, preco as "perco_unitario", estoque from produto;

-- Exiba apenas os produtos com percentual de desconto maior que 0.2.
SELECT * FROM produto WHERE percentual_desconto > 0.2;

-- Exiba os produtos cujo estoque está entre 50 e 200 unidades.
SELECT * from produto where estoque BETWEEN 50 and 200
order by estoque desc

-- Exiba os produtos cujo nome começa com a letra 'C' ou 'M'
SELECT * FROM produto 
WHERE nome LIKE 'C%' OR nome LIKE 'M%';

-- Exiba os produtos ordenados do maior para o menor preço
SELECT * FROM produto
ORDER BY preco DESC;

-- Exiba os 5 produtos mais baratos
SELECT * FROM produto
ORDER BY preco ASC
LIMIT 5;

-- Calcule a média de preços de todos os produtos
SELECT AVG(preco) AS media_precos FROM produto;

-- Mostre o produto mais caro
SELECT * FROM produto
ORDER BY preco DESC
LIMIT 1;

-- Mostre o produto mais barato
SELECT * FROM produto
ORDER BY preco ASC
LIMIT 1;

-- Exiba os produtos com preço acima da média geral dos produtos
SELECT * FROM produto
WHERE preco > (SELECT AVG(preco) FROM produto);

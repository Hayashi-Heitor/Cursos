-- Exemplo 01: Listar os vendedores com o endereço (nome, cidade, uf)

SELECT nome, cidade, uf
FROM vendedor
	JOIN endereco
    ON vendedor.id_vendedor = endereco.vendedor_id
    
-- Exemplo 02: Listar o nome completo dos vendedores dos estados SP, CE ou MG
select nome || ' ' || sobrenome AS "Nome completo", uf
FROM vendedor v
	join endereco e
    on v.id_vendedor = e.vendedor_id
WHERE uf in ('SP', 'CE', 'MG');

-- Exemplo 03: Listar o nome do produto, o nome completo do vendedor.
	-- Filtre os produtos dos vendedores que nasceram entre '1992-01-01' e '1995-01-01'
    -- Ordene pelo preço
    -- Limite a 5 resultados
SELECT p.nome, v.nome || ' ' || v.sobrenome as "Vendedor"
FROM produto p
	join vendedor v
    on p.vendedor_id = v.id_vendedor
where data_nascimento BETWEEN '1992-01-01' and '1995-01-01'
order by preco
limit 5;

-- Exemplo 04: Listar os produtos em que o vendedor mora na uf CE
-- Exibir o nome do produto, o nome do vendedor, o email do vendedor
-- Ordenar pelo nome do produto
SELECT p.nome, v.nome as vendedor, v.email
from produto p
	join vendedor v
    on p.vendedor_id = v.id_vendedor
    join endereco e
    on e.vendedor_id = v.id_vendedor
WHERE e.uf = 'CE'
ORDER by p.nome

-- Exemplo 05: Listar o nome do produto, o preço, a categoria, o nome do vendedor, o email, a cidade e uf numa única consulta.
select p.nome, p.preco, c.nome as categoria, v.nome as vendedor, v.email, e.cidade, e.uf
from produto p
	join vendedor v
    on p.vendedor_id = v.id_vendedor
    join endereco e
    on e.vendedor_id = v.id_vendedor
    join categoria c
    on p.categoria_id = c.id_categoria

-- Criando uma tabela caso ela não exista
create table IF NOT EXISTS usuarios (
  id INTEGER PRIMARY KEY AUTOINCREMENT, -- Chave primária (identificador)
  nome TEXT NOT NULL, -- Coluna obrigatória
  email TEXT UNIQUE, -- Campo único
  idade INTEGER
 );
 
-- Tipos: INTEGER, REAL, TEXT, BLOB = binary large object, NULL
-- Restrições de coluna: NOT NULL, UNIQUE, DEFAULT, PRIMARY KEY, CHECK, FOREIGN KEY

-- Exercício 01: Crie uma tabela funcionario:
	-- id, nome, email, salario, cargo
CREATE TABLE IF NOT EXISTS funcionarios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT NOT NULL,
  email TEXT UNIQUE,
  salario REAL NOT NULL,
  cargo TEXT NOT NULL
);

-- DEAFAULT
CREATE TABLE if not EXISTS pedido (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  status TEXT DEFAULT 'Pendente' -- Valor padrão se não preenchido
);

-- CHECK
create table if not exists alunos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT not NULL check(length(nome) > 1), -- Só insere se o nome tiver mais de uma letra
  idade INTEGER NOT NULL check(idade > 0) -- Só insere se a idade for maior que 0
);

-- Exercício 02: Crie uma tabela chamada 'veiculos'.
	-- id, 
    -- placa (unica, obrigatorio)
    -- modelo (obrigatorio)
    -- ano (a partir de 2000)
    -- status (padrão 'Disponível')
create table if not exists veiculos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  placa INTEGER UNIQUE NOT NULL,
  modelo TEXT NOT NULL,
  ano INTEGER check(ano >= 2000),
  status TEXT DEFAULT 'Dispoível'
);

-- Deletar tabelas
drop table if exists alunos;
drop table if exists funcionarios;
drop table if exists pedido;
drop table if exists usuarios;
drop table if exists veiculos;

-- Exercício 03: Cliente-Conta (1:N)
	-- Cliente (id, nome)
    -- Conta (id, saldo, cliente_id)
CREATE TABLE if not exists cliente(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT not NULL 
);

CREATE TABLE IF NOT EXISTS conta(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  saldo REAL NOT NULL DEFAULT 0.0,
  cliente_id INTEGER not NULL,
  FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- Modificar tabelas
ALTER TABLE conta
  add COLUMN status TEXT DEFAULT 'Ativa';

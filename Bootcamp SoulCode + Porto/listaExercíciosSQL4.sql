-- 1. Crie as seguintes tabelas e faça o que está sendo solicitado:
-- Pense nas cardinalidades e relacionamentos que estas tabelas podem possuir e crie o DDL com base nisso.

PRAGMA foreign_keys = on

-- Aluno
    -- no5me, email, data_nascimento
create table if not exists aluno(
  id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT NOT NULL,
  email TEXT UNIQUE,
  data_nascimento INTEGER 
);

-- Curso
    -- nome, duracao_meses, preco
create table if not exists curso(
  id_curso INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT not NULL,
  duracao_meses INTEGER NOT NULL,
  preco REAL DEFAULT 0.0
);

-- Matricula (associa aluno e o curso)
    -- data_matricula
create table if not exists matricula(
  id_matricula INTEGER PRIMARY KEY AUTOINCREMENT,
  data_matricula TEXT NOT NULL,
  curso_id INTEGER,
  aluno_id INTEGER,
  FOREIGN kEY (curso_id) REFERENCES curso(id_curso),
  FOREIGN KEY (aluno_id) REFERENCES aluno(id_aluno)
);

-- Pagamento (se associa a matrícula)
    -- valor_pago, data_pagamento
CREATE TABLE if not exists pagamento(
  id_pagamento INTEGER PRIMARY key AUTOINCREMENT,
  valor_pago REAL NOT NULL,
  data_pagamento TEXT DEFAULT (date('now')),
  matricula_id INTEGER,
  FOREIGN key (matricula_id) REFERENCES matricula(id_matricula)
);


-- ### INSERÇÕES ###
INSERT INTO aluno (nome, email, data_nascimento) VALUES 
('João Silva', 'joao.silva@email.com', '1990-05-15'),
('Maria Oliveira', 'maria.oliveira@email.com', '1992-08-22'),
('Carlos Souza', 'carlos.souza@email.com', '1988-11-30'),
('Ana Costa', 'ana.costa@email.com', '1995-03-10'),
('Pedro Santos', 'pedro.santos@email.com', '1993-07-18');

INSERT INTO curso (nome, duracao_meses, preco) VALUES 
('Programação Python', 6, 1200.00),
('Desenvolvimento Web', 8, 1500.00),
('Data Science', 10, 2000.00),
('Banco de Dados SQL', 4, 800.00),
('Machine Learning', 12, 2500.00),
('Computaria', 13, 2500.00);

INSERT INTO matricula (data_matricula, curso_id, aluno_id) VALUES 
('2024-01-10', 1, 1),
('2024-01-15', 2, 2),
('2024-02-05', 3, 3),
('2025-02-20', 4, 4),
('2025-03-01', 5, 5),
('2025-03-10', 1, 2),
('2025-03-15', 2, 3),
('2024-04-01', 3, 4),
('2024-04-10', 4, 5),
('2024-04-15', 5, 1);

INSERT INTO pagamento (valor_pago, data_pagamento, matricula_id) VALUES 
(1200.00, '2023-01-10', 1),
(750.00, '2023-01-15', 2),
(750.00, '2023-02-15', 2),
(1000.00, '2023-02-05', 3),
(1000.00, '2023-03-05', 3),
(800.00, '2024-02-20', 4),
(1250.00, '2023-03-01', 5),
(1250.00, '2023-04-01', 5),
(600.00, '2023-03-10', 6),
(600.00, '2023-04-10', 6),
(750.00, '2023-03-15', 7),
(750.00, '2023-04-15', 7),
(1000.00, '2023-04-01', 8),
(400.00, '2023-04-10', 9),
(400.00, '2023-05-10', 9),
(1250.00, '2023-04-15', 10);


-- 2. Consultas:

-- Liste o nome e a data de nascimento de todos os alunos.
-- Renomeie as colunas com alias (aluno_nome e nascimento).
select nome as aluno_nome, data_nascimento as nascimento
from aluno
    
-- Liste os cursos com duração maior ou igual a 6 meses.
SELECT *
from curso
where duracao_meses > 6

-- Encontre os alunos que possuem e-mail cadastrado.
select *
from alunos
where email is not NULL

-- Liste as matrículas realizadas entre 2024-01-01 e 2024-02-28.
SELECT *
FROM matricula
where data_matricula BETWEEN '2024-01-01' and '2024-02-28'

-- Mostre os cursos cujo nome contém a palavra 'ática' ou termina com 'ria'.
SELECT *
from curso
WHERE nome like('%ática%') or nome like('%ria')

-- Exiba o nome dos alunos e a data em que se matricularam.
SELECT nome, data_matricula
from aluno a
	join matricula m
    on a.id_aluno = m.aluno_id
    
-- Liste o nome do curso, o nome do aluno e o preço do curso.
SELECT c.nome as curso, a.nome as aluno, preco
from aluno a
	join matricula m
    on a.id_aluno = m.aluno_id
    join curso c
    on c.id_curso = m.curso_id

-- Liste o nome do aluno, o curso no qual ele está matriculado,
-- o valor efetivamente pago e a data do pagamento.
SELECT a.nome as aluno, c.nome as curso, valor_pago, data_pagamento
from aluno a
	join matricula m
    on a.id_aluno = m.aluno_id
    join pagamento p
    on m.id_matricula = p.matricula_id
    join curso c
    on c.id_curso = m.curso_id

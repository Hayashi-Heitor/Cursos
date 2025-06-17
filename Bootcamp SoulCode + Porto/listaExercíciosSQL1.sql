-- 1. Crie a tabela "clientes" com os campos:
    -- id (chave primária)
    -- nome (obrigatório e único)
    -- email (obrigatório e único)
    -- data_cadastro (data e hora por padrão)

CREATE TABLE if not EXISTS clientes(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT UNIQUE NOT NULL,
  email TEXT UNIQUE NOT NULL,
  data_cadastro TEXT DEFAULT (DATETIME('now'))
);

-- 2. Crie a tabela "eventos"
    -- id (chave primária)
    -- descricao (obrigatorio)
    -- data_evento (obrigatório)
    -- cliente_id (chave estrangeira para "clientes")
    -- status (padrão 'Agendado')

CREATE TABLE if not EXISTS eventos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  descricao TEXT NOT NULL,
  data_evento TEXT NOT NULL,
  cliente_id INTEGER NOT NULL,
  status TEXT DEFAULT 'Agendado',
  FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- Use "ALTER TABLE" para:
   -- Adicionar uma coluna "tipo_evento" na tabela "eventos" com valor padrão 'Presencial'.
  
ALTER TABLE eventos
  add COLUMN tipo_evendo TEXT DEFAULT 'Presencial'

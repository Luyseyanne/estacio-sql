import sqlite3

# Conectar ao banco de dados (ou criar um novo)
conn = sqlite3.connect('associacao.db')
cursor = conn.cursor()

# Criar a tabela de membros
cursor.execute('''
CREATE TABLE IF NOT EXISTS membros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    telefone TEXT,
    data_admissao DATE
)
''')

# Criar a tabela de atividades
cursor.execute('''
CREATE TABLE IF NOT EXISTS atividades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    data_atividade DATE
)
''')

# Criar a tabela de registros de eventos
cursor.execute('''
CREATE TABLE IF NOT EXISTS eventos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_membro INTEGER,
    id_atividade INTEGER,
    data_evento DATE,
    FOREIGN KEY (id_membro) REFERENCES membros(id),
    FOREIGN KEY (id_atividade) REFERENCES atividades(id)
)
''')

# Commit e fechar a conexão
conn.commit()
conn.close()

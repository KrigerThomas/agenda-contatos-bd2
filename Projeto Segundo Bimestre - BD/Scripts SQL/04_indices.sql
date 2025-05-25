-- Index primeira consulta:

CREATE INDEX idx_usuarios_data_nome ON usuario(data_nascimento, nome_completo);

-- Index segunda consulta:

CREATE INDEX idx_usuarios_ano_nascimento ON usuario(data_nascimento);

-- Index terceira consulta:

CREATE INDEX idx_usuarios_email_data ON usuario(email, data_nascimento);

-- Index quarta consulta:

CREATE INDEX idx_usuarios_faixa_id ON usuario(id_usuario);

-- Index quinta consulta:

CREATE INDEX idx_usuarios_email ON usuario(email);

-- Índices para joins
CREATE INDEX idx_contato_usuario ON contato(Usuario_idUsuario);
CREATE INDEX idx_telefone_contato ON telefone(id_contato);
CREATE INDEX idx_endereco_contato ON endereco(id_contato);
CREATE INDEX idx_contato_categoria_contato ON contato_categoria(id_contato);
CREATE INDEX idx_contato_categoria_categoria ON contato_categoria(id_categoria);

-- Outros Index:

CREATE INDEX idx_usuario_data_email 
ON usuario (data_nascimento, email);

CREATE INDEX idx_usuario_data_nascimento ON usuario (data_nascimento);
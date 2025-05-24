-- Index primeira consulta:

CREATE INDEX idx_usuarios_data_nome ON usuario(data_nascimento, nome_completo);

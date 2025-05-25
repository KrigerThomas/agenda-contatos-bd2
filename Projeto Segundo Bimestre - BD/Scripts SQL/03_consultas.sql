SELECT * FROM USUARIO;

-- Consultas_Simples_Heitor

-- Consulta 1:

SELECT * FROM usuario 
WHERE data_nascimento > '2000-01-01' 
AND nome_completo LIKE 'Usuario 9%';

-- Consulta 2:

SELECT YEAR(data_nascimento) as ano, COUNT(*) as total
FROM usuario
GROUP BY YEAR(data_nascimento)
HAVING COUNT(*) > 5000;

-- Consulta 3: (Muito rápida)

SELECT * FROM usuario
WHERE email LIKE 'usuario888%'
ORDER BY data_nascimento;

-- Consulta 4: 

SELECT nome_completo, email 
FROM usuario
WHERE id_usuario BETWEEN 100000 AND 200000;

-- Consulta 5:

SELECT id_usuario, nome_completo 
FROM usuario
WHERE email LIKE '%9999%';

-- Consultas Complexas - Gustavo

-- Consulta 1
CREATE VIEW vw_contatos_favoritos_completos AS
SELECT 
    u.id_usuario,
    u.nome_completo AS nome_usuario,
    u.email,
    c.id_contato,
    c.data_criacao,
    t.numero AS telefone,
    t.tipo AS tipo_telefone,
    e.rua,
    e.numero AS numero_endereco,
    e.complemento,
    e.bairro,
    e.cidade,
    e.estado,
    e.cep,
    GROUP_CONCAT(cat.nome_categoria SEPARATOR ', ') AS categorias
FROM contato c
JOIN usuario u ON u.id_usuario = c.Usuario_idUsuario
LEFT JOIN telefone t ON t.id_contato = c.id_contato
LEFT JOIN endereco e ON e.id_contato = c.id_contato
LEFT JOIN contato_categoria cc ON cc.id_contato = c.id_contato
LEFT JOIN categoria cat ON cat.id_categoria = cc.id_categoria
WHERE c.favorito = TRUE
GROUP BY 
    u.id_usuario, u.nome_completo, u.email,
    c.id_contato, c.data_criacao,
    t.numero, t.tipo,
    e.rua, e.numero, e.complemento, e.bairro, e.cidade, e.estado, e.cep;

SELECT *
FROM vw_contatos_favoritos_completos;

-- Consulta 2

SELECT 
    id_usuario,
    nome_completo,
    email,
    LOWER(email) AS email_lower,
    FLOOR(DATEDIFF(CURDATE(), data_nascimento) / 365.25) AS idade,
    (SELECT COUNT(*) FROM contato c WHERE c.usuario_idusuario = u.id_usuario) AS total_contatos
FROM usuario u
WHERE YEAR(data_nascimento) BETWEEN 1970 AND 2005
  AND LOWER(email) LIKE '%@exemplo.com'
ORDER BY idade DESC, CHAR_LENGTH(nome_completo) DESC;



-- Consulta 3

SELECT 
    id_usuario, 
    nome_completo, 
    email, 
    DATE_FORMAT(data_nascimento, '%W, %M %Y') AS data_formatada,
    (SELECT COUNT(*) FROM contato c WHERE c.usuario_idusuario = u.id_usuario) AS total_contatos
FROM usuario u
WHERE LOWER(email) LIKE '%@exemplo.com'
  AND MONTH(data_nascimento) IN (1, 2, 3, 4, 5, 6)
ORDER BY total_contatos DESC, data_formatada;






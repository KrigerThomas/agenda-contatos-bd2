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

-- Consultas Complexas 

SELECT id_usuario, nome_completo, email,
	DATE_FORMAT(data_nascimento, '%Y') AS ano_nascimento,
    FLOOR(DATEDIFF(CURDATE(), data_nascimento) / 365.25) AS idade
FROM usuario
WHERE email LIKE '%@exemplo.com'
  AND MONTH(data_nascimento) = 5
ORDER BY idade DESC;



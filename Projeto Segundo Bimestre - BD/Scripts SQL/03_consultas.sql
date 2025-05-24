-- Consulta 1 

SELECT * FROM usuario 
WHERE data_nascimento > '2000-01-01' 
AND nome_completo LIKE 'Usuario 9%';

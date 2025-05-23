-- Exemplo de Stored Procedures para popular o banco 

-- Stored Procedure tabela Usuario 
DELIMITER $$

CREATE PROCEDURE povoar_usuarios(IN num_usuarios INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= num_usuarios DO
        INSERT INTO usuario (nome_completo, email, data_nascimento)
        VALUES (
            CONCAT('Usuário ', i),
            CONCAT('usuario', i, '@exemplo.com'),
            DATE_SUB(CURDATE(), INTERVAL (18 + MOD(i, 30)) YEAR)
        );
        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

CALL povoar_usuarios(200);

SELECT * 
FROM Usuario;

-- Stored procedure tabele contato
DELIMITER $$

CREATE PROCEDURE povoar_contato(IN num_contatos INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= num_contatos DO
        INSERT INTO contato (favorito, Usuario_idUsuario)
        VALUES (
            ROUND(RAND()),
            (SELECT id_usuario FROM usuario ORDER BY RAND() LIMIT 1)
        );
        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

CALL povoar_contato(300);

SELECT * 
FROM Contato;

-- Stored procedure tabele telefone
DELIMITER $$

CREATE PROCEDURE povoar_telefone(IN num_telefones INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= num_telefones DO
        INSERT INTO telefone (id_contato, numero, tipo)
        VALUES (
            (SELECT id_contato FROM contato ORDER BY RAND() LIMIT 1),
            CONCAT('(27) 9', LPAD(FLOOR(RAND() * 100000000), 8, '0')),
            ELT(FLOOR((RAND() * 4) + 1), 'celular', 'fixo', 'trabalho', 'outro')
        );
        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

CALL povoar_telefone(350);

SELECT * 
FROM telefone;
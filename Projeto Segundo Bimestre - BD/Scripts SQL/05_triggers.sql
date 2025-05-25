-- Parte 1: Função UDF
DELIMITER $$

CREATE FUNCTION verificar_maioridade(data_nascimento DATE)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE idade INT;
    
    -- Checa se data_nascimento é NULL ou '0000-00-00'
    IF data_nascimento IS NULL OR data_nascimento = '0000-00-00' THEN
        RETURN FALSE;
    END IF;

    SET idade = FLOOR(DATEDIFF(CURDATE(), data_nascimento) / 365.25);
    RETURN idade >= 18;
END $$

DELIMITER ;


-- Parte 2: Tabela de Log
CREATE TABLE IF NOT EXISTS log_insercao_contato (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_contato INT NOT NULL,
    data_insercao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mensagem VARCHAR(255)
);

-- Parte 3: Trigger
DELIMITER $$

CREATE TRIGGER trigger_insercao_contato
AFTER INSERT ON contato
FOR EACH ROW
BEGIN
    INSERT INTO log_insercao_contato (id_contato, mensagem)
    VALUES (NEW.id_contato, CONCAT('Contato inserido com ID: ', NEW.id_contato));
END $$

DELIMITER ;

SELECT id_usuario, nome_completo, verificar_maioridade(data_nascimento) AS maior
FROM usuario;

INSERT INTO contato (favorito, usuario_idusuario) VALUES (FALSE, 1);

SELECT * FROM log_insercao_contato;


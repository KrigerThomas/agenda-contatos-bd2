CREATE DATABASE IF NOT EXISTS agenda_contatos;

USE agenda_contatos;


CREATE TABLE IF NOT EXISTS usuario (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nome_completo VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
data_nascimento DATE 
);

CREATE TABLE IF NOT EXISTS contato (
    id_contato INT AUTO_INCREMENT,
    favorito BOOLEAN NOT NULL DEFAULT FALSE,
    data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Usuario_idUsuario INT,
    PRIMARY KEY(id_contato, Usuario_idUsuario),
    FOREIGN KEY (Usuario_idUsuario) REFERENCES Usuario (id_usuario)
);

CREATE TABLE IF NOT EXISTS telefone (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    id_contato INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    tipo ENUM('celular', 'fixo', 'trabalho', 'outro') NOT NULL,
    FOREIGN KEY (id_contato) REFERENCES contato(id_contato)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_contato INT NOT NULL,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(9) NOT NULL,
    FOREIGN KEY (id_contato) REFERENCES contato(id_contato)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS contato_categoria (
    id_contato INT NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_contato, id_categoria),
    FOREIGN KEY (id_contato) REFERENCES contato(id_contato)
        ON DELETE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
        ON DELETE CASCADE
);

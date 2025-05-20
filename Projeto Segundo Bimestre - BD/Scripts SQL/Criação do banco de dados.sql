-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS agenda_contatos;
USE agenda_contatos;

-- Tabela: contato
CREATE TABLE contato (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_nascimento DATE,
    favorito BOOLEAN NOT NULL DEFAULT FALSE,
    data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabela: telefone
CREATE TABLE telefone (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    id_contato INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    tipo ENUM('celular', 'fixo', 'trabalho', 'outro') NOT NULL,
    FOREIGN KEY (id_contato) REFERENCES contato(id_contato)
        ON DELETE CASCADE
);

-- Tabela: endereco
CREATE TABLE endereco (
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

-- Tabela: categoria
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL UNIQUE
);

-- Tabela: contato_categoria (relacionamento N:N)
CREATE TABLE contato_categoria (
    id_contato INT NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_contato, id_categoria),
    FOREIGN KEY (id_contato) REFERENCES contato(id_contato)
        ON DELETE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
        ON DELETE CASCADE
);

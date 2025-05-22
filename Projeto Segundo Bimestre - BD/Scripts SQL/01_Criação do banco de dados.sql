-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS agenda_contatos;
USE agenda_contatos;

-- Tabela base: contato
CREATE TABLE contato (
    id_contato INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tipo ENUM('F', 'J') NOT NULL COMMENT 'F = Pessoa Física, J = Pessoa Jurídica',
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    PRIMARY KEY (id_contato)
);

-- Pessoa Física
CREATE TABLE pessoa_fisica (
    id_contato INT UNSIGNED NOT NULL,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    PRIMARY KEY (id_contato),
    FOREIGN KEY (id_contato) REFERENCES contato(id_contato) ON DELETE CASCADE
);

-- Pessoa Jurídica
CREATE TABLE pessoa_juridica (
    id_contato INT UNSIGNED NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    nome_fantasia VARCHAR(100),
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    data_abertura DATE,
    PRIMARY KEY (id_contato),
    FOREIGN KEY (id_contato) REFERENCES contato(id_contato) ON DELETE CASCADE
);

-- Endereço
CREATE TABLE endereco (
    id_endereco INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_contato INT UNSIGNED NOT NULL,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(9) NOT NULL,
    PRIMARY KEY (id_endereco),
    FOREIGN KEY (id_contato) REFERENCES contato(id_contato) ON DELETE CASCADE
);

-- Categoria
CREATE TABLE categoria (
    id_categoria INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (id_categoria)
);

-- Contato-Categoria (N:N)
CREATE TABLE contato_categoria (
    id_contato INT UNSIGNED NOT NULL,
    id_categoria INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_contato, id_categoria),
    FOREIGN KEY (id_contato) REFERENCES contato(id_contato) ON DELETE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON DELETE CASCADE
);

-- Responsável (pessoa física que representa uma empresa)
CREATE TABLE funcionario (
    id_funcionario INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_contato_fisico INT UNSIGNED NOT NULL,
    id_empresa INT UNSIGNED NOT NULL,
    funcao VARCHAR(50),
    inicio_vinculo DATE NOT NULL,
    fim_vinculo DATE,
    PRIMARY KEY (id_responsavel),
    FOREIGN KEY (id_contato_fisico) REFERENCES pessoa_fisica(id_contato) ON DELETE CASCADE,
    FOREIGN KEY (id_empresa) REFERENCES pessoa_juridica(id_contato) ON DELETE CASCADE
);

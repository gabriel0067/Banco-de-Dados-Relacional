-- Criar banco de dados bd_sistema_bancario

CREATE DATABASE bd_sistema_bancario;

-- Criar 5 tabelas quaisquer

CREATE TABLE nome(id int, nomes varchar);
CREATE TABLE telefone(numero int, ddd int);
CREATE TABLE cidade(estado varchar, pais varchar);
CREATE TABLE email(ende varchar);
CREATE TABLE cep(id int);

-- Criar tabelas conforme MER (Sistema Bancario):

CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15)
);

CREATE TABLE conta (
    id_conta SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES cliente(id_cliente),
    tipo_conta VARCHAR(50) NOT NULL,
    saldo NUMERIC(10, 2) NOT NULL DEFAULT 0.00
);

CREATE TABLE transacao (
    id_transacao SERIAL PRIMARY KEY,
    id_conta INT REFERENCES conta(id_conta),
    tipo_transacao VARCHAR(50) NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE agencia (
    id_agencia SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255)
);

CREATE TABLE funcionario (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    id_agencia INT REFERENCES agencia(id_agencia)
);



-- Deletar as 5 tabelas criadas aleatoriamente

DROP TABLE IF EXISTS nome;
DROP TABLE IF EXISTS telefone;
DROP TABLE IF EXISTS cidade;
DROP TABLE IF EXISTS email;
DROP TABLE IF EXISTS cep;


-- alterar as tabelas conforme o MER atualizado

ALTER TABLE cliente ADD COLUMN email VARCHAR(255);
ALTER TABLE conta ADD COLUMN data_abertura DATE;
ALTER TABLE transacao ADD COLUMN descricao VARCHAR(255);


-- Criar um esquema com o seu nome

CREATE SCHEMA seunome;


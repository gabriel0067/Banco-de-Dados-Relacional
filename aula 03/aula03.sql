-- criar banco de dados bd_aula03
CREATE DATABASE bd_aula03


-- criar tabelas do MER 
CREATE TABLE tbl_cliente (
	codigo_cliente integer PRIMARY KEY,
	Nome text NOT NULL,
	Cidade text,
	Endereço text
);

CREATE TABLE tbl_emprestimo (
	numero_emprestimo integer PRIMARY KEY,
	codigo_cliente integer,
	codigo_livro integer
);

CREATE TABLE tbl_titulo (
	codigo_titulo integer PRIMARY KEY,
	Titulo text NOT NULL,
	Descricao text,
	Categoria text
);

CREATE TABLE tbl_livros (
	codigo_livro integer PRIMARY KEY,
	codigo_titulo integer,
	status text
);


-- criar domains
create domain chk_status text check(value in ('DISPONIVEL','ALUGADO'));
create domain chk_categoria text check(value in ('DRAMA','COMEDIA'));


-- adicionar domain a tabela
ALTER TABLE tbl_titulo ALTER COLUMN categoria TYPE chk_categoria;
ALTER TABLE tbl_livros ALTER COLUMN status TYPE chk_status;


-- adicionar chaves estrangeiras
ALTER TABLE tbl_emprestimo ADD CONSTRAINT fk_codigo_cliente FOREIGN KEY (codigo_cliente) REFERENCES tbl_cliente(codigo_cliente);
ALTER TABLE tbl_emprestimo ADD CONSTRAINT fk_codigo_livro FOREIGN KEY (codigo_livro) REFERENCES tbl_livros(codigo_livro);
ALTER TABLE tbl_livros ADD CONSTRAINT fk_codigo_titulo FOREIGN KEY (codigo_titulo) REFERENCES tbl_titulo(codigo_titulo);




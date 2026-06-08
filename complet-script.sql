-----------------------------------ativ1
DROP TABLE IF EXISTS Livro;
CREATE TABLE Livro (
titulo VARCHAR(200) NOT NULL,
lancamento DATE,
idioma CHAR(2),
isbn VARCHAR(13) UNIQUE,
capa BLOB );
-----------------------------------ativ2
ALTER TABLE Projeto
ADD id_projeto INTEGER PRIMARY KEY;
ALTER TABLE Projeto
ADD id_gerente INT;
ALTER TABLE Projeto
ADD CONSTRAINT fk_projeto_gerente FOREIGN KEY (id_gerente) REFERENCES Gerente(id);
-----------------------------------ativ3
DROP TABLE IF EXISTS Colaborador;

CREATE TABLE Colaborador (
nome VARCHAR(200) NOT NULL,
nascimento DATE,
sexo CHAR(1),
cpf VARCHAR(11) UNIQUE,
foto BLOB
);
-----------------------------------ativ4
ALTER TABLE Vendas
ADD id_venda INT PRIMARY KEY AUTO_INCREMENT;

ALTER TABLE Vendas
ADD id_produto INT;

ALTER TABLE Vendas
ADD CONSTRAINT fk_vendas_produtos FOREIGN KEY (id_produto) REFERENCES produtos(codigo);
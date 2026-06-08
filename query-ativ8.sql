use SupermercadoDB;

SELECT * FROM Clientes;

SELECT nome, telefone FROM Clientes;

SELECT * FROM Produtos;

SELECT nome, preco FROM Produtos;

SELECT * FROM Funcionarios;

SELECT nome, cargo FROM Funcionarios;

SELECT * FROM Vendas;

SELECT data, total FROM Compras;

SELECT descricao, preco FROM Produtos;

SELECT * FROM Filiais;

SELECT nome, quantidade_estoque FROM Produtos;

SELECT * FROM Clientes WHERE pontos_fidelidade > 100;

SELECT * FROM Produtos WHERE preco > 50;

SELECT * FROM Funcionarios WHERE salario > 3000;

SELECT * FROM Produtos WHERE quantidade_estoque < 10;

SELECT * FROM Compras WHERE data = '2025-01-10';

SELECT * FROM Clientes WHERE telefone IS NOT NULL;

SELECT * FROM Funcionarios WHERE cargo = 'Caixa';

SELECT * FROM Produtos WHERE id_filial = 1;

SELECT * FROM Vendas WHERE total > 500;

SELECT * FROM Fornecedores WHERE nome = 'Distribuidora Alfa';

SELECT * FROM Produtos ORDER BY nome ASC;

SELECT * FROM Produtos ORDER BY preco DESC;

SELECT * FROM Clientes ORDER BY pontos_fidelidade ASC;

SELECT * FROM Funcionarios ORDER BY salario DESC;

SELECT * FROM Vendas ORDER BY data DESC;

SELECT * FROM Compras ORDER BY total DESC;

SELECT * FROM Produtos ORDER BY quantidade_estoque ASC;

SELECT * FROM Fornecedores ORDER BY nome ASC;

SELECT * FROM Filiais ORDER BY endereco ASC;

SELECT * FROM Funcionarios ORDER BY cargo, nome;

SELECT * FROM Produtos ORDER BY categoria, preco DESC;

SELECT id_categoria, COUNT(*) FROM Produtos GROUP BY id_categoria;

SELECT id_filial, SUM(total) FROM Vendas GROUP BY id_filial;

SELECT id_filial, COUNT(*) FROM Funcionarios GROUP BY id_filial;

SELECT id_fornecedor, SUM(total) FROM Compras GROUP BY id_fornecedor;

SELECT cargo, AVG(salario) FROM Funcionarios GROUP BY cargo;

SELECT id_funcionario, COUNT(*) FROM Vendas GROUP BY id_funcionario;

SELECT id_fornecedor, COUNT(*) FROM Produtos GROUP BY id_fornecedor;

SELECT endereco, SUM(pontos_fidelidade) FROM Clientes GROUP BY endereco;

SELECT id_filial, COUNT(*) FROM Compras GROUP BY id_filial;

SELECT id_categoria, SUM(quantidade_estoque) FROM Produtos GROUP BY id_categoria;

SELECT cargo, MAX(salario) FROM Funcionarios GROUP BY cargo;

SELECT id_categoria, COUNT(*) FROM Produtos GROUP BY id_categoria HAVING COUNT(*) > 5;

SELECT id_filial, SUM(total) FROM Vendas GROUP BY id_filial HAVING SUM(total) > 10000;

SELECT cargo, AVG(salario) FROM Funcionarios GROUP BY cargo HAVING AVG(salario) > 3000;

SELECT id_fornecedor, COUNT(*) FROM Produtos GROUP BY id_fornecedor HAVING COUNT(*) > 10;

SELECT id_funcionario, COUNT(*) FROM Vendas GROUP BY id_funcionario HAVING COUNT(*) > 20;

SELECT id_filial, COUNT(*) FROM Funcionarios GROUP BY id_filial HAVING COUNT(*) > 3;

SELECT id_categoria, SUM(quantidade_estoque) FROM Produtos GROUP BY id_categoria HAVING SUM(quantidade_estoque) > 500;

SELECT id_fornecedor, SUM(total) FROM Compras GROUP BY id_fornecedor HAVING SUM(total) > 5000;

SELECT data, COUNT(*) FROM Vendas GROUP BY data HAVING COUNT(*) > 10;

SELECT endereco, SUM(pontos_fidelidade) FROM Clientes GROUP BY endereco HAVING SUM(pontos_fidelidade) > 200;

SELECT cargo, MAX(salario) FROM Funcionarios GROUP BY cargo HAVING MAX(salario) > 7000;

SELECT p.nome, c.nome
FROM Produtos p
JOIN Categorias c ON p.id_categoria = c.id_categoria;

SELECT p.nome, f.nome
FROM Produtos p
JOIN Fornecedores f ON p.id_fornecedor = f.id_fornecedor;

SELECT f.nome, fi.nome
FROM Funcionarios f
JOIN Filiais fi ON f.id_filial = fi.id_filial;

SELECT v.id_venda, v.data, c.nome
FROM Vendas v
JOIN Clientes c ON v.id_cliente = c.id_cliente;

SELECT c.id_compra, c.data, f.nome
FROM Compras c
JOIN Fornecedores f ON c.id_fornecedor = f.id_fornecedor;

SELECT iv.id_venda, p.nome, iv.quantidade, iv.subtotal
FROM ItensVenda iv
JOIN Produtos p ON iv.id_produto = p.id_produto;

SELECT p.nome, f.nome
FROM Produtos p
JOIN Filiais f ON p.id_filial = f.id_filial;

SELECT v.id_venda, f.nome
FROM Vendas v
JOIN Funcionarios f ON v.id_funcionario = f.id_funcionario;

SELECT c.id_compra, fi.nome, c.total
FROM Compras c
JOIN Filiais fi ON c.id_filial = fi.id_filial;

SELECT c.nome, v.id_venda, v.total
FROM Clientes c
JOIN Vendas v ON c.id_cliente = v.id_cliente;

SELECT v.id_venda, c.nome, f.nome, fi.nome, v.total
FROM Vendas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
JOIN Funcionarios f ON v.id_funcionario = f.id_funcionario
JOIN Filiais fi ON v.id_filial = fi.id_filial;

ALTER TABLE Clientes
RENAME TO ClientesVIP;

ALTER TABLE Produtos
ADD marca VARCHAR(50);

ALTER TABLE Produtos
DROP COLUMN marca;

ALTER TABLE Clientes
MODIFY telefone VARCHAR(20);

ALTER TABLE Funcionarios
RENAME COLUMN cargo TO funcao;

ALTER TABLE Produtos
MODIFY nome VARCHAR(200);

ALTER TABLE Clientes
MODIFY nome VARCHAR(100) NOT NULL;

ALTER TABLE Clientes
MODIFY endereco VARCHAR(200) NULL;

ALTER TABLE Clientes
MODIFY pontos_fidelidade INT DEFAULT 0;

ALTER TABLE Vendas
MODIFY id_venda BIGINT;

ALTER TABLE Fornecedores
ADD PRIMARY KEY(id_fornecedor);

ALTER TABLE Fornecedores
DROP PRIMARY KEY;

ALTER TABLE ItensVenda
ADD PRIMARY KEY(id_venda, id_produto);

ALTER TABLE Clientes
DROP PRIMARY KEY;

ALTER TABLE Clientes
ADD PRIMARY KEY(id_cliente);

ALTER TABLE Produtos
MODIFY id_produto INT AUTO_INCREMENT;

ALTER TABLE Produtos
ADD CONSTRAINT fk_categoria
FOREIGN KEY(id_categoria)
REFERENCES Categorias(id_categoria);

ALTER TABLE Produtos
DROP FOREIGN KEY fk_categoria;

ALTER TABLE Vendas
ADD CONSTRAINT fk_cliente
FOREIGN KEY(id_cliente)
REFERENCES Clientes(id_cliente);

ALTER TABLE ItensVenda
ADD CONSTRAINT fk_venda
FOREIGN KEY(id_venda)
REFERENCES Vendas(id_venda)
ON DELETE CASCADE;

ALTER TABLE Produtos
ADD CONSTRAINT fk_fornecedor
FOREIGN KEY(id_fornecedor)
REFERENCES Fornecedores(id_fornecedor)
ON UPDATE CASCADE;

ALTER TABLE Clientes
ADD CONSTRAINT unique_email UNIQUE(email);

ALTER TABLE Clientes
DROP INDEX unique_email;

ALTER TABLE Produtos
ADD CONSTRAINT chk_preco
CHECK(preco >= 0);

ALTER TABLE Clientes
ALTER pontos_fidelidade
SET DEFAULT 0;

ALTER TABLE Funcionarios
MODIFY salario DECIMAL(10,2) NOT NULL;
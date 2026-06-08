USE SupermercadoDB;
INSERT INTO Categorias (nome) VALUES
('Bebidas'),
('Higiene Pessoal'),
('Alimentos'),
('Produtos de Limpeza'),
('Eletrônicos');

INSERT INTO Fornecedores (nome, contato, endereco) VALUES
('PepsiCo Brasil', 'contato@pepsico.com', 'Av. Brigadeiro Faria Lima, 1200 - SP'),
('Kraft Heinz', 'sac@kraftheinz.com', 'Rua Industrial, 350 - SP'),
('Johnson & Johnson', 'atendimento@jnj.com', 'Av. Brasil, 800 - RJ'),
('Samsung Brasil', 'suporte@samsung.com', 'Rua Tecnologia, 500 - SP');

INSERT INTO Filiais (nome, endereco) VALUES
('Filial Centro Oeste', 'Rua Central, 200 - Centro - SP'),
('Filial Norte', 'Av. Norte, 750 - SP');

INSERT INTO Produtos
(nome, descricao, preco, quantidade_estoque,
id_categoria, id_fornecedor, id_filial)
VALUES
('Pepsi Lata 350ml', 'Refrigerante em lata gelado', 4.20, 180, 1, 1, 1),
('Toddy 370g', 'Achocolatado em pó sabor chocolate', 8.50, 120, 3, 2, 1),
('Sabonete Lux 90g', 'Sabonete perfumado', 3.80, 140, 2, 3, 2),
('Desinfetante Veja 1L', 'Desinfetante multiuso', 6.90, 250, 4, 3, 1),
('Monitor Samsung 24"', 'Monitor LED Full HD', 950.00, 15, 5, 4, 2);

INSERT INTO Funcionarios
(nome, cargo, salario, data_contratacao, id_filial)
VALUES
('Pedro Almeida', 'Operador de Caixa', 2100.00, '2022-02-10', 1),
('Juliana Costa', 'Atendente', 2300.00, '2021-06-18', 1),
('Rafael Mendes', 'Gerente', 4800.00, '2020-04-12', 2);

INSERT INTO Clientes
(nome, telefone, endereco, pontos_fidelidade)
VALUES
('Bruno Oliveira', '11912345678', 'Rua das Palmeiras, 45 - SP', 180),
('Camila Rocha', '11987654321', 'Av. Paulista, 900 - SP', 320),
('Thiago Ferreira', '11955554444', 'Rua Verde, 12 - SP', 60);

INSERT INTO Compras
(data, total, id_fornecedor, id_filial)
VALUES
('2023-10-03', 850.00, 1, 1),
('2023-10-08', 620.00, 2, 1),
('2023-10-12', 310.00, 3, 2);

INSERT INTO ItensCompra
(id_compra, id_produto, quantidade, subtotal)
VALUES
(1, 1, 180, 850.00),
(2, 2, 120, 620.00),
(3, 3, 110, 310.00);

INSERT INTO Vendas
(data, total, id_cliente, id_funcionario, id_filial)
VALUES
('2023-11-02', 50.00, 1, 1, 1),
('2023-11-04', 950.00, 2, 2, 2),
('2023-11-06', 12.80, 3, 1, 1);

INSERT INTO ItensVenda
(id_venda, id_produto, quantidade, subtotal)
VALUES
(1, 1, 12, 50.00),
(2, 5, 1, 950.00),
(3, 3, 4, 12.80);

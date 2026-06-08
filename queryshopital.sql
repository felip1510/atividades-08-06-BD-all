-- 1. Nome e cidade dos hospitais
SELECT nome, cidade
FROM Hospitais;

-- 2. Nome, CRM e salário dos médicos
SELECT nome, crm, salario
FROM Medicos;

-- 3. Pacientes e tipo sanguíneo
SELECT nome, tipo_sanguineo
FROM Pacientes;

-- 4. Medicamentos com estoque inferior a 50
SELECT nome, estoque
FROM Medicamentos
WHERE estoque < 50;

-- 5. Pacientes com alergia registrada
SELECT nome, alergias
FROM Pacientes
WHERE alergias IS NOT NULL AND alergias <> 'Nenhuma';

-- 6. Consultas após uma data (ex: 2025-08-03)
SELECT *
FROM Consultas
WHERE data_consulta > '2025-08-03';

-- 7. Exames em um período (ex: agosto de 2025)
SELECT *
FROM Exames
WHERE data_exame BETWEEN '2025-08-01' AND '2025-08-31';

-- 8. Funcionários com salário entre 2500 e 6000
SELECT nome, salario
FROM Funcionarios
WHERE salario BETWEEN 2500 AND 6000;

-- 9. Quartos disponíveis
SELECT *
FROM Quartos
WHERE status_quarto = 'Livre';

-- 10. Pagamentos por forma (ex: PIX)
SELECT *
FROM Pagamentos
WHERE forma_pagamento = 'PIX';

-- 11. Total de pacientes
SELECT COUNT(*) AS total_pacientes
FROM Pacientes;

-- 12. Média das consultas
SELECT AVG(valor) AS media_consultas
FROM Consultas;

-- 13. Menor valor de consulta
SELECT MIN(valor) AS menor_consulta
FROM Consultas;

-- 14. Médicos por especialidade
SELECT e.nome AS especialidade, COUNT(m.id_medico) AS total_medicos
FROM Medicos m
JOIN Especialidades e ON m.id_especialidade = e.id_especialidade
GROUP BY e.nome;

-- 15. Funcionários por setor
SELECT s.nome AS setor, COUNT(f.id_funcionario) AS total_funcionarios
FROM Funcionarios f
JOIN Setores s ON f.id_setor = s.id_setor
GROUP BY s.nome;

-- 16. Médicos e especialidades
SELECT m.nome, e.nome AS especialidade
FROM Medicos m
JOIN Especialidades e ON m.id_especialidade = e.id_especialidade;

-- 17. Funcionários e hospital
SELECT f.nome, h.nome AS hospital
FROM Funcionarios f
JOIN Hospitais h ON f.id_hospital = h.id_hospital;

-- 18. Pacientes e datas de consultas
SELECT p.nome, c.data_consulta
FROM Consultas c
JOIN Pacientes p ON c.id_paciente = p.id_paciente;

-- 19. Medicamento(s) com maior preço
SELECT *
FROM Medicamentos
WHERE preco = (SELECT MAX(preco) FROM Medicamentos);

-- 20. Médicos com salário acima da média
SELECT nome, salario
FROM Medicos
WHERE salario > (SELECT AVG(salario) FROM Medicos);
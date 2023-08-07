-- queries

-- Inserção de dados (exemplo)

INSERT INTO Clientes (id_cliente, nome, telefone, email)
VALUES (1, 'João da Silva', '(11) 1234-5678', 'joao.silva@email.com');

INSERT INTO Veiculos (id_veiculo, id_cliente, modelo, marca, ano)
VALUES (1, 1, 'Civic', 'Honda', 2020);

INSERT INTO Pecas (id_peca, nome, preco)
VALUES (1, 'Vela de Ignição', 25.90);

INSERT INTO Servicos (id_servico, descricao, preco)
VALUES (1, 'Troca de Óleo', 80.00);

INSERT INTO OrdensServico (id_ordem, id_cliente, id_veiculo, data, observacoes)
VALUES (1, 1, 1, '2023-08-06', 'Troca de óleo e troca da vela de ignição.');

INSERT INTO ItensOrdemServico (id_item, id_ordem, id_peca, id_servico, quantidade)
VALUES (1, 1, 1, 1, 1);



-- Exemplos de Queries com as cláusulas mencionadas
-- Recuperação simples de todos os clientes:

SELECT * FROM Clientes;

-- Filtro com WHERE para obter informações de um cliente específico:


SELECT * FROM Clientes WHERE id_cliente = 1;

-- Expressão para gerar um atributo derivado (valor total da ordem de serviço):


SELECT os.id_ordem, SUM(p.preco * ios.quantidade) + SUM(s.preco) AS valor_total
FROM OrdensServico os
LEFT JOIN ItensOrdemServico ios ON os.id_ordem = ios.id_ordem
LEFT JOIN Pecas p ON ios.id_peca = p.id_peca
LEFT JOIN Servicos s ON ios.id_servico = s.id_servico
GROUP BY os.id_ordem;

-- Ordenação dos dados pelo nome dos clientes:

SELECT * FROM Clientes ORDER BY nome;

-- Condição de filtro aos grupos (somente ordens de serviço com valor total maior que 100):

SELECT os.id_ordem, SUM(p.preco * ios.quantidade) + SUM(s.preco) AS valor_total
FROM OrdensServico os
LEFT JOIN ItensOrdemServico ios ON os.id_ordem = ios.id_ordem
LEFT JOIN Pecas p ON ios.id_peca = p.id_peca
LEFT JOIN Servicos s ON ios.id_servico = s.id_servico
GROUP BY os.id_ordem
HAVING valor_total > 100;

-- Junção entre tabelas para obter informações completas da ordem de serviço:

SELECT os.id_ordem, c.nome AS cliente, v.modelo AS veiculo, os.data, os.observacoes,
       p.nome AS peca, ios.quantidade, s.descricao AS servico
FROM OrdensServico os
LEFT JOIN Clientes c ON os.id_cliente = c.id_cliente
LEFT JOIN Veiculos v ON os.id_veiculo = v.id_veiculo
LEFT JOIN ItensOrdemServico ios ON os.id_ordem = ios.id_ordem
LEFT JOIN Pecas p ON ios.id_peca = p.id_peca
LEFT JOIN Servicos s ON ios.id_servico = s.id_servico;

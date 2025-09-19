CREATE DATABASE OficinaDB;
USE OficinaDB;

CREATE TABLE Cliente (
  idCliente INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(30),
  Telefone VARCHAR(12),
  Endereco VARCHAR(50)
);

CREATE TABLE Veiculo (
  idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
  Marca VARCHAR(30),
  Modelo varchar(60),
  Ano INT,
  Placa VARCHAR(10),
  Cliente_idCliente INT,
  FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Equipe (
  idEquipe INT AUTO_INCREMENT PRIMARY KEY,
  nome_equipe VARCHAR(100)
);

CREATE TABLE Mecanico (
  idMecanico INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(30),
  Telefone VARCHAR(12),
  Especialidade VARCHAR(100),
  Equipe_idEquipe INT,
  FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE OrdemServico (
  idOS INT AUTO_INCREMENT PRIMARY KEY,
  data_emissao DATE,
  data_conclusao DATE,
  valorTotal DECIMAL(10,2),
  Veiculo_idVeiculo INT,
  Equipe_idEquipe INT,
  FOREIGN KEY (Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo),
  FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE Servico (
  idServico INT AUTO_INCREMENT PRIMARY KEY,
  Tipo VARCHAR(100),
  valor_mao_obra DECIMAL(10,2)
);

CREATE TABLE OS_Servico (
  idOS INT,
  idServico INT,
  valor DECIMAL(10,2),
  PRIMARY KEY (idOS, idServico),
  FOREIGN KEY (idOS) REFERENCES OrdemServico(idOS),
  FOREIGN KEY (idServico) REFERENCES Servico(idServico)
);

CREATE TABLE Pecas (
  idPecas INT AUTO_INCREMENT PRIMARY KEY,
  Descricao VARCHAR(255),
  Valor DECIMAL(10,2),
  Marca VARCHAR(100),
  Fornecedor VARCHAR(100)
);

CREATE TABLE Pecas_OS (
  idOS INT,
  idPecas INT,
  Quantidade INT,
  Valor DECIMAL(10,2),
  PRIMARY KEY (idOS, idPecas),
  FOREIGN KEY (idOS) REFERENCES OrdemServico(idOS),
  FOREIGN KEY (idPecas) REFERENCES Pecas(idPecas)
);

-- TESTE

INSERT INTO Cliente (Nome, Telefone, Endereco) VALUES
('João Silva', '47999999999', 'Rua Java, 100'),
('Maria oliveira', '47988888888', 'Rua Python, 200');

INSERT INTO Veiculo (Marca, Modelo, Ano, Placa, Cliente_idCliente) VALUES
('BMW','X1', 2022, 'ABC1234', 1),
('Honda', 'Civic', 2018, 'XYZ9876', 2);

INSERT INTO Equipe (nome_equipe) VALUES ('Equipe Alfa'), ('Equipe Beta');

INSERT INTO Mecanico (Nome, Telefone, Especialidade, Equipe_idEquipe) VALUES
('Carlos Mecânico', '47977777777', 'Motor', 1),
('Pedro Mecânico', '47966666666', 'Suspensão', 2);

INSERT INTO OrdemServico (data_emissao, data_conclusao, valorTotal, Veiculo_idVeiculo, Equipe_idEquipe) VALUES
('2025-09-01', '2025-09-05', 3200.00, 1, 1),
('2025-09-02', '2025-09-06', 1800.00, 2, 2);

INSERT INTO Servico (Tipo, valor_mao_obra) VALUES
('Troca de óleo', 150.00),
('Revisão freios', 300.00);

INSERT INTO OS_Servico (idOS, idServico, valor) VALUES
(1, 1, 100.00),
(2, 2, 200.00);

INSERT INTO Pecas (Descricao, Valor, Marca, Fornecedor) VALUES
('Filtro de óleo', 140.00, 'MANN', 'AutoPeças BR'),
('Pastilha de freio', 260.00, 'Ferodo', 'CarParts Ltda');

INSERT INTO Pecas_OS (idOS, idPecas, Quantidade, Valor) VALUES
(1, 1, 1, 140.00),
(2, 2, 1, 260.00);

-- TESTE DE QUERIES

-- 1) SELECT simples
SELECT Nome, Telefone FROM Cliente;

-- 2) WHERE
SELECT * FROM Veiculo WHERE Ano > 2015;

-- 3) Expressão (dias de execução da OS)
SELECT idOS, DATEDIFF(data_conclusao, data_emissao) AS DiasExecucao
FROM OrdemServico;

-- 4) ORDER BY
SELECT Nome, Endereco FROM Cliente ORDER BY Nome ASC;

-- 5) GROUP BY + HAVING (faturamento por equipe)
SELECT e.nome_equipe, SUM(o.valorTotal) AS Faturamento
FROM OrdemServico o
JOIN Equipe e ON o.Equipe_idEquipe = e.idEquipe
GROUP BY e.nome_equipe
HAVING SUM(o.valorTotal) > 1000;

-- 6) JOIN (mostrar OS com cliente e veículo)
SELECT o.idOS, c.Nome AS Cliente, v.Modelo, v.Placa, o.valorTotal
FROM OrdemServico o
JOIN Veiculo v ON o.Veiculo_idVeiculo = v.idVeiculo
JOIN Cliente c ON v.Cliente_idCliente = c.idCliente;

-- criação do banco de dados para o cenário de OFICINA MECÂNICA
drop database if exists oficina_mecanica;

create database oficina_mecanica;

use oficina_mecanica;

-- Criação das 6 tabelas: clientes, veículos, peças, serviços, ordem de serviços e itens da ordem

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Veiculos (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    modelo VARCHAR(50),
    marca VARCHAR(50),
    ano INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Pecas (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);

CREATE TABLE Servicos (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(200),
    preco DECIMAL(10, 2)
);

CREATE TABLE OrdensServico (
    id_ordem INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_veiculo INT,
    data DATE,
    observacoes TEXT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo)
);

CREATE TABLE ItensOrdemServico (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_ordem INT,
    id_peca INT,
    id_servico INT,
    quantidade INT,
    FOREIGN KEY (id_ordem) REFERENCES OrdensServico(id_ordem),
    FOREIGN KEY (id_peca) REFERENCES Pecas(id_peca),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico)
);

-- Define o auto_increment inicial para as tabelas
alter table Clientes auto_increment=1;
alter table Veiculos auto_increment=1;
alter table Pecas auto_increment=1;
alter table Servicos auto_increment=1;
alter table OrdensServico auto_increment=1;
alter table ItensOrdemServico auto_increment=1;

-- Mostra as tabelas criadas
show tables;

-- Mostra os bancos de dados disponíveis
show databases;

-- Mostra as tabelas do banco de dados "information_schema"
use information_schema;
show tables;

-- Mostra as informações sobre as restrições de chave estrangeira no banco de dados "oficina_mecanica"
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'oficina_mecanica';

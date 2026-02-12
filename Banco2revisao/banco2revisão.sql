CREATE DATABASE bike_indoor;
USE bike_indoor;

CREATE TABLE cidade (
    id_cidade INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    uf VARCHAR(2)
);

CREATE TABLE unidade (
    id_unidade INT PRIMARY KEY,
    descricao VARCHAR(40) NOT NULL,
    id_cidade INT,
    FOREIGN KEY (id_cidade) 
		REFERENCES cidade(id_cidade)
);

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(60),
    email VARCHAR(50),
    dtnascimento DATETIME,
    telefone VARCHAR(15),	
    cpf VARCHAR(14),	
    sexo VARCHAR (1),
    peso DECIMAL(10,2),
    altura DECIMAL(10,2),
    id_unidade INT,
    FOREIGN KEY (id_unidade) 
		REFERENCES unidade(id_unidade)
);

CREATE TABLE contato (
    id_contato INT PRIMARY KEY,
    nome VARCHAR(50),
    celular VARCHAR(15),
    relacao VARCHAR(10),
    id_usuario INT,
    FOREIGN KEY (id_usuario) 
        REFERENCES usuario(id_usuario) ON DELETE CASCADE
);

CREATE TABLE pacote(
    id_pacote INT PRIMARY KEY,
    descricao VARCHAR(40),
    qtd_aulas INT,
    valor DECIMAL(8,2),
    bonus INT,
    regras VARCHAR(200),
    prazo INT, 
    max_parcelas INT,
    id_unidade INT,
	FOREIGN KEY (id_unidade) 
		REFERENCES unidade(id_unidade)
);

CREATE TABLE venda_pacote (
    id_venda INT PRIMARY KEY,
    datavenda DATETIME,
    quantidade INT,
    totalCreditos INT,
    saldo INT,
    valorTotal DECIMAL(8,2),
    statusVenda VARCHAR (1),
    expira DATETIME,
	qtdparcelas INT,
    forma_pagamento VARCHAR(1),	
    id_usuario INT,
    FOREIGN KEY (id_usuario) 
		REFERENCES usuario(id_usuario),
    id_pacote INT,
    FOREIGN KEY (id_pacote) 
		REFERENCES pacote(id_pacote)
);

CREATE TABLE agenda (
    id_agenda INT PRIMARY KEY,
    dataHora DATETIME,
    capacidade INT
);


CREATE TABLE reserva (
    id_reserva INT PRIMARY KEY,
    data_reserva DATETIME,
    obs VARCHAR (40),
    id_venda INT,
	FOREIGN KEY (id_venda) 
		REFERENCES venda_pacote(id_venda),
    id_agenda INT,
    FOREIGN KEY (id_agenda) 
		REFERENCES agenda(id_agenda)
);
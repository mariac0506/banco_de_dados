CREATE DATABASE oficina;

USE oficina;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE veiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(100) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50),
    cliente_id INT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,

    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    descricao VARCHAR(255),
    veiculo_id INT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,

    FOREIGN KEY (veiculo_id) REFERENCES veiculos(id)
);


INSERT INTO clientes
(nome, cpf, telefone, email, created_at, updated_at)
VALUES
('João da Silva', '12345678901', '(16) 99999-1111', 'joao@email.com', '2026-10-25 18:02:36', '1998-04-14 10:00:00'),
('Maria Oliveira', '98765432100', '(16) 98888-2222', 'maria@email.com', NOW(), NOW()),
('Carlos Santos', '11122233344', '(16) 97777-3333', 'carlos@email.com', NOW(), NOW()),
('Ana Souza', '55566677788', '(16) 96666-4444', 'ana@email.com', NOW(), NOW());

INSERT INTO veiculos
(placa, marca, modelo, cliente_id, created_at, updated_at)
VALUES
('ABC1D23', 'Toyota', 'Corolla', 1, NOW(), NOW()),
('DEF4E56', 'Honda', 'Civic', 1, NOW(), NOW()),
('GHI7J89', 'Volkswagen', 'Gol', 2, NOW(), NOW()),
('JKL0M12', 'Fiat', 'Argo', 3, NOW(), NOW()),
('NOP3Q45', 'Chevrolet', 'Onix', 4, NOW(), NOW());
INSERT INTO agendamentos
(data, hora, descricao, veiculo_id, created_at, updated_at)
VALUES
('2026-09-21', '08:00:00', 'Troca de óleo e filtro', 1, NOW(), NOW()),
('2026-09-22', '10:30:00', 'Alinhamento e balanceamento', 2, NOW(), NOW()),
('2026-09-23', '14:00:00', 'Revisão dos freios', 3, NOW(), NOW()),
('2026-09-24', '09:00:00', 'Revisão geral do veículo', 4, NOW(), NOW()),
('2026-09-25', '15:30:00', 'Troca de pneus', 5, NOW(), NOW()),
('2026-09-26', '11:00:00', 'Manutenção preventiva', 1, NOW(), NOW());

SELECT
CLIENTES.NOME,
    COUNT(VEICULOS.ID) AS "QTD_CARROS"
FROM CLIENTES
INNER JOIN VEICULOS
ON CLIENTES.ID = VEICULOS.FK_CLI_ID
GROUP BY CLIENTES.ID, CLIENTES.NOME;

SELECT
VEICULOS.ID,
    VEICULOS.PLACA,
    VEICULOS.MARCA,
    VEICULOS.MODELO,
    COUNT(AGENDAMENTOS.ID) AS "QTD_AGENDAMENTOS"
FROM VEICULOS
INNER JOIN AGENDAMENTOS
ON VEICULOS.ID = AGENDAMENTOS.FK_VEI_ID
GROUP BY VEICULOS.ID;

SELECT CLIENTES.NOME AS "NOME DO CLIENTE",
		COUNT(AGENDAMENTOS.ID) AS "TOTAL DE AGENDAMENTOS"
FROM	CLIENTES
LEFT JOIN VEICULOS 
ON CLIENTES.ID = VEICULOS.CLIENTES_ID
LEFT JOIN AGENDAMENTOS
ON VEICULOS.ID = AGENDAMENTOS.VEICULO_ID
GROUP BY CLIENTES.ID, CLIENTES.NOME;
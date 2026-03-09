CREATE TABLE cliente (
    cpf VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    email VARCHAR(100)
);

CREATE TABLE endereco (
    codigo SERIAL PRIMARY KEY,
    rua VARCHAR(100),
    cep VARCHAR(9),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    cpf VARCHAR(20),
    FOREIGN KEY (cpf) REFERENCES cliente(cpf)
);

CREATE TABLE pedido (
    numero SERIAL PRIMARY KEY,
    data DATE,
    status VARCHAR(20),
    cpf VARCHAR(20),
    FOREIGN KEY (cpf) REFERENCES cliente(cpf)
);

CREATE TABLE produto (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    preco_unitario DECIMAL(10,2)
);

CREATE TABLE categoria (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE produto_categoria (
    codigo SERIAL PRIMARY KEY,
    codigo_produto INT,
    codigo_categoria INT,
    FOREIGN KEY (codigo_produto) REFERENCES produto(codigo),
    FOREIGN KEY (codigo_categoria) REFERENCES categoria(codigo)
);

CREATE TABLE item_pedido (
    codigo SERIAL PRIMARY KEY,
    qtde INT,
    total DECIMAL(10,2),
    preco_unitario DECIMAL(10,2),
    numero_pedido INT,
    codigo_produto INT,
    FOREIGN KEY (numero_pedido) REFERENCES pedido(numero),
    FOREIGN KEY (codigo_produto) REFERENCES produto(codigo)
);

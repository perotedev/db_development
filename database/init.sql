-- SELECT DATABASE TO USE
USE db_development

-- TYPE YOUR CODE BELLOW
CREATE TABLE Livro (
    codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(60) NOT NULL UNIQUE,
    isbn VARCHAR(13) NOT NULL UNIQUE,
    edicao VARCHAR(10) NOT NULL UNIQUE,
    ano VARCHAR(4) NOT NULL,
    fk_Editora_codigo INTEGER NOT NULL
);
 
CREATE TABLE Editora (
    codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE,
    telefone VARCHAR(9) NOT NULL,
    endereco VARCHAR(60) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE
);

CREATE TABLE Autor (
    codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    rg VARCHAR(10) NOT NULL UNIQUE,
    endereco VARCHAR(60) NOT NULL,
    telefone VARCHAR(9) NOT NULL
);

CREATE TABLE Assunto (
    codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Autoria (
    fk_Autor_codigo INTEGER,
    fk_Livro_codigo INTEGER UNIQUE
);

CREATE TABLE Contem (
    fk_Livro_codigo INTEGER UNIQUE,
    fk_Assunto_codigo INTEGER
);
 
ALTER TABLE Livro ADD CONSTRAINT FK_Livro_2
    FOREIGN KEY (fk_Editora_codigo)
    REFERENCES Editora (codigo)
    ON DELETE CASCADE;

 
ALTER TABLE Autoria ADD CONSTRAINT FK_Autoria_1
    FOREIGN KEY (fk_Autor_codigo)
    REFERENCES Autor (codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE Autoria ADD CONSTRAINT FK_Autoria_2
    FOREIGN KEY (fk_Livro_codigo)
    REFERENCES Livro (codigo)
    ON DELETE SET NULL;

ALTER TABLE Contem ADD CONSTRAINT FK_Contem_1
    FOREIGN KEY (fk_Livro_codigo)
    REFERENCES Livro (codigo)
    ON DELETE SET NULL;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_2
    FOREIGN KEY (fk_Assunto_codigo)
    REFERENCES Assunto (codigo)
    ON DELETE SET NULL;


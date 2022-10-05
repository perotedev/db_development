-- SELECT DATABASE TO USE
USE db_development

-- TYPE YOUR CODE BELLOW
CREATE TABLE projeto (
nome varchar(20),
numero numeric PRIMARY KEY,
local varchar(10),
numeroDep numeric
);

CREATE TABLE departamento (
numero numeric PRIMARY KEY,
nome varchar(20),
cadGerente numeric,
data_ini date
);

CREATE TABLE empregado (
cad numeric PRIMARY KEY,
sexo char(1),
nome varchar(20),
salario real,
cadSupervisor numeric,
numeroDep numeric,
FOREIGN KEY(numeroDep) REFERENCES departamento (numero)
);

CREATE TABLE locais (
locais varchar(10),
numDep numeric,
PRIMARY KEY (locais,numDep),
FOREIGN KEY(numDep) REFERENCES departamento (numero)
);

CREATE TABLE dependente (
nome varchar(20),
data_nasc date,
grau_parentesco varchar(10),
cadEmp numeric,
PRIMARY KEY(cadEmp),
FOREIGN KEY(cadEmp) REFERENCES empregado (cad)
);

CREATE TABLE trabalha_em (
horas numeric,
cadEmp numeric,
numeroProj numeric,
PRIMARY KEY(cadEmp,numeroProj),
FOREIGN KEY(cadEmp) REFERENCES empregado (cad),
FOREIGN KEY(numeroProj) REFERENCES projeto (numero)
);

ALTER TABLE projeto ADD FOREIGN KEY(numeroDep) REFERENCES departamento (numero);
ALTER TABLE departamento ADD FOREIGN KEY(cadGerente) REFERENCES empregado (cad);


-- INSERTS
INSERT INTO empregado (cad,sexo,nome,salario) VALUES (1,'M','Joao',4000);
INSERT INTO empregado (cad,sexo,nome,salario) VALUES (2,'M','Pedro',5000);
INSERT INTO empregado (cad,sexo,nome,salario) VALUES (3,'M','Antonio',3000);
INSERT INTO empregado (cad,sexo,nome,salario) VALUES (4,'F','Maria',2000);
INSERT INTO empregado (cad,sexo,nome,salario) VALUES (5,'M','Rafael',6000);
INSERT INTO empregado (cad,sexo,nome,salario) VALUES (6,'F','Carla',5000);
INSERT INTO empregado (cad,sexo,nome,salario) VALUES (7,'M','Paulo',4000);
INSERT INTO empregado (cad,sexo,nome,salario) VALUES (8,'M','Marcos',3000);
INSERT INTO empregado (cad,sexo,nome,salario) VALUES (9,'F','Joana',2000);
INSERT INTO empregado (cad,sexo,nome,salario) VALUES (10,'F','Ana',4000);

INSERT INTO departamento (numero,nome,cadGerente,data_ini) VALUES (1,'RH',5,'2013/08/01');
INSERT INTO departamento (numero,nome,cadGerente,data_ini) VALUES (2,'Desenvolvimento',7,'2013/05/01');
INSERT INTO departamento (numero,nome,cadGerente,data_ini) VALUES (3,'Design',2,'2013/10/01');
INSERT INTO departamento (numero,nome,cadGerente,data_ini) VALUES (4,'Suporte',6,'2013/03/01');

INSERT INTO dependente (nome,data_nasc,grau_parentesco,cadEmp) VALUES ('Claudio','2003/05/03','filho',5);
INSERT INTO dependente (nome,data_nasc,grau_parentesco,cadEmp) VALUES ('Angela','2001//07/09','filho',10);
INSERT INTO dependente (nome,data_nasc,grau_parentesco,cadEmp) VALUES ('Alan','2006/10/16','filho',2);
INSERT INTO dependente (nome,data_nasc,grau_parentesco,cadEmp) VALUES ('Bruno','2002/09/21','filho',6);
INSERT INTO dependente (nome,data_nasc,grau_parentesco,cadEmp) VALUES ('Roberto','2008/03/27','filho',3);
INSERT INTO dependente (nome,data_nasc,grau_parentesco,cadEmp) VALUES ('Lorena','2005/11/12','filho',7);

INSERT INTO projeto (nome,numero,local,numeroDep) VALUES ('A',1,'bloco 1',2);
INSERT INTO projeto (nome,numero,local,numeroDep) VALUES ('B',2,'bloco 4',3);
INSERT INTO projeto (nome,numero,local,numeroDep) VALUES ('C',3,'bloco 2',2);
INSERT INTO projeto (nome,numero,local,numeroDep) VALUES ('D',4,'bloco 5',3);
INSERT INTO projeto (nome,numero,local,numeroDep) VALUES ('E',5,'bloco 6',4);
INSERT INTO projeto (nome,numero,local,numeroDep) VALUES ('F',6,'bloco 3',2);

INSERT INTO locais (locais,numDep) VALUES ('bloco 1',2);
INSERT INTO locais (locais,numDep) VALUES ('bloco 2',2);
INSERT INTO locais (locais,numDep) VALUES ('bloco 3',2);
INSERT INTO locais (locais,numDep) VALUES ('bloco 4',3);
INSERT INTO locais (locais,numDep) VALUES ('bloco 5',3);
INSERT INTO locais (locais,numDep) VALUES ('bloco 6',4);
INSERT INTO locais (locais,numDep) VALUES ('bloco 7',1);

INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,1,1);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (6,2,1);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (6,3,2);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,4,2);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,5,3);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (4,6,3);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (4,7,4);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,8,4);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,9,5);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (6,10,5);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (6,1,6);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (6,2,6);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,3,1);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,4,1);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (4,5,2);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (4,6,2);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (4,7,3);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,8,3);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,9,6);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,10,6);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (6,7,5);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (6,6,5);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,5,4);
INSERT INTO trabalha_em (horas,cadEmp,numeroProj) VALUES (8,2,4);

UPDATE empregado SET numeroDep = 3 WHERE cad = 1;
UPDATE empregado SET numeroDep = 3 WHERE cad = 2;
UPDATE empregado SET numeroDep = 4 WHERE cad = 3;
UPDATE empregado SET numeroDep = 4 WHERE cad = 4;
UPDATE empregado SET numeroDep = 2 WHERE cad = 5;
UPDATE empregado SET numeroDep = 2 WHERE cad = 6;
UPDATE empregado SET numeroDep = 2 WHERE cad = 7;
UPDATE empregado SET numeroDep = 2 WHERE cad = 8;
UPDATE empregado SET numeroDep = 1 WHERE cad = 9;
UPDATE empregado SET numeroDep = 3 WHERE cad = 10;

UPDATE empregado SET cadsupervisor = null;
UPDATE empregado SET cadsupervisor = 7 WHERE nome NOT IN ('Paulo');
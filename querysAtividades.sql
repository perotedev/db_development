SELECT * FROM `empregado` WHERE `cadSupervisor` IS NULL;

SELECT AVG(`salario`) AS `mediaSalario` FROM `empregado`;

SELECT  MAX(`salario`) AS `maiorSalario`, MIN(`salario`) AS `menorSalario` FROM `empregado`;

SELECT * FROM `empregado` ORDER BY `salario` DESC;

SELECT * FROM `empregado` ORDER BY `nome` ASC;

SELECT * FROM `empregado` ORDER BY `cad` ASC;

SELECT * FROM `empregado` WHERE `nome` like "M%";

SELECT * FROM `empregado` WHERE `nome` like "%A";

SELECT `sexo`, COUNT(`sexo`) AS `quantidade` FROM `empregado` GROUP BY `sexo`;

SELECT `numeroDep`, COUNT(`numeroDep`) FROM `empregado`  GROUP BY `numeroDep`;

SELECT * FROM `empregado` WHERE `salario` >= 1000 AND `salario` <= 5000 ;

SELECT * FROM `empregado` WHERE `numeroDep` = 2 OR `numeroDep` = 3 ;

SELECT DISTINCT `salario` FROM `empregado`;

SELECT COUNT(`salario`) FROM `empregado` WHERE `salario` > 5000;

SELECT `empregado`.`nome`, `departamento`.`nome` AS `nomeDepartamento` FROM `empregado` INNER JOIN `departamento` ON `numeroDep` = `numero`;

SELECT `locais`.`locais` AS `local`, `departamento`.`nome` AS `departamento` FROM `departamento` LEFT JOIN `locais` ON `numero` = `numDep`;

SELECT `empregado`.`nome` AS `empregado`, `departamento`.`nome` AS `nomeDepartamento`, `trabalha_em`.`horas` AS `horasDiarias`, `projeto`.`nome` AS `projeto` FROM `empregado` INNER JOIN `trabalha_em` ON `cad` = `cadEmp` INNER JOIN `projeto` ON `numeroProj` = `projeto`.`numero` INNER JOIN `departamento` ON `projeto`.`numeroDep` = `departamento`.`numero`;

SELECT `empregado`.`nome` AS `empregado`, `dependente`.`nome` AS `dependente`, `dependente`.`grau_parentesco` FROM `empregado` INNER JOIN `dependente` ON `cad` = `cadEmp`;
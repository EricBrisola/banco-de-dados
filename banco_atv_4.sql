USE clinica;

SELECT m.nome, m.cpf
	FROM medicos m 
    JOIN pacientes p ON m.cpf = p.cpf; 
    
SELECT m.nome AS nome_medico, f.nome AS nome_funcionario, f.cidade AS cidade_comum
	FROM medicos m
    JOIN funcionarios f 
    ON 
		m.cidade = f.cidade;
    
SELECT p.codp, p.nome, c.hora
	FROM pacientes p
    JOIN consultas c
    ON 
		p.codp = c.codp
    WHERE c.hora > '14:00';
 
SELECT a.nroa AS numero, a.andar AS andar, m.especialidade
	FROM ambulatorio a
    JOIN medicos m 
    ON 
		a.nroa = m.nroa
    WHERE m.especialidade = 'ortopedia' AND m.ativo = 1;

SELECT p.nome, p.cpf
	FROM pacientes p
    JOIN consultas c
    ON 
		p.codp = c.codp
	WHERE consulta_data BETWEEN  "2024-06-13" AND  "2024-06-16";
    
SELECT m.nome, m.idade
	FROM medicos m
    JOIN consultas c
    ON 
		m.codm = c.codm
    JOIN pacientes p
    ON 
		p.codp = c.codp
    WHERE p.nome = 'Ana';
    
SELECT m.codm, m.nome
	FROM medicos m
    JOIN ambulatorio a
    ON 
		m.nroa = a.nroa
    WHERE nome != 'Pedro' 
    AND m.nroa = (
		SELECT nroa 
		FROM medicos 
		WHERE nome = 'Pedro');
        
SELECT p.nome AS paciente, p.cpf
	FROM pacientes p 
    JOIN consultas c
    ON 
		p.codp = c.codp
    JOIN medicos m
    ON 
		c.codm = m.codm
    WHERE m.especialidade = 'ortopedia' AND c.consulta_data < '2024-06-21';
    
SELECT f.nome, f.salario
	FROM funcionarios f
    WHERE nome != 'Denise'
    AND f.cidade = (
		SELECT cidade 
		FROM funcionarios
        WHERE nome = 'Denise')
    AND f.salario > (
		SELECT salario
        FROM funcionarios
        WHERE nome = 'Denise');

SELECT a.*, m.nome AS medico
	FROM ambulatorio a
    LEFT JOIN medicos m
    ON a.nroa = m.nroa;
    
SELECT c.consulta_data, c.hora, m.nome AS medico, p.nome AS paciente, a.nroa
	FROM consultas c
    LEFT JOIN medicos m
    ON c.codm = m.codm
    RIGHT JOIN pacientes p
    ON c.codp = p.codp
    LEFT JOIN ambulatorio a
    ON a.nroa = m.nroa;
    
/* 
segunda maneira de fazer

SELECT c.consulta_data, c.hora, m.nome AS medico, p.nome AS paciente, a.nroa
	FROM consultas c
	LEFT JOIN medicos m ON c.codm = m.codm
	LEFT JOIN pacientes p ON c.codp = p.codp
	LEFT JOIN ambulatorio a ON a.nroa = m.nroa;
*/
    
/*1.
Realize as seguintes consultas usando subconsultas com IN,
ANY, ALL e/ou EXISTS, ou subconsultas na cláusula FROM:

a. Buscar nome e CPF dos médicos que são pacientes do hospital
b. Buscar código e nome dos pacientes com consulta marcada
para horários após às 14 horas.
c. Buscar o número e andar dos ambulatórios onde nenhum
médico dá atendimento.
d. Buscar o número e o andar de todos os ambulatórios, exceto o
de menor capacidade.
e. Buscar nome e CPF dos médicos que atendem em
ambulatórios com capacidade superior à menor capacidade dos
ambulatórios do primeiro andar (usando somente estas informações).
f. DESAFIO: buscar nome e CPF dos médicos que têm/tiveram
consultas com todos os pacientes menores de 25 anos.
 */
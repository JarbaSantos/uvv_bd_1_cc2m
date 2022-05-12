/* Questão_01 */

select     numero_departamento, round (avg(salario),2) 
as         média_salarial 
from       funcionario 
group by   numero_departamento 
order by   numero_departamento;

/* Questão_02 */

select     sexo, round (avg(salario),2) 
as         média_salarial 
from       funcionario  
group by   sexo;

/* Questão_03 */

select     concat(primeiro_nome, nome_meio, ultimo_nome) 
as         nome_completo, data_nascimento, year(current_timestamp)-year(data_nascimento) 
as         idade, salario, dp.nome_departamento 
from       funcionario fc 
inner join departamento dp 
on         fc.numero_departamento = dp.numero_departamento;

/* Questão_04 */

select     distinct concat(fc1.primeiro_nome, fc1.nome_meio, fc1.ultimo_nome) 
as         nome_completo, year(current_timestamp())-year(fc1.data_nascimento) 
as         idade, fc1.salario as salaraio_atual, if(fc2.salario >= 35000, fc2.salario * 1.15, fc2.salario * 1.20) 
as         salario_reajustado from funcionario fc1
inner join funcionario fc2 
on         (fc1.cpf = fc2.cpf);

/* Questão_05 */

select     distinct fc1.primeiro_nome 
as         funcionarios, fc2.primeiro_nome 
as         gerentes, dp.nome_departamento, fc1.salario 
from       funcionario fc1 inner join funcionario fc2 
on         (fc1.cpf_supervisor = fc2.cpf) 
inner join departamento d 
on         (fc1.numero_departamento = dp.numero_departamento)
order by   nome_departamento, salario desc;

/* Questão_06 */

select     distinct concat(primeiro_nome, nome_meio, ultimo_nome) 
as         nome_funcionario, numero_departamento, concat(d.nome_dependente, fc.nome_meio, fc.ultimo_nome) 
as         nome_dependente, year(current_timestamp())-year(d.data_nascimento) 
as         idade_dependente, if(d.sexo = "M","Masculino","Feminino") 
as         sexo from funcionario fc, dependente
inner join dependente d where fc.cpf = d.cpf_funcionario;

/* Questão_07 */

select     concat(fc.primeiro_nome, fc.nome_meio, fc.ultimo_nome) 
as         nome_completo, fc.salario,  part.nome_departamento
from       funcionario 
as         fc inner join departamento part 
on         (part.numero_departamento = fc.numero_departamento) 
left join  dependente depart 
on         (depart.cpf_funcionario = fc.cpf) 
where      depart.nome_dependente 
is         null;

/* Questão_08 */

select     distinct numero_departamento, trabalha_em.numero_projeto, concat(fc.primeiro_nome, fc.nome_meio, fc.ultimo_nome) 
as         nome_funcionario,horas from funcionario 
as         fc
inner join trabalha_em 
on         fc.cpf = trabalha_em.cpf_funcionario 
order by   numero_departamento;

/* Questão_09 */

select     sum(te.horas) 
as         horas_totais, nome_projeto, nome_departamento 
from       trabalha_em te  inner join projeto pjt 
on         pjt.numero_projeto = te.numero_projeto 
inner join departamento dp 
on         dp.numero_departamento = pjt.numero_departamento 
where      te.numero_projeto = te.numero_projeto  
group by   te.numero_projeto, pjt.nome_projeto, dp.nome_departamento;

/* Questão_10 (Questão igual a Questão_01[reportei isso por e-mail])*/

select     numero_departamento, round (avg(salario),2) 
as         média_salarial 
from       funcionario 
group by   numero_departamento 
order by   numero_departamento;

/* Questão_11 */

select     concat(fc.primeiro_nome, nome_meio, ultimo_nome) 
as         nome_funcionario, projeto.nome_projeto,(trabalha_em.horas * 50) 
as         valor
from       ((funcionario as fc inner join trabalha_em on fc.cpf = trabalha_em.cpf_funcionario) 
inner join projeto 
on         projeto.numero_projeto = trabalha_em.numero_projeto);

/* Questão_12 */

select     concat(primeiro_nome, nome_meio, ultimo_nome) 
as         funcionario, dp.nome_departamento, pjt.nome_projeto, horas 
from       departamento dp 
inner join projeto pjt 
on         (dp.numero_departamento = pjt.numero_departamento) 
inner join trabalha_em te 
on         (te.numero_projeto = pjt.numero_projeto) 
inner join funcionario fc 
on         (te.cpf_funcionario = fc.cpf) 
where      te.horas = 0;


/* Questão_13 */

select     distinct concat(primeiro_nome, nome_meio, ultimo_nome) 
as         nome, sexo, year(current_timestamp())-year(data_nascimento) 
as         idade from funcionario
union
select     distinct concat(d.nome_dependente, fc.nome_meio, fc.ultimo_nome) 
as         nome, d.sexo, year(current_timestamp())-year(d.data_nascimento) 
as         idade
from       dependente d
inner join funcionario fc 
on         (fc.cpf = d.cpf_funcionario)
order by   idade desc;

/* Questão_14 */

select     fc.numero_departamento, count(*) 
as         qtd_empregados 
from       funcionario fc, departamento dp
where      fc.numero_departamento = dp.numero_departamento
group by   fc.numero_departamento;

/* Questão_15 */

select     distinct concat(fc.primeiro_nome, fc.nome_meio, fc.ultimo_nome) 
as         nome_completo, fc.numero_departamento, pjt.nome_projeto
from       funcionario fc
inner join trabalha_em te 
on         (fc.cpf = te.cpf_funcionario)
left outer join projeto pjt 
on         (pjt.numero_projeto = te.numero_projeto and fc.cpf = te.cpf_funcionario and te.horas > 0)
order by   nome_projeto;

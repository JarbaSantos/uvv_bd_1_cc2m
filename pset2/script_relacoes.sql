su - postgres
postgres 

psql
computaco@raiz

/*se necessario. (sempre que entro, preciso alterar para acessar o schema do elmasri) */
alter user jarbas set search_path to elmasri, '\$user', public;

\c uvv jarbas;
99426929

/* Questão 1 */
SELECT   avg(salario)
FROM     funcionario
WHERE    numero_departamento=1
UNION
SELECT   avg(salario)                  
FROM     funcionario
WHERE    numero_departamento=4
UNION
SELECT   avg(salario)
FROM     funcionario
WHERE    numero_departamento=5;

 /* Questão 2 */
 SELECT  avg(salario)
 FROM    funcionario
 WHERE   sexo=M
 UNION
 SELECT  avg(salario)
 FROM    funcionario
 WHERE   sexo=F
            
 /* Questão 3 */
 

DROP DATABASE if EXISTS UNIVERSIDADE;
## CRIA O BANCO UNIVERSIDADE
CREATE DATABASE UNIVERSIDADE;

## CRIA A TABELA DEPARTAMENTO
CREATE TABLE UNIVERSIDADE.DEPARTAMENTO(CD_DEPARTAMENTO INTEGER NOT NULL AUTO_INCREMENT,
                                       PRIMARY KEY(CD_DEPARTAMENTO),
                                       NOME varchar(50),
                                       CAMPUS varchar(50)) ENGINE = INNODB;


## CRIA TABELA PROFESSOR
CREATE TABLE UNIVERSIDADE.PROFESSOR(CD_PROFESSOR INTEGER NOT NULL AUTO_INCREMENT,
                                    PRIMARY KEY(CD_PROFESSOR),
                                    NOME varchar(50),
                                    CPF integer,
                                    SALARIO float,
                                    DATA_NASCIMENTO date,
                                    FK_DEPARTAMENTO integer,
                                    FOREIGN KEY (FK_DEPARTAMENTO) REFERENCES DEPARTAMENTO (CD_DEPARTAMENTO) ON UPDATE CASCADE ON DELETE CASCADE)ENGINE = INNODB;            


## CRIA TABELA TITULACAO
CREATE TABLE UNIVERSIDADE.TITULACAO(CD_TITULACAO INTEGER NOT NULL AUTO_INCREMENT,
                                    PRIMARY KEY(CD_TITULACAO),
                                    INSTITUICAO varchar(50),
                                    CURSO varchar(50),
                                    GRAU varchar(50),
                                    FK_PROFESSOR integer,
                                    FOREIGN KEY (FK_PROFESSOR) REFERENCES PROFESSOR(CD_PROFESSOR) ON UPDATE CASCADE ON DELETE CASCADE)ENGINE = INNODB;
        
        
## CRIA TABELA DEPENDENTE
CREATE TABLE UNIVERSIDADE.DEPENDENTE(CD_DEPENDENTE INTEGER NOT NULL AUTO_INCREMENT,
                                     PRIMARY KEY(CD_DEPENDENTE),
                                     NOME varchar(50),
                                     RELACIONAMENTO varchar(50),
                                     DATA_NASCIMENTO date,
                                     FK_PROFESSOR integer,
                                     FOREIGN KEY (FK_PROFESSOR) REFERENCES PROFESSOR(CD_PROFESSOR) ON UPDATE CASCADE ON DELETE CASCADE)ENGINE = INNODB;


## CRIA TABELA CURSO
CREATE TABLE UNIVERSIDADE.CURSO(CD_CURSO INTEGER NOT NULL AUTO_INCREMENT,
                                PRIMARY KEY(CD_CURSO),
                                NOME varchar(50),
                                TURNO varchar(50),
                                NUMERO_ALUNOS integer)ENGINE = INNODB;
    

## CRIA TABELA ALUNO
CREATE TABLE UNIVERSIDADE.ALUNO(CD_ALUNO integer PRIMARY KEY,
                                NOME varchar(50),
                                MATRICULA varchar(50),
                                ENDERECO varchar(50),
                                DATA_NASCIMENTO date,
                                FK_CURSO integer,
                                FOREIGN KEY (FK_CURSO) REFERENCES CURSO(CD_CURSO) ON UPDATE CASCADE ON DELETE CASCADE)ENGINE = INNODB;
    

## CRIA TABELA DISCIPLINA
CREATE TABLE UNIVERSIDADE.DISCIPLINA(CD_DISCIPLINA integer not null AUTO_INCREMENT,
                                     PRIMARY KEY (CD_DISCIPLINA),
                                     NOME varchar(50),
                                     HORAS integer)ENGINE = INNODB;
    
    
## CRIA TABELA OFERTA
CREATE TABLE UNIVERSIDADE.OFERTA(CD_OFERTA integer not null AUTO_INCREMENT,
                                PRIMARY KEY (CD_OFERTA),
                                FREQUENCIA integer,
                                ANO integer,
                                NOTA float,
                                SEMESTRE integer,
                                FK_PROFESSOR integer,
                                FK_ALUNO integer,
                                FK_DISCIPLINA integer,
                                FOREIGN KEY (FK_PROFESSOR) REFERENCES PROFESSOR(CD_PROFESSOR) ON UPDATE CASCADE ON DELETE CASCADE,
                                FOREIGN KEY (FK_ALUNO) REFERENCES ALUNO(CD_ALUNO) ON UPDATE CASCADE ON DELETE CASCADE,
                                FOREIGN KEY (FK_DISCIPLINA) REFERENCES DISCIPLINA(CD_DISCIPLINA) ON UPDATE CASCADE ON DELETE CASCADE)ENGINE = INNODB;

 
## CRIA TABELA DEPARTAMENTO_CURSO
CREATE TABLE UNIVERSIDADE.DEPARTAMENTO_CURSO(CD_DEPARTAMENTO_CURSO integer not null AUTO_INCREMENT PRIMARY KEY,
                                             FK_DEPARTAMENTO integer,
                                             FK_CURSO integer,
                                             FOREIGN KEY (FK_DEPARTAMENTO) REFERENCES DEPARTAMENTO(CD_DEPARTAMENTO) ON UPDATE CASCADE ON DELETE CASCADE,
                                             FOREIGN KEY (FK_CURSO) REFERENCES CURSO(CD_CURSO) ON UPDATE CASCADE ON DELETE CASCADE)ENGINE = INNODB;
 
 
## CRIA TABELA DISCIPLINA_CURSO
CREATE TABLE UNIVERSIDADE.DISCIPLINA_CURSO(CD_DISCIPLINA_CURSO integer not null AUTO_INCREMENT PRIMARY KEY,
                                           FK_CURSO integer,
                                           FK_DISCIPLINA integer,
                                           FOREIGN KEY (FK_CURSO) REFERENCES CURSO(CD_CURSO),
                                           FOREIGN KEY (FK_DISCIPLINA) REFERENCES DISCIPLINA(CD_DISCIPLINA))ENGINE = INNODB;
                                           
## INSERCAO DE DADOS NA TABELA DEPARTAMENTO
## ITEM 01
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (nome, campus) VALUES ('Matemática', 'UEM');
## ITEM 02
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (nome, campus) VALUES ('Química', 'UEM');
## ITEM 03
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (nome, campus) VALUES ('Arquitetura e Urbanismo', 'UEM');
## ITEM 04
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (nome, campus) VALUES ('Física', 'UEM');
## ITEM 05
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (nome, campus) VALUES ('Estística', 'UEM');
## ITEM 06
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (nome, campus) VALUES ('Farmácia', 'UEM');
## ITEM 07
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (nome, campus) VALUES ('Engenharia Química', 'UEM');
## ITEM 08
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (nome, campus) VALUES ('Enfermagem', 'UEM');
## ITEM 09
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (nome, campus) VALUES ('Engenharia Mecânica', 'UEM');
## ITEM 10
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (nome, campus) VALUES ('Psicologia', 'UEM');

## INSERCAO DE DADOS NA TABELA PROFESSOR
## ITEM 01
INSERT INTO UNIVERSIDADE.PROFESSOR (nome, cpf, salario, data_nascimento, fk_departamento) VALUES ('Alberto', 10, 1000.00, '2022-01-01', 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.PROFESSOR (nome, cpf, salario, data_nascimento, fk_departamento) VALUES ('Bruno', 11, 2000.00, '2022-02-02', 1);
## ITEM 03
INSERT INTO UNIVERSIDADE.PROFESSOR (nome, cpf, salario, data_nascimento, fk_departamento) VALUES ('Carlos', 12, 3000.00, '2022-03-03', 1);
## ITEM 04
INSERT INTO UNIVERSIDADE.PROFESSOR (nome, cpf, salario, data_nascimento, fk_departamento) VALUES ('Diana', 13, 4000.00, '2022-04-04', 1);
## ITEM 05
INSERT INTO UNIVERSIDADE.PROFESSOR (nome, cpf, salario, data_nascimento, fk_departamento) VALUES ('Elaine', 14, 5000.00, '2022-05-05', 1);
## ITEM 06
INSERT INTO UNIVERSIDADE.PROFESSOR (nome, cpf, salario, data_nascimento, fk_departamento) VALUES ('Fabio', 15, 6000.00, '2022-06-06', 2);
## ITEM 07
INSERT INTO UNIVERSIDADE.PROFESSOR (nome, cpf, salario, data_nascimento, fk_departamento) VALUES ('Gustavo', 16, 7000.00, '2022-07-07', 2);
## ITEM 08
INSERT INTO UNIVERSIDADE.PROFESSOR (nome, cpf, salario, data_nascimento, fk_departamento) VALUES ('Henrique', 17, 8000.00, '2022-08-08', 3);
## ITEM 09
INSERT INTO UNIVERSIDADE.PROFESSOR (nome, cpf, salario, data_nascimento, fk_departamento) VALUES ('Isabela', 18, 8000.00, '2022-09-09', 4);
## ITEM 10
INSERT INTO UNIVERSIDADE.PROFESSOR (nome, cpf, salario, data_nascimento, fk_departamento) VALUES ('João', 19, 8000.00, '2022-10-10', 5);

## INSERCAO DE DADOS NA TABELA TITULACAO 
## ITEM 01
INSERT INTO UNIVERSIDADE.TITULACAO(instituicao, curso, grau, fk_professor) VALUES ('UTFPR', 'Matemática', 'Especialização', 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.TITULACAO(instituicao, curso, grau, fk_professor) VALUES ('UEL', 'Química', 'Especialização', 2);
## ITEM 03
INSERT INTO UNIVERSIDADE.TITULACAO(instituicao, curso, grau, fk_professor) VALUES ('UNEB', 'Arquitetura e Urbanismo', 'Especialização', 3);
## ITEM 04
INSERT INTO UNIVERSIDADE.TITULACAO(instituicao, curso, grau, fk_professor) VALUES ('UFBA', 'Física', 'Especialização', 4);
## ITEM 05
INSERT INTO UNIVERSIDADE.TITULACAO(instituicao, curso, grau, fk_professor) VALUES ('UNB', 'Estística', 'Especialização', 5);
## ITEM 06
INSERT INTO UNIVERSIDADE.TITULACAO(instituicao, curso, grau, fk_professor) VALUES ('UFRB', 'Farmácia', 'Especialização', 6);
## ITEM 07
INSERT INTO UNIVERSIDADE.TITULACAO(instituicao, curso, grau, fk_professor) VALUES ('FTC', 'Engenharia Química', 'Mestrado', 7);
## ITEM 08
INSERT INTO UNIVERSIDADE.TITULACAO(instituicao, curso, grau, fk_professor) VALUES ('UNIOESTE', 'Enfermagem', 'Mestrado', 8);
## ITEM 09
INSERT INTO UNIVERSIDADE.TITULACAO(instituicao, curso, grau, fk_professor) VALUES ('USP', 'Engenharia Mecânica', 'Mestrado', 9);
## ITEM 10
INSERT INTO UNIVERSIDADE.TITULACAO(instituicao, curso, grau, fk_professor) VALUES ('ITA', 'Psicologia', 'Doutorado', 10);

## INSERCAO DE DADOS NA TABELA DEPENDENTES
## ITEM 01
INSERT INTO UNIVERSIDADE.DEPENDENTE(nome, relacionamento, data_nascimento, FK_PROFESSOR) VALUES ('Zophia', 'Filha', '2022-10-03', 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.DEPENDENTE(nome, relacionamento, data_nascimento, FK_PROFESSOR) VALUES ('Yolanda', 'Filha', '2022-05-11', 1);
## ITEM 03
INSERT INTO UNIVERSIDADE.DEPENDENTE(nome, relacionamento, data_nascimento, FK_PROFESSOR) VALUES ('Xande', 'Filho', '2022-11-25', 2);
## ITEM 04
INSERT INTO UNIVERSIDADE.DEPENDENTE(nome, relacionamento, data_nascimento, FK_PROFESSOR) VALUES ('Wanderley', 'Filho', '2022-01-19', 2);
## ITEM 05
INSERT INTO UNIVERSIDADE.DEPENDENTE(nome, relacionamento, data_nascimento, FK_PROFESSOR) VALUES ('Valcir', 'Filho', '2022-02-12', 3);

## INSERCAO DE DADOS NA TABELA CURSO
## ITEM 01
INSERT INTO UNIVERSIDADE.CURSO(nome, turno, numero_alunos) VALUES ('Matemática', 'Matutino', 50);
## ITEM 02
INSERT INTO UNIVERSIDADE.CURSO(nome, turno, numero_alunos) VALUES ('Química', 'Matutino', 49);
## ITEM 03
INSERT INTO UNIVERSIDADE.CURSO(nome, turno, numero_alunos) VALUES ('Enfermagem', 'Matutino', 48);
## ITEM 04
INSERT INTO UNIVERSIDADE.CURSO(nome, turno, numero_alunos) VALUES ('Engenharia Mecânica', 'Matutino', 47);
## ITEM 05
INSERT INTO UNIVERSIDADE.CURSO(nome, turno, numero_alunos) VALUES ('Farmárcia', 'Vespertino', 46);
## ITEM 06
INSERT INTO UNIVERSIDADE.CURSO(nome, turno, numero_alunos) VALUES ('Arquitetura e Urbanismo', 'Vespertino', 45);
## ITEM 07
INSERT INTO UNIVERSIDADE.CURSO(nome, turno, numero_alunos) VALUES ('Física', 'Vespertino', 45);
## ITEM 08
INSERT INTO UNIVERSIDADE.CURSO(nome, turno, numero_alunos) VALUES ('Medicina', 'Vespertino', 45);
## ITEM 09
INSERT INTO UNIVERSIDADE.CURSO(nome, turno, numero_alunos) VALUES ('Ciências Contábeis', 'Vespertino', 45);
## ITEM 10
INSERT INTO UNIVERSIDADE.CURSO(nome, turno, numero_alunos) VALUES ('Psicologia', 'Noturno', 45);

## INSERCAO DE DADOS NA TABELA DISCIPLINA
## ITEM 01
INSERT INTO UNIVERSIDADE.DISCIPLINA(cd_disciplina, nome, horas) VALUES (1, 'Cálculo I', 2);
## ITEM 02
INSERT INTO UNIVERSIDADE.DISCIPLINA(cd_disciplina, nome, horas) VALUES (2, 'Qúimica Orgânica', 3);
## ITEM 03
INSERT INTO UNIVERSIDADE.DISCIPLINA(cd_disciplina, nome, horas) VALUES (3, 'Anatomia', 4);
## ITEM 04
INSERT INTO UNIVERSIDADE.DISCIPLINA(cd_disciplina, nome, horas) VALUES (4, 'Mecânica dos fluidos', 4);
## ITEM 05
INSERT INTO UNIVERSIDADE.DISCIPLINA(cd_disciplina, nome, horas) VALUES (5, 'Toxicologia', 2);
## ITEM 06
INSERT INTO UNIVERSIDADE.DISCIPLINA(cd_disciplina, nome, horas) VALUES (6, 'Desenho Técnico', 3);
## ITEM 07
INSERT INTO UNIVERSIDADE.DISCIPLINA(cd_disciplina, nome, horas) VALUES (7, 'Cálculo II', 2);
## ITEM 08
INSERT INTO UNIVERSIDADE.DISCIPLINA(cd_disciplina, nome, horas) VALUES (8, 'Prática Supervisionadas em Enfermagem', 1);
## ITEM 09
INSERT INTO UNIVERSIDADE.DISCIPLINA(cd_disciplina, nome, horas) VALUES (9, 'Contabilidade Introdutória', 2);
## ITEM 10
INSERT INTO UNIVERSIDADE.DISCIPLINA(cd_disciplina, nome, horas) VALUES (10, 'História da Psicologia', 5);

## INSERCAO DE DADOS NA TABELA ALUNO
## ITEM 01
INSERT INTO UNIVERSIDADE.ALUNO(cd_aluno, nome, matricula, endereco, data_nascimento, fk_curso) VALUES (1, 'John', 'EM-OUT-2022', 'Rua das Flores', '1990-03-21', 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.ALUNO(cd_aluno, nome, matricula, endereco, data_nascimento, fk_curso) VALUES (2, 'Maria', 'PS-NOV-2022', 'Rua das Palmeiras', '1996-02-01', 1);
## ITEM 03
INSERT INTO UNIVERSIDADE.ALUNO(cd_aluno, nome, matricula, endereco, data_nascimento, fk_curso) VALUES (3, 'Lola', 'MA-JAN-2021', 'Avenida Brasil', '1995-03-10', 2);
## ITEM 04
INSERT INTO UNIVERSIDADE.ALUNO(cd_aluno, nome, matricula, endereco, data_nascimento, fk_curso) VALUES (4, 'Marcos', 'FI-MAR-2021', 'Rua dos Coqueiros', '1999-11-12', 3);
## ITEM 05
INSERT INTO UNIVERSIDADE.ALUNO(cd_aluno, nome, matricula, endereco, data_nascimento, fk_curso) VALUES (5, 'Junior', 'FI-MAR-2020', 'Rua das Frutas', '2000-04-21', 4);
## ITEM 06
INSERT INTO UNIVERSIDADE.ALUNO(cd_aluno, nome, matricula, endereco, data_nascimento, fk_curso) VALUES (6, 'Monica', 'QU-DEZ-2022', 'Rua das Frutas', '2000-05-29', 5);
## ITEM 07
INSERT INTO UNIVERSIDADE.ALUNO(cd_aluno, nome, matricula, endereco, data_nascimento, fk_curso) VALUES (7, 'Ana', 'EN-NOV-2020', 'Rua das Samabaias', '1996-02-23', 5);
## ITEM 08
INSERT INTO UNIVERSIDADE.ALUNO(cd_aluno, nome, matricula, endereco, data_nascimento, fk_curso) VALUES (8, 'Bruna', 'CC-SET-2021', 'Avenida Norte', '1992-03-20', 6);
## ITEM 09
INSERT INTO UNIVERSIDADE.ALUNO(cd_aluno, nome, matricula, endereco, data_nascimento, fk_curso) VALUES (9, 'Cleber', 'AU-JUN-2021', 'Avenida Sul', '1995-11-22', 7);
## ITEM 10
INSERT INTO UNIVERSIDADE.ALUNO(cd_aluno, nome, matricula, endereco, data_nascimento, fk_curso) VALUES (10, 'Cleber', 'AU-JUN-2021', 'Avenida Sul', '1992-01-16', 8);

## INSERCAO DE DADOS NA TABELA OFERTA
## ITEM 01
INSERT INTO UNIVERSIDADE.OFERTA(CD_OFERTA, frequencia, ano, nota, semestre, FK_PROFESSOR, FK_ALUNO, FK_DISCIPLINA) VALUES (1, 100, 2020, 100, 1, 1, 1, 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.OFERTA(CD_OFERTA, frequencia, ano, nota, semestre, FK_PROFESSOR, FK_ALUNO, FK_DISCIPLINA) VALUES (2, 100, 2021, 100, 2, 2, 2, 2);
## ITEM 03
INSERT INTO UNIVERSIDADE.OFERTA(CD_OFERTA, frequencia, ano, nota, semestre, FK_PROFESSOR, FK_ALUNO, FK_DISCIPLINA) VALUES (3, 100, 2021, 100, 1, 3, 3, 3);
## ITEM 04
INSERT INTO UNIVERSIDADE.OFERTA(CD_OFERTA, frequencia, ano, nota, semestre, FK_PROFESSOR, FK_ALUNO, FK_DISCIPLINA) VALUES (4, 100, 2019, 100, 2, 4, 4, 4);
## ITEM 05
INSERT INTO UNIVERSIDADE.OFERTA(CD_OFERTA, frequencia, ano, nota, semestre, FK_PROFESSOR, FK_ALUNO, FK_DISCIPLINA) VALUES (5, 100, 2020, 100, 1, 5, 2, 5);
## ITEM 06
INSERT INTO UNIVERSIDADE.OFERTA(CD_OFERTA, frequencia, ano, nota, semestre, FK_PROFESSOR, FK_ALUNO, FK_DISCIPLINA) VALUES (6, 100, 2021, 100, 2, 5, 3, 6);
## ITEM 07
INSERT INTO UNIVERSIDADE.OFERTA(CD_OFERTA, frequencia, ano, nota, semestre, FK_PROFESSOR, FK_ALUNO, FK_DISCIPLINA) VALUES (7, 100, 2022, 100, 1, 6, 5, 7);
## ITEM 08
INSERT INTO UNIVERSIDADE.OFERTA(CD_OFERTA, frequencia, ano, nota, semestre, FK_PROFESSOR, FK_ALUNO, FK_DISCIPLINA) VALUES (8, 100, 2019, 100, 2, 3, 2, 8);
## ITEM 09
INSERT INTO UNIVERSIDADE.OFERTA(CD_OFERTA, frequencia, ano, nota, semestre, FK_PROFESSOR, FK_ALUNO, FK_DISCIPLINA) VALUES (9, 100, 2019, 100, 1, 2, 4, 9);
## ITEM 10
INSERT INTO UNIVERSIDADE.OFERTA(CD_OFERTA, frequencia, ano, nota, semestre, FK_PROFESSOR, FK_ALUNO, FK_DISCIPLINA) VALUES (10, 100, 2022, 100, 2, 2, 1, 10);

## INSERCAO DE DADOS NA TABELA DEPARTAMENTO_CURSO
## ITEM 01
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(cd_departamento_curso, fk_departamento, fk_curso) VALUES (1, 1, 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(cd_departamento_curso, fk_departamento, fk_curso) VALUES (2, 2, 2);
## ITEM 03
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(cd_departamento_curso, fk_departamento, fk_curso) VALUES (3, 3, 3);
## ITEM 04
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(cd_departamento_curso, fk_departamento, fk_curso) VALUES (4, 4, 4);
## ITEM 05
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(cd_departamento_curso, fk_departamento, fk_curso) VALUES (5, 5, 5);
## ITEM 06
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(cd_departamento_curso, fk_departamento, fk_curso) VALUES (6, 6, 6);
## ITEM 07
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(cd_departamento_curso, fk_departamento, fk_curso) VALUES (7, 7, 7);
## ITEM 08
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(cd_departamento_curso, fk_departamento, fk_curso) VALUES (8, 8, 8);
## ITEM 09
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(cd_departamento_curso, fk_departamento, fk_curso) VALUES (9, 9, 9);
## ITEM 10
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(cd_departamento_curso, fk_departamento, fk_curso) VALUES (10, 10, 10);

## INSERCAO DE DADOS NA TABELA DEPARTAMENTO_CURSO
## ITEM 01
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(cd_disciplina_curso, fk_curso, FK_DISCIPLINA) VALUES (1, 1, 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(cd_disciplina_curso, fk_curso, FK_DISCIPLINA) VALUES (2, 1, 2);
## ITEM 03
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(cd_disciplina_curso, fk_curso, FK_DISCIPLINA) VALUES (3, 2, 3);
## ITEM 04
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(cd_disciplina_curso, fk_curso, FK_DISCIPLINA) VALUES (4, 2, 4);
## ITEM 05
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(cd_disciplina_curso, fk_curso, FK_DISCIPLINA) VALUES (5, 3, 5);
## ITEM 06
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(cd_disciplina_curso, fk_curso, FK_DISCIPLINA) VALUES (6, 4, 6);
## ITEM 07
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(cd_disciplina_curso, fk_curso, FK_DISCIPLINA) VALUES (7, 5, 7);
## ITEM 08
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(cd_disciplina_curso, fk_curso, FK_DISCIPLINA) VALUES (8, 6, 8);
## ITEM 09
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(cd_disciplina_curso, fk_curso, FK_DISCIPLINA) VALUES (9, 7, 9);
## ITEM 10
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(cd_disciplina_curso, fk_curso, FK_DISCIPLINA) VALUES (10, 8, 10);

## ATUALIZAR NUMERO_ALUNOS PARA 50 EM TODOS OS CURSOS
UPDATE UNIVERSIDADE.CURSO SET NUMERO_ALUNOS = 50 WHERE NUMERO_ALUNOS <= 49;

## ATUALIZAR endereco DO ALUNO COM nome 'Junior' PARA 'Rua das Trocas'
UPDATE universidade.aluno SET endereco = 'Rua das Trocas' WHERE nome = 'Junior';

## ALTERA TABELA ALUNO ADICIONANDO UMA COLUNA email
ALTER TABLE universidade.aluno ADD email varchar(50);

## ALTERA TABELA ALUNO REMOVENDO UMA COLUNA email
ALTER TABLE universidade.aluno DROP COLUMN email;

## ATUALIZAR nome DO ALUNO COM codigo 10 PARA 'Fagundes'
UPDATE universidade.aluno SET nome = 'Fagundes' WHERE CD_ALUNO = 10;

## ATUALIZAR endereco DO ALUNO COM codigo 10 PARA 'Avenida Oeste'
UPDATE universidade.aluno SET endereco = 'Avenida Oeste' WHERE CD_ALUNO = 10;

## ATUALIZAR matricula DO ALUNO COM codigo 10 PARA 'FA-AGO-2019'
UPDATE universidade.aluno SET matricula = 'FA-AGO-2019' WHERE CD_ALUNO = 10;

## CRIA TABELA TESTE PARA PODER DELETAR DEPOIS
CREATE TABLE UNIVERSIDADE.TESTE(codigo INTEGER NOT NULL AUTO_INCREMENT,
                                       PRIMARY KEY(codigo)) ENGINE = INNODB;

## DELETAR TABELA TESTE 
DROP TABLE UNIVERSIDADE.TESTE;

## SELECT NA COLUNA codigo E horas DA TABELA ALUNO ONDE horas É MAIOR QUE 2
SELECT CD_DISCIPLINA, horas FROM UNIVERSIDADE.disciplina WHERE horas > 2;

## SELECT COM JOIN
SELECT ALUNO.NOME, curso.NOME FROM aluno JOIN curso ON aluno.FK_CURSO = curso.CD_CURSO;

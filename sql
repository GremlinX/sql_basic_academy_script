DROP DATABASE if EXISTS UNIVERSIDADE;
## CRIA O BANCO UNIVERSIDADE
CREATE DATABASE UNIVERSIDADE;

## CRIA A TABELA DEPARTAMENTO
CREATE TABLE UNIVERSIDADE.DEPARTAMENTO(codigo INTEGER NOT NULL AUTO_INCREMENT,
                                       PRIMARY KEY( codigo ),
                                       nome varchar(50),
                                       campus varchar(50));


## CRIA TABELA PROFESSOR
CREATE TABLE UNIVERSIDADE.PROFESSOR(codigo INTEGER NOT NULL AUTO_INCREMENT,
                                    PRIMARY KEY( codigo ),
                                    nome varchar(50),
                                    cpf integer,
                                    salario float,
                                    dataNascimento date,
                                    cdDepartamento integer,
                                    CONSTRAINT fkDepartamento FOREIGN KEY (cdDepartamento) REFERENCES DEPARTAMENTO(codigo));                


## CRIA TABELA TITULACAO
CREATE TABLE UNIVERSIDADE.TITULACAO(codigo INTEGER NOT NULL AUTO_INCREMENT,
                                    PRIMARY KEY( codigo ),
                                    instituicao varchar(50),
                                    curso varchar(50),
                                    grau varchar(50),
                                    cdProfessor integer,
                                    CONSTRAINT fkProfessor FOREIGN KEY (cdProfessor) REFERENCES PROFESSOR(codigo));
        
        
## CRIA TABELA DEPENDENTE
CREATE TABLE UNIVERSIDADE.DEPENDENTE(codigo INTEGER NOT NULL AUTO_INCREMENT,
                                     PRIMARY KEY( codigo ),
                                     nome varchar(50),
                                     relacionamento varchar(50),
                                     dataNascimento date,
                                     cdProfessor integer,
                                     CONSTRAINT fkProfessor FOREIGN KEY (cdProfessor) REFERENCES PROFESSOR(codigo));


## CRIA TABELA CURSO
CREATE TABLE UNIVERSIDADE.CURSO(codigo INTEGER NOT NULL AUTO_INCREMENT,
                                PRIMARY KEY( codigo ),
                                nome varchar(50),
                                turno varchar(50),
                                numeroAlunos integer);
    
    
## CRIA TABELA OFERTA
CREATE TABLE UNIVERSIDADE.OFERTA(codigo integer PRIMARY KEY,
                                frequencia integer,
                                ano integer,
                                nota float,
                                semestre integer,
                                cdProfessor integer,
                                cdAluno integer,
                                cdDisciplina integer,
                                CONSTRAINT fkProfessor FOREIGN KEY (cdProfessor) REFERENCES PROFESSOR(codigo),
                                CONSTRAINT fkAluno FOREIGN KEY (cdAluno) REFERENCES ALUNO(codigo),
                                CONSTRAINT fkDisciplina FOREIGN KEY (cdDisciplina) REFERENCES DISCIPLINA(codigo));


## CRIA TABELA DISCIPLINA
CREATE TABLE UNIVERSIDADE.DISCIPLINA(codigo integer PRIMARY KEY,
                                     nome varchar(50),
                                     horas integer,
                                     cdPreRequisito integer,
                                     CONSTRAINT fkPreRequisito FOREIGN KEY (cdPreRequisito) REFERENCES PREREQUISITO(codigo));


## CRIA TABELA ALUNO
CREATE TABLE UNIVERSIDADE.ALUNO(codigo integer PRIMARY KEY,
                                nome varchar(50),
                                matricula varchar(50),
                                endereco varchar(50),
                                dataNascimento date,
                                cdCurso integer,
                                CONSTRAINT fkCurso FOREIGN KEY (cdCurso) REFERENCES CURSO(codigo));
 
 
## CRIA TABELA DEPARTAMENTO_CURSO
CREATE TABLE UNIVERSIDADE.DEPARTAMENTO_CURSO(codigo integer PRIMARY KEY,
                                             cdDepartamento integer,
                                             cdCurso integer,
                                             CONSTRAINT fkDepartamento FOREIGN KEY (cdDepartamento) REFERENCES DEPARTAMENTO(codigo),
                                             CONSTRAINT fkCurso FOREIGN KEY (cdCurso) REFERENCES CURSO(codigo));
 
 
## CRIA TABELA DISCIPLINA_CURSO
CREATE TABLE UNIVERSIDADE.DISCIPLINA_CURSO(codigo integer PRIMARY KEY,
                                           cdCurso integer,
                                           cdDisciplina integer,
                                           CONSTRAINT fkCurso FOREIGN KEY (cdCurso) REFERENCES CURSO(codigo),
                                           CONSTRAINT fkDisciplina FOREIGN KEY (cdDisciplina) REFERENCES DISCIPLINA(codigo));
            
            
## INSERCAO DE DADOS NA TABELA DEPARTAMENTO
## ITEM 01
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (codigo, nome, campus) VALUES (1, 'Matemática', 'UEM');
## ITEM 02
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (codigo, nome, campus) VALUES (2, 'Química', 'UEM');
## ITEM 03
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (codigo, nome, campus) VALUES (3, 'Arquitetura e Urbanismo', 'UEM');
## ITEM 04
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (codigo, nome, campus) VALUES (4, 'Física', 'UEM');
## ITEM 05
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (codigo, nome, campus) VALUES (5, 'Estística', 'UEM');
## ITEM 06
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (codigo, nome, campus) VALUES (6, 'Farmácia', 'UEM');
## ITEM 07
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (codigo, nome, campus) VALUES (7, 'Engenharia Química', 'UEM');
## ITEM 08
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (codigo, nome, campus) VALUES (8, 'Enfermagem', 'UEM');
## ITEM 09
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (codigo, nome, campus) VALUES (9, 'Engenharia Mecânica', 'UEM');
## ITEM 10
INSERT INTO UNIVERSIDADE.DEPARTAMENTO (codigo, nome, campus) VALUES (10, 'Psicologia', 'UEM');


## INSERCAO DE DADOS NA TABELA PROFESSOR
## ITEM 01
INSERT INTO UNIVERSIDADE.PROFESSOR (codigo, nome, cpf, salario, dataNascimento, cdDepartamento) VALUES (1, 'Alberto', 10, 1000.00, '2022-01-01', 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.PROFESSOR (codigo, nome, cpf, salario, dataNascimento, cdDepartamento) VALUES (2, 'Bruno', 11, 2000.00, '2022-02-02', 1);
## ITEM 03
INSERT INTO UNIVERSIDADE.PROFESSOR (codigo, nome, cpf, salario, dataNascimento, cdDepartamento) VALUES (3, 'Carlos', 12, 3000.00, '2022-03-03', 1);
## ITEM 04
INSERT INTO UNIVERSIDADE.PROFESSOR (codigo, nome, cpf, salario, dataNascimento, cdDepartamento) VALUES (4, 'Diana', 13, 4000.00, '2022-04-04', 1);
## ITEM 05
INSERT INTO UNIVERSIDADE.PROFESSOR (codigo, nome, cpf, salario, dataNascimento, cdDepartamento) VALUES (5, 'Elaine', 14, 5000.00, '2022-05-05', 1);
## ITEM 06
INSERT INTO UNIVERSIDADE.PROFESSOR (codigo, nome, cpf, salario, dataNascimento, cdDepartamento) VALUES (6, 'Fabio', 15, 6000.00, '2022-06-06', 2);
## ITEM 07
INSERT INTO UNIVERSIDADE.PROFESSOR (codigo, nome, cpf, salario, dataNascimento, cdDepartamento) VALUES (7, 'Gustavo', 16, 7000.00, '2022-07-07', 2);
## ITEM 08
INSERT INTO UNIVERSIDADE.PROFESSOR (codigo, nome, cpf, salario, dataNascimento, cdDepartamento) VALUES (8, 'Henrique', 17, 8000.00, '2022-08-08', 3);
## ITEM 09
INSERT INTO UNIVERSIDADE.PROFESSOR (codigo, nome, cpf, salario, dataNascimento, cdDepartamento) VALUES (9, 'Isabela', 18, 8000.00, '2022-09-09', 4);
## ITEM 10
INSERT INTO UNIVERSIDADE.PROFESSOR (codigo, nome, cpf, salario, dataNascimento, cdDepartamento) VALUES (10, 'João', 19, 8000.00, '2022-10-10', 5);


## INSERCAO DE DADOS NA TABELA TITULACAO 
## ITEM 01
INSERT INTO UNIVERSIDADE.TITULACAO(codigo, instituicao, curso, grau, cdProfessor) VALUES (1, 'UTFPR', 'Matemática', 'Especialização', 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.TITULACAO(codigo, instituicao, curso, grau, cdProfessor) VALUES (2, 'UEL', 'Química', 'Especialização', 2);
## ITEM 03
INSERT INTO UNIVERSIDADE.TITULACAO(codigo, instituicao, curso, grau, cdProfessor) VALUES (3, 'UNEB', 'Arquitetura e Urbanismo', 'Especialização', 3);
## ITEM 04
INSERT INTO UNIVERSIDADE.TITULACAO(codigo, instituicao, curso, grau, cdProfessor) VALUES (4, 'UFBA', 'Física', 'Especialização', 4);
## ITEM 05
INSERT INTO UNIVERSIDADE.TITULACAO(codigo, instituicao, curso, grau, cdProfessor) VALUES (5, 'UNB', 'Estística', 'Especialização', 5);
## ITEM 06
INSERT INTO UNIVERSIDADE.TITULACAO(codigo, instituicao, curso, grau, cdProfessor) VALUES (6, 'UFRB', 'Farmácia', 'Especialização', 6);
## ITEM 07
INSERT INTO UNIVERSIDADE.TITULACAO(codigo, instituicao, curso, grau, cdProfessor) VALUES (7, 'FTC', 'Engenharia Química', 'Mestrado', 7);
## ITEM 08
INSERT INTO UNIVERSIDADE.TITULACAO(codigo, instituicao, curso, grau, cdProfessor) VALUES (8, 'UNIOESTE', 'Enfermagem', 'Mestrado', 8);
## ITEM 09
INSERT INTO UNIVERSIDADE.TITULACAO(codigo, instituicao, curso, grau, cdProfessor) VALUES (9, 'USP', 'Engenharia Mecânica', 'Mestrado', 9);
## ITEM 10
INSERT INTO UNIVERSIDADE.TITULACAO(codigo, instituicao, curso, grau, cdProfessor) VALUES (10, 'ITA', 'Psicologia', 'Doutorado', 10);


## INSERCAO DE DADOS NA TABELA DEPENDENTES
## ITEM 01
INSERT INTO UNIVERSIDADE.DEPENDENTE(codigo, nome, relacionamento, dataNascimento, cdProfessor) VALUES (1, 'Zophia', 'Filha', '2022-10-03', 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.DEPENDENTE(codigo, nome, relacionamento, dataNascimento, cdProfessor) VALUES (2, 'Yolanda', 'Filha', '2022-05-11', 1);
## ITEM 03
INSERT INTO UNIVERSIDADE.DEPENDENTE(codigo, nome, relacionamento, dataNascimento, cdProfessor) VALUES (3, 'Xande', 'Filho', '2022-11-25', 2);
## ITEM 04
INSERT INTO UNIVERSIDADE.DEPENDENTE(codigo, nome, relacionamento, dataNascimento, cdProfessor) VALUES (4, 'Wanderley', 'Filho', '2022-01-19', 2);
## ITEM 05
INSERT INTO UNIVERSIDADE.DEPENDENTE(codigo, nome, relacionamento, dataNascimento, cdProfessor) VALUES (5, 'Valcir', 'Filho', '2022-02-12', 3);


## INSERCAO DE DADOS NA TABELA CURSO
## ITEM 01
INSERT INTO UNIVERSIDADE.CURSO(codigo, nome, turno, numeroAlunos) VALUES (1, 'Matemática', 'Matutino', 50);
## ITEM 02
INSERT INTO UNIVERSIDADE.CURSO(codigo, nome, turno, numeroAlunos) VALUES (2, 'Química', 'Matutino', 49);
## ITEM 03
INSERT INTO UNIVERSIDADE.CURSO(codigo, nome, turno, numeroAlunos) VALUES (3, 'Enfermagem', 'Matutino', 48);
## ITEM 04
INSERT INTO UNIVERSIDADE.CURSO(codigo, nome, turno, numeroAlunos) VALUES (4, 'Engenharia Mecânica', 'Matutino', 47);
## ITEM 05
INSERT INTO UNIVERSIDADE.CURSO(codigo, nome, turno, numeroAlunos) VALUES (5, 'Farmárcia', 'Vespertino', 46);
## ITEM 06
INSERT INTO UNIVERSIDADE.CURSO(codigo, nome, turno, numeroAlunos) VALUES (6, 'Arquitetura e Urbanismo', 'Vespertino', 45);
## ITEM 07
INSERT INTO UNIVERSIDADE.CURSO(codigo, nome, turno, numeroAlunos) VALUES (7, 'Física', 'Vespertino', 45);
## ITEM 08
INSERT INTO UNIVERSIDADE.CURSO(codigo, nome, turno, numeroAlunos) VALUES (8, 'Medicina', 'Vespertino', 45);
## ITEM 09
INSERT INTO UNIVERSIDADE.CURSO(codigo, nome, turno, numeroAlunos) VALUES (9, 'Ciências Contábeis', 'Vespertino', 45);
## ITEM 10
INSERT INTO UNIVERSIDADE.CURSO(codigo, nome, turno, numeroAlunos) VALUES (10, 'Psicologia', 'Noturno', 45);


## INSERCAO DE DADOS NA TABELA DISCIPLINA
## ITEM 01
INSERT INTO UNIVERSIDADE.DISCIPLINA(codigo, nome, horas, cdPreRequisito) VALUES (1, 'Cálculo I', 2, 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.DISCIPLINA(codigo, nome, horas, cdPreRequisito) VALUES (2, 'Qúimica Orgânica', 3, 2);
## ITEM 03
INSERT INTO UNIVERSIDADE.DISCIPLINA(codigo, nome, horas, cdPreRequisito) VALUES (3, 'Anatomia', 4, 3);
## ITEM 04
INSERT INTO UNIVERSIDADE.DISCIPLINA(codigo, nome, horas, cdPreRequisito) VALUES (4, 'Mecânica dos fluidos', 4, 1);
## ITEM 05
INSERT INTO UNIVERSIDADE.DISCIPLINA(codigo, nome, horas, cdPreRequisito) VALUES (5, 'Toxicologia', 2, 2);
## ITEM 06
INSERT INTO UNIVERSIDADE.DISCIPLINA(codigo, nome, horas, cdPreRequisito) VALUES (6, 'Desenho Técnico', 3, 3);
## ITEM 07
INSERT INTO UNIVERSIDADE.DISCIPLINA(codigo, nome, horas, cdPreRequisito) VALUES (7, 'Cálculo II', 2, 1);
## ITEM 08
INSERT INTO UNIVERSIDADE.DISCIPLINA(codigo, nome, horas, cdPreRequisito) VALUES (8, 'Prática Supervisionadas em Enfermagem', 1, 2);
## ITEM 09
INSERT INTO UNIVERSIDADE.DISCIPLINA(codigo, nome, horas, cdPreRequisito) VALUES (9, 'Contabilidade Introdutória', 2, 3);
## ITEM 10
INSERT INTO UNIVERSIDADE.DISCIPLINA(codigo, nome, horas, cdPreRequisito) VALUES (10, 'História da Psicologia', 5, 1);


## INSERCAO DE DADOS NA TABELA ALUNO
## ITEM 01
INSERT INTO UNIVERSIDADE.ALUNO(codigo, nome, matricula, endereco, dataNascimento, cdCurso) VALUES (1, 'John', 'EM-OUT-2022', 'Rua das Flores', '1990-03-21', 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.ALUNO(codigo, nome, matricula, endereco, dataNascimento, cdCurso) VALUES (2, 'Maria', 'PS-NOV-2022', 'Rua das Palmeiras', '1996-02-01', 1);
## ITEM 03
INSERT INTO UNIVERSIDADE.ALUNO(codigo, nome, matricula, endereco, dataNascimento, cdCurso) VALUES (3, 'Lola', 'MA-JAN-2021', 'Avenida Brasil', '1995-03-10', 2);
## ITEM 04
INSERT INTO UNIVERSIDADE.ALUNO(codigo, nome, matricula, endereco, dataNascimento, cdCurso) VALUES (4, 'Marcos', 'FI-MAR-2021', 'Rua dos Coqueiros', '1999-11-12', 3);
## ITEM 05
INSERT INTO UNIVERSIDADE.ALUNO(codigo, nome, matricula, endereco, dataNascimento, cdCurso) VALUES (5, 'Junior', 'FI-MAR-2020', 'Rua das Frutas', '2000-04-21', 4);
## ITEM 06
INSERT INTO UNIVERSIDADE.ALUNO(codigo, nome, matricula, endereco, dataNascimento, cdCurso) VALUES (6, 'Monica', 'QU-DEZ-2022', 'Rua das Frutas', '2000-05-29', 5);
## ITEM 07
INSERT INTO UNIVERSIDADE.ALUNO(codigo, nome, matricula, endereco, dataNascimento, cdCurso) VALUES (7, 'Ana', 'EN-NOV-2020', 'Rua das Samabaias', '1996-02-23', 5);
## ITEM 08
INSERT INTO UNIVERSIDADE.ALUNO(codigo, nome, matricula, endereco, dataNascimento, cdCurso) VALUES (8, 'Bruna', 'CC-SET-2021', 'Avenida Norte', '1992-03-20', 6);
## ITEM 09
INSERT INTO UNIVERSIDADE.ALUNO(codigo, nome, matricula, endereco, dataNascimento, cdCurso) VALUES (9, 'Cleber', 'AU-JUN-2021', 'Avenida Sul', '1995-11-22', 7);
## ITEM 10
INSERT INTO UNIVERSIDADE.ALUNO(codigo, nome, matricula, endereco, dataNascimento, cdCurso) VALUES (10, 'Cleber', 'AU-JUN-2021', 'Avenida Sul', '1992-01-16', 8);


## INSERCAO DE DADOS NA TABELA OFERTA
## ITEM 01
INSERT INTO UNIVERSIDADE.OFERTA(codigo, frequencia, ano, nota, semestre, cdProfessor, cdAluno, cdDisciplina) VALUES (1, 100, 2020, 100, 1, 1, 1, 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.OFERTA(codigo, frequencia, ano, nota, semestre, cdProfessor, cdAluno, cdDisciplina) VALUES (2, 100, 2021, 100, 2, 2, 2, 2);
## ITEM 03
INSERT INTO UNIVERSIDADE.OFERTA(codigo, frequencia, ano, nota, semestre, cdProfessor, cdAluno, cdDisciplina) VALUES (3, 100, 2021, 100, 1, 3, 3, 3);
## ITEM 04
INSERT INTO UNIVERSIDADE.OFERTA(codigo, frequencia, ano, nota, semestre, cdProfessor, cdAluno, cdDisciplina) VALUES (4, 100, 2019, 100, 2, 4, 4, 4);
## ITEM 05
INSERT INTO UNIVERSIDADE.OFERTA(codigo, frequencia, ano, nota, semestre, cdProfessor, cdAluno, cdDisciplina) VALUES (5, 100, 2020, 100, 1, 5, 2, 5);
## ITEM 06
INSERT INTO UNIVERSIDADE.OFERTA(codigo, frequencia, ano, nota, semestre, cdProfessor, cdAluno, cdDisciplina) VALUES (6, 100, 2021, 100, 2, 5, 3, 6);
## ITEM 07
INSERT INTO UNIVERSIDADE.OFERTA(codigo, frequencia, ano, nota, semestre, cdProfessor, cdAluno, cdDisciplina) VALUES (7, 100, 2022, 100, 1, 6, 5, 7);
## ITEM 08
INSERT INTO UNIVERSIDADE.OFERTA(codigo, frequencia, ano, nota, semestre, cdProfessor, cdAluno, cdDisciplina) VALUES (8, 100, 2019, 100, 2, 3, 2, 8);
## ITEM 09
INSERT INTO UNIVERSIDADE.OFERTA(codigo, frequencia, ano, nota, semestre, cdProfessor, cdAluno, cdDisciplina) VALUES (9, 100, 2019, 100, 1, 2, 4, 9);
## ITEM 10
INSERT INTO UNIVERSIDADE.OFERTA(codigo, frequencia, ano, nota, semestre, cdProfessor, cdAluno, cdDisciplina) VALUES (10, 100, 2022, 100, 2, 2, 1, 10);


## INSERCAO DE DADOS NA TABELA DEPARTAMENTO_CURSO
## ITEM 01
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(codigo, cdDepartamento, cdCurso) VALUES (1, 1, 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(codigo, cdDepartamento, cdCurso) VALUES (2, 2, 2);
## ITEM 03
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(codigo, cdDepartamento, cdCurso) VALUES (3, 3, 3);
## ITEM 04
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(codigo, cdDepartamento, cdCurso) VALUES (4, 4, 4);
## ITEM 05
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(codigo, cdDepartamento, cdCurso) VALUES (5, 5, 5);
## ITEM 06
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(codigo, cdDepartamento, cdCurso) VALUES (6, 6, 6);
## ITEM 07
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(codigo, cdDepartamento, cdCurso) VALUES (7, 7, 7);
## ITEM 08
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(codigo, cdDepartamento, cdCurso) VALUES (8, 8, 8);
## ITEM 09
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(codigo, cdDepartamento, cdCurso) VALUES (9, 9, 9);
## ITEM 10
INSERT INTO UNIVERSIDADE.DEPARTAMENTO_CURSO(codigo, cdDepartamento, cdCurso) VALUES (10, 10, 10);


## INSERCAO DE DADOS NA TABELA DEPARTAMENTO_CURSO
## ITEM 01
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(codigo, cdCurso, cdDisciplina) VALUES (1, 1, 1);
## ITEM 02
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(codigo, cdCurso, cdDisciplina) VALUES (2, 1, 2);
## ITEM 03
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(codigo, cdCurso, cdDisciplina) VALUES (3, 2, 3);
## ITEM 04
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(codigo, cdCurso, cdDisciplina) VALUES (4, 2, 4);
## ITEM 05
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(codigo, cdCurso, cdDisciplina) VALUES (5, 3, 5);
## ITEM 06
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(codigo, cdCurso, cdDisciplina) VALUES (6, 4, 6);
## ITEM 07
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(codigo, cdCurso, cdDisciplina) VALUES (7, 5, 7);
## ITEM 08
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(codigo, cdCurso, cdDisciplina) VALUES (8, 6, 8);
## ITEM 09
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(codigo, cdCurso, cdDisciplina) VALUES (9, 7, 9);
## ITEM 10
INSERT INTO UNIVERSIDADE.DISCIPLINA_CURSO(codigo, cdCurso, cdDisciplina) VALUES (10, 8, 10);


## ATUALIZAR numeroAlunos PARA 50 EM TODOS OS CURSOS
UPDATE UNIVERSIDADE.CURSO SET numeroAlunos = 50 WHERE numeroAlunos <= 49;

## ATUALIZAR nome DO ALUNO COM codigo 10 PARA 'Fagundes'
UPDATE universidade.aluno SET nome = 'Fagundes' WHERE codigo = 10;

## ATUALIZAR endereco DO ALUNO COM nome 'Junior' PARA 'Rua das Trocas'
UPDATE universidade.aluno SET endereco = 'Rua das Trocas' WHERE nome = 'Junior';

## ALTERA TABELA ALUNO ADICIONANDO UMA COLUNA email
ALTER TABLE universidade.aluno ADD email varchar(255);

## ALTERA TABELA ALUNO REMOVENDO UMA COLUNA email
ALTER TABLE universidade.aluno DROP COLUMN email;

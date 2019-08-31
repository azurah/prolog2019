/*pai(adao, caim).
pai(adao, abel).
pai(adao, seth).
pai(seth, enos).

avo(X, Y) :- pai(X, Z), pai(Z, Y).*/


/**
 Uma forma de interpretar estes fatos é como se fossem três tabelas: a tabela estudante lista os
números de matrícula e os nomes de estudantes, a tabela curso lista o código da disciplina e o
nome da disciplina, a tabela matriculado lista os cursos nos quais os alunos estão matriculados,
usando os números de matrícula para identicar alunos e códigos de disciplina para identicar
cursos.
(a) Crie um predicado cursa(Nome, Curso), que é verdade se o estudante cujo nome é Nome
cursa a disciplina chamada Curso.
(b) Use o predicado que você criou para obter a lista dos estudantes matriculados em truco.
 */

estudante(1234, 'Alan Almeida').
estudante(2345, 'Bruno Barros').
estudante(3456, 'Carla Chaves').
estudante(4567, 'Denise Duran').
estudante(5678, 'Enio Esteves').
                              
curso(666, domino).
curso(069, truco).
curso(171, poker).
                              
matriculado(1234, 666).
matriculado(1234, 069).
matriculado(1234, 171).
matriculado(2345, 069).
matriculado(3456, 171).
matriculado(4567, 069).
matriculado(5678, 171).

cursa(N, C) :- estudante(X, N), matriculado(X, Y), curso(Y, C).

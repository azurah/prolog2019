/**
Q1. Uma forma de interpretar estes fatos é como se fossem três tabelas: a tabela estudante lista os
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

% letra a
cursa(N, C) :- estudante(X, N), matriculado(X, Y), curso(Y, C).
% letra b
cursa(X,truco).

/*
Q2. Considere o seguinte conjunto de fatos, um pequeno dicionário que define palavras e suas classes
gramaticais:

    palavra(artigo, um).
    palavra(artigo, o).
    palavra(substantivo, bandido).
    palavra(substantivo, hamburguer).
    palavra(pronome, algum).
    palavra(pronome, todo).
    palavra(verbo, come).
    palavra(verbo, rouba).
    
(a) Escreva uma regra gramatical (frase(P1, P2, P3, P4, P5)) que diz que toda frase de 5
palavras é válida se a primeira é um artigo, a segunda é um substantivo, a terceira é um
verbo, a quarta é um pronome e a última é um substantivo.

(b) A frase "o bandido rouba um hamburguer" é válida segunda a regra do item anterior?

(c) Quantas frases diferentes podem ser formadas usando essa regra gramatical e o dicionário
fornecido?
*/
% Letra a

frase(P1, P2, P3, P4, P5) :- 
    (
        palavra(artigo, P1);
        palavra(artigo, P1)   
    ), 
    (
        palavra(substantivo, P2);
        palavra(substantivo, P2)
    ), 
    (
        palavra(verbo, P3);
        palavra(verbo, P3)
    ), 
    (
        palavra(pronome, P4);
        palavra(pronome, P4)
    ), 
    (
        palavra(substantivo, P5);
        palavra(substantivo, P5)
    ).
  
  % letra b
  ?- frase(o, bandido, rouba, um, hamburguer).
  Resposta: false.
  
  % letra c
  ?- X is 2**5.
  Resposta: 16. 
  % OBS: Basta observarmos que em cada regra gramatical há 2 alternativas e a frase possuí 5 palavras, donde concluímos 32 possibilidades.
 

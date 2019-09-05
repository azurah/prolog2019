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

/*
3. Considere os seguintes fatos onde pai(X, Y) é verdade se X é pai de Y:

  pai(a, b).
  pai(a, c). 
  pai(b, d). 
  pai(b, e). 
  pai(c, f).
  
(a) Defina um predicado irmao(X, Y) que é verdade se X é irmão de Y.

(b) Defina um predicado primo(X, Y) que é verdade se X é primo de Y.

(c) Defina um predicado neto(X, Y) que é verdade se X é neto de Y.

(d) Defina um predicado descendente(X, Y) que é verdade se X é descendente de Y.

(e) Defina um predicado avo(X) que é verdade se X é avô de alguém.
*/
   pai(a, b).
    pai(a, c). 
    pai(b, d). 
    pai(b, e). 
    pai(c, f).

% letra e
avo(X, Z) :- pai(Y, Z), pai(X, Y).

% letra c
neto(X, Z) :- pai(Y, X), pai(Z, Y). 

% letra a
irmao(X, Z) :- pai(Y, X), pai(Y, Z).

%letra b -- em dúvida
primo(X, Z) :- pai(P, X), pai(S, Z), irmao(P, S).

%letra d
descendente(Z, X) :- pai(X, Z); avo(X,Z). 

/*
4) Um mapa de um certo jogo é composto por várias salas numeradas, conectadas por portais.
Alguns pares de salas estão conectados, outros não. Os portais permitem que o jogador passe
de uma sala para outra, mas apenas em um sentido, ou seja, o portal que leva da sala 1 para a
sala 2 não permite que o jogador retorne da sala 2 para a sala 1. Considere a seguinte lista de
conexões, onde c(X, Y) é verdade se é possível ir de X para Y:

c(1, 2). 
c(3, 4). 
c(5, 6).
c(7, 8). 
c(9, 10). 
c(12, 13).
c(13, 14). 
c(15, 16). 
c(17, 18). 
c(19, 20). 
c(4, 1). 
c(6, 3).
c(4, 7). 
c(6, 11). 
c(14, 9). 
c(11, 15). 
c(16, 12). 
c(14, 17). 
c(16, 19).

(a) Defina um predicado vai(X, Y) que é verdade se existe um caminho, direto ou indireto,
que leva o jogador da sala X para a sala Y.

(b) Há alguma sala inalcançável a partir das demais? Se sim, quais?

(c) Quais salas deixam o jogador preso?

(d) Qual a sala com menor número a partir da qual é possível chegar na sala 20?

(e) Suponha agora que as conexões são bi-direcionais. O predicado do primeiro item ainda
funciona? Por que?
*/

c(1, 2). 
c(3, 4). 
c(5, 6).
c(7, 8). 
c(9, 10). 
c(12, 13).
c(13, 14). 
c(15, 16). 
c(17, 18). 
c(19, 20). 
c(4, 1). 
c(6, 3).
c(4, 7). 
c(6, 11). 
c(14, 9). 
c(11, 15). 
c(16, 12). 
c(14, 17). 
c(16, 19).

% letra a
vai(X, Y) :- c(X, Y).
vai(X, Y):- c(X, Z), vai(Z, Y).

%letra b
%salas 5 é inalcançavel uma vez que nenhuma sala leva a ela.
hasSome(X) :- vai(Z, X), write(Z). 
whoAnter(Z) :- findall(X, vai(X, Z), L),write(L).


%letra c
%As salas 2, 8, 20, 18, 10 deixam o jogador preso. 
semProx(Z) :- findall(X, vai(Z, X), L), write(L).

%letra d
%Sala 5.
%encontrar o minimo de uma lista
min_list([Min],Min).

min_list([H,K|T],M) :-
    H =< K,                             
    min_list([H|T],M).               

min_list([H,K|T],M) :-
    H > K,                             
    min_list([K|T],M).  

%Encontrar o valor menor antes 20
minAnterior20(Z) :-  findall(X, vai(X, Z), L), min_list(L, Y), write(Y).

/* 
Q7. Implemente os seguintes métodos para manipulação de matrizes:
(a) Transposição (existe o predicado transpose no PROLOG, não use)
(b) Multiplicação
(c) Inversão (no SIGAA tem a explicação de um método de inversão, caso não lembre). Assuma que as matrizes são listas de listas de números, as listas internas são as linhas. Ex:
[[1, 2], [3, 4], [5, 6]] é uma matriz com 3 linhas e 2 colunas, onde a primeira linha tem elementos 1 e 2, a segunda tem elementos 3 e 4 e a terceira tem elementos 5 e 6. Nomes a usar os predicados: trans(A, Y), mult(A, B, Y) e inv(A, Y). Em todos os casos Y deve ser unificado com a resposta desejada
*/
%(a) Transposta de uma matriz
transpose_Mine([[]|_], []).
transpose_Mine(Matrix, [Row|Rows]) :- 
transpose_1(Matrix, Row, RestMatrix), transpose_Mine(RestMatrix, Rows).
transpose_1([], [], []).
transpose_1([[H|T]|Rows], [H|Hs], [T|Ts]) :-
 transpose_1(Rows, Hs, Ts).

/*(consulta teste)
 ?- transpose_Mine([[1, 2, 3], [4, 5, 6], [7, 8, 9]], R), print(R).*/


%(b) Multiplicação entre duas matrizes. N é o produto escalar das listas V1 and V2.
dot(V1, V2, N)  :-  maplist(product, V1, V2, P), sumlist(P, N).
product(N1, N2, N3) :- N3 is N1*N2.
 % M3 é o produto de M1 and M2
mmult(M1, M2, M3)  :-  transpose_Mine(M2,MT), maplist(mm_helper(MT), M1, M3).
mm_helper(M2, I1, M3) :- maplist(dot(I1), M2, M3).
%(c) Matriz Inversa
% rev(+M, -M2) – lista inversa
rev(M, M2) :- halves(M, [], M2).
% halves(+A, +B, -C).
halves([X|T], Acc, M2) :- halves(T, [X| Acc], M2).
halves([], X, X).

/* 
Q5. Quando é aplicado o método da resolução a uma fórmula lógica, tanto proposicional quanto
de predicados, e chegamos em uma cláusula vazia, sabemos que a fórmula é insatisfazível. No
entanto, na programação lógica (que é baseada no método da resolução) dizemos que a consulta
é consequência lógica do programa quando encontramos a cláusula vazia. Em um caso a cláusula vazia representa contradição e no outro representa tautologia. Mostre que não há incoerência entre as duas interpretações.

Reposta:
Em programação logica, fatos conhecidos são utilizados como base para que possamos responder a perguntas sobre outros fatos, desconhecidos. Acaso nosso algoritmo nos retorne uma lista vazia a pergunta feita, isto indicaria que não existe uma solução válida nas informações presentes, desta forma, a consulta realizada é falsa. Todavia, se fizermos uma consulta e o algoritmo nos retorne uma lista vazia, entendemos que a consulta realizada é verdadeira. Então, pode ser que obtenhamos uma contradição ou uma tautologia, a depender do algoritmo proposto (uma falha? Não!). Na lógica de predicados, pela própria definição, encontramos sempre para uma solução vazia que a formula é insatisfazível. Portanto, entendemos que em programação logica, encontrar uma contradição ou uma tautologia, depende da forma como interpretamos o resultado e verificamos a coerência entre o resultado e a pergunta realizada.
*/



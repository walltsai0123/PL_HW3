ancestor(A,B) :- parent(A,B).
ancestor(A,B) :- parent(X,B), ancestor(A,X).

parent_input(1):- true,!.
parent_input(N):-
    N > 1, read(A), read(B), assert(parent(A,B)), 
    M is N-1, parent_input(M).

lca_input(0):- true,!.
lca_input(N):-
    N > 0, read(A), read(B), lca(A,B,N), 
    M is N-1, lca_input(M).

answer(0):- true,!.
answer(N):-
    N > 0, output(N,X), write(X), 
    nl, M is N-1, answer(M).

lca(A,B,N) :- 
  A=:=B -> assert(output(N,A));
  ancestor(A,B) -> assert(output(N,A));
  parent(X,A),lca(X,B,N).

main:-
    read(N), parent_input(N),
    read(M), lca_input(M), 
    answer(M), halt.

:- initialization(main).
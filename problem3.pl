path(A,B) :- walk(A,B,[]).            
walk(A,B,V) :-       
    edge(A,X),
    not(member(X,V)), 
    (                  
        B = X            
    ;                  
        walk(X,B,[A|V])  
    ).

edge_input(0):- true,!.
edge_input(N):-
    N > 0, read(A), read(B), assert(edge(A,B)),
    M is N-1, edge_input(M).

con_input(0):- true,!.
con_input(N):-
    N > 0, read(A), read(B),
     con(A,B,N), M is N-1, con_input(M).

answer(0):- true,!.
answer(N):-
    N > 0, output(N,X), write(X), nl,
     M is N-1, answer(M).

con(A,B,N) :- 
  path(A,B) -> assert(output(N,"Yes"));
  assert(output(N,"No")).

main:-
    read(N), read(E), edge_input(E),
    read(M), con_input(M),
    answer(M), halt.
:- initialization(main).
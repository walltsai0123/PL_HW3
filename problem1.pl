isPrime(2) :- !.
isPrime(3) :- !.
isPrime(X) :-
    X > 3,
    X mod 2 =\= 0,
    N_max is floor(sqrt(X)),
    isPrime_(X,3,N_max).
isPrime_(X,N,N_max) :-
    (  N > N_max 
    -> true
    ;  0 =\= X mod N,
       M is N + 2,
       isPrime_(X,M,N_max)
    ).
twoPrime(X):-
    Y is X - 2,
    (
        isPrime(Y)
    ->  output(2,Y),true
    ;   C is 2 + 1,
        D is Y - 1,
        twoPrime_(X,C,D)
    ).
twoPrime_(X,Y,Z):-
    (
        isPrime(Y), isPrime(Z)
    ->  output(Y,Z), true
    ;   C is Y + 1,
        D is X - C,
        twoPrime_(X,C,D)
    ).
output(A,B):-
    write("Output: "), write(A), tab(1), write(B), nl.
main :-
    write("Input: "), read(A),
    A > 2, 0 =:= A mod 2,
    twoPrime(A),halt.
:- initialization(main).
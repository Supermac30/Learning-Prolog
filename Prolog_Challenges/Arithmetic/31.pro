isPrime(2) :- !.
isPrime(N) :-
    \+ 0 is mod(N, 2),
    NewN is N - 2,
    isPrimeAcc(N, NewN).
isPrimeAcc(_, 1) :- !.
isPrimeAcc(N, M) :-
    \+ 0 is mod(N, M),
    NewM is M - 2,
    isPrimeAcc(N, NewM).
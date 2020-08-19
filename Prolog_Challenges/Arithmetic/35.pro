primeFactors(N, L) :- primeFactorsAcc(N, 2, [], L).
primeFactorsAcc(1, _, L, L) :- !.
primeFactorsAcc(N, M, A, L) :-
    0 is mod(N, M), !,
    NewN is N/M,
    append(A, [M], NewA),
    primeFactorsAcc(NewN, M, NewA, L).
primeFactorsAcc(N, M, A, L) :-
    NewM is M + 1,
    primeFactorsAcc(N, NewM, A, L).
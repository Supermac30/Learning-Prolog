rev(L0, L1) :- revAcc(L0, [], L1).
revAcc([H|T], A, L) :- revAcc(T, [H|A], L).
revAcc([], L, L).

encodeDirect(L, X) :- 
    rev(L, Use),
    encodeDirectAcc(Use, [], X).

encodeDirectAcc([], X, X).

encodeDirectAcc([H|T], A, X) :-
    count(H, T, 1, A, X).

count(H, [H|T], P, A, X) :-
    !, NewP is P + 1,
    count(H, T, NewP, A, X).

count(H, L, P, A, X) :-
    encodeDirectAcc(L, [[H, P]|A], X).

primeFactorsMulti(N, L) :-
    primeFactors(N, L0),
    encodeDirect(L0, L).
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
split(L, C, L1, L2) :- splitAcc(L, C, [], L1, L2).
splitAcc(L1, 0, L0, L0, L1) :- !.
splitAcc([H|T], C, AL0, L0, L1) :-
    NewC is C - 1,
    append(AL0, [H], NewAL),
    splitAcc(T, NewC, NewAL, L0, L1).

slice(L, 1, C2, X) :-
    !, split(L, C2, X, _).

slice([_|T], C1, C2, X) :-
    NewC1 is C1 - 1,
    NewC2 is C2 - 1,
    slice(T, NewC1, NewC2, X).
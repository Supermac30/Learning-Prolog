conseqDup(L, X) :- conseqDupAcc(L, [], X).
conseqDupAcc([H|[H|T]], A, X) :-
    !, conseqDupAcc([H|T], A, X).
conseqDupAcc([H|T], A, X) :-
    append(A, [H], NewA),
    conseqDupAcc(T, NewA, X).
conseqDupAcc([], L, L).
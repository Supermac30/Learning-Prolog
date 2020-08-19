combination(N, L, NewL) :- combinationAcc(N, 0, L, [], NewL).
combinationAcc(N, N, [], A, A).
combinationAcc(N, NA, [H|L], A, NewL) :-
    NewNA is NA + 1,
    combinationAcc(N, NewNA, L, [H|A], NewL).
combinationAcc(N, NA, [_|L], A, NewL) :-
    combinationAcc(N, NA, L, A, NewL).

group3(L0, G1, G2, G3) :-
    combination(2, L0, G1),
    subtract(L0, G1, L1),
    combination(3, L1, G2),
    subtract(L1, G2, G3).

group(L, G, X) :- groupAcc(L, G, [], X).
groupAcc(_, [], X, X).
groupAcc(L, [H|T], A, X) :-
    combination(H, L, G),
    subtract(L, G, NewL),
    groupAcc(NewL, T, [G|A], X).
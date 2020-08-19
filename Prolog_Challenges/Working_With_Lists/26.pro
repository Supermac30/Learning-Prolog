combination(N, L, NewL) :- combinationAcc(N, 0, L, [], NewL).
combinationAcc(N, N, [], A, A).
combinationAcc(N, NA, [H|L], A, NewL) :-
    NewNA is NA + 1,
    combinationAcc(N, NewNA, L, [H|A], NewL).
combinationAcc(N, NA, [_|L], A, NewL) :-
    combinationAcc(N, NA, L, A, NewL).
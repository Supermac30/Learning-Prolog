drop(L, C, X) :- dropAcc(L, C, 1, [], X).
dropAcc([], _, _, X, X).
dropAcc([_|T], C, C, A, X) :-
    !, dropAcc(T, C, 1, A, X).
dropAcc([H|T], C, Loc, A, X) :-
    append(A, [H], NewA),
    NewLoc is Loc + 1,
    dropAcc(T, C, NewLoc, NewA, X).
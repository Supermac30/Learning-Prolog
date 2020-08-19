len(L, X) :- lenAcc(L, 0, X).
lenAcc([_|T], A, X) :-
    B is A + 1,
    lenAcc(T, B, X).
lenAcc([], X, X).
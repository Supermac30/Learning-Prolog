lastButOne([H|T], X) :- lastButOneAcc(T, H, _, X).
lastButOneAcc([H|T], _, A, X) :-
    lastButOneAcc(T, A, H, X).
lastButOneAcc([], X, _, X).
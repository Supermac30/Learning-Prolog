last([H|T], X) :- lastAcc(T, H, X).
lastAcc([H|T], _, X) :-
    lastAcc(T, H, X).
lastAcc([], X, X).

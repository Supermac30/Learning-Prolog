dupli(L, X) :- dupliAcc(L, [], X).
dupliAcc([], X, X).
dupliAcc([H|T], A, X) :-
    append(A, [H, H], NewA),
    dupliAcc(T, NewA, X).
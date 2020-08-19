dupli(L, T, X) :- dupliAcc(L, T, [], X).
dupliAcc([], _, X, X).
dupliAcc([H|T], C, A, X) :-
    mult(H, C, Add),
    append(A, Add, NewA),
    dupliAcc(T, C, NewA, X).
mult(_, 0, []).
mult(H, C, [H|T]) :-
    NewC is C - 1,
    mult(H, NewC, T).
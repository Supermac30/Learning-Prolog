flatten(L, F) :- flattenAcc(L, [], F).
flattenAcc([H|T], A, L) :-
    is_list(H), !,
    flatten(H, FH),
    append(A, FH, NewA),
    flattenAcc(T, NewA, L).
flattenAcc([H|T], A, L) :-
    append(A, [H], NewA),
    flattenAcc(T, NewA, L).
flattenAcc([], L, L).
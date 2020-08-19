split(L, C, L1, L2) :- splitAcc(L, C, [], L1, L2).
splitAcc(L1, 0, L0, L0, L1) :- !.
splitAcc([H|T], C, AL0, L0, L1) :-
    NewC is C - 1,
    append(AL0, [H], NewAL),
    splitAcc(T, NewC, NewAL, L0, L1).
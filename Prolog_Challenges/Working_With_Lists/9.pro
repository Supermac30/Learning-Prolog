rev(L0, L1) :- revAcc(L0, [], L1).
revAcc([H|T], A, L) :- revAcc(T, [H|A], L).
revAcc([], L, L).

pack(L, X) :- 
    rev(L, Use),
    packAcc(Use, [], X).
packAcc([], X, X).
packAcc([H|T], [[H|TA0]|TA1], X) :-
    !, packAcc(T, [[H, H|TA0]|TA1], X).
packAcc([H|T], L, X) :-
    packAcc(T, [[H] | L], X).
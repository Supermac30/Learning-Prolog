pack(L, X) :- packAcc(L, [], X).
packAcc([], X, X).
packAcc([H|T], [[H|TA0]|TA1], X) :-
    !, packAcc(T, [[H, H|TA0]|TA1], X).
packAcc([H|T], L, X) :-
    packAcc(T, [[H] | L], X).

len(L, X) :- lenAcc(L, 0, X).
lenAcc([_|T], A, X) :-
    B is A + 1,
    lenAcc(T, B, X).
lenAcc([], X, X).

encode(L, X) :-
    pack(L, Start),
    encodeAcc(Start, [], X).
encodeAcc([], X, X).
encodeAcc([[H|T0]|T1], A, X) :-
    len([H|T0], Len),
    Len \== 1, !,
    encodeAcc(T1, [[Len, H] | A], X).
encodeAcc([[H|T0]|T1], A, X) :-
    len([H|T0], Len),
    Len == 1, 
    encodeAcc(T1, [H|A], X).
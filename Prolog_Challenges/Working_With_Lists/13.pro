rev(L0, L1) :- revAcc(L0, [], L1).
revAcc([H|T], A, L) :- revAcc(T, [H|A], L).
revAcc([], L, L).

encodeDirect(L, X) :- 
    rev(L, Use),
    encodeDirectAcc(Use, [], X).

encodeDirectAcc([], X, X).

encodeDirectAcc([H|T], A, X) :-
    count(H, T, 1, A, X).

count(H, [H|T], P, A, X) :-
    !, NewP is P + 1,
    count(H, T, NewP, A, X).

count(H, L, P, A, X) :-
    P = 1, !,
    encodeDirectAcc(L, [H|A], X).

count(H, L, P, A, X) :-
    encodeDirectAcc(L, [[H, P]|A], X).
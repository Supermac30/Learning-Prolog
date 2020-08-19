rev(L0, L1) :- revAcc(L0, [], L1).
revAcc([H|T], A, L) :- revAcc(T, [H|A], L).
revAcc([], L, L).

decode(L, X) :-
    rev(L, Use),
    decodeAcc(Use, [], X).
decodeAcc([], X, X).
decodeAcc([[0, _]|T], A, X) :-
    !, decodeAcc(T, A, X).
decodeAcc([[Len, E]|T], A, X) :-
    !, NewLen is Len - 1,
    decodeAcc([[NewLen, E] | T], [E | A], X).
decodeAcc([H|T], A, X) :-
    decodeAcc(T, [H | A], X).
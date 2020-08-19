rev(L0, L1) :- revAcc(L0, [], L1).
revAcc([H|T], A, L) :- revAcc(T, [H|A], L).
revAcc([], L, L).
split(L, C, L1, L2) :- splitAcc(L, C, [], L1, L2).
splitAcc(L1, 0, L0, L0, L1) :- !.
splitAcc([H|T], C, AL0, L0, L1) :-
    NewC is C - 1,
    append(AL0, [H], NewAL),
    splitAcc(T, NewC, NewAL, L0, L1).

rotate(L, 0, L).
rotate(L, C, X) :-
    C =< 0, !,
    length(L, Amount),
    NewC is Amount + C,
    rotate(L, NewC, X).

rotate(L, C, X) :-
    split(L, C, L1, L2),
    append(L2, L1, X).

remove_at(X, L, C, R) :-
    NewC is C - 1,
    rotate(L, NewC, [X|NewL]),
    rotate(NewL, -NewC, R).
    
rnd_select(L, C, NewL) :-
    rnd_select_acc(L, C, [], NewL).
rnd_select_acc(_, 0, X, X).
rnd_select_acc(L, C, A, Last) :-
    length(L, Size),
    NewSize is Size + 1,
    random(1, NewSize, R),
    remove_at(X, L, R, NewL),
    NewC is C - 1,
    rnd_select_acc(NewL, NewC, [X|A], Last).

rnd_permu(L, NewL) :-
    length(L, Len),
    rnd_select(L, Len, NewL).
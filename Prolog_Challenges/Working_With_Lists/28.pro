remove(L, X, NewL) :-
    removeAcc([], L, X, FB, FA),
    append(FB, FA, NewL).
removeAcc(FB, [X|FA], X, FB, FA).
removeAcc(B, [H|T], X, FB, FA) :-
    append(B, [H], NewB),
    removeAcc(NewB, T, X, FB, FA).

minimum(X, [H|T], NewL) :- 
    minimumAcc(X, T, H),
    remove([H|T], X, NewL).
    
minimumAcc(H, [], H).
minimumAcc(X, [H|T], A) :-
    length(H, L0),
    length(A, L1),
    L0 < L1, !,
    minimumAcc(X, T, H).
minimumAcc(X, [_|T], A) :- minimumAcc(X, T, A).

frequency(L, S, Amount) :- 
    length(S, LenS),
    frequencyAcc(L, LenS, 0, Amount).
frequencyAcc([], _, X, X).
frequencyAcc([H|T], Len, A, X) :-
    length(H, Len), !,
    NewA is A + 1,
    frequencyAcc(T, Len, NewA, X).
frequencyAcc([_|T], Len, A, X) :- frequencyAcc(T, Len, A, X).

minimumFreq(Original, X, [H|T], NewL) :- 
    minimumFreqAcc(Original, X, T, H),
    remove([H|T], X, NewL).
minimumFreqAcc(_, H, [], H).
minimumFreqAcc(Original, X, [H|T], A) :-
    frequency(Original, H, L0),
    frequency(Original, A, L1),
    L0 < L1, !,
    minimumFreqAcc(Original, X, T, H).
minimumFreqAcc(Original, X, [_|T], A) :-
    minimumFreqAcc(Original, X, T, A).


lsort(L, Sorted) :- lsortAcc(L, [], Sorted).
lsortAcc([], Sorted, Sorted).
lsortAcc(L, A, Sorted) :-
    minimum(X, L, NewL),
    append(A, [X], NewA),
    lsortAcc(NewL, NewA, Sorted).

lfsort(L, Sorted) :- lfsortAcc(L, L, [], Sorted).
lfsortAcc(_, [], Sorted, Sorted).
lfsortAcc(Original, L, A, Sorted) :-
    minimumFreq(Original, X, L, NewL),
    append(A, [X], NewA),
    lfsortAcc(Original, NewL, NewA, Sorted).
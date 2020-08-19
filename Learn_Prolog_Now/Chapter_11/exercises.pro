% exercise 11.3
:- dynamic sigmares/2.
sigmares(1, 1).

sigma(N, X) :- 
    sigmaAcc(N, 0, X),
    assert(sigmares(N, X)).
sigmaAcc(N, XA, X) :- 
    sigmares(N, Add), !,
    X is XA + Add.
sigmaAcc(N, XA, X) :-
    NewN is N-1,
    NewXA is XA+N,
    sigmaAcc(NewN, NewXA, X).

/* Practical Session */

% exercise 1
append([], L, L).
append([H|T], L1, [H|L2]) :-
    append(T, L1, L2).

member(A, B) :- append(_, X, B), append([A], _, X).

subset(L0, L1) :-
    nonvar(L0), 
    sort(L0, S0), 
    subsetA([], S0, L1).

subset(L0, L1) :-
    var(L0),
    subsetA([], L0, L1).

subsetA(L0, L1, []):-
    sort(L0, S0),
    S0 = L1.

subsetA(LA, L, [_|T]) :-
    subsetA(LA, L, T).

subsetA(LA, L, [H|T]) :-
    subsetA([H|LA], L, T).

powerset(L, P) :- findall(X, subset(X, L), P).
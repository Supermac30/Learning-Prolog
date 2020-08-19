% exercise 5.2
increment(X, Y) :- X is Y-1.
sum(X, Y, Z) :- Z is Y+X.

% exercise 5.3
addone([], []).
addone([H0 | T0], [H1 | T1]) :- 
    H1 is H0 + 1,
    addone(T0, T1).

/* Practical Session*/

% exercise 1

accMin([H|T],A,Min)  :-
    H  <  A,
    accMin(T,H,Min).

accMin([H|T],A,Min)  :-
    H  >=  A,
    accMin(T,A,Min).

accMin([],A,A).

% exercise 2

scalarMult(_, [], []).
scalarMult(X, [A|B], [C|D]) :-
    is(C, *(X, A)),
    scalarMult(X, B, D).

% exercise 3

dot([A], [B], C) :- C is A*B.
dot([A|B], [C|D], K) :-
    dot(B, D, R),
    K is A*C+R.
    
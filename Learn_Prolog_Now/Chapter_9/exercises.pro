% exercise 9.3
complexTerm(X) :-
    nonvar(X),
    functor(X, _, A),
    A > 0.

termtype(X, Y) :- atom(X), Y=atom.
termtype(X, Y) :- atomic(X), Y=constant.
termtype(X, Y) :- var(X), Y=variable.
termtype(X, Y) :- number(X), Y=number.
termtype(X, Y) :- float(X), Y=float.
termtype(X, Y) :- integer(X), Y=integer.
termtype(X, Y) :- complexTerm(X), Y=complex_Term.
termtype(X, Y) :- not(complexTerm(X)), Y=simple_Term.

% exercise 9.4

groundterm(X) :- groundTermAcc(X, 1).

groundTermAcc(X, N) :-
    nonvar(X),
    not(atom(X)),
    arg(N, X, Y),
    groundTermAcc(Y, 1),
    M is N+1,
    groundTermAcc(X, M).

groundTermAcc(X, N) :-
    not(atom(X)),
    nonvar(X),
    not(arg(N, X, _)).

groundTermAcc(X, _) :-
    atom(X).

/* Practical Session */

% exercise 1

pptree(T) :- pptreeSpace(T, 0).

pptreeSpace(T, _):-
    (var(T); atomic(T)), !,
    display(T).

pptreeSpace(T, Space) :-
    nl,
    functor(T, F, _),
    tab(Space),
    display(F),
    write("("),
    atom_length(F, X),
    printArg(T, 1, Space + X + 1),
    write(")").

printArg(T, ArgNum, Space) :-
    Y is ArgNum + 1,
    arg(Y, T, _), !,
    arg(ArgNum, T, X),
    pptreeSpace(X, Space),
    printArg(T, Y, Space).

printArg(T, ArgNum, Space) :-
    arg(ArgNum, T, X),
    pptreeSpace(X, Space).

% exercise 2

:- op(700, fx, not).
:- op(800, xfx, and).
:- op(900, xfx, or).
:- op(1000, xfx, implies).
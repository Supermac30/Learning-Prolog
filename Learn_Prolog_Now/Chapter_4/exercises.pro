% exercise 4.3
second(X, [_, X | _]).

% exercise 4.4
swap([A, B | _], [B, A | _]).

% exercise 4.5
tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([], []).
listtran([A | B], [C | D]) :-
    tran(A, C),
    listtran(B, D).

% exercise 4.6
twice([], []).
twice([A], [A, A]).
twice([A | B], [A, A | C]) :- twice(B, C).
range(X, X, [X]).
range(X, Y, [X|T]) :-
    Y > X, !,
    NewX is X + 1,
    range(NewX, Y, T).
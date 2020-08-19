kthElem([H|_], 0, H).
kthElem([H|T], P, X) :-
    Y is P - 1,
    kthElem(T, Y, X).

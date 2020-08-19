append([], L, L).
append([H|T], L1, [H|L2]) :-
    append(T, L1, L2).

suffix(A, B) :- append(_, A, B).
prefix(A, B) :- append(A, _, B).

accRev([H|T], A, R) :- accRev(T, [H|A], R).
accRev([], A, A).
reverse(A, B) :- accRev(A, [], B).

size([], 0).
size([_|T], X) :-
    size(T, Y),
    X is Y+1.

% exercise 6.1
double(H) :- append(X, X, H).

% exercise 6.2
palindrome(A) :- reverse(A, A).

% exersice 6.3

equalWithoutEnd([_], []).
equalWithoutEnd([H|T0], [H|T1]) :- equalWithoutEnd(T0, T1).

topTail([H0|T0], L) :-
    size([H0|T0], X),
    X > 2,
    equalWithoutEnd(T0, L).

% exercise 6.4

revLast(List, X) :-
    size(List, S),
    S > 1,
    [X|_] = reverse(List).

recLast([A], A).
recLast([H|T], X) :-
    size([H|T], S),
    S > 1,
    recLast(T, X).

% exercise 6.5

swapfl([H0|T0], [H1|T1]) :-
    recLast(T1, H0),
    recLast(T0, H1).

% exercise 6.6

colors(X) :-
    X = red;
    X = blue;
    X = green.

nationalities(X) :-
    X = english;
    X = spanish;
    X = japanese.

pets(X) :- 
    X = jaguar;
    X = snail;
    X = zebra.

house(red, english, X) :- pets(X).
house(X, spanish, jaguar) :- colors(X).
house(X, japanese, Y) :- colors(X), pets(Y).

street( house(C0, N0, P0), 
        house(C1, N1, P1),
        house(C2, N2, P2) ) :-
    house(C0, N0, P0),
    house(C1, N1, P1),
    house(C2, N2, P2),
    (P0 = snail, N1 = japanese;
    P1 = snail, N2 = japanese),
    (P1 = snail, C0 = blue;
    P2 = snail, C1 = blue),
    unique(house(C0, N0, P0), house(C1, N1, P1), house(C2, N2, P2)).

unique(house(C0, N0, P0), house(C1, N1, P1), house(C2, N2, P2)) :-
    C0 \= C1,
    C0 \= C2,
    C1 \= C2,
    N0 \= N1,
    N0 \= N2,
    N1 \= N2,
    P0 \= P1,
    P0 \= P2,
    P1 \= P2.

zebra(X) :-
    street(house(_, X, zebra), _, _);
    street(_, house(_, X, zebra), _);
    street(_, _, house(_, X, zebra)).

/* Practical Session */

% exercise 1

member(A, B) :- append(_, X, B), append([A], _, X).

% exercise 2

accSet([], L, L).
accSet([A|B], L, Z) :-
    (member(A, B),
    accSet(B, L, Z));
    (not(member(A, B)),
    accSet(B, [A|L], Z)).    

set(A, B) :- accSet(A, [], B).

% exercise 3

accFlat([], L, L).

accFlat([[H|T0]|T1], L, Z) :-
    accFlat([H|[T0|T1]], L, Z).

accFlat([A|T], L, Z) :-
    (A \= [_|_],
    A \= [],
    accFlat(T, [A|L], Z));
    (A = [],
    accFlat(T, L, Z)).

flatten(A, B) :- accFlat(A, [], B).
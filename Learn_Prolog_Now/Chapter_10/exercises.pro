% exercise 10.2 

class(Number,positive)  :-  Number  >  0, !.
class(0,zero) :- !.
class(Number,negative)  :-  Number  <  0.

% exercise 10.3

split(L, P, N) :- splitAcc(L, [], [], P, N).

splitAcc([H|T], Ap, An, P, N) :-
    H >= 0, !,
    splitAcc(T, [H|Ap], An, P, N).

splitAcc([H|T], Ap, An, P, N) :-
    H < 0,
    splitAcc(T, Ap, [H|An], P, N).

splitAcc([], P, N, P, N).

% exercise 10.4

append([], L, L).
append([H|T], L1, [H|L2]) :-
    append(T, L1, L2).

member(A, B) :- append(_, X, B), append([A], _, X).

directTrain(saarbruecken,dudweiler, _).
directTrain(forbach,saarbruecken, _).
directTrain(freyming,forbach, _).
directTrain(stAvold,freyming, _).
directTrain(fahlquemont,stAvold, _).
directTrain(metz,fahlquemont, _).
directTrain(nancy,metz, _).
directTrain(A, B, 0) :- directTrain(B, A, 1).

route(A, B, [B|Route]) :- routeAcc(A, B, [], Route).

routeAcc(A, B, L, L) :-
    directTrain(A, B, 0).

routeAcc(A, B, L, Al) :-
    directTrain(A, H, 0),
    not(member(H, L)),
    routeAcc(H, B, [H|L], Al).

% exercise 10.5

loves(vincent, mia).
loves(marsellus, mia).
loves(pumpkin, honeyBunny).
loves(honeyBunny, pumpkin).

jealous(X, Y) :- loves(X, Z), loves(Y, Z), X \= Y.

/* Practical Session */

% exercise 1

% way 1
nu(A, B) :- \+ A=B. 

% way 2
nu(A, B) :- A = B, !, fail.
nu(_, _). 

% way 3
nu(A, A) :- !, fail.
nu(_, _).

% exercise 2

uni(X, Term, Y) :- unifiableAcc(X, Term, [], Y).

unifiableAcc([H|L0], T, L1, Al) :-
    \+ H \= T, !,
    unifiableAcc(L0, T, [H|L1], Al).

unifiableAcc([_|L0], T, L1, Al) :-
    unifiableAcc(L0, T, L1, Al).

unifiableAcc([], T, L, L).
% exercise 3.2
directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha, irina).

in(A, B) :- directlyIn(A, B).
in(A, B) :-
    directlyIn(A, C),
    in(C, B).

% exercise 3.3
directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

travelFromTo(A, B) :- directTrain(A, B).

travelFromTo(A, B) :-
    directTrain(A, C),
    travelFromTo(C, B).

% exercise 3.4
numeral(0).
numeral(succ(X)) :- numeral(X).

greater_than(X, 0) :- X\=0.
greater_than(succ(X), succ(Y)) :- greater_than(X, Y).

% exercise 3.5
leaf(_).
tree(_, _).

swap(leaf(A), leaf(A)).

swap(tree(A, B), tree(C, D)) :-
    swap(A, D),
    swap(B, C).

/* practical session */

% exercise 1
connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(A, B) :- connected(A, B).
path(A, B) :-
    connected(A, C),
    path(C, B).

% exercise 2
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

byAny(A, B) :-
    byCar(A, B);
    byTrain(A, B);
    byPlane(A, B).

travel(A, B) :- byAny(A, B).
travel(A, B) :-
    byAny(A, C),
    travel(C, B).

% exercise 3

travel(A, B, go(A, B)) :- byAny(A, B).
travel(A, B, go(A, C, X)) :-
    byAny(A, C),
    travel(C, B, X).
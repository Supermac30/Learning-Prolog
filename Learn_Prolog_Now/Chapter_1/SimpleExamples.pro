/*
%knowledge base 1

woman(mia).
woman(jody).
woman(yolanda).
playsAirGuitar(jody).
party.
*/

/*
% knowledge base 2

%facts
happy(yolanda).
listens2Music(mia). 
%rules
listens2Music(yolanda) :- happy(yolanda).
playsAirGuitar(mia) :- listens2Music(mia).
playsAirGuitar(yolanda) :- listens2Music(yolanda).
*/

/*
% knowledge base 3

happy(vincent).
listens2Music(butch).
playsAirGuitar(vincent) :-
    listens2Music(vincent), % comma means and
    happy(vincent).
playsAirGuitar(butch) :-
    happy(butch); % semicolon means or
    listens2Music(butch).
*/

/*
% knowledge base 4
woman(mia).
woman(jody).
woman(yolanda).

loves(vincent, mia).
loves(marsellus, mia).
loves(pumpkin, honeyBunny).
loves(honeyBunny, pumpkin).
*/

/*
% knowledge base 5

loves(vincent, mia).
loves(marsellus, mia).
loves(pumpkin, honeyBunny).
loves(honeyBunny, pumpkin).

jealous(X, Y) :- loves(X, Z), loves(Y, Z).
*/
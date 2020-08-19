% exercise 7.1

s71(W, Z) :- foo(W, X), bar(X, Y), wiggle(Y, Z).
foo([choo | W], W).
foo(X, Z) :- foo(X, Y), foo(Y, Z).
bar(X, Z) :- mar(X, Y), zar(Y, Z).
mar(X, Z) :- me(X, Y), my(Y, Z).
me([i | W], W).
my([am | W], W).
zar(X, Z) :- blar(X, Y), car(Y, Z).
blar([a | W], W).
car([train | W], W).
wiggle([toot | W], W).
wiggle(X, Z) :- wiggle(X, Y), wiggle(Y, Z).

% exercise 7.2

s72 --> [a], [b].
s72 --> [a], s72, [b].

% exercise 7.3

s73 --> [a], [b], [b].
s73 --> [a], s73, [b], [b].

/* Practical Session */

% exercise 1

s1 --> [].
s1 --> [a], [a], s1.

% exercise 2

s2 --> mid.
s2 --> [a], s2, [d].
mid --> [].
mid --> [b], [b], mid, [c], [c].

% exercise 3

prop --> [p].
prop --> [q].
prop --> [r].
prop --> [not], prop.
prop --> ['('], prop, [or], prop, [')'].
prop --> ['('], prop, [and], prop, [')'].
prop --> ['('], prop, [implies], prop, [')'].
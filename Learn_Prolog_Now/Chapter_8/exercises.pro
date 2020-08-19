% exercise 8.1
/*
s  -->  np(X),vp(X).
   
np(X)  -->  det,n(X).

vp(X)  -->  v(X),np(X).
vp(X)  -->  v(X).

det  -->  [the].
det  -->  [a].

n(singular)  -->  [woman].
n(singular)  -->  [man].
n(plural)  -->  [men].
n(plural)  -->  [women].
n(_)  -->  [apple].
n(_)  -->  [pear].

v(plural)  -->  [eat].
v(plural) -->  [know].
v(singular)  -->  [eats].
v(singular) -->  [knows].
*/

% exercise 8.2
% kanga(V,R,Q)  -->  roo(V,R),jumps(Q,Q),{marsupial(V,R,Q)}.
kanga(V, R, Q, A, B) :-
    roo(V, R, A, C),
    jumps(Q, Q, C, B),
    marsupial(V, R, Q).

/* Practical Session */

append([], L, L).
append([H|T], L1, [H|L2]) :-
    append(T, L1, L2).

member(A, B) :- append(_, X, B), append([A], _, X).


s(s(NP, VP))  -->  np(subject, X, NP), vp(X, _, VP).

np(_, X, np(Det, Adj, N))  -->  det(X, Det), adj([], _, Adj), n(X, N).
np(X, Y, np(Pro))  -->  pro(X, Y, Pro).

vp(Y, X, vp(V, NP))  -->  v(Y, V), np(object, X, NP).
vp(Y, vp(V))  -->  v(Y, V).

adj(_, _, adj([])) --> [].
adj(List, Word, adj(Word)) --> [Word|List], {lex(Word, adj)}, {not(member(Word, List))}.
adj(List, Word, adj(Adj)) --> {not(member(Word, List))}, adj([Word|List], _, Adj). 

det(X, det(Word))  -->  [Word], {lex(Word, det, X)}.
n(X, n(Word))  -->  [Word], {lex(Word, n, X)}.
pro(X, Y, pro(Word))  -->  [Word], {lex(Word, pro, X, Y)}.
v(X, v(Word))  -->  [Word], {lex(Word, v, X)}.

lex(he, pro, subject, singular).
lex(she, pro, subject, singular).
lex(him, pro, object, singular).
lex(her, pro, object, singular).
lex(the, det, plural).
lex(a, det, singular).
lex(woman, n, singular).
lex(man, n, singular).
lex(men, n, plural).
lex(women, n, plural).
lex(shoot, v, plural).
lex(shoots, v, singular).
lex(eats, v, singular).
lex(eat, v, plural).
lex(knows, v, singular).
lex(know, v, plural).
lex(small, adj).
lex(large, adj).
lex(frightened, adj).
lex(frightened, adj).
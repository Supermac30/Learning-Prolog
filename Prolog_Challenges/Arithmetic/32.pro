gcd(G, 0, G) :- !.
gcd(A, B, G) :-
    NewB is mod(A, B),
    gcd(B, NewB, G).
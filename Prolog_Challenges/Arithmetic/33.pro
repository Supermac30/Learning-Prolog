gcd(G0, 0, G1) :- !, G0 == G1.
gcd(A, B, G) :-
    NewB is mod(A, B),
    gcd(B, NewB, G).
coprime(A, B) :- gcd(A, B, 1).
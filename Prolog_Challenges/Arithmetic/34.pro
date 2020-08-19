gcd(G0, 0, G1) :- !, G0 == G1.
gcd(A, B, G) :-
    NewB is mod(A, B),
    gcd(B, NewB, G).
coprime(A, B) :- gcd(A, B, 1).
phi(M, N) :- phiAcc(M, M, 0, N).
phiAcc(_, 0, A, A) :- !.
phiAcc(M0, M1, A, N) :-
    coprime(M0, M1), !,
    NewM is M1 - 1,
    NewA is A + 1,
    phiAcc(M0, NewM, NewA, N).
phiAcc(M0, M1, A, N) :-
    NewM is M1 - 1,
    phiAcc(M0, NewM, A, N).
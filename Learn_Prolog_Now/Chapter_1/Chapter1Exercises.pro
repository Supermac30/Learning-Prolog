% Exercise 1.4
killer(butch).

married(mia, marsellus).
married(X, Y) :- married(Y, X).

dead(zed).

aKillsB(marsellus, X) :- aGivesMassageB(X, mia).

aLovesB(mia, X) :- goodDancer(X).

aEatsB(jules, X) :- nutritious(X); tasty(X).


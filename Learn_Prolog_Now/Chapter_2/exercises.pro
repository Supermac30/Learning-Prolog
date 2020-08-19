% exercise 2.4
word(astante,  a,s,t,a,n,t,e).
word(astoria,  a,s,t,o,r,i,a).
word(baratto,  b,a,r,a,t,t,o).
word(cobalto,  c,o,b,a,l,t,o).
word(pistola,  p,i,s,t,o,l,a).
word(statale,  s,t,a,t,a,l,e).

crossword(V1, V2, V3, H1, H2, H3) :-
    word(V1, F1, F5, F11, F15, F21, F25, F31),
    word(V2, F2, F7, F12, F17, F22, F27, F32),
    word(V3, F3, F9, F13, F19, F23, F29, F33),
    word(H1, F4, F5, F6, F7, F8, F9, F10),
    word(H2, F14, F15, F16, F17, F18, F19, F20),
    word(H3, F24, F25, F26, F27, F28, F29, F30).
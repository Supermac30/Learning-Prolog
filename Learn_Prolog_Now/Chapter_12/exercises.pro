% exercise 12.1
hogwart :-
    open("hogwart.houses", write, Stream),
    /*
            gryffindor
    hufflepuff          ravenclaw
            slytherin

    */
    write(Stream, "          gryffindor"), nl(Stream),
    write(Stream, "hufflepuff          ravenclaw"), nl(Stream),
    write(Stream, "          slytherin"), nl(Stream),
    close(Stream).

% exercise 12.2
:- dynamic word(_, _).

frequency :-
    open("read.txt", read, Stream),
    readFile(Stream),
    close(Stream).

readFile(Stream) :-
    \+ at_end_of_stream(Stream),
    readWord(Stream, Word),
    addWord(Word),
    readFile(Stream).

addWord(Word) :-
    word(Word, X), !,
    retract(word(Word, X)),
    Y is X + 1,
    assert(word(Word, Y)).

addWord(Word) :-
    assert(word(Word, 1)).

readWord(InStream,W):-
    get_code(InStream,Char),
    checkCharAndReadRest(Char,Chars,InStream),
    atom_codes(W,Chars).

checkCharAndReadRest(10,[],_):-  !.

checkCharAndReadRest(32,[],_):-  !.

checkCharAndReadRest(-1,[],_):-  !.

checkCharAndReadRest(end_of_file,[],_):-  !.

checkCharAndReadRest(Char,[Char|Chars],InStream):-
        get_code(InStream,NextChar),
        checkCharAndReadRest(NextChar,Chars,InStream).

/* Practical Session */
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

pptree(T, Stream) :- pptreeSpace(T, 0, Stream).

pptreeSpace(T, _, Stream):-
    (var(T); atomic(T)), !,
    write(Stream, T).

pptreeSpace(T, Space, Stream) :-
    nl(Stream),
    functor(T, F, _),
    tab(Stream, Space),
    write(Stream, F),
    write(Stream, "("),
    atom_length(F, X),
    printArg(T, 1, Space + X + 1, Stream),
    write(Stream, ")").

printArg(T, ArgNum, Space, Stream) :-
    Y is ArgNum + 1,
    arg(Y, T, _), !,
    arg(ArgNum, T, X),
    pptreeSpace(X, Space, Stream),
    printArg(T, Y, Space, Stream).

printArg(T, ArgNum, Space, Stream) :-
    arg(ArgNum, T, X),
    pptreeSpace(X, Space, Stream).

test(Sentence, FileName) :-
    s(X, Sentence, []),
    open(FileName, write, Stream),
    pptree(X, Stream),
    close(Stream).
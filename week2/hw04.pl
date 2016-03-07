%% 3.01
and(A, B) :- A, B.

or(A, B) :- A; B.

nor(A, B) :- not(or(A, B)).

nand(A, B) :- not(and(A, B)).

xor(A, B) :- or(A, B), not(and(A, B)).

impl(A, _B) :- not(A).
impl(A, B) :- and(A, B).

equ(A, B) :- or(and(A, B), and(not(A), not(B))).

try(false).
try(true).

sp :- write(' ').

prn(A, B, X) :- X, !, write(A), sp, write(B), sp, write(true), nl, false.
prn(A, B, _X) :- write(A), sp, write(B), sp, write(false), nl, false.

table(A,B, X) :- try(A), try(B), prn(A, B, X), false.

%% 3.04
%% prefix(S, X, Y) :- prefix each string in X with the string S. The
%% resultant list is stored in Y.
prefix(_S, [], []).
prefix(S, [X | Xs], [Y|Ys]) :-
    string_concat(S, X, Y),
    prefix(S, Xs, Ys).

%% gray(N, C) :- C is the N-bit gray code; N must be >= 1.
gray(N, _C) :- N < 1, !, false.
gray(1, ['0', '1']).
gray(N, C) :-
    N1 is N - 1,
    gray(N1, C1),
    reverse(C1, C2),
    prefix('0', C1, C3),
    prefix('1', C2, C4),
    append([C3, C4], C).

% 3.01
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

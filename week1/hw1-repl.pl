[hw1]. make.

/* examples
even(z).
even(s(z)).
even(s(s(z))).
*/


% Exercise 1.1
plus(s(z), s(z), s(s(z))).
plus(s(s(z)), R, s(s(s(z)))).
diff(s(s(s(z))), s(s(z)), R).


% Exercise 1.2
/* times(s(s(s(z))), R, s(s(s(s(z))))).      never terminates */
/* times(R, s(s(s(z))), s(s(s(s(z))))).      never terminates */

divexact(s(z), z, Q, R).

divexact(s(z), s(z), Q, R).

divexact(s(s(s(s(z)))), s(z), Q, R).

divexact(s(s(s(s(z)))), s(s(z)), Q, R).

divexact(s(s(s(s(z)))), s(s(s(z))), Q, R).

divexact(s(s(s(s(z)))), s(s(s(s(z)))), Q, R).

divexact(s(s(s(s(z)))), s(s(s(s(s(z))))), Q, R).

% Exercise 1.3: binary exponentiation
plus(s(z), z, B0).

plus(B0, B0, B1).

plus(B1, B1, B2).

plus(B2, B2, B3).


% Exercise 1.4
bplus(0, 0, 0, 0, R1, R0, C).

bplus(0, 0, 0, 1, R1, R0, C).

bplus(0, 0, 1, 0, R1, R0, C).

bplus(0, 0, 1, 1, R1, R0, C).

bplus(0, 1, 0, 0, R1, R0, C).

bplus(0, 1, 0, 1, R1, R0, C).

bplus(0, 1, 1, 0, R1, R0, C).

bplus(0, 1, 1, 1, R1, R0, C).

bplus(1, 0, 0, 0, R1, R0, C).

bplus(1, 0, 0, 1, R1, R0, C).

bplus(1, 0, 1, 0, R1, R0, C).

bplus(1, 0, 1, 1, R1, R0, C).

bplus(1, 1, 0, 0, R1, R0, C).

bplus(1, 1, 0, 1, R1, R0, C).

bplus(1, 1, 1, 0, R1, R0, C).

bplus(1, 1, 1, 1, R1, R0, C).


bcvt(0, 0, X).

bcvt(0, 1, X).

bcvt(1, 0, X).

bcvt(1, 1, X).


bcvt(B1, B0, z).

bcvt(B1, B0, s(z)).

bcvt(B1, B0, s(s(z))).

bcvt(B1, B0, s(s(s(z)))).

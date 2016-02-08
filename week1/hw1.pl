% examples
even(z).
even(s(s(N))) :- even(N).

% 0 + N = N
% (M + 1) + N = (M + N) + 1
/*
plus(z, N, N).
plus(s(M), N, s(P)) :- plus(M, N, P).
*/

% 0 * N = 0
% (M + 1) * N = (M * N) + N
times(z, _, z).
times(s(M), N, Q) :-
   times(M, N, P),
   plus(P, N, Q).


% Exercise 1.1
% 0 + N = N
% (M + 1) + N = M + (N + 1)
plus(z, N, N).
plus(s(M), N, P) :- plus(M, s(N), P).

% M - S = D <- S + D = M
diff(M, S, D) :- plus(S, D, M).


% Exercise 1.2
less(P, s(P)).
less(P, s(Q)) :- less(P, Q).

divexact(N, D, z, N) :-
   less(N, D).
divexact(N, D, Q, R) :-
   less(D, s(N)),
   less(Q, s(N)),
   less(R, D),
   times(Q, D, P),
   plus(R, P, N).


% Exercise 1.4
% one-bit addition a, b, result, carry
bplus(0, 0, 0, 0).
bplus(0, 1, 1, 0).
bplus(1, 0, 1, 0).
bplus(1, 1, 0, 1).

% two-bit addition
bplus(A1, A0, B1, B0, R1, R0, C) :-
   bplus(A0, B0, R0, C0),
   bplus(A1, C0, X1, C1),
   bplus(X1, B1, R1, C2),
   bplus(C1, C2, C, 0).

% one-bit conversion
bcvt(0, z).
bcvt(1, s(z)).

% two-bit conversion
bcvt(B1, B0, X) :-
   bcvt(B1, D1),
   bcvt(B0, D0),
   times(D1, s(s(z)), P),
   plus(P, D0, X).

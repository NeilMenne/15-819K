% Unary natural numbers z, s(z), s(s(z)), ...

even(z).
even(s(s(N))) :- even(N).

plus(s(M), N, s(P)) :- plus(M, N, P).
plus(z, N, N).

times(z, N, z).
times(s(M), N, Q) :-
	times(M, N, P),
	plus(P, N, Q).


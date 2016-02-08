% 1.1
plus2(z, N, N).
plus2(s(M), N, s(P)) :-
    plus2(M, s(N), s(P)).


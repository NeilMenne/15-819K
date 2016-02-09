% 1.1
%% (m+1)+n = m+(n+1)
%% 0+n =n				

plus_alt(M, s(N), s(P)) :- plus_alt(M, N, P).
plus_alt(z, N, N).

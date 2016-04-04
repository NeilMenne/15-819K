num_length(N, L) :-
    number_string(N, S),
    string_length(S, L).

%% X * Y = Z2 * B^2M + Z1 * B^M + Z0 where
%% X  = X1 * B^M + X0
%% Y  = Y1 * B^M + X0
%% Z2 = X1 * Y1
%% Z1 = X1 * Y0 + X0 * Y1
%% Z0 = X0 * Y0.
%% Z1 can more efficiently be defined as:
%% Z1 = (X1 + X0)(Y1 + Y0) - Z2 - Z0.
%% which requires one less multiplication to compute
karatsuba(X, Y, Z) :-
    (X < 10; Y < 10) -> Z is X * Y;
    num_length(X, XL),
    num_length(Y, YL),
    M is min(XL, YL) - 1,
    pow(10, M, Bm),
    X1 is div(X, Bm),
    X0 is mod(X, Bm),
    Y1 is div(Y, Bm),
    Y0 is mod(Y, Bm),
    karatsuba(X1, Y1, Z2),
    karatsuba(X0, Y0, Z0),
    X0X1 is X0 + X1,
    Y0Y1 is Y0 + Y1,
    karatsuba(X0X1, Y0Y1, Z1L),
    Z1 is Z1L - Z2 - Z0,
    pow(Bm, 2, B2m),
    Z is Z2 * B2m + Z1 * Bm + Z0.

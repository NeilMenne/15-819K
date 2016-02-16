%% filter(_, [], _Ps).
%% filter(X, [Y|Ys], Ps) :-
%%     X = Y,
%%     cons(Y, Ps, Qs),
%%     filter(X, Ys, Qs).

%% dutch(_Rs, _Ws, _Bs, []).
%% dutch(Rs, Ws, Bs, [X|Xs]) :-
%%     X = white, append([X], Xs, Ps), dutch(Rs, Ps, Bs, Xs).
%% dutch(Rs, Ws, Bs, [X|Xs]) :-
%%     X = blue,  append([X], Xs, Ps), dutch(Rs, Ws, Ps, Xs).

equal(_, []).
equal(P, [X|Xs]) :- P = X, equal(P, Xs).

dutch([], [], [], []).
dutch(Rs, Ws, Bs, [X|Xs]) :- X = red,   dutch([X|Rs], Ws, Bs, Xs).
dutch(Rs, Ws, Bs, [X|Xs]) :- X = white, dutch(Rs, [X|Ws], Bs, Xs).
dutch(Rs, Ws, Bs, [X|Xs]) :- X = blue,  dutch(Rs, Ws, [X|Bs], Xs).

%% dutch2, after looking at Brent's

red(r).
white(w).
blue(b).

ndp([], [], [], []).
ndp([X|Rs], Ws, Bs, [X|Xs]) :- red(X),   ndp(Rs, Ws, Bs, Xs).
ndp(Rs, [X|Ws], Bs, [X|Xs]) :- white(X), ndp(Rs, Ws, Bs, Xs).
ndp(Rs, Ws, [X|Bs], [X|Xs]) :- blue(X),  ndp(Rs, Ws, Bs, Xs).

nd(Xs, Ps) :-
    ndp(Rs, Ws, Bs, Xs),
    append(Rs, Ws, Qs),
    append(Qs, Bs, Ps).

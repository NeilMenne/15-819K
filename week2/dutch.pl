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

member(X, [X|Ys]).
member(X, [Y|Ys]) :- member(X, Ys).

% prefix([1,2], [1,2,3]).
prefix([], Ys).
prefix([X|Xs], [X|Ys]) :- prefix(Xs, Ys).

% suffix([2,3], [1,2,3]).
suffix(Xs, Xs).
suffix(Xs, [Y|Ys]) :- suffix(Xs, Ys).

% append([], [1], [1]).
% append([], [1], Z).
% append([2], [1], Zs).
% append(Xs, Ys, [1,2,3]).
append([], Ys, Ys).
append([X|Xs], Ys, [X|Zs]) :- append(Xs, Ys, Zs).

% prefix2([1,2], [1,2,3]).
% prefix2([1,3], [1,2,3]).
prefix2(Xs, Ys) :- append(Xs, _, Ys).

% suffix2([2,3], [1,2,3]).
suffix2(Xs, Ys) :- append(_, Ys, Zs).

% sublist([2,3], [1,2,3]).
% sublist([2,3], [1,2,3,4]).
% sublist([3,4], [Z,3,4]).
%% sublist(Xs, Ys) :- prefix(Ps, Ys), suffix(Xs, Ps).
%% sublist(Xs, Ys) :- prefix2(Ps, Ys), suffix2(Xs, Ps).

%% ex1: sublist returns false also, using append doesn't seem to
%% actually work, is this related?

quicksort([], []).
quicksort([X0|Xs], Ys) :-
    partition(Xs, X0, Ls, Gs),
    quicksort(Ls, Ys1),
    quicksort(Gs, Ys2),
    append(Ys1, [X0|Ys2], Ys).

partition([], _, [], []).
partition([X|Xs], X0, [X|Ls], Gs) :-
    X =< X0, partition(Xs, X0, Ls, Gs).
partition([X|Xs], X0, Ls, [X|Gs]) :-
    X > X0, partition(Xs, X0, Ls, Gs).

% quicksort([3, 4, 2, 6, 7, 8], Z).
% quicksort([1,2,3], [1,2,3]).
% quicksort([1,2,3], [1,3,2]).
% quicksort(Z, [1,2,3]).

minimum(X, Y, X) :- X =< Y.
minimum(X, Y, Y) :- X > Y.
% minimum(2, 1, Z).

minimum(X, Y, Z) :- X =< Y -> Z = X ; Z = Y.

minimum(X, Y, Z) :- X =< Y, !, Z = X.
minimum(X, Y, Y).

%% EX2: ordered
% ordered([1,2,3]).
% ordered([1,3,2]).
ordered([]).
ordered([X0|Xs]) :- ordered(X0, Xs).
ordered(X0, [X1|Xs]) :- X0 >= X1, ordered(Xs).

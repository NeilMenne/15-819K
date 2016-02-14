%%% Quick sort and minimum, as examples.
%%% Author: Frank Pfenning
%%%
%%% Uses built-in append/3

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

% minimum, with guards on both clauses
minimum(X, Y, X) :- X =< Y.
minimum(X, Y, Y) :- X > Y.

% minimum, with conditional
minimum2(X, Y, Z) :- X =< Y -> Z = X ; Z = Y.

% minimum, with cut
minimum3(X, Y, Z) :- X =< Y, !, Z = X.
minimum3(X, Y, Y).

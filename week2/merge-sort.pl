%%% ex 2.3 mergesort(xs, ys) for lists of integers
%%% author: Lang Martin

merge([X|Xs], [Y|Ys], Zs) :-
    X =< Y,
    append([X], Zs, Ps),
    Zs = Ps,
    merge(Xs, [Y|Ys], Zs).

merge([X|Xs], [Y|Ys], Zs) :-
    X > Y,
    append([Y], Zs, Ps),
    Zs = Ps,
    merge([X|Xs], Ys, Zs).

merge(Xs, [], Zs) :- append(Xs, Zs, Ps), Zs = Ps.
merge([], Ys, Zs) :- append(Ys, Zs, Ps), Zs = Ps.

mergesort([], []).
mergesort([X|Xs], Ys) :-
    merge(Xs, Ys).

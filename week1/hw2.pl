% examples
% prefix_(Xs, Ys) iff list Xs is a prefix of list Ys
prefix_([], _Ys).
prefix_([X|Xs], [X|Ys]) :- prefix_(Xs, Ys).

% suffix_(Xs, Ys) iff list Xs if a suffix of list Ys
suffix_(Xs, Xs).
suffix_(Xs, [_Y|Ys]) :- suffix_(Xs, Ys).

% append_(Xs, Ys, Zs) iff Zs is the result of appending list Ys to list Xs
append_([], Ys, Ys).
append_([X|Xs], Ys, [X|Zs]) :- append_(Xs, Ys, Zs).

% alternative definitions of prefix and suffix.
prefix2(Xs, Ys) :- append_(Xs, _, Ys).
suffix2(Xs, Ys) :- append_(_, Xs, Ys).

% sublist_(Xs, Ys) iff Xs is a sublist of Ys
sublist_(Xs, Ys) :- prefix_(Ps, Ys), suffix_(Xs, Ps).

% length_(Xs, N) iff Xs is a list of length N.
length_([], 0).
length_([_X|Xs], N) :- length_(Xs, N1), N is N1+1.


% Exercise 2.1
%dealwithit

% Exercise 2.2
ordered([]).
ordered([_]).
ordered([X, Y|Ys]) :- X =< Y, ordered([Y|Ys]).

permute([], []).
permute(Xs, [X|Ps]) :-
   append(Xp, [X|Xn], Xs),
   append(Xp, Xn, Ys),
   permute(Ys, Ps).


% Exercise 2.3
sort_merge(Xs, [], Xs).
sort_merge([], Ys, Ys).
sort_merge([X|Xs], [Y|Ys], [X|Rs]) :-
   X =< Y,
   sort_merge(Xs, [Y|Ys], Rs).
sort_merge([X|Xs], [Y|Ys], [Y|Rs]) :-
   X > Y,
   sort_merge([X|Xs], Ys, Rs).

merge_sort([], []).
merge_sort(Xs, Ys) :-
   append(X1, X2, Xs),
   length(X1, N),
   length(X2, N),
   merge_sort(X1, Y1),
   merge_sort(X2, Y2),
   sort_merge(Y1, Y2, Ys).
merge_sort([X|Xs], Ys) :-
   merge_sort(Xs, Zs),
   sort_merge([X], Zs, Ys).


% Exercise 2.4
flags([], [], [], []).
flags([r|Xs], [r|Rs], Ws, Bs) :-
   flags(Xs, Rs, Ws, Bs).
flags([w|Xs], Rs, [w|Ws], Bs) :-
   flags(Xs, Rs, Ws, Bs).
flags([b|Xs], Rs, Ws, [b|Bs]) :-
   flags(Xs, Rs, Ws, Bs).

flags(Xs, Ss) :-
   flags(Xs, Rs, Ws, Bs),
   append([Rs, Ws, Bs], Ss).

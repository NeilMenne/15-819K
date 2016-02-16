
%% Exercise 2.3
% mergesort(U, S) :- U is the unsorted list, S is the sorted list via
% the mergesort algorithm:
% - repeatedly subdivide the list into sublists until each sublist is
%   exactly one element
% - merge the sublists into sorted sublists until there is only a
%   single sorted list
mergesort([], []).
mergesort([X], [X]).
mergesort(U, S) :-
    split(U, L, R),
    mergesort(L, LS),
    mergesort(R, RS),
    merge(LS, RS, S).

% split(L, LH, RH) :- LH is 'left half' of the list L, RH is the
% 'right half' of the list.
split([], [], []).
split([H], [H], []).
split([H0,H1|S], [H0|LH], [H1|RH]) :- split(S, LH, RH).

% merge sublists to create a sorted list
merge([], RS, RS).
merge(LS, [], LS).
merge([L|LS], [R|RS], [L|S]) :-
    L =< R,
    merge(LS, [R|RS], S).
merge([L|LS], [R|RS], [R|S]) :-
    L > R,
    merge([L|LS], RS, S).

%% Exercise 2.4
% dutch_flag(L, D) :- L is the unsorted list of elements, D is the
% sorted list where the elements with red(X) are first, white(X) are
% second, and blue(X) are last
dutch_flag([], []).
dutch_flag([X], [X]).
dutch_flag(L, D) :-
    filterColor(red, L, Rs),
    filterColor(white, L, Ws),
    filterColor(blue, L, Bs),
    append([Rs, Ws, Bs], D).

% filterColor(P, L, C) :- P is the predicate used to identify whether
% an item satisfies the color requirement. if the item does, it'll be
% in the results list C.
filterColor(_P, [], []).
filterColor(P, [H], [H]) :- call(P, H).
filterColor(P, [H|L], [H|C]) :-
    call(P, H),
    filterColor(P, L, C).
filterColor(P, [_H|L], C) :-
    filterColor(P, L, C).

% arbitrarily assign some atoms to the predicates
blue(b).
red(r).
white(w).

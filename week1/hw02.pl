%% Homework Week 2

%% consult('list.pl').
%% consult('sort.pl').

%% 2.1
%% sublist_(Xs, Ys) :- prefix(Ps, Ys), suffix(Xs, Ps).
%% Identify a shortcoming of the given definition of sublist and
%% rewrite it to avoid the problem.

sublist_([a,b],[a,b,c,d]).

sublist_([b,c],[a,b,c,d]).

sublist_([c,d],[a,b,c,d]).

sublist_([d,a],[a,b,c,d]). 	%should be false?

sublist_([a,c],[a,b,c,d]).	%should be false?

% a list of one or no items is not considered a sublist

sublist_([c],[a,b,c,d]).	%should be true?

sublist_([],[a,b,c,d]).		%should be true?

% Fix
%% sublist2([], Ys).
%% sublist2(Xs, Ys) :- prefix_(Ps, Ys), suffix_(Xs, Ps), append(Xs, _, Ys).

sublist2([a,b],[a,b,c,d]).

sublist2([b,c],[a,b,c,d]).

sublist2([c,d],[a,b,c,d]).

sublist2([c],[a,b,c,d]).

sublist2([],[a,b,c,d]).

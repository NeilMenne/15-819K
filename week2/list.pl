%%% Simple predicates on lists
%%% Author: Frank Pfenning
%%%
%%% If a predicate p is already built-in, the name
%%% has been modified to p_ to allow this to compile

% list_(Xs) iff Xs is a list
% Same as built-in list(Xs)
list_([]).
list_([X|Xs]) :- list_(Xs).

% nat(N) iff N is a natural number in unary notation
nat(z).
nat(s(N)) :- nat(N).

% natlist(N) iff N is a list of natural numbers
natlist([]).
natlist([N|Ns]) :- nat(N), natlist(Ns).

% plist(P, Xs) iff Xs is a list where each element satisfies P
plist(P, []).
plist(P, [X|Xs]) :- G=..[P, X], call(G), plist(P, Xs).
% P(X) or call(P(X)) works in some Prolog implementations,
% but not in GNU Prolog.
% Decompose into G=..[P, X] which sets G = P(X) and then call G

% member_(X, Ys) iff X is a member of the list Ys.
% Will succeed multiple times for each member of Ys equal to X.
% member_(X, Ys) is identical to built-in member(X, Ys)
member_(X, [X|Ys]).
member_(X, [Y|Ys]) :- member_(X, Ys).

% member1(X, Ys) iff X is a member of the list Ys
% Will succeed only once, for the first member of Ys equal to X.
member1(X, [X|Ys]).
member1(X, [Y|Ys]) :- X \= Y, member1(X, Ys).

% prefix_(Xs, Ys) iff list Xs is a prefix of list Ys
prefix_([], Ys).
prefix_([X|Xs], [X|Ys]) :- prefix_(Xs, Ys).

% suffix_(Xs, Ys) iff list Xs if a suffix of list Ys
suffix_(Xs, Xs).
suffix_(Xs, [Y|Ys]) :- suffix(Xs, Ys).

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
length_([X|Xs], N) :- length_(Xs, N1), N is N1+1.

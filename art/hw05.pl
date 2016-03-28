%% 5.01 - The problem with negation:

%% Given some trivial predicates, engineer and ooltewah, and a
%% well-defined domain that these predicates/facts apply to: [brent,
%% neil, josh, lang] we introduce a new predicate elsewhere using
%% simple negation.

engineer(brent).
engineer(neil).
engineer(josh).
engineer(lang).

ooltewah(neil).
ooltewah(josh).

elsewhere(X) :- not(ooltewah(X)).

%% Discuss the results of the following query:
%% elsewhere(X), engineer(X).

%% And how those results differ from:
%% engineer(X), elsewhere(X).

%% 5.02 - Is this list a set?

%% Remember that member/2 is provided. Write a function set/1 which
%% expects a list and determines whether or not that list is also a
%% set.

set([]).
set([X|Ys]) :- not(member(X,Ys)), set(Ys).

%% set([a, b, c]). => true/yes
%% set([a, b, a]). => false/no

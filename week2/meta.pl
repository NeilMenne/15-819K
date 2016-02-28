% Simple meta-interpreters
% Author: Frank Pfenning

% Declare test predicates to be dynamic
% so they can be used with clause/2
:- dynamic([p/1, q/1, r/1]). 

% Version 0
% Use meta-call facilities
solve0(A) :- call(A).

% Version 1
% Inherit subgoal order, clause order, unification
% solve1(A)  --  solve goal A
solve1(true).
solve1((A , B)) :- solve1(A), solve1(B).
solve1(P) :- clause(P, B), solve1(B).

% Version 2
% Inherit clause order, unification
% Make subgoal order explicit through subgoal stack
% solve2(A, S)  --  solve A with subgoal stack S
solve2(true, true).
solve2(true, (A , S)) :- solve2(A, S).
solve2((A , B), S) :- solve2(A, (B , S)).
solve2(P, S) :- clause(P, B), solve2(B, S).

% Top-level call: subgoal stack is empty
solve2(A) :- solve2(A, true).

% Trivial test predicates
p(X) :- q(X), r(X).
q(a).
q(b).
r(b).
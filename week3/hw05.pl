%% 4.01 Check whether a given term represents a binary tree
istree(nil).
istree(t(_, L, R)) :-
    istree(L),
    istree(R).

[hw2]. make.

/* examples
*/

% Exercise 2.1
sublist_([], [4, 1, 2, 3, 5]).


% Exercise 2.2
ordered([1, 3, 2]).

ordered([]).

ordered([1]).

ordered([1, 2]).

ordered([2, 1]).


permute([1, 2, 3], [1]).

permute([1, 2, 3], [1, 1, 1]).

permute([1, 2, 3], [1, 2, 3, 1]).

permute([1, 2, 3], [2, 3, 1]).

permute([1, 2, 3, 4], X).


% Exercise 2.3
merge_sort([], []).

merge_sort([1], [1]).

merge_sort([1, 2], [1, 2]).

merge_sort([2, 1], [1, 2]).

merge_sort([3, 2, 1], [1, 2, 3]).

merge_sort([2, 3, 1], [1, 2, 3]).

merge_sort([2, 1, 3], [1, 2, 3]).

% Exercise 2.4
flags([b, b, w, r, w, b, r, b, w], S).

sublist_([], []).

sublist_([], [1]).

sublist_([1], [1]).

sublist_([], [1, 2, 3]).

sublist_([], [a,b,c]).

sublist_([a], [a,b,c]).

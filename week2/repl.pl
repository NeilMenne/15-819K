equal(red, [red, red, red, blue, red]).

equal(red, [red, red, red, red, red]).

dutch([white], [blue], [white], [white, blue, red]).

dutch([red], [blue], [white], []).

dutch([red], [blue], [white], [white, blue, red]).

nd([r, b, w, w, w, r, b, w], [r, r, w, w, w, w, b, b]).

%% never returns
%% nd(Zs, [r, r, w, w, w, w, b, b]).

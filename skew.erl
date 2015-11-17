-module(skew).
-export([powers/1, digits/1]).

powers(0) -> [];
powers(1) -> [1];
powers(N) ->
    Log2 = trunc(math:log2(N + 1)),
    LargestSkew = trunc(math:pow(2, Log2)) - 1,
    [LargestSkew | powers(N - LargestSkew)].

zeros(N) -> lists:duplicate(N, 0).

log(N) -> trunc(math:log2(N + 1)) - 1.

digits([]) -> [];
digits([P]) -> [1 | zeros(log(P))];
digits([P, Q]) when P == Q -> [2 | zeros(log(P))];
digits([P, Q]) -> [1 | zeros(log(P) - log(Q) - 1) ++ digits([Q])];
digits([P, Q, R | Powers]) when P == Q ->
    [2 | zeros(log(P) - log(R) - 1) ++ digits([R | Powers])];
digits([P, Q | Powers]) ->
    [1 | zeros(log(P) - log(Q) - 1) ++ digits([Q | Powers])].

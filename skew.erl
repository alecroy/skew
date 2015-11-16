-module(skew).
-export([powers/1]).

powers(0) -> [];
powers(1) -> [1];
powers(N) ->
    Log2 = trunc(math:log2(N + 1)),
    LargestSkew = trunc(math:pow(2, Log2)) - 1,
    [LargestSkew | powers(N - LargestSkew)].

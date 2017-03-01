-module(sum).
-author("BeenoTung").

-export([compress/1, test/0]).
%-compile(export_all).

compress(Xs) -> compress(Xs,[]).

compress([], Acc) -> lists:reverse(Acc);
compress([{H,N1}|[{H,N2}|T]], Acc) -> compress([{H,N1+N2}|T],Acc);
compress([H|T], Acc) -> compress(T,[H|Acc]).

test() -> compress([{"01 Feb 2017", 16439}, {"01 Feb 2017", 15803}]) == [{"01 Feb 2017", 32242}].

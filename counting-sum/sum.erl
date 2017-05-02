-module(sum).
-author("BeenoTung").

-export([compress/1, test/0, test2/0]).
%-compile(export_all).

compress(Xs) -> compress(Xs,[]).

compress([], Acc) -> lists:reverse(Acc);
compress([{H,N1}|[{H,N2}|T]], Acc) -> compress([{H,N1+N2}|T],Acc);
compress([H|T], Acc) -> compress(T,[H|Acc]).

test() -> compress([{"01 Feb 2017", 16439}, {"01 Feb 2017", 15803}]) == [{"01 Feb 2017", 32242}].

test2() -> compress(
[{"Wed, 01 Feb 2017", 16439},
 {"Wed, 01 Feb 2017", 15803},
 {"Thu, 02 Feb 2017", 16375},
 {"Thu, 02 Feb 2017", 16488},
 {"Fri, 03 Feb 2017", 15597},
 {"Fri, 03 Feb 2017", 15566},
 {"Mon, 06 Feb 2017", 15681},
 {"Mon, 06 Feb 2017", 15665},
 {"Tue, 07 Feb 2017", 14350},
 {"Tue, 07 Feb 2017", 14779},
 {"Wed, 08 Feb 2017", 14286},
 {"Wed, 08 Feb 2017", 14897},
 {"Thu, 09 Feb 2017", 15838},
 {"Thu, 09 Feb 2017", 15815},
 {"Fri, 10 Feb 2017", 15071},
 {"Fri, 10 Feb 2017", 17488},
 {"Mon, 13 Feb 2017", 14582},
 {"Mon, 13 Feb 2017", 14990},
 {"Tue, 14 Feb 2017", 15827},
 {"Tue, 14 Feb 2017", 15704},
 {"Wed, 15 Feb 2017", 14400},
 {"Wed, 15 Feb 2017", 14400},
 {"Thu, 16 Feb 2017", 15386},
 {"Thu, 16 Feb 2017", 15493},
 {"Fri, 17 Feb 2017", 15771},
 {"Fri, 17 Feb 2017", 15390},
 {"Mon, 20 Feb 2017", 14604},
 {"Mon, 20 Feb 2017", 15306},
 {"Tue, 21 Feb 2017", 14132},
 {"Tue, 21 Feb 2017", 15831},
 {"Wed, 22 Feb 2017", 14175},
 {"Wed, 22 Feb 2017", 15566},
 {"Thu, 23 Feb 2017", 14880},
 {"Thu, 23 Feb 2017", 15780},
 {"Fri, 24 Feb 2017", 14700},
 {"Fri, 24 Feb 2017", 14700},
 {"Mon, 27 Feb 2017", 33759},
 {"Tue, 28 Feb 2017", 34696}]
) ==
[{"Wed, 01 Feb 2017", 32242},
 {"Thu, 02 Feb 2017", 32863},
 {"Fri, 03 Feb 2017", 31163},
 {"Mon, 06 Feb 2017", 31346},
 {"Tue, 07 Feb 2017", 29129},
 {"Wed, 08 Feb 2017", 29183},
 {"Thu, 09 Feb 2017", 31653},
 {"Fri, 10 Feb 2017", 32559},
 {"Mon, 13 Feb 2017", 29572},
 {"Tue, 14 Feb 2017", 31531},
 {"Wed, 15 Feb 2017", 28800},
 {"Thu, 16 Feb 2017", 30879},
 {"Fri, 17 Feb 2017", 31161},
 {"Mon, 20 Feb 2017", 29910},
 {"Tue, 21 Feb 2017", 29963},
 {"Wed, 22 Feb 2017", 29741},
 {"Thu, 23 Feb 2017", 30660},
 {"Fri, 24 Feb 2017", 29400},
 {"Mon, 27 Feb 2017", 33759},
 {"Tue, 28 Feb 2017", 34696}].
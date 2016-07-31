%%%-------------------------------------------------------------------
%%% @author beenotung
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. Jul 2016 10:45 AM
%%%-------------------------------------------------------------------
-module(main).
-author("beenotung").

%% API
-compile(export_all).

%% recursion without tail optimization
fib_slow(N) ->
  if
    N == 1 -> 1
  ; N == 2 -> 1
  ; N > 2 -> fib_slow(N - 1) + fib_slow(N - 2)
  end.

take(0, [H | _]) -> H;
take(N, [_ | Tail]) when n > 1 -> take(N - 1, Tail).

len(Len, []) -> Len;
len(Len, [_ | Tail]) -> len(Len + 1, Tail).

len(List) -> len(0, List).

%% dynamic programming
fib_fast(N) when N > 0 -> take(N - 1, fib_table(N)).

fib_table(N) -> fib_table(N, [1, 1]).

fib_table(N, List) ->
  case len(List) of
    Len when N =< Len ->
      List;
    Len when N - 1 == Len ->
      List ++ [take(N - 2, List) + take(N - 3, List)];
    Len when N > Len ->
      fib_table(N, fib_table(N - 1, List))
  end.

%% reduction approach
fib_fastest(N) -> fib_internal(N, 1, 1, 1).

fib_internal(1, _, _, _) -> 1;
fib_internal(2, _, _, _) -> 1;
fib_internal(Target, Target, Pre1, _) -> Pre1;
fib_internal(Target, Current, Pre1, Pre2) when Current < Target ->
  fib_internal(Target, Current + 1, Pre2, Pre1 + Pre2).

-module(utils).
%-compile(export_all).
-export([
  take/2
  , genNList/3
  , random/1
  , int_to_string/1
  , test/1
  , sort_list/1
  , uniq_list/1
]).

take(1, [H | _]) ->
  H;
take(Num, [_ | Tail]) ->
  take(Num - 1, Tail).

genList(0, Value) ->
  [];
genList(1, Value) ->
  [Value];
genList(Size, Value) ->
  [Value | genList(Size - 1, Value)].

genNList(NDimension, Size, Value) when NDimension =< 1 ->
  [genList(Size, Value)];
genNList(NDimension, Size, Value) ->
  [genList(Size, Value) | genNList(NDimension - 1, Size, Value)].

random(X) when X =< 0 ->
  invalid;
random(1) ->
  os:system_time() rem 10;
random(NDigit) ->
  random(1) + random(NDigit - 1) * 10.

int_to_string(0) -> "0";
int_to_string(1) -> "1";
int_to_string(2) -> "2";
int_to_string(3) -> "3";
int_to_string(4) -> "4";
int_to_string(5) -> "5";
int_to_string(6) -> "6";
int_to_string(7) -> "7";
int_to_string(8) -> "8";
int_to_string(9) -> "9";
int_to_string(X) when X < 0 -> "!invalid!";
int_to_string(X) ->
  int_to_string(X div 10) ++ int_to_string(X rem 10).

gen_digit_list(0) -> [0];
gen_digit_list(X) -> [X rem 10 | gen_digit_list(X div 10)].

count_digit(X, []) -> 0;
count_digit(X, [X | Tail]) -> 1 + count_digit(X, Tail);
count_digit(X, [_ | Tail]) -> count_digit(X, Tail).

count_uniq_digit_list([], List) -> [];
count_uniq_digit_list(Index = [Head | Tail], List) ->
  HeadCount = count_digit(Head, List),
  HeadLabel = Head,
  [{HeadLabel, HeadCount} | count_uniq_digit_list(Tail, List)].

count_digit_list([]) -> [];
count_digit_list(List) ->
%%  io:format("before sort ~p~n", [List]),
  SortedList = sort_list(List),
%%  io:format("after sort ~p~n", [SortedList]),
  UniqList = uniq_list(SortedList),
%%  io:format("uniq list : ~p~n", [UniqList]),
  count_uniq_digit_list(UniqList, List).

power_count(0) -> 0;
power_count(X) -> 1 + power_count(X div 10).

count_int(X, []) ->
  0;
count_int(X, [X | Tail]) ->
  1 + count_int(X, Tail).

map_int(0) -> 0;
map_int(X) -> [X rem 10 | map_int(X div 10)].

list_filter([], Fun) -> [];
list_filter([Head | Tail], Fun) ->
  Matched = Fun(Head),
%%  io:format("matched : ~p~n", [Matched]),
  if Matched ->
    [Head] ++ list_filter(Tail, Fun);
    not Matched -> list_filter(Tail, Fun)
  end.

smaller_number(A) ->
  fun(B) -> B < A end.

same_number(A) ->
  fun(B) -> A == B end.

larger_number(A) ->
  fun(B) -> B > A end.

sort_list([]) ->
%%  io:format("case 1~n"),
  [];
sort_list([Head | []]) ->
%%  io:format("case 2~n"),
  [Head];
sort_list([Head | Tail]) ->
%%  io:format("case 3 : ~p ; ~p ~n", [Head, Tail]),
  Left = list_filter(Tail, smaller_number(Head)),
  Center = list_filter(Tail, same_number(Head)),
  Right = list_filter(Tail, larger_number(Head)),
%%  io:format("Head : ~p~n", [Head]),
%%  io:format("Tail : ~p~n", [Tail]),
%%  io:format("Left : ~p~n", [Left]),
%%  io:format("Center : ~p~n", [Center]),
%%  io:format("Right : ~p~n~n", [Right]),
  sort_list(Left) ++ [Head | Center] ++ sort_list(Right).

uniq_list_i([], Skip) -> [];
uniq_list_i([Skip | Tail], Skip) ->
  uniq_list_i(Tail, Skip);
uniq_list_i([Head | Tail], Skip) ->
  [Head | uniq_list_i(Tail, Head)].

%% input List must be sorted
uniq_list([]) -> [];
uniq_list([Head | []]) -> [Head];
uniq_list(List = [Head | _]) -> [Head] ++ uniq_list_i(List, Head).

test(Length) ->
  Num = random(Length),
  DigitList = gen_digit_list(Num),
  Dict = count_digit_list(DigitList),
  io:format("the random test result : ~p~n", [Dict]).

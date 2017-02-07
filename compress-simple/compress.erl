-module(compress).
-author("Beeno Tung").

-compile(export_all).

compress(Xs) -> lists:reverse(compress(Xs,[])).

compress([], Acc) -> Acc;
compress([H|[H|T]], Acc) -> compress([ {H,2} |T],Acc);
compress( [ {H,N} | [H|T] ], Acc) -> compress( [ {H,N+1} | T ], Acc);
compress([H|T], Acc) -> compress(T,[H|Acc]).

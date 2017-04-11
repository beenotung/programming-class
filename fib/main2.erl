-module(main2).

-export([fib/1]).

fib(0) -> 1;
fib(1) -> 1;
fib(N) -> fib(N-2,1,1).

fib(0,A,B) -> A+B;
fib(N,A,B) -> fib(N-1,B,A+B).
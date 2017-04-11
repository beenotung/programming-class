fib(0,1).
fib(1,1).
fib(N,F) :- fib(N-2,1,1,F).

fib(0,A,B,F) :- F is A + B.

fib(N,A,B,F) :-
    N > 0,
    N1 is N - 1,
    A1 is B,
    B1 is A + B,
    fib(N1,A1,B1,F).
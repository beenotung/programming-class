prime(2).
prime(3).
prime(X) :-
  X > 3,
  \+ (
    X1 is X - 1,
    between(2,X1,N),
    0 is X mod N
  ).

next_prime(X,R) :-
  Start is X + 1,
  End is X * 2,
  next_prime_(Start,End,R).

next_prime_(Start,End,R) :-
  between(Start,End,R),
  prime(R).

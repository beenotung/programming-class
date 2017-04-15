prime(X) :-
  X > 1,
  \+ (
    X1 is X - 1,
    between(2,X1,N),
    0 is X mod N
  ).

next_prime(X,R) :-
  Start is X + 1,
  End is X * 2,
  between(Start,End,R),
  prime(R).

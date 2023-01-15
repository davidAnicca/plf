#!/bin/prolog

f(1, 1):-!.
f(K, X):-
	K1 is K-1,
	f(K1, Y),
	aux(K1, X, Y).

aux(K, X, Y):-
	Y > 1,
	!,
	K2 is K-1,
	X is K2.

aux(_, X, Y):-
	Y > 0.5,
	!,
	X is Y.

aux(_, X, Y):- X is Y - 1.

f2(1, 1):-!.
f2(K,X):-K1 is K-1, f2(K1,Y) , Y>1, !, K2 is K1-1, X is K2.
f2(K,X):-K1 is K-1, f2(K1,Y) , Y>0.5, !, X is Y.
f2(K,X):-K1 is K-1, f2(K1,Y) , X is Y-1.

t():-
	f(20, Y),
	print(Y),
	f2(20, YY),
	print(""),
	print(YY).

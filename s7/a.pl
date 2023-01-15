#!/bin/prolog

f([], 0).

f([H|T], S):-
	f(T, S1),
	aux([H|T], S, S1).

aux([H|_], S, S1):-
	H < S1,
	!,
	S is H + S1.

aux([_|_], S, S1):-
	S is S1 + 2.
	
f2([], 0).
f2([H|T],S):- f2(T,S1) ,H<S1,!,S is H+S1.
f2([_|T],S):- f2(T,S1) , S is S1+2.

test():-
	f([1, 2, 3, 4, 5], S),
	write(S),
	
	f2([1, 2, 3, 4, 5], S2),
	write(S2).

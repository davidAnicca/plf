#!/bin/prolog

f([], -1):-!.
f([H|T], Y):-
	f(T, S),
	aux([H|T], Y, S).

aux([_|T], Y, S):-
	S < 1,
	!,
	Y is S +2.

aux([H|T], Y, S):-
	S < 0,
	!,
	Y is S + H.

aux([_|T], Y, S):-
	Y is S.

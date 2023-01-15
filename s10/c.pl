#!/bin/prolog

e([H|_], H).
e([_|T], E):-
	e(T, E).

s(_, S, S, NC, C, C):-
	NC mod 2 =:= 0.

s(L, _, SDAT, _, [], R):-
	e(L, E),
	E mod 2 =:= 0,
	s(L, E, SDAT, 1, [E], R).


s(L, _, SDAT, _, [], R):-
	e(L, E),
	E mod 2 =:= 1,
	s(L, E, SDAT, 0, [E], R).


s(L, S, SDAT, NC, [H|T], R):-
	e(L, E),
	E < H,
	E mod 2 =:= 0,
	NCPP is NC + 1,
	SPE is S + E,
	s(L, SPE, SDAT, NCPP, [E, H|T], R).


s(L, S, SDAT, NC, [H|T], R):-
	e(L, E),
	E < H,
	E mod 2 =:= 1,
	NCPP is NC + 0,
	SPE is S + E,
	s(L, SPE, SDAT, NCPP, [E, H|T], R).

sub(L, S, O):-
	findall(R, s(L, 0, S, 0, [], R), O).

t():-
	sub([1,2,3,4,5,6,10], 10, O),
	write(O).
	

#!/bin/prolog

e([H|_], H).
e([_|T], E):-
	e(T, E).
	
%sub(L, S, NP, SD, C, R)

sub(_, S, NP, S, C, C):-
	NP mod 2 =:= 0.
	
sub(L, _, NP, SD, [], R):-
	e(L, E),
	E mod 2 =:= 0,
	NPP is NP + 1,
	sub(L, E, NPP, SD, [E], R).

sub(L, _, NP, SD, [], R):-
	e(L, E),
	E mod 2 =:= 1,
	sub(L, E, NP, SD, [E], R).

sub(L, S, NP, SD, [H|T], R):-
	e(L, E),
	\+ e([H|T], E),
	E < H,
	SPE is S + E,
	E mod 2 =:= 0,
	NPP is NP + 1,
	sub(L, SPE, NPP, SD, [E,H|T], R).


sub(L, S, NP, SD, [H|T], R):-
	e(L, E),
	\+ e([H|T], E),
	E < H,
	SPE is S + E,
	E mod 2 =:= 1,
	sub(L, SPE, NP, SD, [E,H|T], R).
	 

s(L, S):-
	findall(R, sub(L, 0, 0, S, [], R), O),
	write(O).
	

#!/bin/prolog

e([H|_], H).
e([_|T], E):-e(T, E).

%s(L, S, NC, C, O)
s(_, S, NC, C, C):-
	S mod 2 =:= 1,
	NC mod 2 =:= 1.
	
s(L, _, _, [], R):-
	e(L, E),
	K is E mod 2,
	s(L, E, K, [E], R).

s(L, S, N, [H|T], R):-
	e(L, E),
	E < H,
	K is E mod 2,
	SPP is S + E,
	NPP is N + K,
	s(L, SPP, NPP, [E, H|T], R).

sub(L, R):-
	findall(O, s(L, 0, 0, [], O), R).

t():-
	sub([2, 3, 4], R),
	write(R).

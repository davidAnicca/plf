#!/bin/prolog

%g(A, B, C, R)

g(B, B, C, [B|C]).
g(A, B, C, R):-
	APP is A + 1,
	g(APP, B, [A|C], R).

i(A, B, R):-
	g(A, B, [], R).

e([H|_], H).
e([_|T], E):-
	e(T, E).

s(_, S, C, C):-
	S mod 2 =:= 1.

s(L, _, [], R):-
	e(L, E),
	s(L, E, [E], R).

s(L, S, [H|T], O):-
	e(L, E),
	E < H, 
	SPE is S + E,
	s(L, SPE, [E,H|T], O).

t():-
	i(2, 4, L),
	findall(O, s(L, 0, [], O), R),
	write(R).
	

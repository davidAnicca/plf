#!/bin/prolog

extragere([H|_], H).
extragere([_|T], E):-extragere(T, E).


%a(L, S, N, C, R)


a(_, S, N, C, C):-
	S mod 2 =:= 1,
	N mod 2 =:= 0.

a(L, S, N, C, R):-
	extragere(L, E),
	\+ extragere(C, E),
	SPE is S + E,
	NPP is N + 1,
	a(L, SPE, NPP, [E|C], R).

aw(L, O):-
	findall(R, a(L, 0, 0, [], R), O).

	


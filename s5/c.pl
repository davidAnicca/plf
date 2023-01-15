#!/bin/prolog

extrage([H|_], H).
extrage([_|T], E):-extrage(T, E).


%sub(L:list, NP:int, S:sumac, C, O)

sub(_, NP, S, C, C):-
	\+ NP =:= 0,
	NP mod 2 =:= 0,
	S mod 2 =:= 1.

%sub(_, _, _, C, C).

sub(L, NP, _, [], R):-
	extrage(L, E),
	E mod 2 =:= 0,
	NPP is NP+1,
	sub(L, NPP, E, [E], R).


sub(L, NP, _, [], R):-
	extrage(L, E),
	E mod 2 =:= 1,
	sub(L, NP, E, [E], R).


sub(L, NP, S, [H|T], R):-
	extrage(L, E),
	\+ extrage([H|T], E),
	E < H,
	E mod 2 =:= 1,
	SPE is S + E, 
	sub(L, NP, SPE, [E, H|T], R).

sub(L, NP, S, [H|T], R):-
	extrage(L, E),
	\+ extrage([H|T], E),
	E < H,
	E mod 2  =:= 0,
	NPP is NP + 1,
	SPE is S + E, 
	sub(L, NPP, SPE, [E, H|T], R).


s(L):-
	findall(O, sub(L, 0, 0, [], O), R),
	write(R).

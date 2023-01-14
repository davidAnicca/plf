#!/bin/prolog
%să se steargă toate secvențele consecutive
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
add_f([], E, [E]).
add_f([H|T], E, [H|R]):- add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%elim(L:list, C:list, R:list, LAST:int).

elim([], C, C, _).

elim([ A, B| T], C, R, _):-
	A =:= B - 1,
	!,
	elim([B|T], C, R, A).

elim([ A| T], C, R, LAST):-
	A =:= LAST + 1,
	!,
	elim(T, C, R, A).

elim([H|T], C, R, _):-
	add_f(C, H, CC),
	elim(T, CC, R, H).

eliminare(L, R):- elim(L, [], R, -1).


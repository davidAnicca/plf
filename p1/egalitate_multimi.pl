#!/bin/prolog
%să se verifice dacă două mulțimi sunt egale (fără să se facă apel la diferența a două mulțimi)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
in([], _):- fail.
in([E|_], E).
in([_|T], E):- in(T, E).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inclus(A:list, B:list) 
%verifică dacă A este inclus în B
%ii determinist
inclus([], _).
inclus([H|T], B):-
	in(B, H),
	inclus(T, B).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%egale(A:list, B:list)
%verifică dacă A === B 
%ii determinist

egale(A, B):-
	inclus(A, B),
	inclus(B, A).

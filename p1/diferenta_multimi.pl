#!/bin/prolog
%să se scrie un predicat care întoarce diferența a două mulțimi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%apare(L:lista, E:int)
%verifica dacă E apare în lista L
%determinist (ii)

apare([], _):-fail.
apare([E|_], E).
apare([H|T], E):-
	H =\= E,
	apare(T, E).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mdif(A:lista, B:lista, C:lista, O:lista)
%diferenta A-B colectată în C
%rezultatul în O
%iiio iiii determinist

mdif([], _, C, C).

mdif([H|T], B, C, O):-
	apare(B, H),
	!,
	mdif(T, B, C, O). 

mdif([H|T], B, C, O):-
	add_f(C, H, C1),
	mdif(T, B, C1, O).	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mdiff(A:lista, B:lista, C:lista)
%C <- A-B
%determinist iii, iio

mdiff(A, B, C):-
	mdif(A, B, [], C).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

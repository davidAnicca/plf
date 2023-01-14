#!/bin/prolog
%să se scrie un predicat care determină cel mai mic 
%multiplu comun al elementelor unei liste formate
%din numere întregi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%cmmmc(A:int, B:int, C:int, O:int)
%cmmmc între A și B, calculat în C
%rezultatul în O
%iiio iiii determinist

cmmmc(A, B, C, C):-
	C mod B =:= 0,
	C mod A =:= 0,
	!.

cmmmc(A, B, C, O):-
	K is C+1,
	cmmmc(A, B, K, O).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%cmmmcF(A:int, B:int, C:int)
%C <- cmmmc(A, B)

cmmmcF(A, B, C):-
	cmmmc(A, B, A, C).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%cmmmcL(L:lista, C:int, O:int)
%calculează în C cmmmc de elemente din lista
%rezultatul în O
%iii, iio determinist


cmmmcL([], C, C).
cmmmcL([H|T], C, O):-
	cmmmcF(H, C, C1),
	cmmmcL(T, C1, O).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%cmmmcFull(L:lista, C:int)
%C <- cmmmc(L)
%ii, io deteminist

cmmmcFull([H|T], C):-
	cmmmcL([H|T], H, C).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#!/bin/prolog
%să se scrie un predicat care testează dacă o listă este o mulțime
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ap(L:list, E:int, N:int, R:int)
%numără în N numărul de apariții ale lui E în L
%rezultat în R
%iiio iiii determinist

ap([], _, N, N).

ap([H|T], E, N, R):-
	H =:= E,
	!,
	NPP is N+1,
	ap(T, E, NPP, R).

ap([_|T], E, N, R):-
	ap(T, E, N, R).

%wrapper
%iio iii determinist
aparitii(L, E, N):- ap(L, E, 0, N).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%multime(L:lista, LC:lista)
%verifiva dacă lista L este o mulțime
%LC - copia listei
%ii determinist
multime([], _).

multime([H|_], LC):-
	aparitii(LC, H, N),
	N > 1,
	!,
	fail.

multime([_|T], LC):-
	multime(T, LC).

%wrapper
%i determinist
e_multime(L):-multime(L, L).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

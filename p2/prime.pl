#!/bin/prolog
%Se da o lista de numere intregi. 
%Se cere sa se scrie de 2 ori in lista 
%fiecare numar prim. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%prim_o(N:int, D:int)
%verifică dacă N este prim
%D parcurge toți posibilii divizori între 2 și N div 2
%ii determinist

prim_o(N, D):-
	N > 1,
	JN is N div 2,
	D > JN.

prim_o(N, D):-
	N > 1,
	M is N mod D,
	M =\= 0,
	DD is D+1,
	prim_o(N, DD).

%wrapper prim(N:int)
%verifică dacă N este prim
%i determ

prim(N):- prim_o(N, 2).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%scrie(L:list, C:list, R:list)
%scrie de două ori toate primele din L
%C colectoare
%R rezultat
%iio iii determinist

scrie([], C, C).

scrie([H|T], C, R):-
	prim(H),
	!,
	add_f(C, H, CC),
	add_f(CC, H, CCC),
	scrie(T, CCC, R).

scrie([H|T], C, R):-
	add_f(C, H, CC),
	scrie(T, CC, R).

%wrapper run(L:lista)
%i determinist
%afișează rezultatul
run(L):- 
	scrie(L, [], R),
	print(R).

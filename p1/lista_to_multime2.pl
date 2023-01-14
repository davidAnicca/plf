#!/bin/prolog
%să se scrie un predicat care transformă
%o listă într-o mulțime, in ordinea ULTIMEI
%apariții
%exemplu [1, 2, 3, 1, 2] -> [3, 1, 2]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%reverse_o(L:list, C:list, R:list)
%inversează lista L
%C colectoare
%rezultat în R
%iio iii determinist
reverse_o([], R, R).
reverse_o([H|T], C, R):- reverse_o(T, [H|C], R). 
reverse(L, R):- reverse_o(L, [], R).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%add_f(L:lista, E:int, R:lista)
add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%apare(L:lista, E:int)
%verifica dacă E apare în L(true)
%(ii) determinist

apare([], _):-fail.
apare([E|_], E).
apare([H|T], E):-
	H =\= E,
	apare(T, E).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%lm(L:lista, C:lista, O:lista)
%transforma lista L intr-o mulțime cu pastrarea pozițiilor (prima apariție)
%rezultat în O
%iii, iio determinist

lmm([], C, C).

lmm([H|T], C, O):-
	apare(C, H),
	!,
	lmm(T, C, O).
	
lmm([H|T], C, O):-
	add_f(C, H, R),
	lmm(T, R, O).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%wraper

ltos(L, R):-
	reverse(L, LR),
	lmm(LR, [], RR),
	reverse(RR, R).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

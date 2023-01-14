#!/bin/prolog
%să se elimine toate aparitiile unui anumit atom dintr-o lista
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%add_f(L, E, C)
%adauga la final

add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%elimina(L:list, C:list, O:list, E:int)
%elimina toate aparitiile lui E din lista L
%C colectoare
%O rezultat

elimina([], C, C, _).

elimina([H|T], C, O, E):-
	H =:= E,
	!,
	elimina(T, C, O, E).

elimina([H|T], C, O, E):-
	add_f(C, H, R),
	elimina(T, R, O, E).

%wrapper
run(L, E, C):-
	elimina(L, [], C, E).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

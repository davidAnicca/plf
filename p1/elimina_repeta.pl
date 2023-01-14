#!/bin/prolog
%să se elimine dintr-o lista toate elementele care se repetă
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%aparitii_e(L:lista, E:int, N:int, O:int)
%numără aparițiile elementului E în lista L
%N variabilă de numărare
%O rezultat

aparitii_e([], _, N, N).

aparitii_e([H|T], E, N, O):-
	H =:= E,
	!,
	NPP is N+1,
	aparitii_e(T, E, NPP, O).

aparitii_e([_|T], E, N, O):-
	aparitii_e(T, E, N, O).

%wrapper
aparitii(L, E, N):-aparitii_e(L, E, 0, N).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%add_f(L, E, C)
%adauga la final

add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%elimina(L:list, LC:list C:list, O:list)
%elimina elementele din L care se repetă
%C colectoare
%LC copie lista L
%O rezultat

elimina([], _, C, C).

elimina([H|T], LC, C, O):-
	aparitii(LC, H, N),
	N > 1,
	!,
	elimina(T, LC, C, O).

elimina([H|T], LC, C, O):-
	add_f(C, H, R),
	elimina(T, LC, R, O).

%wrapper
run(L, C):-
	elimina(L, L, [], C).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#!/bin/prolog
%să se scrie un predicat care intoarce reuniunea a două mulțimi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%in(L:list, E:element)
%verifică dacă un element apare în lista

in([], _):-fail.
in([E|_], E).
in([_|T], E):-in(T, E).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%adaugare la final
add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%reuniune(A:list, B:list, O:list)
%efectuează reuniunea mulțimilor A și B
%rezultatul în O

reuniune(A, [], A).

reuniune(A, [H|T], O):-
	in(A, H),
	!,
	reuniune(A, T, O).

reuniune(A, [H|T], O):-
	add_f(A, H, C),
	reuniune(C, T, O).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#!/bin/prolog
%să se intercaleze un element pe pozitia a n-a a unei liste
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%adaugare la final
add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inter(L:list, C:list, R:list E:int, P:int, I:int)
%intercalează elementul E pe poziția P în lista L
%C colectoare
%R rezultat
%E elementul de intercalat
%P pozitia pe care se intercalează
%I indicele curent

inter([], C, C, _, P, I):-
	P < I.

inter([], C, CPP, E, P, I):-
	P >= I,
	add_f(C, E, CPP).

inter(L, C, R, E, P, I):-
	P =:= I,
	!,
	add_f(C, E, CPP),
	IPP is I+1,
	inter(L, CPP, R, E, P, IPP).

inter([H|T], C, R, E, P, I):-
	add_f(C, H, CPP),
	IPP is I+1,
	inter(T, CPP, R, E, P, IPP).

%wrapper run(L:list, R:list, E:int, P:int)

run(L, R, E, P):- inter(L, [], R, E, P, 1).

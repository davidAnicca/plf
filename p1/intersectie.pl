#!/bin/prolog
%sa se scrie un predicat care intoarce intersectia a doua multimi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%in(L:list, E:int)
%verifică dacă E apare în lista L
%ii determinist

in([], _):-fail.
in([E|_], E).
in([_|T], E):- in(T, E).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%adaugare final
add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%intersectie(A:list, B:list, C:list, R:list)
%intersecția dintre A și B
%C colectoare
%R rezultat
%iiio iiii determinist

intersectie([], _, C, C).
	
intersectie([H|T], B, C, R):-
	in(B, H),
	!,
	add_f(C, H, CPP),
	intersectie(T, B, CPP, R).

intersectie([_|T], B, C, R):-
	intersectie(T, B, C, R).

%wrapper run(A:list, B:list, R:list)
% A intersectat cu B
% R rezultat
% iio iii determinist

run(A, B, R):- intersectie(A, B, [], R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

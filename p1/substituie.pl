#!/bin/prolog
%să se scrie un predicat care substituie
%intr-o lista un elemnt printr-o altă listă.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%add_f(L:lista, E:int, C:lista)
%adauga la final elementul L
%iii, iio determinist
add_f([], E, [E]).
add_f([H|T], E, [H|C]):-add_f(T, E, C).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%concat(A:lista, B:lista, C:lista, O:lista)
%concatenează A și B
%C colectoare
%O rezultat
%iiio, iiii determinist

concat([], [], C, C).

concat([H|T], B, C, O):-
	add_f(C, H, R),
	concat(T, B, R, O).

concat([], [H|T], C, O):-
	add_f(C, H, R),
	concat([], T, R, O).

%concatenare full
concatenare(A, B, C):-concat(A, B, [], C).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%sub(A:lista, L:lista, C:lista, O:lista, E:int)
%substituie toate elementele E din A cu lista L
%C colectoare
%O rezultat
%iiioi, iiiii  determinist

sub([], _, C, C, _).

sub([H|T], L, C, O, E):-
	H == E,
	!,
	concatenare(C, L, R),
	sub(T, L, R, O, E).

sub([H|T], L, C, O, E):-
	concatenare(C, [H], R),
	sub(T, L, R, O, E).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%substituie(A:lista, L:lista, E:int, C:list)
%wrapper
substituie(A, L, E, C):-
	sub(A, L, [], C, E).

%pretty print
run(A, L, E):-
	substituie(A, L, E, C),
	write(C).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

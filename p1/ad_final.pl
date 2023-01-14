#!/bin/prolog
%ADĂUGAREA UNUI ELEMENT LA FINALUL UNEI LISTE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%add_f(L:lista, E:element, O:lista)
%adauga la finalul unei liste un element E
%rezultatul se afla în O
%iio iii determinist

add_f([], E, [E]).

add_f([H|T], E, [H|C1]):-
	add_f(T, E, C1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#!/bin/prolog
%să se determine pozitiile elementului maxim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%maxim_o(L:list, M:int, R:int)

maxim_o([], M, M).
maxim_o([H|T], M, R):-
	H > M,
	!,
	maxim_o(T, H, R).

maxim_o([_|T], M, R):-
	maxim_o(T, M, R).

%wrapper
maxim([H|T], M):- maxim_o([H|T], H, M). 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%poz_o(L:list, C:list, R:list, P:int, E:int)
%R lista cu pozitiile pe care se află elementul E din L
%C colectoare
%pozitia actuala din lista
%determinist iio iii

poz_o([], C, C, _, _).

poz_o([H|T], C, R, P, E):-
	H == E,
	add_f(C, P, CC),
	PP is P+1,
	poz_o(T, CC, R, PP, E).

poz_o([_|T], C, R, P, E):-
	PP is P+1,
	poz_o(T, C, R, PP, E).

%%%wrapper poz(L:list, R:list)
%R lista cu pozitiile pe care se află elementul maxim din L
%ii io determinist

poz(L, R):-
	maxim(L, E),
	poz_o(L, [], R, 1, E).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

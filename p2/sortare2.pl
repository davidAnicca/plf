#!/bin/prolog
%sortare cu eliminarea dublurilor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%min_o(L:list, M:int, R:int)
%calculează în R minimul dintr-o lista L
%M se modifică pe parcurs
%iio iii determinist

min_o([], M, M).

min_o([H|T], M, R):-
	M > H,
	!,
	min_o(T, H, R).

min_o([_|T], M, R):-
	min_o(T, M, R).

%wrapper min(L:list, M:int)
%minimul M din lista L
min([H|T], M):- min_o([H|T], H, M). 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%elimina_o(L:list, E:int, C:list, R:list)
%elimina toate aparițiile elementului E din lista L
%C colectoare R rezultat
%determinist iiio iiii

elimina_o([], _, C, C).

elimina_o([H|T], E, C, R):-
	H == E,
	!,
	elimina_o(T, E, C, R).

elimina_o([H|T], E, C, R):-
	add_f(C, H, CC),
	elimina_o(T, E, CC, R). 

elimina(L, E, R):- elimina_o(L, E, [], R). 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%sortare_o(L:list, C:list, R:list)
%sortează lista L în R
%C variabilă colectoare
%iii iio determinist

sortare_o([], C, C).

sortare_o(L, C, R):-
	min(L, M),
	elimina(L, M, LL),
	add_f(C, M, CC),
	sortare_o(LL, CC, R).

sortare(L):-
	sortare_o(L, [], R),
	write(R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

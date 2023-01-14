#!/bin/prolog
%Sa se adauge dupa fiecare element dintr-o lista divizorii elementului.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
add_f([], E, [E]).
add_f([H|T], E, [H|R]):- add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%add_div_o(L:list, N:int, D:int, R:list)
%adaugă în lista L toți divizorii lui N
%D divizorii posibili  
%R rezultat

add_div_o(R, N, NN, R):- NN is N+1.

add_div_o(L, N, D, R):-
	N mod D =:= 0,
	!,
	add_f(L, D, LL),
	DD is D+1,
	add_div_o(LL, N, DD, R).

add_div_o(L, N, D, R):-
	DD is D+1,
	add_div_o(L, N, DD, R).

%add_div(L:list, N:int, R:list)
%adaugă la lista L toți divizorii lui N
%rezultat în R 
%iio iii determinist
add_div(L, N, R):- add_div_o(L, N, 1, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%adauga(L:list, C:list, R:list)
%adaugă după fiecare element din L toți divizorii lui
%C colectoare
%R rezultat
%iio iii determinist

adauga([], R, R).

adauga([H|T], C, R):-
	add_f(C, H, CC),
	add_div(CC, H, CCC),
	adauga(T, CCC, R).

%run(L:list)
%afisează toate elementele din L urmate de divizorii lor
run(L):-
	adauga(L, [], R),
	print(R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

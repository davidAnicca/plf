#!/bin/prolog
%să se scrie un predicat care determina 
%produsul unui nr reprezentat pe lista
%cu o anumită cifră
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%reverse_o(L:list, C:list, R:rezultat)

reverse_o([], C, C).

reverse_o([H|T], C, R):-
	reverse_o(T, [H|C], R).

reverse(L, R):- reverse_o(L, [], R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%produs(N:list, E:int, R:int, T:transport, P:int, RR:int)
%N nr reprezentat INVERS pe lista
%N * E
%R rezultat
%T transport
%P puterea 
%RR rezultat final

produs([], _, R, T, P, RR):-
	RR is (T * P) + R.

produs([H|T], E, R, TR, P, RR):-
	PROD is ( E * H ) + TR,
	PROD > 10,
	!,
	PP is PROD mod 10,
	TRN is PROD div 10,
	PRODF is R + (PP * P),
	PN is P * 10,
	produs(T, E, PRODF, TRN, PN, RR).

produs([H|T], E, R, TR, P, RR):-
	PROD is (E * H) + TR,
	PN is P * 10,
	PRODF is R + (PROD * P),
	produs(T, E, PRODF, 0, PN, RR).

%wrapper 
%inversează lista de numere înainte de apel
%iii iio determinist

produs_f(L, E, R):-
	reverse(L, LL).
	produs(LL, E, 0, 0, 1, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#!/bin/prolog
%determina succesorul nr reprezentat pe lista
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%succ(N:list, C:list, R:list, TR:int, E:int)
%aduna 1 la N
%N numar reprezentat invers pe lista
%colectoare C
%R rezultat
%TR transportul la suma cu 1
%E prima dată e 1, apoi se mută la 0 pe toată execuția.
%iio iii determinist

succ([],C, R, 1, _):-!,
	add_f(C, 1, R).

succ([], C, C, 0, _).

succ([H|T], C, R, TR, E):-
	SUMA is H + E + TR,
	SUMA >= 10,
	!,
	UC is SUMA mod 10,
	add_f(C, UC, CC),
	succ(T, CC, R, 1, 0).

succ([H|T], C, R, TR, E):-
	SUMA is H + E + TR,
	add_f(C, SUMA, CC),
	succ(T, CC, R, 0, 0).

%succesor(L:list, R:list)
%ii io determinist	
succesor(L, R):-
	reverse(L, LL),
	succ(LL, [], RR, 0, 1),
	reverse(R, RR).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

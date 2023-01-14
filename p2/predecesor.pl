#!/bin/prolog
%determina predecesorul nr reprezentat pe lista
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pred(N:list, C:list, R:list, TR:int, E:int)
%scade 1 din N
%N numar reprezentat invers pe lista
%colectoare C
%R rezultat
%TR transportul la diferenta cu 1
%E prima dată e 1, apoi se mută la 0 pe toată execuția.
%iio iii determinist

pred([],C, R, 1, _):-!,
	add_f(C, 1, R).

pred([], C, C, 0, _).

pred([H|T], C, R, TR, E):-
	DIF is H - E - TR,
	DIF < 0,
	!,
	DIFF is 10 + H - E - TR,
	add_f(C, DIFF, CC),
	pred(T, CC, R, 1, 0).

pred([H|T], C, R, TR, E):-
	DIF is H - E - TR,
	add_f(C, DIF, CC),
	pred(T, CC, R, 0, 0).

%predecesor(L:list, R:list)
%ii io determinist	
predecesor(L, R):-
	reverse(L, LL),
	pred(LL, [], RR, 0, 1),
	reverse(R, RR).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

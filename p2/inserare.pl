#!/bin/prolog
%să se adauge in lista dupa 1-ul ele,emt
%al 3-lea element............ o valoare dată e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
add_f([], E, [E]).
add_f([H|T], E, [H|R]):- add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inser(L:list, C:list, R:list, E:int, I:int, P:int)
%L lista initiala
%C colectoarea
%R rezultatul
%E elementul de adaugat
% I indexul 1 .. 2 .. 
% P pozitia de adăugare 1...3....7....15....
%P(n) = 2*P(n-1) + 1
%P(0) = 1
% P <- 2*I + 1; I <-- 1 inițial
inser([], C, C, _, _, _).

inser([H|T], C, R, E, I, P):-
	I =:= P,
	!,
	add_f(C, H, CC),
	add_f(CC, E, CCC),
	IPP is I+1,
	PP is I + I + 1,
	inser(T, CCC, R, E, IPP, PP).

inser([H|T], C, R, E, I, P):-
	add_f(C, H, CC),
	IPP is I+1,
	inser(T, CC, R, E, IPP, P).

inserare(L, E):- 
	inser(L, [], R, E, 1, 1),
	print(R).




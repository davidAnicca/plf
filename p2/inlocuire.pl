#!/bin/prolog
%Sa se inlocuiasca toate aparitiile unui element dintr-o lista cu un alt 
%element.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
add_f([], E, [E]).
add_f([H|T], E, [H|R]):-
	add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%substituie(L:list, C:list, R:list, A:int, B:int)
%substituie orice element A din L cu elementul B 
%C colectoare
%R rezultat
%iioii iiiii determinist

substituie([], C, C, _, _).

substituie([A|T], C, R, A, B):-
	!,
	add_f(C, B, CPP),
	substituie(T, CPP, R, A, B).

substituie([H|T], C, R, A, B):-
	add_f(C, H, CPP),
	substituie(T, CPP, R, A, B).

%wrapper run(L:list, R:list, A:int, B:int)
%ioii iiii determinist
	 
run(L, R, A, B):- substituie(L, [], R, A, B).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

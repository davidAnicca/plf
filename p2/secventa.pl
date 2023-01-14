#!/bin/prolog
%Sa se determine cea mai lunga secventa de numere pare consecutive dintr-o 
%lista (daca sunt mai multe secvente de lungime maxima, una dintre ele).
%%%%%%%%%%%%%%%%%%%%%%%%%
add_f([], E, [E]).
add_f([H|T], E, [H|R]):- add_f(T, E, R).
%%%%%%%%%%%%%%%%%%%%%%%%%
%secv_o(L:list, I:int S:int, SM:int, DM:int, RS:int, RD:int)

%determină în RS și RD începutul și finalul celei mai lungi secvențe
%	de nr pare consecutive din L
%I indicele curent
%S > 0 dacă suntem într-o secvență (indică începutul ei)
%SM și DM limitele secvenței maxime găsite până la acel punct
%NU funcționează dacă secvența se termină cu ultimul element
%	pentru asta se adaugă artificial un 1 la finalul listei

%terminare lista
secv_o([], _,  _, SM, DM, SM, DM).

%incepe o secvență nouă
secv_o([A,B|T], I, -1, SM, DM, RS, RD):-
	A mod 2 =:= 0,
	B =:= A + 2,
	!,
	S is I,
	IPP is I+1,
	write('INCEPE '),
	print(A),
	write('\n'),
	secv_o([B|T], IPP, S, SM, DM, RS, RD).


%continua o secventa
secv_o([A,B|T], I, S, SM, DM, RS, RD):-
	S =\= -1,
	A mod 2 =:= 0,
	B =:= A + 2,
	!,
	write('CONTINUA '),
	print(A),
	write('\n'),
	IPP is I+1,
	secv_o([B|T], IPP, S, SM, DM, RS, RD).
	 
%se termină o secvență care e mai lungă decât maxima
secv_o([A, B|T], I, S, SM, DM, RS, RD):-
	S =\= -1,
	A mod 2 =:= 0,
	B =\= A + 2,
	LEN is I - S,
	LENV is DM - SM,
	LEN >= LENV,
	!,
	write('STOP >='),
	print(A),
	write('\n'),
	IPP is I+1,
	secv_o([B|T], IPP, -1, S, I, RS, RD).

%se termină o secvență care NU e mai lungă decât maxima
secv_o([A, B|T], I, S, SM, DM, RS, RD):-
	S =\= -1,
	A mod 2 =:= 0,
	B =\= A + 2,
	LEN is I - S,
	LENV is DM - SM,
	LEN < LENV,
	!,
	IPP is I+1,
	write('STOP <'),
	print(A),
	write('\n'),
	secv_o([B|T], IPP, -1, SM, DM, RS, RD).

%inafara oricărei secvențe 
secv_o([A, B|T], I, _, SM, DM, RS, RD):-
	A =\= B - 2,
	IPP is I+1,
	write('AFARA '),
	print(A),
	write('\n'),
	secv_o([B|T], IPP, -1, SM, DM, RS, RD).


%inafara oricărei secvențe ultimul element 
secv_o([A|T], I, _, SM, DM, RS, RD):-
	A mod 2 =:= 1,
	IPP is I+1,
	write('AFARA '),
	print(A),
	write('\n'),
	secv_o(T, IPP, -1, SM, DM, RS, RD).


%secv(L:list, S:int, D:int)
%secventa maximă de pare consecutive
%inceputul secvenței în S și finalul în D
%0 0 dacă nu s-a găsit așa ceva

secv(L, S, D):-
	add_f(L, 1, LL), 
	secv_o(LL, 1, -1, 0, 0, S, D).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%cut_o(L:list, I:int, S:int, D:int, C:list, R:list)
%taie lista între indicii S și D

cut_o([H|T], I, S, D, C, R):-
	I >= S,
	D >= I,
	!,
	add_f(C, H, CC),
	IPP is I+1,
	cut_o(T, IPP, S, D, CC, R).


cut_o([], _, _, _, C, C).
cut_o([_|T], I, S, D, C, R):-
	IPP is I + 1,
	cut_o(T, IPP, S, D, C, R).

cut(L, S, D, R):- cut_o(L, 1, S, D, [], R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%afisarea secventei
%run(L:list)
%i determinist

run(L):-
	secv(L, S, D),
	cut(L, S, D, R),
	print(R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#!/bin/prolog


g(0, C, C).
g(N, C, O):-
	NMM is N - 1,
	g(NMM, [N|C], O).

e([H|_], H).
e([_|T], E):-
	e(T, E).

%c(L, K, NC, C, R)
%k cate sa fie
%NC nr de elemente din colectoare

c(_, K, K, C, C).

c(L, K, _, [], R):-
	e(L, E),
	c(L, K, 1, [E], R).

c(L, K, NC, [H|T], R):-
	e(L, E),
	E < H, 
    D is H - E,
    D mod 2 =:= 0,
    NCPP is NC + 1,
    c(L, K, NCPP, [E, H|T], R).
	
t():-
	findall(R, c([1, 2, 3, 4], 2, 0, [], R), O),
	write(O).

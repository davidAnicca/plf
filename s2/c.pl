#!/bin/prolog

g(N, N, [N]):-!.

g(I, N, [I|R]):-
	IPP is I + 1,
	g(IPP, N, R).

e([H|_], H).
e([_|T], O):- e(T, O).

cond(_, []).

cond(E, [H|_]):-
	D is abs(E-H),
	D >= 2.

p(_, N, N, C, C).

p(L, NC, N, C, R):-
	e(L, E),
	\+ e(C, E),
	cond(E, C),
	NCPP is NC + 1,
	p(L, NCPP, N, [E|C], R).

m(N, O):-
	g(1, N, L),
	findall(R, p(L, 0, N, [], R), O).

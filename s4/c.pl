#!/bin/prolog

%io nedet (gen toate elem)
%ii det (member)
extrage([H|_], H).
extrage([_|T], E):-extrage(T, E).

%a(l, k, v, p, nc, c, o)
%l originala
% k de cate elemente
% v val max pentru p
%p produsu curent
%nc nr elemente generate
% c colec
% o output
a(_, K, V, P, K, O, O):- P < V.

a(L, K, V, P, NC, C, R):-
	extrage(L, E),
	\+ extrage(C, E),
	PN is P * E,
	NCPP is NC + 1,
	a(L, K, V, PN, NCPP, [E|C], R).

t(L, K, V, R):-
	findall(O, a(L, K, V, 1, 0, [], O), R).

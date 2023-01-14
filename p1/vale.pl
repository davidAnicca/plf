#!/bin/prolog
%să se determine dacă o listă are aspect de vale
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%vale(L:lista, F:int)
%verifica dacă lista este vale
%F = 0 dacă se coboară
%F = 1 dacă se urcă
% ii determinist

vale([], 1).
vale([_], 1).

vale([ A,B|T], -1):-
	A > B,
	vale([B|T], 0).

vale([ A,B|T], 0):-
	A > B,
	vale([B|T], 0).

vale([ A,B|T], 0):-
	B >= A,
	vale([B|T], 1).

vale([ A,B|T], 1):-
	A < B,
	vale([B|T], 1).

%wrapper run(L:lista)
%verifica dacă lista L are aspect de vale
%i determinist
run(L) :- vale(L, -1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

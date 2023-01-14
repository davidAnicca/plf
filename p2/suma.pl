#!/bin/prolog
%suma a două numere reprezentate pe listă
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%reverse_o(L, C, R)

reverse_o([], C, C).
reverse_o([H|T], C, R):-
	reverse_o(T, [H|C], R).

reverse(L, R):- reverse_o(L, [], R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%suma(A:list, B:list, T:int, S:int, P:int, R:int)
%calculează suma nr A și B reprezentate pe liste
%A și B sunt scrise invers
%T transportul
%S suma care crește
%P puterea
%R rezultatul
%iiiio iiiii determinist

suma([], [], _, S,_, S).

suma([], [H|T], TR, S, P, R):-
	PP is P*10,
	SUMA is ((H + TR)* P) + S,
	suma([], T, 0, SUMA, PP, R).

suma([H|T], [], TR, S, P, R):-
	PP is P*10,
	SUMA is ((H + TR)* P) + S,
	suma(T, [], 0, SUMA, PP, R).


suma([A|TA], [B|TB], TR, S,P, R):-
	PP is P* 10,
	SABT is A + B + TR,
	SABT > 10,
	!,
	SUMA is ((SABT mod 10) * P) + S,
	suma(TA, TB, 1, SUMA, PP, R).

suma([A|TA], [B|TB], TR, S, P, R):-
	PP is P* 10,
	SUMA is ((A + B + TR)* P) + S,
	suma(TA, TB, 0, SUMA, PP, R).

%wraper run(A:list, B:list, S:int)
%calculează suma
%A și B nr reprezentate pe listă în ordine corectă
run(A, B, S):-
	reverse(A, AR),
	reverse(B, BR),
	suma(AR, BR, 0, 0, 1, S).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

#!/bin/prolog
%predicatul se satisface dacă o listă are un nr par de elemente
%eșuează în caz contrar
%NU SE POT NUMĂRA ELEMENTELE DIN LISTĂ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%par(L:list)
%determină dacă lista L are nr par de elemente
%i determinist

par([]).
par([_,_|T]):- 
	par(T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

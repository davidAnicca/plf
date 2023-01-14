#!/bin/prolog
%intersectare fără păstrarea dublurilor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%adaugaFin(L:list, E:int, O:list)
%Adauga elementul E la finalul Listei Listei
%L - lista initiala
%E - elementul de adaugat
%O - lista rezultat
%modele de flux: iio, iii

adaugaFin([], E, [E]).

adaugaFin([H|T], E, [H|R]):- adaugaFin(T, E, R).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%interclasare(A:list, B:list, C:list, R:list)
%interclaseaza listele A si B fara duplicate
%A, B - listele de interclasat
%C - lista colectoare
%R - rezultattul final
%modele de flux: iio, iii
%determinist


interclasare([], [], C, C).

interclasare([], [H|T], C, R):-
    last(C, U),
    H == U,
    !,
    interclasare([], T, C, R).
    
interclasare([H|T], [], C, R):-
    last(C, U),
    H == U,
    !,
    interclasare(T, [], C, R).

interclasare([], [H|T], C, R):-
    adaugaFin(C, H, C1),
    interclasare([], T, C1, R).
    
interclasare([H|T], [], C, R):-
    adaugaFin(C, H, C1),
    interclasare(T, [], C1, R).
    
interclasare([H|T], B, C, R):-
    last(C, U),
    H == U,
    !,
    interclasare(T, B, C, R). 
    

interclasare(A, [H|T], C, R):-
    last(C, U),
    H == U,
    !,
    interclasare(A, T, C, R). 

    
interclasare([A1|A], [B1|B], C, R):-
    A1 < B1,
    adaugaFin(C, A1, C1),
    interclasare(A, [B1|B], C1, R).
    
    
interclasare([A1|A], [B1|B], C, R):-
    A1 == B1,
    adaugaFin(C, A1, C1),
    interclasare(A, B, C1, R).  
    
    
interclasare([A1|A], [B1|B], C, R):-
    A1 > B1,
    adaugaFin(C, B1, C1),
    interclasare([A1|A], B, C1, R).    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%interclasareFull(A:list, B:list, C:list)
%A, B liste de interclasat
%C: lista rezultat(interclasarea)
%determinist


interclasareFull(A, B, C):- interclasare(A, B, [], C).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Autor:
% Fecha: 04/03/2017

consult(practica1).

%CONSULTAS AUXILIARES

%posicion devuelve la posicion de un elemento.
posicion(ELEMENTO,[ELEMENTO|_],0).
posicion(_,[],_):-!,fail.
posicion(ELEMENTO,[_|LIS],Posicion):-posicion(ELEMENTO,LIS,Posi), Posicion is Posi + 1.

imprimirLis([]).
imprimirLis([ELEMENTO|LIS]):- writeln(ELEMENTO),imprimirLis(LISTA).

moneda(X):-random(0,2,X),write(X).

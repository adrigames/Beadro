% Autor:
% Fecha: 04/03/2017

%consult(practica1).

%-----------------mostrar una lista
print_l([]):- writeln('').
print_l([X|L]):- write(X), write(', '), print_l(L).

imprimirpreguntas:- preguntas(X),print_l(X).
%-----------------empezar el juego
inicio:-
writeln('Quien es quien'),
writeln('Elija dificultad'),
writeln('\tFacil: 1.'),
writeln('\tDificil: 2.'),
writeln('\tNo quiero jugar: 3.'),
read(Dificultad),
jugar(Dificultad),
writeln('Gracias por jugar').

%------------------inicia el juego con dificultad 1 o 2 o sale del juego

jugar(Dificultad):-
Dificultad=:=1 ->
writeln('Jugando al facil...'),
inicializar(Chicos,Chicas,PN,PR,RR,RV,F,T,G,OA,OM,Personajes,Preguntas),
print_l(PN)
%hueco formula juego facil
.

jugar(Dificultad):-
Dificultad=:=2 ->
writeln('Jugando al dificil...'),
writeln('Modo no disponible, compre el dlc')
%hueco formula juego dificil
.

jugar(Dificultad):-
Dificultad=:=3 ->
writeln('Saliendo.');
writeln('No hay mas opciones, elija una de las disponibles.'),inicio
.


%---------- sorteo jugador 1: empieza maquina / empieza jugador

sorteo_inicial(X):- random(0,2,X),
(X=:=0 -> writeln('Empieza el jugador.');
writeln('Empieza la maquina.')).

%-----------inicializar

inicializar(Chicos,Chicas,PN,PR,RR,RV,F,T,G,OA,OM,Personajes,Preguntas):-
chico(Chicos),
chica(Chicas),
pelo_negro(PN),
pelo_rubio(PR),
ropa_roja(RR),
ropa_verde(RV),
feliz(F),
triste(T),
gafas(G),
ojos_azules(OA),
ojos_marrones(OM),
personaje(Personajes),
preguntas(Preguntas).


%-----------pertenencia elemento lista
pertenece(C, [C|_]) :- !.
pertenece(C, [_|R]) :- pertenece(C,R).

%-----------eliminar elemento lista
elimina(X,[X|X1],X1).
elimina(X,[Y|Y1],[Y|Z1]):- elimina(X, Y1, Z1).

%---------inicializar personajes

inicializar_personajes(PersonajeJugador, PersonajeMaquina, ListaPersonajes):-

personaje_jugador(PersonajeJugador,ListaPersonajes),
personaje_maquina(PersonajeMaquina,PersonajeJugador,ListaPersonajes),
writeln(PersonajeJugador),writeln(PersonajeMaquina).


personaje_jugador(P,L):-
length(L,N),random(0,N,Ns),
nth0(Ns,L,P).

personaje_maquina(Pj,P,L):-
elimina(P,L,Ls),
length(Ls,N),random(0,N,Ns)
,nth0(Ns,Ls,Pj).

%CONSULTAS AUXILIARES

%posicion devuelve la posicion de un elemento.
%posicion(ELEMENTO,[ELEMENTO|_],0).
%posicion(_,[],_):-!,fail.
%posicion(ELEMENTO,[_|LIS],Posicion):-posicion(ELEMENTO,LIS,Posi), Posicion is Posi + 1.

%moneda(X):-random(0,2,X),write(X).


prueba_bool:- chico(X), pertenece(tiffany,X) -> writeln('funciona') ; writeln('no funciona').

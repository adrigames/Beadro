% Autor:
% Fecha: 04/03/2017

%Estrategia1, modo facil.


%----------------------------------funciones genericas-------------------

%insertar en una lista
insertar(X, Lista, Resultado) :- Resultado = [X|Lista].


%ultimo elemento de una lista
ultimo_elemento([Y], Y).
ultimo_elemento([_|Xs], Y):- ultimo_elemento(Xs, Y).

%------------concatenar listas
conc([],L,L).
conc([X|A],L,[X|B]) :- conc(A,L,B).
%-----------pertenencia elemento lista
pertenece(C, [C|_]) :- !.
pertenece(C, [_|R]) :- pertenece(C,R).

%-----------eliminar elemento lista
elimina(X,[X|X1],X1).
elimina(X,[Y|Y1],[Y|Z1]):- elimina(X, Y1, Z1).

%-----------------mostrar una lista
print_l([]):- writeln('').
print_l([X|L]):- write(X), write(', '), print_l(L).

%---------- sorteo quien empieza

sorteo_inicial(X):-
random(0,2,X),
(X=:=0 -> writeln('Empieza el jugador.');
writeln('Empieza la maquina.')).


%-----------inicializar las listas

inicializar(Listas,Personajes,Preguntas):-
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
preguntas(Preguntas),
insertar(OM,[],R1),
insertar(OA,R1,R2),
insertar(G,R2,R3),
insertar(T,R3,R4),
insertar(F,R4,R5),
insertar(RV,R5,R6),
insertar(RR,R6,R7),
insertar(PR,R7,R8),
insertar(PN,R8,R9),
insertar(Chicas,R9,R10),
insertar(Chicos,R10,Listas)
.

%---------inicializar personajes

inicializar_personajes(PersonajeJugador, PersonajeMaquina, ListaPersonajes):-
personaje_jugador(PersonajeJugador,ListaPersonajes),
personaje_maquina(PersonajeMaquina,PersonajeJugador,ListaPersonajes)
.

personaje_jugador(P,L):-
length(L,N),random(0,N,Ns),
nth0(Ns,L,P).

personaje_maquina(Pj,P,L):-
elimina(P,L,Ls),
length(Ls,N),random(0,N,Ns),
nth0(Ns,Ls,Pj)
.


%--------------------------------------------------------------------









%-----------------empezar el juego
inicio:-
writeln('Quien es quien'),
writeln('\tJugar modo facil: 1.'),
writeln('\tNo quiero jugar: 2.'),
read(Dificultad),
jugar(Dificultad),
writeln('Gracias por jugar').

%------------------inicia el juego con dificultad 1 o 2 o sale del juego

comenzar_facil:-
inicializar(ListasJ,ListaJ,PreguntasJ),
inicializar(ListasM,ListaM,PreguntasM),
inicializar_personajes(PJ,PM,ListaJ),
elimina(PJ,ListaJ,PersonajesJ),
elimina(PM,ListaM,PersonajesM),
writeln('Tu personaje es'),
writeln(PJ),
sorteo_inicial(X),
(X=:=0 -> turno_J(PJ,PM,PersonajesJ,PersonajesM,PreguntasJ,PreguntasM,ListasJ,ListasM)
;
turno_M(PJ,PM,PersonajesJ,PersonajesM,PreguntasJ,PreguntasM,ListasJ,ListasM))
.

%-------opciones: jugar o no jugar

jugar(Dificultad):-
Dificultad=:=1 ->
writeln('Jugando al facil...'),
comenzar_facil
.

jugar(Dificultad):-
Dificultad=:=2 ->
writeln('Saliendo.');
writeln('No hay mas opciones, elija una de las disponibles.'),inicio
.

%----------------------------------turno jugador
/*
  se comprueba si ha ganado la maquina, si no, el jugador hace pregunta
  coge la lista de la pregunta y, si el nombre del personaje de la maquina coincide con alguno de la lista,
  la nueva lista solo contendra los coincidentes entre la lista de la pregunta y la lista que se tenía;
  si la respuesta es no, se quitan todos los de la lista de la pregunta en la lista actual.
  una vez tenemos las listas nuevas, pasamos turno a la maquina
*/

comprobacion_jugador(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,X):-
writeln('Candidatos antes de la eliminación: '),
print_l(ListaJ),
nth0(Y,PreguntasJ,X),elimina(X,PreguntasJ,PreguntasJ2),
nth0(Y,ListasJ,ListaAux),elimina(ListaAux,ListasJ,ListasJ2),
subtract(ListaJ,ListaAux,ListaJ2),
writeln('Candidatos depués de la eliminación: '),
                    (
                    pertenece(PM,ListaAux)->
                    subtract(ListaJ,ListaJ2,ListaJ3),
                    print_l(ListaJ3),
                    turno_M(PJ,PM,ListaJ3,ListaM,PreguntasJ2,PreguntasM,ListasJ2,ListasM)
                    ;
                    print_l(ListaJ2),
                    turno_M(PJ,PM,ListaJ2,ListaM,PreguntasJ2,PreguntasM,ListasJ2,ListasM)
                    )
.

turno_J(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM):-
length(ListaM,N),
(
N=:=1 ->
writeln(''), writeln('Has perdido.')
;
writeln(''),
writeln('Tu turno.'),
writeln('Posibles personajes de la maquina:'),
print_l(ListaJ),
writeln('Introduzca una pregunta:'),
print_l(PreguntasJ),
read(X),
        (pertenece(X,PreguntasJ) ->
        comprobacion_jugador(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,X)
        ;
        writeln('mala pregunta'),
        turno_J(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM)
        )
)
.

%---------turno maquina

turno_M(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM):-
length(ListaJ,N),
(N=:=1 ->
writeln(''),
writeln('Has Ganado.')
;
writeln(''),
writeln('Turno de la maquina.'),
writeln('Lista de preguntas restantes:'),
print_l(PreguntasM),
length(PreguntasM,X),random(0,X,Y)
,comprobacion_maquina(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,Y)
)
.

comprobacion_maquina(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,Y):-
nth0(Y,PreguntasM,X),elimina(X,PreguntasM,PreguntasM2),
nth0(Y,ListasM,ListaAux),elimina(ListaAux,ListasM,ListasM2),
write('Pregunta de la maquina: '),
writeln(X),
subtract(ListaM,ListaAux,ListaM2),
writeln('Posibles personajes del jugador antes de la pregunta: '),
print_l(ListaM),
(pertenece(PJ,ListaAux) -> subtract(ListaM,ListaM2,ListaM3),
writeln('Posibles personajes del jugador despues de la pregunta: '),
print_l(ListaM3),
turno_J(PJ,PM,ListaJ,ListaM3,PreguntasJ,PreguntasM2,ListasJ,ListasM2)
;
writeln('Posibles personajes del jugador despues de la pregunta: '),
print_l(ListaM2),
turno_J(PJ,PM,ListaJ,ListaM2,PreguntasJ,PreguntasM2,ListasJ,ListasM2))
.

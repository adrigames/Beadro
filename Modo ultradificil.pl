% Autor:
% Fecha: 04/03/2017



%--------------------------------- funciones




cien(X):- X is 100.
cero(X):- X is 0.


%ultimo elemento de una lista
ultimo_elemento([Y], Y).

ultimo_elemento([_|Xs], Y):- ultimo_elemento(Xs, Y).

%incrementar

incrementar(X,X1):-
X1 is X+1.


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


%---------- sorteo jugador 1: empieza maquina / empieza jugador

sorteo_inicial(X):- random(0,2,X),
(X=:=0 -> writeln('Empieza el jugador.');
writeln('Empieza la maquina.')).

%-----------inicializar

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

insertar(X, Lista, Resultado) :- Resultado = [X|Lista].


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

diferencia(X,Y,Z):-
D is X - Y,
(D > 0 ->
Z is D
;
Z is Y - X )
.

%----------------------------------------------------------------




%-----------------empezar el juego
inicio:-
writeln('Quien es quien'),
writeln('Elija dificultad'),
writeln('\tJuego modo ultra dificil: 1.'),
writeln('\tNo quiero jugar: 2.'),
read(Dificultad),
jugar(Dificultad),
writeln('Gracias por jugar').

%------------------inicia el juego con dificultad 1 o 2 o sale del juego


jugar(Dificultad):-
Dificultad=:=1 ->
writeln('Jugando al dificil...'),
%writeln('Modo no disponible, compre el dlc')
%hueco formula juego dificil
comenzar_dificil.


jugar(Dificultad):-
Dificultad=:=2 ->
writeln('Saliendo.');
writeln('No hay mas opciones, elija una de las disponibles.'),inicio
.


comenzar_dificil:-
inicializar(ListasJ,ListaJ,PreguntasJ),
inicializar(ListasM,ListaM,PreguntasM),
inicializar_personajes(PJ,PM,ListaJ),
elimina(PJ,ListaJ,PersonajesJ),
elimina(PM,ListaM,PersonajesM),
writeln('Tu personaje es'),
writeln(PJ),
sorteo_inicial(X),
(X=:=0 -> turno_J_dificil(PJ,PM,PersonajesJ,PersonajesM,PreguntasJ,PreguntasM,ListasJ,ListasM)
;
turno_M_dificil(PJ,PM,PersonajesJ,PersonajesM,PreguntasJ,PreguntasM,ListasJ,ListasM))
.
%turno jugador
/*
  se comprueba si ha ganado la maquina, si no, el jugador hace pregunta
  coge la lista de la pregunta y, si el nombre del personaje de la maquina coincide con alguno de la lista,
  la nueva lista solo contendra los coincidentes entre la lista de la pregunta y la lista que se tenía;
  si la respuesta es no, se quitan todos los de la lista de la pregunta en la lista actual.
  una vez tenemos las listas nuevas, pasamos turno a la maquina
*/

comprobacion_jugador_dificil(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,X):-
writeln('Candidatos antes de la eliminación: '),
print_l(ListaJ),
nth0(Y,PreguntasJ,X),elimina(X,PreguntasJ,PreguntasJ2),
nth0(Y,ListasJ,ListaAux),elimina(ListaAux,ListasJ,ListasJ2),
print_l(ListaAux),
subtract(ListaJ,ListaAux,ListaJ2),
print_l(ListaJ2),
writeln('Candidatos depués de la eliminación: '),
(pertenece(PM,ListaAux) -> subtract(ListaJ,ListaJ2,ListaJ3),
print_l(ListaJ3),
turno_M_dificil(PJ,PM,ListaJ3,ListaM,PreguntasJ2,PreguntasM,ListasJ2,ListasM)
;
print_l(ListaJ2),
turno_M_dificil(PJ,PM,ListaJ2,ListaM,PreguntasJ2,PreguntasM,ListasJ2,ListasM))
.

turno_J_dificil(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM):-
length(ListaM,N), (N=:=1 -> writeln('Has perdido.');
writeln(''),
writeln('Tu turno.'),
writeln('Lista de preguntas restantes:'),
print_l(PreguntasJ),
writeln('Posibles personajes de la maquina:'),
print_l(ListaJ),
writeln('Introduzca una pregunta:'),
print_l(PreguntasJ),
read(X),
(pertenece(X,PreguntasJ) ->
%writeln('vamoh a comprobah'),
comprobacion_jugador_dificil(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,X)
;
writeln('mala pregunta'),
turno_J_dificil(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM)))
.


%---------turno maquina

turno_M_dificil(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM):-
length(ListaJ,N),
(N=:=1 ->
writeln('Has Ganado.')
;
writeln(''),
writeln('Turno de la maquina.'),
writeln('Lista de preguntas restantes:'),
print_l(PreguntasM),
cero(Cien),
cero(Pregunta0),
cero(Contador),
elegir_pregunta(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,Cien,Pregunta0,Contador) %empieza con una diferencia amplia y en la primera pregunta
)
.

%elegir pregunta
/*
  esta funcion irá pasando la lista y calculando la diferencia, pasando el numero de pregunta y la diferencia de opcin si y no
  de esta manera, el que sea menor se transmite y cuando se hayan visto todas las preguntas se llama a comprobación
*/

elegir_pregunta(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,DiferenciaActual,Pregunta,Contador):-
length(PreguntasM,X),
(
Contador=:=X ->
%salir y llamar a comprobacion_maquina
comprobacion_maquina(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,Pregunta)
;
%continuamos buscando la mejor pregunta
nth0(Contador,ListasM,Y), %cogemos los participantes de la pregunta correspondiente
incrementar(Contador,NuevoContador),
subtract(ListaM,Y,ListaM2),
subtract(ListaM,ListaM2,ListaM3),
length(ListaM2,M2),length(ListaM3,M3),
diferencia(M2,M3,NuevaDiferencia),
(
DiferenciaActual < NuevaDiferencia ->
%si mejora la pregunta, se utilizara el contador como nueva pregunta y se calcula la nueva diferencia
elegir_pregunta(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,NuevaDiferencia,Contador,NuevoContador)
;
%si sigue igual, pasamos la diferencia anterior y la pregunta anterior
elegir_pregunta(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,DiferenciaActual,Pregunta,NuevoContador)
)
)
.

comprobacion_maquina(PJ,PM,ListaJ,ListaM,PreguntasJ,PreguntasM,ListasJ,ListasM,Y):-
nth0(Y,PreguntasM,X),elimina(X,PreguntasM,PreguntasM2),
nth0(Y,ListasM,ListaAux),elimina(ListaAux,ListasM,ListasM2),
write('Pregunta de la maquina: '),
writeln(X),
subtract(ListaM,ListaAux,ListaM2),
writeln('Posibles personajes jugador antes: '),
print_l(ListaM),
(pertenece(PJ,ListaAux) -> subtract(ListaM,ListaM2,ListaM3),
writeln('Posibles personajes jugador despues: '),
print_l(ListaM3),
turno_J_dificil(PJ,PM,ListaJ,ListaM3,PreguntasJ,PreguntasM2,ListasJ,ListasM2)
;
writeln('Posibles personajes jugador despues: '),
print_l(ListaM2),
turno_J_dificil(PJ,PM,ListaJ,ListaM2,PreguntasJ,PreguntasM2,ListasJ,ListasM2))
.

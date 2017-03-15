% Autor:
% Fecha: 16/02/2017


chico([albert,paul,tom,derek,richard,louis,michael,charles,sam,steve,will,anthony,billy,henry]).
chica([tiffany,natalie,roxanne,sarah,sabrina,cindy,emma]).
pelo_negro([albert,tom,derek,richard,louis,charles,steve,henry,tiffany,sarah,sabrina,cindy]).
pelo_rubio([paul,michael,sam,will,anthony,billy,natalie,roxanne,emma]).
ropa_roja([albert,paul,richard,louis,sam,steve,anthony,henry,natalie,sarah,cindy]).
ropa_verde([tom,derek,michael,charles,will,billy,tiffany,roxanne,sabrina,emma]).
feliz([albert,tom,richard,michael,charles,steve,will,anthony,tiffany,natalie,roxanne,sabrina,cindy,emma]).
triste([paul,derek,louis,sam,billy,henry,sarah]).
gafas([albert,michael,charles,anthony,natalie,sabrina]).
ojos_azules([albert,richard,louis,sam,will,billy,natalie,roxanne,sabrina]).
ojos_marrones([paul,tom,derek,michael,charles,steve,anthony,henry,tiffany,sarah,cindy,emma]).

personaje([albert,paul,tom,derek,richard,louis,michael,charles,sam,steve,will,anthony,billy,henry,tiffany,natalie,roxanne,sarah,sabrina,cindy,emma]).

preguntas([chico,chica,pelo_negro,pelo_rubio,ropa_roja,ropa_verde,feliz,triste,gafas,ojos_azules,ojos_marrones]).
 /*
%-----------funciones

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


%---------- sorteo jugador 1: empieza maquina / empieza jugador

sorteo_inicial(X):- random(0,2,X),
(X=:=0 -> writeln('Empieza el jugador.');
writeln('Empieza la maquina.')).

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
        */




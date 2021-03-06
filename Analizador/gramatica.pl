% Autor: Adrian de Juan Lora, Ignacio Ribera D�az
% Fecha: 03/04/2017

%Base de conocimiento

%------Sintaxis------
%oracion (X,[el,hombre,come,la,manzana],[]), draw(X).
oracion(o(OS)) --> oracion_simple(OS).
oracion(o(OC)) --> oracion_compuesta(OC).

%oracion(osub(CS,OS)) --> conjuncion_subordinada_relativa(CS), oracion(OS).

oracion_subordinada(osub(CS,OS)) --> conjuncion_subordinada(CS), oracion_simple(OS).
%oracion_subordinada_relativo(or(GN,CS)) --> grupo_nominal(GN), oracion_subordinada(CS).
oracion_compuesta(or(GN,CS,GV)) --> grupo_nominal_v2(GN), oracion_subordinada(CS), grupo_verbal(GV).
oracion_compuesta(or(OS,CS)) --> oracion_simple(OS), oracion_subordinada(CS).%, oracion(OS2).
oracion_compuesta(oc(GN,CS,GV,C,O)) --> grupo_nominal_v2(GN), oracion_subordinada(CS), grupo_verbal(GV), conjuncion(C), oracion_simple(O).
oracion_compuesta(oc(GN,CS,GV,O)) --> grupo_nominal_v2(GN), oracion_subordinada(CS), grupo_verbal(GV), oracion_simple(O).

%oraciones compuestas
%oracion_coordinada(oc(O,C,O2)) --> oracion_simple(O), conjuncion(C), oracion(O2).

oracion_compuesta(oc(O,C,O2)) --> oracion(O), conjuncion(C), oracion(O2).
oracion_compuesta(oc(O,C,O2)) --> oracion_compuesta(O), conjuncion(C), oracion(O2).
/*oracion_coordinada(oc(O,C,O2,C2,O3)) --> oracion_simple(O), conjuncion(C), oracion_simple(O2), conjuncion(C2), oracion_simple(O3).
oracion_coordinada(oc(O,C,O2,C2,O3,C3,O4)) --> oracion_simple(O), conjuncion(C), oracion_simple(O2), conjuncion(C2), oracion_simple(O3), conjuncion(C3), oracion_simple(O4).
*/
  /*
oracion_compuesta(ocm(OC)) --> oracion_coordinada(OC).
oracion_compuesta(ocm(OC,OR)) --> oracion_coordinada(OC), oracion(OR).
oracion_compuesta(ocm(OC,OR)) --> oracion_compuesta(OC), oracion_subordinada(OR).

oracion_compuesta(ocm(OR)) --> oracion_subordinada_relativo(OR).*/
%oracion_compuesta(ocm(O, O2)) --> oracion_subordinada_relativo(O), oracion(O2).
%subordinadas

%oracion simple
oracion_simple(os(GN,GV)) --> grupo_nominal_v2(GN), grupo_verbal(GV).
oracion_simple(os(GV)) --> grupo_verbal(GV).



%grupos nominales
%simples
grupo_nominal(gn(N)) --> nombre_comun(N).
grupo_nominal(gn(NP)) --> nombre_propio(NP).
grupo_nominal(gn(DET,N)) --> determinante(DET), nombre_comun(N).
grupo_nominal(gn(DET,ADJ,N)) --> determinante(DET), adjetivo(ADJ), nombre_comun(N).
%grupo_nominal(gn(DET,N,GADJ)) --> determinante(DET), nombre_comun(N), grupo_adjetival(GADJ).%, adjetivo(ADJ).
%complejos
grupo_nominal_v2(gn(GN)) --> grupo_nominal(GN).
grupo_nominal_v2(gn(GN, NP)) --> grupo_nominal(GN), nombre_propio(NP).
grupo_nominal_v2(gn(GN, GADJ)) --> grupo_nominal(GN), grupo_adjetival(GADJ).
grupo_nominal_v2(gn(GN, C, GN2)) --> grupo_nominal(GN), conjuncion(C), grupo_nominal(GN2).
grupo_nominal_v2(gn(GN,GP)) --> grupo_nominal(GN), grupo_preposicional(GP).

%grupos adjetivales
grupo_adjetival(gadj(ADJ)) --> adjetivo(ADJ).
grupo_adjetival(gadj(ADJ, GP)) --> adjetivo(ADJ), grupo_preposicional(GP).
grupo_adjetival(gadj(ADV, GADJ)) --> adverbio(ADV), grupo_adjetival(GADJ).
grupo_adjetival(gadj(GADV, ADJ)) --> grupo_adverbial(GADV), adjetivo(ADJ).
%grupo_adjetival(gadj(ADJ, C, GADJ2)) --> adjetivo(ADJ), conjuncion(C), grupo_adjetival(GADJ2).
%grupo_adjetival(gadj(ADV, ADJ, C, GADJ2)) --> adverbio(ADV), adjetivo(ADJ), conjuncion(C), grupo_adjetival(GADJ2).



%grupos adverbiales
grupo_adverbial(gadv(ADV, ADV2)) --> adverbio(ADV), adverbio(ADV2).
grupo_adverbial(gadv(ADV, GN)) --> adverbio(ADV), grupo_nominal(GN).
grupo_adverbial(gadv(ADV, GP)) --> adverbio(ADV), grupo_preposicional(GP).
grupo_adverbial(gadv(ADV)) --> adverbio(ADV).

%grupos verbales
grupo_verbal(gv(V)) --> verbo(V).
grupo_verbal(gv(V, GADJ)) --> verbo(V), grupo_adjetival(GADJ).
grupo_verbal(gv(V, GADV)) --> verbo(V), grupo_adverbial(GADV).
grupo_verbal(gv(V, GN)) --> verbo(V), grupo_nominal_v2(GN).
grupo_verbal(gv(V, GN, GP)) --> verbo(V), grupo_nominal_v2(GN), grupo_preposicional(GP).
grupo_verbal(gv(V, GP)) --> verbo(V), grupo_preposicional(GP).
grupo_verbal(gv(V, GP, GP2)) --> verbo(V), grupo_preposicional(GP), grupo_preposicional(GP2).
%grupo_verbal(gv(V, GADJ)) --> verbo(V), grupo_adjetival(GADJ).
%grupo_verbal(gv(V, GN, GP, GP2)) --> verbo(V), grupo_nominal_v2(GN), grupo_preposicional(GP), grupo_preposicional(GP2).

%grupos preposicionales
grupo_preposicional(gp(P, GN)) --> preposicion(P), grupo_nominal_v2(GN).
grupo_preposicional(gp(P, GADJ)) --> preposicion(P), grupo_adjetival(GADJ).
grupo_preposicional(gp(P, GADV)) --> preposicion(P), grupo_adverbial(GADV).
grupo_preposicional(gp(P, GV)) --> preposicion(P), grupo_verbal(GV).
%grupo_preposicional(gp(P, GP)) --> preposicion(P), grupo_preposicional(GP).


%------Diccionario------

%Determinantes
determinante(det(X)) --> [X], {det(X)}.
det(el).
det(la).
det(los).
det(las).
det(un).
det(una).
det(unos).
det(unas).
det(mi).
det(mis).
det(tu).
det(tus).
det(su).
det(sus).
det(nuestro).
det(nuestra).
det(nuestros).
det(nuestras).
det(vuestro).
det(vuestra).
det(vuestros).
det(vuestras).
det(este).
det(esta).
det(estos).
det(estas).
det(ese).
det(esa).
det(esos).
det(esas).
det(aquel).
det(aquella).
det(aquellos).
det(aquellas).

%nombre
nombre_comun(n(X)) --> [X], {n(X)}.
n(hombre).
n(mujer).
n(procesador).
n(textos).
n(manzana).
n(manzanas).
n(tenedor).
n(patatas).
n(cafe).
n(mesa).
n(periodico).
n(paella).
n(novela).
n(rocodromo).
n(herramienta).
n(zumo).
n(tardes).
n(cuchillo).
n(gato).
n(raton).
n(alumno).
n(universidad).
n(derecho).
n(filosofia).
n(cerveza).
n(documentos).
n(pelo).


nombre_propio(np(X)) --> [X], {np(X)}.
np(juan).
np(maria).
np(hector).
np(irene).

%verbos
verbo(v(X)) --> [X], {v(X)}.
v(ama).
v(come).
v(es).
v(comen).
v(toma).
v(toman).
v(prefiere).
v(canta).
v(salta).
v(bebe).
v(beben).
v(escala).
v(sirve).
v(lee).
v(tiene).
v(estudia).
v(escribir).
v(recoge).


%adjetivos
adjetivo(adj(X)) --> [X], {adj(X)}.
adj(moreno).
adj(morena).
adj(roja).
adj(rojas).
adj(rubio).
adj(alta).
adj(alto).
adj(fritas).
adj(agil).
adj(delicado).
adj(potente).
adj(negro).
adj(grande).
adj(gris).
adj(peque�o).

%adverbios
adverbio(adv(X)) --> [X], {adv(X)}.
adv(bastante).
adv(muy).
adv(solamente).

%Conjunciones
%Conjunciones coordinadas
conjuncion(conj(X)) --> [X], {conj(X)}.
conj(y).
conj(e).
conj(ni).
conj(o).
conj(u).
conj(pero).
conj(aunque).
conj(sino).
conj(mientras).

%Conjunciones subordinadas
conjuncion_subordinada(conj_s(X)) --> [X], {conj_s(X)}.
conj_s(que).
conj_s(cuyo).
conj_s(cuya).
conj_s(cual).
conj_s(quien).
conj_s(donde).
conj_s(como).


%preposiciones
preposicion(prep(X)) --> [X], {prep(X)}.
prep(a).
prep(ante).
prep(bajo).
prep(cabe).
prep(con).
prep(contra).
prep(de).
prep(desde).
prep(en).
prep(entre).
prep(hacia).
prep(hasta).
prep(para).
prep(por).
prep(segun).
prep(si).
prep(sobre).
prep(tras).
prep(durante).
prep(mediante).
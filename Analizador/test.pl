% Autor:
% Fecha: 04/04/2017

%testeando
:- consult(draw).
:- consult(gramatica).

parte1 :- o1,o2,o3,o4,o5,o6,o7.

o1 :- oracion(X,[el,hombre,come,una,manzana],[]), draw(X).
o2 :- oracion(X,[la,mujer,come,manzanas],[]), draw(X).
o3 :- oracion(X,[maria,come,una,manzana,roja],[]), draw(X).
o4 :- oracion(X,[juan,ama,a,maria],[]), draw(X).
o5 :- oracion(X,[el,gato,grande,come,un,raton,gris],[]), draw(X).
o6 :- oracion(X,[juan,estudia,en,la,universidad],[]), draw(X).
o7 :- oracion(X,[juan,y,maria,comen,una,manzana,con,un,tenedor,y,un,cuchillo],[]), draw(X).

parte2 :- p1,p2,p3,p4.
p1 :- oracion(X,[juan,estudia,filosofia,pero,maria,estudia,derecho],[]),draw(X).
p2 :- oracion(X,[juan,come,y,bebe,mientras,maria,lee],[]),draw(X).
p3 :- oracion(X,[juan,que,es,muy,alto,tiene,el,pelo,rubio],[]),draw(X).
p4 :- oracion(X,[juan,que,es,muy,alto,tiene,el,pelo,rubio,pero,maria,es,morena],[]),draw(X).

parte3 :- a1,a2,a3,a4,a5,a6,a7,a8,a9,a10.
a1 :- oracion(X,[juan,es,moreno,y,maria,es,alta],[]),draw(X).
a2 :- oracion(X,[maria,toma,un,cafe,mientras,juan,recoge,la,mesa],[]),draw(X).
a3 :- oracion(X,[juan,toma,cafe,y,lee,el,periodico],[]),draw(X).
a4 :- oracion(X,[juan,y,hector,comen,patatas,fritas,y,beben,cerveza],[]),draw(X).
a5 :- oracion(X,[juan,come,patatas,fritas,pero,maria,prefiere,paella,aunque,hector,toma,cafe,e,irene,lee,una,novela],[]),draw(X).
a6 :- oracion(X,[irene,canta,y,salta,mientras,juan,estudia],[]),draw(X).
a7 :- oracion(X,[hector,come,patatas,fritas,y,bebe,zumo,mientras,juan,canta,y,salta,aunque,maria,lee,una,novela],[]),draw(X).
a8 :- oracion(X,[juan,que,es,agil,escala,en,el,rocodromo,por,las,tardes],[]),draw(X).
a9 :- oracion(X,[juan,que,es,muy,delicado,come,solamente,manzanas,rojas],[]),draw(X).
a10 :- oracion(X,[el,procesador,de,textos,que,es,una,herramienta,bastante,potente,sirve,para,escribir,documentos],[]),draw(X).

%inventadas
parte4 :- i1.
i1 :- oracion(X,[juan,come,manzanas,por,las,tardes],[]),draw(X).


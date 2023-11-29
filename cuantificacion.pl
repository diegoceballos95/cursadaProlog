% BASE DE CONOCIMIENTO

dulce(chocolate).
dulce(caramelo).
dulce(durazno).
amargo(radicheta).
amargo(cebada).
leGusta(roque,chocolate).
leGusta(roque,radicheta).
leGusta(pepe,cebada).
colorDePelo(roque,colorado).
colorDePelo(pepe,castanio).
vive(roque,buenosAires).
vive(pepe,mendoza).
vive(lucas,salliquelo).
ciudadGrande(buenosAires).
ciudadGrande(mendoza).


% Como denimos esTierno/1? donde una persona es tierna si todas las cosas que le gustan son dulces.

% forall tiene aridad 2, 1 parametro de "Que cosa se debe satisfacer", y otro de la "condicion que se debe cumplir" para satisfacer los enlaces y objetivos.

esTierno(Persona) :- forall(leGusta(Persona, Alimento), dulce(Alimento)).


% Definir el predicado alimentoCurioso/1, un alimento es curioso si solamente le gusta a gente de pelo colorado.

alimentoCurioso(Alimento) :- forall(leGusta(Persona, Alimento), colorDePelo(Persona, colorado)).


% Definir el predicado esPeculiar/1, un alimento es peculiar si a todas las personas que le gusta son coloradas y de Buenos Aires.

esPeculiar1(Alimento) :- forall(leGusta(Persona, Alimento), colorDePelo(Persona, colorado), vive(Persona, buenosAires)). % NO FUNCIONA: DEBE TENER SOLO 2 PARAMETROS

% OTRA FORMA ---

esPeculiar_(Alimento) :- forall(alimentoCurioso(Alimento) , vive(Persona, buenosAires)). % NO FUNCIONA: CUMPLE LOS 2 PARAMETROS, PERO NO EXISTE ENLACE ENTRE PERSONA Y LO QUE SE DESEA SATISFACER, OSEA "PERSONA" DEBERIA ESTAR EN AMBOS PARAMETROS.

% FORMA CORRECTA --- añadir los parametros de condicion dentro de unb parentesis para que estas N condiciones actuen como un solo parametro:

esPeculiar2(Alimento) :- forall(leGusta(Persona, Alimento), (colorDePelo(Persona, colorado), vive(Persona, buenosAires))). 

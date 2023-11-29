% PERSONAJES DE FICCION.
personajeDeFiccion(goku).
personajeDeFiccion(r2d2).
personajeDeFiccion(hulk).
personajeDeFiccion(groot).
personajeDeFiccion(terminator).


% PAISES
pais(argentina).
pais(chile).
provincia(salta, argentina).
departamento(tartagal, salta).


% PERSONAS
come(ramiro, carne).
come(ana, verduras).
% "Ana no come carne" y "Nina no come pastas" son hechos falsos por si mismos. Por ende es innecesario añadirlo a mi base de conocimiento.


% ANIMALES
gato(ciru).
gato(felix).
raton(jerry).
perro(oddie).
perro(sam).
perro(cachulo).


% Defina el predicado dueño (duenio/2) -- 2 es la ARIDAD...
duenio(john, oddie).
duenio(will, sam).
duenio(isma, ciru).
duenio(isma, cachulo).


% REGLA
% AND: esFeliz(X) :- duenio(X, A1), gato(A1), duenio(X, A2), perro(A2).
esFeliz(X) :- (duenio(X, A1), gato(A1)) ; (duenio(X, A2), perro(A2)). % OR


% EJERCICIO N°1: ARISTOTELES Y SUS AMIGOS
    % Todos los hombres son mortales.
    % Socrates es hombre.
    %Por lo tanto, Socrates es mortal.
hombre(socrates).
hombre(hipatia).
hombre(platon).
hombre(aristoteles).
mortal(X) :- hombre(X).


% EJERCICIO N°2: NOMINA DE EMPLEADOS -- DIEGO CEBALLOS

% ------- ASI LO HICE YO (mas largo) -------
cadete(juan).
cadete(roque).
cadete(ana).
cadete(pedro).
empleado(maria).
empleado(nora).
empleado(felipe).
empleado(hugo).

trabajaEn(maria, ventas).
trabajaEn(juan, ventas).
trabajaEn(roque, ventas).
trabajaEn(nora, compras).
trabajaEn(pedro, compras).
trabajaEn(felipe, administracion).
trabajaEn(ana, administracion).
trabajaEn(hugo, administracion).

companiero(A, B) :- trabajaEn(A, ventas) , trabajaEn(B, ventas) , A\==B.
companiero(A, B) :- trabajaEn(A, compras) , trabajaEn(B, compras) , A\==B.
companiero(A, B) :- trabajaEn(A, administracion) ; trabajaEn(B, administracion) , A\==B.

ordena(A, B) :- companiero(A, B) , empleado(A) , cadete(B) , A\==B. 


% ------- ASI LO HIZO EL PROFE OROZCO (mas corto) -------
trabajaEn_(maria, ventas, empleado).
trabajaEn_(juan, ventas, cadete).
trabajaEn_(roque, ventas,cadete).
trabajaEn_(nora, compras, empleado).
trabajaEn_(pedro, compras, cadete).
trabajaEn_(felipe, administracion, empleado).
trabajaEn_(ana, administracion, cadete).
trabajaEn_(hugo, administracion, empleado).

% A\==B para no relacionar con uno mismo: A=maria B=maria
companiero_(A, B) :- trabajaEn_(A, S, _) , trabajaEn_(B, S, _) , A\==B.

ordena_(A, B) :- companiero_(A, B) , trabajaEn_(A, _, empleado) , trabajaEn_(B, _, cadete) , A\==B.
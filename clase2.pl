% Emplear conceptos de hechos, reglas y consultas para completar una base de conocimiento de una empresa local. Elabore un informe explicando las decisiones de implementación para los siguientes ejercicios.

% --------------- EJERCICIO N°1 ---------------

% functor(nombre, profesion, caracteristica, edad)
% functor(nombre, profesion, caracteristica, edad)
candidato(roque, contador, honesto, joven).
candidato(amalia, ingeniero, honesto, _).
candidato(cecilia, abogado, _, _).
candidato(cristina, _, ambicioso, _).
candidato(ruben, _, ambicioso, _).
candidato(marta, _, ambicioso, _).   % Derivado del Ejercicio N°2
candidato(mario, abogado, _, joven). % Derivado del Ejercicio N°3
candidato(ivan, _, ambicioso, _).    % Derivado del Ejercicio N°3

% Se decidio esta implementacion ya que permite abarcar los todos los datos de cada persona en un solo hecho.


% --------------- EJERCICIO N°2 ---------------

% trabajoEn(roque, contaduria).
% trabajoEn(amalia, ingenieria).
% trabajoEn(cecilia, abogacia).
% trabajoEn(cristina, _).
% trabajoEn(ruben, _).
trabajoEn(marta, ventas).    
trabajoEn(mario, ingenieria). % Derivado del Ejercicio N°3
trabajoEn(ivan, ventas).      % Derivado del Ejercicio N°3

puede(A, contaduria) :- candidato(A, contador, honesto, _).
puede(A, ventas) :- candidato(A, _, ambicioso, _) , trabajoEn(A, ventas).

% Marta de añade a la base de conociemientos, y se crea el hecho trabajoEn, usando datos del Ejercicio N°1.


% --------------- EJERCICIO N°3 ---------------

puede(A, proyectos) :- trabajoEn(A, ingenieria) , candidato(A, abogado, _, joven).

puede(A, logistica) :- candidato(A,ingeniero, _, joven) ; trabajoEn(A, ingenieria) ;
                       candidato(A, abogado, _, joven) ; trabajoEn(A, abogacia).


% --------------- EJERCICIO N°4 ---------------

candidato(juan, cadete, _, _).
candidato(roque, cadete, _, _).
candidato(ana, cadete, _, _).
candidato(pedro, cadete, _, _).
candidato(maria, empleado, _, _).
candidato(nora, empleado, _, _).
candidato(felipe, empleado, _, _).
candidato(hugo, empleado, _, _).

trabajoEn(maria, ventas).
trabajoEn(juan, ventas).
trabajoEn(roque, ventas).
trabajoEn(nora, compras).
trabajoEn(pedro, compras).
trabajoEn(felipe, administracion).
trabajoEn(ana, administracion).
trabajoEn(hugo, administracion).


% ------------------------------  VERSION CORTA ------------------------------

% functor(nombre, profesion, caracteristica, edad, experiencia)

candidato_(roque, contador, honesto, joven, _).
candidato_(amalia, ingeniero, honesto, _).
candidato_(cecilia, abogado, _, _, _).
candidato_(cristina, _, ambicioso, _, _).
candidato_(ruben, _, ambicioso, _, _).
candidato_(marta, _, ambicioso, _, ventas).   
candidato_(mario, abogado, _, joven, ingenieria). 
candidato_(ivan, _, ambicioso, _, ventas).

candidato_(juan, cadete, _, _, ventas).
candidato_(roque, cadete, _, _, ventas).
candidato_(ana, cadete, _, _, administracion).
candidato_(pedro, cadete, _, _, compras).
candidato_(maria, empleado, _, _, ventas).
candidato_(nora, empleado, _, _, compras).
candidato_(felipe, empleado, _, _, administracion).
candidato_(hugo, empleado, _, _, administracion).

puede_(A, contaduria) :- candidato_(A, contador, honesto, _, _).

puede_(A, ventas) :- candidato_(A, _, ambicioso, _, ventas).

puede_(A, proyectos) :- candidato_(A, abogado, _, joven, _, ingenieria).

puede_(A, logistica) :- candidato_(A,ingeniero, _, joven, _) ; 
                        candidato_(A,ingeniero, _, _, ingenieria) ; 
                        candidato_(A, abogado, _, joven, _) ; 
                        candidato_(A, abogado, _, _, abogacia).
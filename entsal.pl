% Si en read() ingreso por teclado una palabra que inicia en Mayus, me mostrara un codigo o direccion de memoria.

% Si ingreso con minusculas, al mostrar la variable, se mostrara correctamente lo que se ingresó.

saludo:- write('Cual es tu nombre?') , nl, read(Nombre) ,
         write('Hola, bienvenido '), write(Nombre).

promedio :- write('Ingresa el primer numero: ') , read(A),
            write('Ingresa el primer numero: ') , read(B),
            write('Ingresa el primer numero: ') , read(C),
            write('El promedio es: ') , Prom is (A+B+C)/3, write(Prom).

cuadrados:- repeat, 
            leeNumero(X) , 
            procesa(X) , 
            !.

leeNumero(X) :- repeat,
                write('Numero?: '),
                read(X),
                number(X), % Para detectar los valores como num y no como chars
                !.

procesa(0) :- !.
procesa(X) :- R is X*X,
              writeln(X, '^2 = ', R),
              fail.

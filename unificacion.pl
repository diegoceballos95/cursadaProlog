% BASE DE CONOCIMIENTO

gustaDe(luis, nora).
gustaDe(roque, nora).
gustaDe(roque, ana).
gustaDe(marcos, zulema).
gustaDe(juan, nuria).
gustaDe(X, zulema) :- gustaDe(X, ana).
gustaDe(juan, X) :- gustaDe(roque, X).

compiten(X, Y) :- gustaDe(X, Z), gustaDe(Y, Z).

debeDinero(juan, marcos).
debeDinero(juan, roque).

% Determinar con cuales de las clausulas unifica cada una de las siguientes consultas. En el cada caso que una clausula unifica con una consulta, indicar que variables se ligan y con que atomos.
    %    ?- gustaDe(juan, A).
    %    ?- gustaDe(A, zulema).
    %    ?- gustaDe(marcos, ana).
    %    ?- gustaDe(juan, zulema).
    %    ?- gustaDe(A, B).


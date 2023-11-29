% En búsqueda del asesino:

    % •	Un asesino siempre odia a su víctima y nunca es más rico que ella. El asesino de la tía Agatha, además, vive en la mansión Dreadbury.
    % •	Tía Agatha, el carnicero y Charles son las únicas personas que viven en la mansion.
    % •	Charles odia a todas las personas de la mansión que no son odiadas por la tía Agatha.
    % •	Agatha odia a todos los que viven en la mansión, excepto al carnicero.
    % •	Quien no es odiado por el carnicero y vive en la mansión, es más rico que tía Agatha
    % •	El carnicero odia a las mismas personas que odia tía Agatha.

% Elabore una base de conocimientos con todos los hechos y reglas que se desprenden de la narrativa. Que obtenemos con la siguiente consulta: ?asesino (agatha, Asesino).

viveEn(agatha, mansion).
viveEn(charles, mansion).
viveEn(carnicero, mansion).

odiaA(charles, X) :- viveEn(X, mansion) , not(odiaA(agatha, X)) , X \== charles.

odiaA(agatha, X) :- viveEn(X, mansion) , X \== carnicero , X \== agatha.

odiaA(carnicero, X) :- odiaA(agatha, X) , X \== carnicero.

esMasRico(X, agatha) :- viveEn(X, mansion) , not(odiaA(carnicero, X)) , X \== agatha.

asesinadoPor(agatha, X) :- odiaA(X, agatha) , not(esMasRico(X, agatha)) , viveEn(X, mansion).

% asesino(agatha, As).   ---->    Asesino = charles ;
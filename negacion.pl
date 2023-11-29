noNulo(X) :- not(X == 0).

saldoCuenta(maria,1000).
saldoCuenta(flora, 3000000).
saldoCuenta(antonio, 2000000).

millonario(X) :- saldoCuenta(X, Y), Y > 1000000.
pobre(X) :- not(millonario(X)).
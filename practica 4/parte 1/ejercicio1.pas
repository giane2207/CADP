 program sumador;
type
vnums = array [1..10] of integer;
var
numeros : vnums;
i : integer;
begin
for i:=1 to 10 do begin {primer bloque for}
 numeros[i] := i;
 writeln ('el primer bloque imprime: ', numeros [i], ' en el indice ', i);
 writeln ('----------------------');
 end;
  writeln ('__________________________________________');
 for i := 2 to 10 do begin {segundo bloque for}
 numeros[i] := numeros[i] + numeros [ (i -1)];
 writeln ('el segundo bloque imprime: ', numeros [i], ' en el indice ', i);
  writeln ('----------------------');
 end;
 end.

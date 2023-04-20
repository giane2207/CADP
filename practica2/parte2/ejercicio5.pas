{a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.}


program ej5ap2p2;
function doblePar (numA, numB: integer): boolean;
begin
  doblePar:= (numA + NumA = numB);
end;

var
  numeA, NumeB: integer;
begin
  writeln ('Ingrese un numero: ');
  readln (numeA);
  writeln ('Ingrese un numero: ');
  readln (numeB);
  if (doblePar(numeA, numeB)) then begin
     writeln ('El numero ', numeB , ' es el doble de ', numeA);
   end
   else 
     writeln ('El numero ', numeB , ' no es es el doble de ', numeA);
end.

{a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.}


program ej5ap2p2;
procedure doble ( numA, numB: integer; var doble: boolean);
begin
  doble:= (numA + NumA = numB);
end;
var
  numeA, NumeB: integer;
  double: boolean;
begin
  writeln ('Ingrese un numero: ');
  readln (numeA);
  writeln ('Ingrese un numero: ');
  readln (numeB);
  doble (numeA, numeB, double);
  if (double) then begin
    writeln ('El numero ', numeB , ' es el doble de ', numeA);
   end
   else 
     writeln ('El numero ', numeB , ' no es es el doble de ', numeA);
end.

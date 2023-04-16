{8. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el
número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.}

program ej8p2p2;

procedure DigitosParImpar (var cantImp, sumaPar: integer; numero: integer);
begin
  if (numero MOD 2 = 0) then begin
    sumaPar:= sumaPar + numero;
   end
   else 
     cantImp:= cantImp + 1;
end;

var
  SumaDePares, CantImpares, numero, resto: integer;

begin
  writeln ('Ingrese un numero: ');
  readln (numero);
  while (numero <> 1234) do begin
    SumaDePares:= 0; CantImpares:= 0;
    while (numero <> 0) do begin
      resto:= numero MOD 10;
      DigitosParImpar (CantImpares, SumaDePares, resto);
      numero:= numero DIV 10;
     end;
    writeln ('La suma de sus digitos pares es: ', SumaDePares);
    writeln ('La cantidad de digitos impares que posee es: ', CantImpares);
    writeln ('Ingrese un numero: ');
    readln (numero);
  end;
end.

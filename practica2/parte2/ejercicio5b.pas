{b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program ej5ap2p2;
function doblePar (numA, numB: integer): boolean;
begin
  doblePar:= (numA + NumA = numB);
end;

var
  numA, NumB, cantPares, CantDoble: integer;  
begin
  cantPares:= 0;
  cantDoble:= 0;
  writeln ('Ingrese 2 numeros numero: ');
  read (numA); read (numB);
  while (numA <> 0) or (numB <> 0) do
   begin 
     cantpares:= cantPares + 1;
     if (doblePar(numA, NumB)) then begin
       cantdoble:= cantdoble + 1;
      end;
     writeln ('Ingrese 2 numeros numero: ');
     read (numA); read (numB);
   end;
  writeln ('La cantidad de pares leidos fue: ', cantPares);
  writeln ('La cantidad de pares en los que numB es el doble de numA: ', cantDoble);
end.

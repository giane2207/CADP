//Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
//ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).
program ej4P1;
var
  num, doble: real;
begin 
  writeln ('ingrese un numero');
  readln (num);
  doble:= num * 2;
  while (num <> doble) do 
    readln (num);
  writeln (num:0:2);
end.

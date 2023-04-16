//Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
//ingrese el número 100, el cual debe procesarse. Informar en pantalla:
//◦ El número máximo leído.
//◦ El número mínimo leído.
//◦ La suma total de los números leídos.

program ej5p1p2;
var
  num, min, max, suma: integer;
begin
  min:= 9999;
  max:= -9999;
  suma:= 0;
  repeat
    writeln ('Ingrese un numero: ');
    readln (num);
    suma:= suma + num;
    writeln ('suma parcial: ', suma);
    if (num > max) then begin
      max:= num;
     end;
    if (num < min) then begin
      min:= num;
     end;
  until (num = 100);
  writeln ('el numero maximo es: ', max);
  writeln ('el numero minimo es: ', min);
  writeln ('El total de la suma es: ', suma);
  
end.


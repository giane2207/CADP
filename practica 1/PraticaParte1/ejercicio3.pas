//Realizar un programa que lea 3 números enteros y los imprima en orden descendente.

program ejer3P1;
var
  num1, num2, num3: integer;
begin 
  writeln ('Ingrese 3 numeros');
  readln (num1);
  readln (num2);
  readln (num3);
  if (num1 > num2) and (num1 > num3) then 
  begin
    if (num2 > num3) then
      writeln (num1 , num2, num3)
      else 
       writeln (num1, num3, num2);
  end;
  if (num2 > num1) and (num2 > num3) then
  begin 
    if (num1 > num3) then 
      writeln (num2, num1, num3)
      else 
        writeln (num2, num3, num1);
  end;
  if (num3 > num1) and (num3 > num2) then
    if (num1> num2) then
      writeln (num3, num1, num2)
      else 
        writeln (num3, num2, num3);
 end.

//Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
//los dos números mínimos leídos.

program ej4p1p2;
var
  num, min1,i,min2:integer;
begin
  min1:=9999;
  min2:=9999;
  for i:= 1 to 4 do
    begin 
      writeln ('Ingrese un numero');
      readln (num);
      if (num < min1) then begin
        min2:= min1;
        min1:= num;
       end
      else 
        if (num < min2) then begin
          min2:= num;
         end;
     end;
  writeln ('Los minimos son: ', min1, ' y ', min2);
end.
        

{11. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.
12.}


program ej11p2p2;
//proceso que retorna si se cumple la secuencia A y la cantidad de los caracteres leidos
procedure CumpleA (var cumple: boolean; var cant: integer);
var
  c: char;
begin
  cant:= 0;
  writeln ('Ingrese la secuencia de A');
  readln (c);
  while (c <> '$') and (c <> '%') do begin 
    cant:= cant + 1;
    writeln ('Ingrese la secuencia de A');
    readln (c);
   end;
  cumple:= (c = '%');
end;
//proceso que retorna si se cumple la secuencia y la cantidad de veces que tiene q leer
procedure CumpleB (var cumple: boolean; CantEnA: integer);
var
  c: char;
  arroba: integer;
begin
  writeln ('Ingrese la secuencia de B');
  readln (c);
  arroba:= 3;
  while (c <> '*') and (arroba > 0) and (CantEnA > 0) do begin
    CantEnA:= cantEnA - 1;
    if (c = '@') then begin
      arroba:= arroba -1;
    end;    
    writeln ('Ingrese la secuencia de B');
    readln (c);
  end;
  cumple:= (c= '*') and (CantEnA > 0);
end;

var
  cumple: boolean;
  cantLeidosA: integer;
begin
  cumple:= true;
  CumpleA (cumple, cantLeidosA);
  if (cumple) then begin
    CumpleB (cumple, cantLeidosA);
    if (cumple) then begin
      writeln ('Se cumple la secuencia');
     end // end y else de B
     else 
       writeln ('No se cumple la secuencia en B');
  end // end y else de A
  else 
    writeln ('No se cumple la secuencia en A');
end.

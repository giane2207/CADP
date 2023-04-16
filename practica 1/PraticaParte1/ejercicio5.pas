//Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
//reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
//número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.
program ej5P1;
var
  num, doble: real;
  cant: integer;
begin 
  cant:= 0;
  writeln ('ingrese un numero');
  readln (num);
  doble:= num * 2;
  while (num <> doble) and (cant < 10) do
    begin
      readln (num);
      cant:= cant + 1;
    end;
  if  (num = doble) then
  begin
    writeln ('El doble es: ', doble:0:2)
  end
    else 
      writeln ('No se ha encontrado el doble.')
end.

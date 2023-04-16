//6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
//lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
//b. Implemente un programa que invoque al módulo del inciso a.

program ej6P2P1;
procedure numerosPar;
var
  num, maxPar: integer;
begin
  maxPar:= -1;
  writeln ('Ingrese un numero: ');
  readln (num);
  while (num > 0) do 
  begin
    if (num MOD 2 = 0) then 
      begin 
         if (num > maxpar) then
           begin
             maxpar:= num;
           end;
      end;
    writeln ('Ingrese un numero: ');
    readln (num);
  end;
  writeln ('El numero par mas alto fue: ', maxPar);
end;
begin
  numerosPar;
end.

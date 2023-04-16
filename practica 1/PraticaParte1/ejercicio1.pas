program ej1P1;
var
 num1,num2: integer;	
Begin
  writeln ('Ingrese 2 numeros');
  readln (num1);
  readln (num2);
  //comparo los dos numeros para saber cual es el mayor
  if(num1>num2) then
  begin
       writeln('El primer numero es mayor');
  end
  else
  begin
       if(num1<num2) then
       begin
            writeln('El segundo es mayor');
       end
       else
       begin
            writeln('Son iguales');
       end;
  end;
End.

//Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
//carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
//una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
//con la secuencia de números, e imprimir el resultado final.

program ejercicio9P1;
var 
  car: char;
  num, total: integer;
begin
  total:= 0;
  writeln ('Ingrese "+" o "-"');
  read (car);
  if (car <> '+') and (car <> '-') then 
    writeln ('El caracter ingresado no es el correcto ')
  else 
    writeln ('ingrese un numero');
    readln (num);
    while (num <> 0) do
      begin
        if (car = '+') then
          total:= total + num;
        if (car = '-') then
          total:= total - num;
        writeln ('ingrese un numero');
        readln (num);    
      end;
   write ('El resultado es: ', total);      
end.

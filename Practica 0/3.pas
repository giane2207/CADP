program ejercicio5P0;
var 
  num1, num2, division: real;
begin
  write ('Ingrese un numero: ');
  readln (num1);
  write ('Ingrese segundo numero: ');
  readln (num2);
  division:= (num1) / (num2);
  writeln ('El resultado de dividir ', num1:1:1, ' por ', num2:1:1, ' es: ', division:2:2);
end.

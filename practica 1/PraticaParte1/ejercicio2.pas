//Realizar un programa que lea un número real e imprima su valor absoluto.
program ej2P1;
var 
  num, valorAbsoluto: real;
Begin 
  writeln ('Ingrese un numero');
  readln (num);
  if (num >= 0) then
    valorAbsoluto:= num;
    if (num < 0) then
      valorAbsoluto:= num * (-1);
  writeln ('El valor absoluto de ', num:0:2, ' es: ',valorAbsoluto:0:2);
End.

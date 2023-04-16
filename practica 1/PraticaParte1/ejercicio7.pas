//Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
//almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
//Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
//10% al precio anterior.

program ejercicio7P1;
var 
  codi: integer;
  precActual, precNuevo: real;
begin 
  repeat 
    writeln ('Ingrese codigo del producto: ');
    readln (codi);
    writeln ('Ingrese el precio actual del mismo: ');
    readln (precActual);
    writeln ('Ingrese el nuevo precio: ');
    readln (precNuevo);
    if (precNuevo >= precActual*1.1) then
      writeln ('el precio nuevo del producto: ', codi, ' es superior al 10% del precio actual')
      else
        writeln ('El precio nuevo del producto: ', codi, ' no supero el 10% del precio actual')
  until (codi = 32767);
end.

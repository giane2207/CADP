program ejercicio4P0;
Const 
  PI= 3.14;
var
  diametro, radio, perimetro, area: real;
begin 
  write('ingrese el diametro de un circulo: ');
  readln (diametro);
  radio:= diametro / 2;
  area:= PI * radio * radio;
  perimetro:= PI * radio * 2;
  writeln ('su radio es: r: ', radio:0:2, ' su area es: ' , area:0:2, ' su perimetro es: ', perimetro:0:1);
end.

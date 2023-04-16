program alcanceYFunciones;
var
  suma, cant : integer;
function calcularPromedio : real;
var
  prom : real;
begin
  if (cant = 0) then begin
   prom := -1
  end
  else
   begin
    prom := suma / cant;
  end;
  calcularPromedio:= prom;
end;
var 
  promedio: real; //la variable debe ser del mismo tipo que la funcion//
begin
  readln(suma);
  readln(cant);
  promedio:= calcularPromedio; // le asigno a la variable el nombre de la funcion//
  if (promedio <> -1) then begin // la variable promedio tiene el valor que devolvio la funcion y la utilizo para comparar//
    cant := 0;
    writeln('El promedio es: ', promedio:0:1); //no volvemos a invocar, simplemente colocamos la variable que tiene el valor que queremos
  end
  else
     writeln('Dividir por cero no parece ser una buena idea');
end.

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
 promedio: real;
begin
  writeln ('Ingrese la suma: ');
  readln(suma);
  writeln ('Ingrese la cantidad: ');
  readln(cant);
  promedio:= calcularPromedio;
  if (promedio <> -1) then begin
    cant := 0;
    writeln('El promedio es: ',promedio:0:1);
  end
  else
     writeln('Dividir por cero no parece ser una buena idea');
end.

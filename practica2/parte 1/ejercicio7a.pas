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
begin
  readln(suma);
  readln(cant);
  if (calcularPromedio <> -1) then begin
    cant := 0;
    writeln('El promedio es: ', calcularPromedio:0:1);
  end
  else
     writeln('Dividir por cero no parece ser una buena idea');
end.

//Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
//lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
//Al finalizar la lectura, informar:
//a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
//b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
//1).
//c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
//menor al valor 2500 (en el ejemplo anterior se debería informar 0%).

program ejercicio6P1;
var
  numLegajo, cantAlumnos, promAlumnos: integer;
  promedio, alumDestacados, porcenDestacados: real;
begin 
  cantAlumnos:= 0;
  promAlumnos:= 0;
  alumDestacados:= 0;
  write ('Ingrese el numero de legajo del alumno: ');
  readln (numLegajo);
  while (numLegajo <> -1) do 
  begin
    write ('Ingrese el promedio del alumno: ');
    readln (promedio);
    if (promedio > 6.5) then
    begin
      promAlumnos:= promAlumnos + 1;
      if (promedio > 8.5) and (numlegajo < 2500) then
        begin
          alumDestacados:= alumDestacados + 1;
        end;
    end;
    write ('Ingrese el numero de legajo del alumno: ');
    readln (numLegajo);
    cantAlumnos:= cantAlumnos + 1;
  end;
  PorcenDestacados:=  100 * alumDestacados / cantAlumnos;
  writeln ('La cantidad de alumnos leida fue: ', cantAlumnos);
  writeln ('La cantidad de alumnos con promedio mayor a 6.5 es: ', promAlumnos);
  writeln ('El porcentaje de alumnos destacados es: %', PorcenDestacados:0:2);
end.

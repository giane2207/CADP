program ej1ap3;

type
  alumno = record
   codigo : integer;
   nombre : string;
   promedio : real;
end;

procedure leer(var alu : alumno);
begin
  writeln('ingrese el codigo del alumno');
  readln(alu.codigo);
  if (alu.codigo <> 0) then begin
    writeln('Ingrese el nombre del alumno'); 
    readln(alu.nombre);
    writeln('Ingrese el promedio del alumno'); 
    readln(alu.promedio);
  end;
end;

var
alum: alumno;
cant: integer;

begin
  cant:= 0;
  leer (alum);
  while (alum.codigo <> 0) do begin
    cant:= cant + 1;
    leer (alum);
   end;
  writeln ('la cantidad de alumnos leidas es:', cant);
end.

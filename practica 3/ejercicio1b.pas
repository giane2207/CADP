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
cant : integer;
maxProm: real;
nombreProm: string;

begin
  cant:= 0;
  maxProm:= 0;
  leer (alum);
  while (alum.codigo <> 0) do begin
    if  (alum.promedio > maxProm) then begin
      nombreProm:= alum.nombre;
      maxProm:= alum.promedio;
     end;
   leer (alum);
   cant:= cant + 1;
  end;
  writeln ('la cantidad de alumnos leidas es:', cant);
  writeln ('El nombre del alumno con mejor promedio es:', nombreProm);
end.

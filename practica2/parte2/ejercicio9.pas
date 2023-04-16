program ej9p2p2;

procedure ApellidosMinInscripcion (var minInscripcion1, minInscripcion2: integer; var apellidoMin1, apellidoMin2: string; apellido: string; numInscripcion: integer);
begin
  if (numInscripcion < minInscripcion1) then begin
    apellidoMin2:= apellidoMin1;
    apellidoMin1:= apellido;
    minInscripcion1:= numInscripcion;
   end
   else
     if (numInscripcion < minInscripcion2) then begin
       apellidoMin2:= apellido;
       minInscripcion2:= numInscripcion;
      end;
end;

procedure NombresMaxInscripciones (var maxInscripcion1, maxInscripcion2: integer; var nombreMax1, nombreMax2: string; nombre: string; numInscripcion: integer);
begin
  if (numInscripcion > maxInscripcion1) then begin
      nombreMax2:= nombreMax1;
      nombreMax1:= nombre;
      maxInscripcion1:= numInscripcion;
   end
   else 
     if (numInscripcion < maxInscripcion2) then begin
         nombreMax2:= nombre;
        maxInscripcion2:= numInscripcion;
    end;
end;

function InscripcionPar (numInscripcion: integer): boolean;
begin
  InscripcionPar:= (numInscripcion MOD 2 = 0);
end;

procedure LeerDatos (var nombre, apellido: string; var numInscripcion: integer);
begin  
  writeln ('Ingrese los datos del alumno: ');
  writeln ('Ingrese nombre:');
  readln (nombre);
  writeln ('Ingrese apellido: ');
  readln (apellido);
  writeln ('Ingrese numero de inscripcion: ');
  readln (numInscripcion);
end;

//variables del programa principal
var 
  nombre, apellido, apellidoMin1, apellidoMin2, nombreMax1, nombreMax2: string;
  numInscripcion, minInscripcion1, minInscripcion2 ,maxInscripcion1, maxInscripcion2: integer;
  totalAlumnos, totalInscripPares: integer;

begin
  totalAlumnos:= 0; totalInscripPares:= 0;
  minInscripcion1:= 30000;
  minInscripcion2:= 30000;
  maxInscripcion1:= -1;
  maxInscripcion1:= -1;
  
  repeat 
    LeerDatos (nombre, apellido, numInscripcion);
    totalAlumnos:= totalAlumnos + 1;
    if (InscripcionPar (numInscripcion)) then begin
      totalInscripPares:= totalInscripPares + 1;
     end;
    ApellidosMinInscripcion (minInscripcion1, minInscripcion2, apellidoMin1, apellidoMin2, apellido, numInscripcion);
    NombresMaxInscripciones (maxInscripcion1, maxInscripcion2, nombreMax1, nombreMax2, nombre, numInscripcion);
  until (numInscripcion = 1200);
 
   writeln ('El apellido de los dos alumnos con numero de inscripcion mas chico es: ', apellidoMin1, ' y ', apellidoMin2);
   writeln ('El nombre de los dos alumnos con numero de inscripcion mas grande es : ', nombreMax1, ' y ', nombreMax2);
   writeln ('El porcentaje de alumnos con numero de inscripcion par es: ', (totalInscripPares/totalAlumnos) * 100:0:1,'%');
 
 end.


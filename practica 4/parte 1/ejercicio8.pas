{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

program ej8p3;
const
     dimF = 3; //400 alumnos
type
     alumnos = record
         nroInscrip: integer;
         dni: integer;
         apellido: string;
         nombre: string;
         anioNac: integer;
     end;
     
     vector = array [1..dimF] of alumnos;
     
procedure leerAlumnos (var a: alumnos);
begin
     write ('Ingrese numero de inscripcion: ' );
     readln (a.nroInscrip);
     write ('Ingrese DNI del alumno: ');
     readln (a.dni);
     write ('Ingrese nombre del alumno: ');
     readln (a.nombre);
     write ('Ingrese apellido del alumno: ');
     readln (a.apellido);
     write ('Ingrese anio de nacimiento del alumno: ');
     readln (a.anioNac);
     writeln ('');
end;

 
procedure cargarVector (var vAlumnos: vector; a: alumnos; i: integer);
begin
         vAlumnos[i]:= a;
end;
 
 
function esPar (dni: integer): boolean;
var
     resto: integer;
begin
    esPar:= True;
     while (dni <> 0) AND (esPar <> False) do begin
         resto:= dni MOD 10;
         if (resto MOD 2 <> 0) then
             esPar:= False
         else
            dni:= dni DIV 10;
            end;
end;
 
function calcularPorcentaje (cantPares: integer): real;
begin
   calcularPorcentaje:= (cantPares/dimF) * 100;
end;
 
procedure evaluarMin(var minEdad1, minEdad2: integer; var nombre1, nombre2, apellido1, apellido2: string; a: alumnos);
begin
    if (a.anioNac < minEdad1)then begin
        minEdad2:= minEdad1;
        nombre2:= nombre1;
        apellido2:= apellido1;
        minEdad1:= a.anioNac;
        nombre1:= a.nombre;
        apellido1:= a.apellido;
    end
    else if (a.anioNac < minEdad2)then begin
        minEdad2:= a.anioNac;
        nombre2:= a.nombre;
        apellido2:= a.apellido;
    end;
end;
var
    minEdad1, minEdad2, cantPares, i: integer;
    nombre1, nombre2, apellido1, apellido2: String;
    a:alumnos;
    par: boolean;
    porcentaje: real;
    v: vector;
Begin
    minEdad1:= 9999;
    minEdad2:= 9999;
    cantPares:= 0;
    for i:= 1 to dimF do begin
        leerAlumnos(a);
        cargarVector (v, a, i);
        evaluarMin(minEdad1, minEdad2, nombre1, nombre2, apellido1, apellido2, a);
        par:= esPar(a.dni);
        if (par = True)then
            cantPares:= cantPares+1;
    end;
    porcentaje:= calcularPorcentaje(cantPares);
    writeln('El porcentaje de DNI pares es: ',porcentaje:0:2);
    writeln('El alumno mayor es ',nombre1,' ',apellido1,' seguido de ',nombre2,' ',apellido2);
end.

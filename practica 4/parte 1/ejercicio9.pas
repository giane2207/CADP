{9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}


program ej8p3;
const
     corte = -1; //condicion de corte
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
     write ('Ingrese DNI del alumno: ');
     readln (a.dni);
     if (a.dni <> corte)then begin
         write ('Ingrese numero de inscripcion: ' );
         readln (a.nroInscrip);
         write ('Ingrese nombre del alumno: ');
         readln (a.nombre);
         write ('Ingrese apellido del alumno: ');
         readln (a.apellido);
         write ('Ingrese anio de nacimiento del alumno: ');
         readln (a.anioNac);
         writeln ('');
     end;
end;

 
procedure cargarVector (var vAlumnos: vector; var a: alumnos;  var dimL: integer);
begin
    dimL:= 0;
    leerAlumnos (a);
    while (dimL < dimF) and (a.dni <> corte)  do begin
         dimL:= dimL + 1;
         vAlumnos[dimL]:= a;
    end;         
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
    minEdad1, minEdad2, cantPares, dimL: integer;
    nombre1, nombre2, apellido1, apellido2: String;
    a:alumnos;
    par: boolean;
    porcentaje: real;
    v: vector;
Begin
    minEdad1:= 9999;
    minEdad2:= 9999;
    cantPares:= 0;
    cargarVector (v, a, dimL);
    while (dimL <= dimF) and(a.dni <> corte) do begin
        evaluarMin(minEdad1, minEdad2, nombre1, nombre2, apellido1, apellido2, a);
        par:= esPar(a.dni);
        if (par = True)then
            cantPares:= cantPares+1;
        cargarVector (v, a, dimL);
    end;
    porcentaje:= calcularPorcentaje(cantPares);
    writeln('El porcentaje de DNI pares es: ',porcentaje:0:2);
    writeln('El alumno mayor es ',nombre1,' ',apellido1,' seguido de ',nombre2,' ',apellido2);
end.

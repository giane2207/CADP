{El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}


program ej3p3;

const
  RelacionSugeridaUNESCO = 23.435;
  cantEscuelas = 4; // 2400

type 
  escuela = record
     CUE: integer;
     Nestablecimiento: string;
     cantDocentes: integer;
     cantAlumnos: integer;
     localidad: string;
end;

procedure Leer (var escu: escuela);
begin
     write('Ingrese el CUE: ');
     readln(escu.CUE);
     write('Ingrese el nombre del establecimiento: ');
     readln(escu.Nestablecimiento);
     write('Ingrese la cantidad de docentes: ');
     readln(escu.cantDocentes);
     write('Ingrese la cantidad de alumnos: ');
     readln(escu.cantAlumnos);
     write('Ingrese la localidad: ');
     readln(escu.localidad);
end;
  
//funcion que determina y devuelve la relacion docente-alumno
function RelacionDocYAlum (cantAlum, cantDocentes: integer): real;
begin
     RelacionDocYAlum:= (cantAlum/cantDocentes);
end;

//funcion que devuelve si la relacion y nombre del establecimiento coinciden con lo requerido
function EscuRelacionSuperior (relacion: real; nombreEscu: string): boolean;
begin
     EscuRelacionSuperior:= ((relacion > RelacionSugeridaUNESCO) and (nombreEscu = 'La Plata'));
end;

//procediemto que retorna dos maximos con sus respectivos nombres y codigos
procedure MejorRelacion (var mejor1, mejor2: real; var nombre1, nombre2: string; var codigo1, codigo2: integer; codigo: integer; nombre: string; relacion: real);
begin
  if (relacion < mejor1) then begin
     mejor2:= mejor1;
     codigo2:= codigo1;
     nombre2:= nombre1;
     mejor1:= relacion;
     codigo1:= codigo;
     nombre1:= nombre;
  end
  else 
    if (relacion < mejor2) then begin
         mejor2:= relacion;
         codigo2:= codigo;
         nombre2:= nombre;
    end;
end;

//variables del programa principal

var
  cantSuperiorRela, cue1, cue2, i: integer;
  nombre1, nombre2: string;
  relacion, mejor1, mejor2: real;
  e: escuela;

begin
  cantSuperiorRela:= 0;
  mejor1:= 9999;
  mejor2:= 9999;
  cue1:= 1;
  nombre1:= '';
  for i:= 1 to cantEscuelas do begin
     Leer (e);
     relacion:= RelacionDocYAlum(e.cantAlumnos, e.cantDocentes); //calcula la relacion 
     if (EscuRelacionSuperior (relacion, e.Nestablecimiento)) then begin //analiza si la escuela de La Plata es mayor al valor sugerido
         cantSuperiorRela:= cantSuperiorRela + 1;
     end;
     MejorRelacion (mejor1,mejor2, nombre1, nombre2, cue1, cue2, e.CUE, e.Nestablecimiento, relacion);
  end;
  
   writeln ('La cantidad de escuelas de La Plata con una relacion superior a la sugerida por UNESCO es: ', cantSuperiorRela);
   writeln ('El cue y nombre de las dos escuelas con mejor relacion entre docentes y alumnos es ');
   writeln ('1er escuela: CUE: ',cue1, ' nombre del establecimiento: ', nombre1);
   writeln ('2da escuela: CUE: ',cue2, ' nombre del establecimiento: ', nombre2);

end.

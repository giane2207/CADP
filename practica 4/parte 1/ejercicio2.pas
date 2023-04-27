{2. Dado el siguiente programa, complete las líneas indicadas, considerando que:
a) El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa
el valor 0 (que no debe procesarse) o cuando el vector está completo.
b) El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con
el valor n y también debe devolver la suma de todos los elementos del vector.}

program eje2p4;

const 
  cantDatos = 3; // 150
type
  vDatos = array [1..cantDatos] of real;

procedure CargarVector (var v: vDatos; var dimL: integer);
var
   i: integer;
begin
    for i:= 1 to cantDatos do begin
         writeln ('Ingrese un numero real');
         readln (v[i]);
         if  (v[i] <> 0) then begin
             dimL:= dimL + 1;
         end;
    end;
end;

procedure ModificarVectorySumar (var v: vDatos; dimL: integer; n: real; var suma: real);
var
  i: integer;
begin
    for i:= 1 to cantDatos do begin
         suma:= suma + v[i];
         v[i]:= v[i] + n;
    end;
end;

var
    datos : vDatos;
    dim : integer;
    num, suma : real;
    
begin
     dim:= 0;
     suma:= 0;
     CargarVector(datos, dim);
     writeln('Ingrese un valor a sumar');
     readln(num);
     modificarVectorySumar(datos, dim, num, suma);
     writeln('La suma total de los valores es: ', suma:0:1);
     writeln('Se procesaron: ', dim , ' números');
end.

     









 
 
 
 
 
 

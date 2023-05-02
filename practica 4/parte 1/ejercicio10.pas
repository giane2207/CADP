{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.
11.}

program ejercicio10p4;
const
     dimF = 5; //300 empleados
     corte = 0; //condicion de corte
type
     rango = 1..dimF;
     
     empleados = record
        salario: real;
     end;
          
     vectorSalarios = array [rango] of empleados;
     
     
procedure cargaVector (var v: vectorSalarios; var dimL: integer);
var 
     salario: real;
begin
     dimL:= 0;
     writeln ('Ingrese el salario del empleado');
     read (salario);
     while (dimL < dimF) and (salario <> corte) do begin
         dimL:= dimL + 1;
         v[dimL].salario:= salario;
         if (dimL < dimF) then begin
             writeln ('Ingrese el salario del empleado');
             read (salario);
         end
     end;
end;

procedure IncrementarSalario (x: real; var v: vectorSalarios; dimL: integer);
var
     i: integer;
begin
     for i:= 1 to dimL do begin
         v[i].salario:= v[i].salario * (100 + x) / 100; //incremento cada salario en un x porciento
     end;
end;

function SueldoPromedio (dimL: integer; totalSalarios: real): real;
begin
    SueldoPromedio:= totalSalarios/dimL;
end;

function SumadeSalarios (v: vectorSalarios; dimL: integer): real;
var
     suma: real;
     i: integer;
begin
     suma:= 0;
     for i:= 1 to dimL do begin
         suma:= suma + v[i].salario;
     end;
     SumadeSalarios:= suma;
end;

procedure Informar (x, promedio: real);
begin
     writeln ('El salario de los empleados fue incrementado en un: ', x:0:1, '%');
     writeln ('El sueldo promedio de los empleados es: $', promedio:0:1);
end;

var
     v: vectorSalarios;
     totalSalarios, promedio, x: real;
     dimL: integer;
begin
     cargaVector (v, dimL);
     totalSalarios:= SumadeSalarios(v, dimL);
     promedio:= sueldoPromedio (dimL, totalSalarios);
     writeln ('Ingrese el valor que quiere incrementar los salarios de los empleados: ');
     read (x);
     IncrementarSalario (x, v, dimL);
     Informar (x, promedio);
 end.    

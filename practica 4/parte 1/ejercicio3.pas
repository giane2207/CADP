{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}


program ej3p3;

const
     dimF = 10;
  
type
     vector = array [1..dimF] of integer;

//modulos
procedure CargarVector (var v: vector; var dimL: integer);
var
  i: integer;
begin
    for i:= 1 to dimF do begin
        writeln ('Ingrese un numero');
        read(v[i]);
        dimL:= dimL + 1;
    end;
end;
{a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.}
procedure incisoA(v: vector; dimL: integer);
var
    i: integer;
begin
    for i:= 1 to dimL do begin        
         writeln ('Posicion ', i,') ', v[i]);
    end;
end;

{b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.}
procedure incisoB (v: vector; dimL: integer);
var 
     i: integer;
begin
     for i:= dimL downto 1 do begin
         writeln ('Posicion ', i,') ', v[i]);
     end;
end;

{c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.}
procedure incisoC (v: vector; dimL: integer);
var 
     i: integer;
begin
     for i:= (dimL DIV 2 )downto 1 do begin      
        writeln ('Posicion ', i,') ', v[i]);
     end; 
     writeln ('--');
     for i:= (dimL DIV 2 + 1) to dimL do begin    
         writeln ('Posicion ', i,') ', v[i]);
     end; 
end;        
        
{d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.}
procedure xy(x,y: integer; v: vector);
var i:integer;
begin
     if(x > y) then
     begin
          for i:=x downto y do 
          writeln('Posicion ', i,') ', v[i]);
     end
     else begin
          for i:=x to y do 
             writeln ('Posicion ', i,') ', v[i]);
     end;
end;



//variables del programa principal
var
   v: vector;
   dimL: integer;
   X, Y: integer;

begin
  dimL:= 0;
  CargarVector (v, dimL);
  writeln ('_______________________ ');
  writeln ('IncisoA: ');
  incisoA (v, dimL);
  writeln ('_______________________ ');
  writeln ('IncisoB: ');
  incisoB (v, dimL);
  writeln ('_______________________ ');
  writeln ('IncisoC: ');
  incisoC (v, dimL);
  writeln ('_______________________ ');
  writeln ('Ingrese un numero x');
  readln (X);
  writeln ('Ingrese un numero y');
  readln (Y);
  
  xy (X, Y, v)
end.

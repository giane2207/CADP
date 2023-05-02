{5. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”}

program ej4y5P3;

const
  dimF = 10; //100

type
  vector = array [1 .. dimF] of integer;
  
{ a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
 o el valor -1 en caso de no encontrarse. }
function Posicion (v: vector; dimL: integer; x: integer): integer;
var 
  pos: integer;
  encontre: boolean;
begin
     pos:= 1;
     encontre:= false;
     while (not(encontre)) and (pos <> dimL) do begin
         if ( v[pos] = x ) then begin
             encontre:= true;
         end
         else 
             pos:= pos + 1;
     end;
     if (encontre) then begin
         Posicion:= pos;
     end
     else 
         Posicion:= -1;
end;

{b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.}
procedure Intercambio (var v: vector; x, y : integer);
var 
     aux: integer;
begin
     aux:= v[x]; //me guardo el elemento que esta en la posicion x
     v[x]:= v[y]; // guardo el valor de la posicion Y en la posicion X
     v[y]:= aux; // guardo el valor de la posicion X (aux) en Y 
end;

{e) elementoMaximo: retorna la posición del mayor elemento del vector}
function elementoMaximo (v: vector; dimL: integer): integer;
var 
     i, max: integer;
begin
     max:= -1;
     for i:= 1 to dimL do begin
         if ( v[i] >= max ) then begin
             max:= v[i];
         end;
     end;
     elementoMaximo:= max;
end;

{e) elementoMaximo: retorna la posición del mayor elemento del vector}
function elementoMinimo (v: vector; dimL: integer): integer;
var 
     i, min: integer;
begin
     min:= 9999;
     for i:= 1 to dimL do begin
         if ( v[i] <= min ) then begin
             min:= v[i];
         end;
     end;
     elementoMinimo:= min;
end;
    
procedure Carga (var v: vector; var dimL: integer);
var
     x: integer; //auxiliar para leer elementos del vector
begin
     dimL:= 0;
     writeln ('Ingrese un numero entero ');
     readln (x);
     while (( x <> 0 ) and ( dimL < dimF )) do begin
         dimL:= dimL + 1;  
         v[dimL]:= x; // le asigno el valor de x al elemento en la posicion dimL
         writeln ('El elemento en la posicion ', dimL, ' es ', x);
         read (x);
                                       
     end;
end;

//variables de programa principal
var
     dimL, elementMax, elementMin, posMax, PosMin: integer;
     v: vector;
begin
     carga (v, dimL);
     elementMax:= elementoMaximo (v, dimL);
     elementMin:= elementoMinimo (v, dimL);
     posMax:= Posicion (v, dimL, elementMax);
     posMin:= Posicion (v, dimL, elementMin);
     Intercambio (v, posMax, posMin);
     writeln ('El elemento maximo es ', elementMax, ' que se encontraba en la posicion ', posMax, ' fue intercambiada con el elemento minimo ', elementMin, ' que se encontraba en la posicion ', posMin);
end.
    

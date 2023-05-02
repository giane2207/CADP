{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:

a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector




{  a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
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

{c) sumaVector: retorna la suma de todos los elementos del vector}
function SumaVector (v: vector; dimL: integer): integer;
var
    i, suma: integer;
begin
     for i:= 1 to dimL do begin
         suma:= suma + v [i];
     end;
     sumaVector:= suma;
end;

{d) promedio: devuelve el valor promedio de los elementos del vector}
function Promedio (cantElementos, sumaTotal: integer): real;
begin
     Promedio := sumaTotal / cantElementos;
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

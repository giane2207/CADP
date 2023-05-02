program ej4y5P3;

const
  dimF = 10; //100

type
  vector = array [1 .. dimF] of integer;
  
procedure ElementoMaxyMin (var posMin, posMax, max, min: integer; v: vector; dimL: integer);
var
   i: integer;
begin
     
     for i:= 1 to dimL do begin
         if (v[i] < min ) then begin
             min:= v[i];
             posMin:= i;
         end;
         if (v[i] > max ) then begin
            max:= v[i];
            posMax:= i;
         end;
     end;
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

var 
  maxi, mini, dimL, posMin, posMax: integer;
  v: vector;
begin
   maxi:= -1;
   mini:= 9999;
   Carga (v, dimL);
   ElementoMaxyMin (posMin, posMax, maxi, mini, v, dimL);
   writeln ('El elemento maximo ', maxi, ' se encontro en la posicion ', posMax, ' y el elemento minimo ', mini, ' se encontro en la posicion ', posMin);
end.

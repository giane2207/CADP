{7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.}


program ej7p3; 
   
type
   rango = 0..9;
   tnumeros = array [rango] of integer;

procedure Inicializar (var a: tnumeros);
var
  i: integer;
begin
   for i:= 0 to 9 do begin
       a[i]:= 0;
   end;
end;

procedure Descomponer (var a: tnumeros; num: integer);
var
  resto: integer;
begin
     while (num <> 0) do begin
         resto:= num MOD 10;
         a[resto]:= a [resto] + 1;
         num:= num DIV 10;
     end;
end;

procedure DigitoMasLeido (var max: integer; a: tnumeros);
var
   i: integer;
begin
     for i:= 0 to 9 do begin
         if (a[i] > max) then begin
             max:= i;
         end;
     end;
end;

procedure SinOcurrencias (a: tnumeros);
var
    i: integer;
begin
     write ('Los numeros sin ocurrencias fueron: ');
     for i:= 0 to 9 do begin
         if (a[i] = 0) then begin
             write (i, ', ');
         end;
     end;
end;

procedure Imprimir (n: tnumeros);
var
  i: integer;
begin
     for i:= 0 to 9 do begin
         if (n[i] <> 0) then begin
             writeln ('numero ', i, ': ' , n[i], ' veces');
         end;
     end;
end;

var
   max, num: integer;
   n: tnumeros;
begin
     max:= -1;
     Inicializar (n);
     writeln ('Ingrese un numero ');
     readln (num);
     while (num <> -1) do begin
         Descomponer (n, num);
         DigitoMasLeido(max, n);
         writeln ('Ingrese un numero ');
         readln (num);
     end;
     Imprimir (n);
     writeln ('El digito mas leido fue: ', max);
     SinOcurrencias(n);
end.         

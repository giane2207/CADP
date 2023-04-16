//Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
//se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
//- Los códigos de los dos productos más baratos.
//- La cantidad de productos de más de 16 pesos con código par.
 
program ej6p1p2;
type 
  codigos= 1..200; 
var
  cod, barato, i: codigos;
  precio, menorVal: real;
  prodpar: integer;
begin
  menorVal:= 9999;
  prodpar:= 0;
  for i:= 1 to 4 do begin
    writeln ('Ingrese codigo del producto: ');
    readln (cod);
    writeln ('Ingrese el precio del producto: ');
    readln (precio);
    if (precio < menorVal) then begin //verifico si es barato
      barato:= cod; //guardo el codigo del producto barato
      menorVal:= precio; //le pongo el precio del ultimo producto barato
     end;
    if ((precio > 16) and (cod MOD 2 = 0)) then begin // analizo si salio mas de $16 y si el codigo es par
      prodPar:= prodPar + 1; 
      end;
  end;
  writeln ('El codigo del producto mas barato es: ', barato);
  writeln ('La cantidad de productos que salieron mas de $16 y codigo par fueron: ', prodPar);
end.

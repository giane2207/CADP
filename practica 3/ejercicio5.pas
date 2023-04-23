{Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}

program ej6p3;
type
  auto = record
    marca : string;
    modelo : string;
    precio : real;
  end;

procedure Leer (var a: auto);
begin

  writeln ('Ingrese marca del auto');
  readln (a.marca);
  if (a.marca <> 'zzz') then begin
    writeln ('Ingrese modelo del auto');
    readln (a.modelo);
    writeln ('Ingrese precio del auto');
    readln (a.precio);
    writeln ('___________________');
  end;
end;

function Promedio (total: real; cant: integer): real;
begin
  Promedio:= (total/cant);
end;

procedure autoCaro (var maxPrecio: real; var marcaMax, modeloMax: string; modelo, marca: string; precio: real);
begin
   if (precio > maxPrecio) then begin
      maxPrecio:= precio;
      marcaMax:= marca;
      modeloMax:= modelo;
    end;
end;

var
  maxPrecio, precioTotal: real;
  marcaMax, modeloMax, marcaActual: string;
  cantProductos: integer;
  a: auto;
  
begin
  maxPrecio:= -1;
  Leer (a);
  while (a.marca <> 'zzz') do begin
     marcaActual:= a.marca;
     cantProductos:= 0;
     precioTotal:= 0;
     while ((a.marca <> 'zzz') and (a.marca = marcaActual)) do begin
         cantProductos:= cantProductos + 1;
         precioTotal:= precioTotal + a.precio;
         autoCaro (maxPrecio, marcaMax, modeloMax, a.modelo, a.marca, a.precio);
         Leer (a);
     end;
     writeln ('se ha ingresado otra marca');
     writeln ('El precio promedio de la marca ', marcaActual, ' es: $', Promedio(precioTotal, cantProductos):0:1);
     writeln ('___________________');
  end;
  writeln ('el auto de marca: ', marcaMax, ' y modelo: ', modeloMax, ' es el auto mas caro');
end.














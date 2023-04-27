program ejercicio6;
//Procesos

//Código de los dos productos más baratos.
procedure ProductosBaratos (codigo: integer; precio: real; var barat1, barat2: integer; var precioMin1,precioMin2: real);
begin 
  if (precio < precioMin1) then 
  begin
    barat2:= barat1; //actualizo el codigo barato 1
    barat1:= codigo;  //actualizo el codigo barato 2
    precioMin1:= precio;  //actualizo el precio min 1
  end
  else 
   if (precio < precioMin2) then
   begin
      barat2:= codigo; ;  //actualizo el codigo barato 2
      precioMin2:= precio; //actualizo el precio min 1
   end;
end;

// Código del producto de tipo “pantalón” más caro.
procedure PantEsCaro (codigo: integer; precio: real; var precioPant,maxPrecio: real; var codPant: integer);
begin
  if (precio > maxPrecio) then
  begin
    codPant:= codigo; //actualizo el codigo del pantalon max
    maxPrecio:= precio; //actualizo el precio del pantalon max
    precioPant:= precio; 
   end;
end;

//FUNCIONES

// Precio promedio
function PrecioPromedio (totalDinero: real; totalProds: integer): real;
begin 
  PrecioPromedio:= (totalDinero/totalProds);
end;
 
procedure leerDatos (var precio: real; var codigo: integer; var tipo: string);
begin
    writeln ('Ingrese codigo del producto');
    readln (codigo);
    writeln ('Ingrese el precio: ');
    readln (precio); 
    writeln ('Ingrese el tipo de prenda: ');
    readln (tipo);
    writeln ('___________________________');
end;
 
var
  i, barat1, barat2, codigo, totalProds, codPant: integer; 
  precio, totalDinero, precioPant, maxPrecio, precioMin1, precioMin2: real;
  tipo: string;
  
begin  
  totalProds:= 0; totalDinero:= 0; // para calcular el promedio
  barat1:= 0; barat2:= 0; // para guardar el codigo de los 2 mas baratos
  codPant:= 0; //para guardar el codigo del pantalon mas caro
  precioPant:= 0; // para guardar el precio maximo
  
  //variables para comparar maximos y minimos
  maxPrecio:= -1; 
  precioMin1:= 9999;
  precioMin2:=9999;
  
  for i:= 1 to 4 do
  begin
    leerDatos (precio, codigo, tipo);
    totalprods:= totalProds + 1; //guarda el total de los productos
    totalDinero:= totalDinero + precio; //guarda el total de los productos
    ProductosBaratos (codigo, precio, barat1, barat2, precioMin1, precioMin2);
    if (tipo = 'pantalon') then begin
      PantEsCaro(codigo, precio, precioPant, maxPrecio,CodPant);
     end;
    end;
    
    writeln ('Los codigos de los productos mas baratos son: ', barat1, ' y ',barat2);
    writeln ('El codigo del pantalon mas caro es: ', codPant);
    write ('El precio promedio es: ', PrecioPromedio (totaldinero, totalProds):0:1);
   
end.

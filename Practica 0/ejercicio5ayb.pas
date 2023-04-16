{Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades
iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la
cantidad de clientes (Y), e imprima en pantalla un mensaje informando la cantidad de
caramelos que le corresponderá a cada cliente, y la cantidad de caramelos que se
quedará para sí mismo.}

program ejercicio5a;
const
  precio = 1.60;
var
  cantCaramelos, cantClientes, aCadaCliente, alKiosquero: integer;
  kiosqueroCobra: real;
Begin 
  write ('Ingrese cantidad de caramelos: ');
  readln (cantCaramelos);
  write ('Ingrese cantidad de clientes para repartir los caramelos: ');
  readln (cantClientes);
  aCadaCliente:= cantCaramelos DIV cantClientes;
  alKiosquero:= cantCaramelos MOD cantClientes;
  kiosqueroCobra:= precio * cantClientes * acadacliente;
  writeln ('A cada cliente le corresponderan ',aCadaCliente, ' si la cantidad de caramelos es: ', cantCaramelos);
  writeln ('El kiosquero se queda con los caramelos que sobraron, que fueron: ', alKiosquero);
  writeln ('El kiosquero debera cobrar ', kiosqueroCobra:0:2);
end.

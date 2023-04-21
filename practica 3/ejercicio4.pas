{Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

program ej4p3;
const 
     cantClientes = 4; // 9300
     precioMin = 3.40; //precio de los minutos
     precioMB = 1.35; // precio de los MB

type
     tclientes = record
         codcliente: integer;
         cantlineas: integer;
         end;
     
     tlineas = record
         tel: integer;
         cantmin: integer;
         megas: integer;
         end;

procedure leerCliente (var c: tclientes);
begin
  writeln ('Ingrese codigo de cliente: '); 
  readln (c.codcliente); 
  writeln ('Ingrese cantidad de lineas: ');
  readln (c.cantlineas); 
end;

procedure leerLinea (var lin: tlineas);
begin
  writeln ('Ingrese numero de celular: ');
  readln (lin.tel); 
  writeln ('Ingrese cantidad de minutos consumidos en el mes: ');
  readln (lin.cantmin); 
  writeln ('Ingrese cantidad de MB consumidos en el mes: ');
  readln (lin.megas);
end;

procedure aFacturar (var sumaMinutos, sumaMegas: real);
var
  c: tclientes;
  lin: tlineas;
  cantTotalMin, cantTotalMB: integer;
  i: integer;
begin
  cantTotalMin:= 0; cantTotalMB:= 0;
  sumaMinutos:= 0; sumaMegas:= 0;
  leerCliente (c);
  for i:= 1 to c.cantlineas do begin
    leerLinea (lin);
    cantTotalMin:= cantTotalMin + lin.cantmin;
    cantTotalMB:= cantTotalMB + lin.megas;
   end;
   sumaMinutos:= cantTotalMin * precioMin;
   sumaMegas:= cantTotalMB * precioMB;
end;

var
  i: integer;
  sumaMinutos, sumaMegas,total: real;
begin
  for i:= 1 to cantClientes do begin
     aFacturar (sumaMinutos, sumaMegas);
     total:= sumaMinutos + sumaMegas;
     writeln ('El monto por los minutos consumidos en el mes: $', sumaMinutos:0:1, ' y por los MB consumidos: $', sumaMegas:0:1);
     writeln ('El monto total a pagar por los minutos y los MB consumidos es: $', total:0:1);
     writeln ('----------------------------');
    end;
end.

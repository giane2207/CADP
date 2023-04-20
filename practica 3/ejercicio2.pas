{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los}

program eje2p3;
type 
  subdia = 1..31;
  submes = 1..12;
  
  fecha = record
    dia: subdia;
    mes: submes;
    anio: integer;
  end;

procedure Leer (var fe: fecha);
begin
  writeln ('Ingrese anio:');
  readln (fe.anio);
  if (fe.anio <> 2020) then begin
    writeln ('Ingrese dia:');
    readln (fe.dia);
    writeln ('Ingrese mes:');
    readln (fe.mes);
  end;
end;

var
  f: fecha;
  cantVerano, cantPrimeros: integer;
begin
  cantVerano:= 0;
  cantPrimeros:= 0;
  Leer (f);
  while (f.anio <> 2020) do begin
    if (f.mes <= 3) then begin
       cantVerano:= cantVerano + 1;
       end;
    if (f.dia <= 10) then begin
       cantPrimeros:= cantPrimeros + 1;
       end;
    Leer (f);
    end;
   writeln ('la cantidad de casamientos realizados durante los meses de verano son: ', cantVerano);
   writeln ('la cantidad de casamientos realizados en los primeros 10 días de cada mes es: ', cantPrimeros);
end.      

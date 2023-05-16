program ej13p4;
const
     //constantes
     anios = 50 
     primerAnio = 1973; //2023 - 50
     ultimoAnio = primerAnio + anios - 1;
     cantLugares = 100;
type
    //registro
     Temperaturas = record  
         anio: integer;
         temperatura: real;
     end;
     
    // rangos
     rangoTemperaturas = primerAnio..UltimoAnio;
     rangoPromedios = 1..cantLugares;
     
     //vectores
     vectorTemperaturas = array [rangoTemperaturas] of Temperaturas;
     vectorPromedios = array [rangoPromedios] of real;


//modulos
  
procedure LeerRegistro (var t: Temperaturas);
begin
     writeln ('Ingrese la temperatura del lugar: ');
     read (t.temperatura);
     writeln ('Ingrese el anio: ');
     read (t.anio);
     writeln ('');
end;


procedure CargaVector (var v: vectorTemperaturas);
var
     i: integer;
begin
     for i:= 1 to cantLugares do begin
         LeerRegistro;
     end;
end;

procedure InicializarVector (var v: vectorTemperaturas);
var
     i: integer;
begin
     for i:= 1 to cantLugares

procedure MaxTemperatura (temp: real; anio: integer; var maxTemperatura: real; var anioMaxTemp: integer);
begin
     if (temp > maxTemperatura) then begin
         maxTemperatura:= temp;
         anioMaxTemp:= anio;
      end;
end;

procedure cargaPromedioAnual (totalPromedios: real; i: integer; var p: vectorPromedios);
begin
     p[i]:= totalPromedios/anios;
end;

procedure MaxPromedioMundial (p: vectorPromedios; var maxTempPromedio: real; var anioMaxProm: integer; i: integer; anio: integer);
begin
     if (p[i] > maxTempPromedio) then begin
         maxTempPromedio:= p[i];
         anioMaxProm:= anio;
     end;
end;

procedure Procesar (  );
var
     a, i: integer;
     totalProms: real;
     maxTempPromedio: real;
     anioMaxProm: integer;
     maxTemp: real;
     anioMax: integer;
     
     
     
     
     
     
     
     
     

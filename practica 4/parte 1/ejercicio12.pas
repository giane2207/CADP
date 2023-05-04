program ej12p4;
const
    //dimensiones fisicas
     dimF = 5;//53 galaxias
     tipos = 4;
type

     Galaxias = record
         nombre: string;
         tipo: integer;
         masa: real;
         distancia: real;
     end;
     
     //rangos
     rangoGalaxias = 1..dimF;
     
     //vectores
     vectorContador = array [1..4] of  integer;
     vectorGalaxias = array [rangoGalaxias] of Galaxias;


//modulos
procedure LeerRegistro (var g: galaxias);
begin
     write ('Ingrese el nombre de la galaxia: ');
     readln (g.nombre);
     write ('Ingrese el tipo: ');
     readln (g.tipo);
     write ('Ingrese la masa en KG: ');
     readln (g.masa);
     write ('Ingrese la distancia en parsecs: ');
     readln (g.distancia);
end;


//carga e inicializacion de vectores
procedure cargaVector (var v: vectorGalaxias);
var
     i: integer;
begin
     for i:= 1 to dimF do begin
         LeerRegistro (v[i]);
     end;
end;


procedure InicializarVector (var v: vectorContador);
var 
     i:integer;
begin
     for i:= 1 to tipos do begin
         v[i]:= 0;
     end;
end;


//modulos
function Masa3Galaxias (nombre: string): boolean;
begin
     Masa3Galaxias:= (nombre = 'Via Lactea') or (nombre = 'Andromeda') or (nombre = 'Triangulo');
end;
 
function Porcentaje (totalMasa: real; masa3galaxy: real): real; 
begin
     Porcentaje:= (masa3galaxy* 100) / totalMasa;
end;


procedure MayorMasa (var maxMasa1, maxMasa2: real; var nombre1, nombre2: string; nombre: string; masa: real);
begin
     if (masa > maxMasa1) then begin 
         maxMasa2:= maxMasa1;
         nombre2:= nombre1;
         maxMasa1:= masa;
         nombre1:= nombre;
     end
     else if (masa > maxMasa2) then begin
         maxMasa2:= masa;
         nombre2:= nombre;
     end;
end;

procedure MenorMasa (var minMasa1, minMasa2: real; var nombre1, nombre2: string; nombre: string; masa: real);
begin
     if (masa > minMasa1) then begin 
         minMasa2:= minMasa1;
         nombre2:= nombre1;
         minMasa1:= masa;
         nombre1:= nombre;
     end
     else if (masa > minMasa2) then begin
         minMasa2:= masa;
         nombre2:= nombre;
     end;
end;


procedure Procesar (var nombreMax1, nombreMax2, nombreMin1, nombreMin2: string; var cantMenoresPc: integer; var masa3galaxy: real; var porcentajeMasa: real;  v: vectorGalaxias; var t: vectorContador; var masaTotal: real);
var
     i: integer;
     maxMasa1, maxMasa2, minMasa1, minMasa2: real;
begin
     //inicializo variables
     maxMasa1:= -1;
     maxMasa2:= -1;
     minMasa1:= 9999;
     minMasa1:= 9999;    
     masaTotal:= 0;
     nombreMax1:= '';
     nombreMin1:='';
     porcentajeMasa:=0; 
     
     for i:= 1 to dimF do begin
         masaTotal:= masaTotal + v[i].masa;
         case v[i].tipo of 
             1: t[1]:= t[1] + 1;
             2: t[2]:= t[2] + 1;
             3: t[3]:= t[3] + 1;
             4: t[4]:= t[4] + 1;
         end;
         if (Masa3Galaxias(v[i].nombre)) then begin
              masa3galaxy:= masa3galaxy + v[i].masa;
         end;     
         if (v[i].tipo <> 4) and (v[i].distancia < 1000) then begin
             cantMenoresPc:= cantMenoresPc + 1;
         end;
         MenorMasa (minMasa1, minMasa2, nombreMin1, nombreMin2, v[i].nombre, v[i].masa);
         MayorMasa (maxMasa1, maxMasa2, nombreMax1, nombreMax2, v[i].nombre, v[i].masa);
     end;
    porcentajeMasa:= Porcentaje(masaTotal, masa3galaxy);
end;

procedure Informar (nombreMax1, nombreMax2, nombreMin1, nombreMin2: string; cantMenoresPc: integer; masa3galaxy: real; porcentajeMasa: real; t: vectorContador);
var
     i: integer;
begin
     for i:= 1 to tipos do begin
         writeln ('Para el tipo ', i, ' hubo:', t[i], ' galaxias');
     end;     
     writeln ('La masa total acumulada de las 3 galaxias principales (la Via Lactea, Andromeda y Triangulo) es de: ', masa3galaxy:1:0, 'kg y el porcentaje que esto representa respecto a la masa de todas las galaxias es de: ',porcentajeMasa:0:1, '%');
     writeln ('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc es de: ', cantMenoresPc);
     writeln ('El nombre de la galaxia con mayor masa es ', nombreMax1, ' seguido de la galaxia ', nombreMax2);
     writeln ('El nombre de la galaxia con menor masa es ', nombreMin1, ' seguido de la galaxia ', nombreMin2);
end;


var
     v: vectorGalaxias;
     t: vectorContador;
     nombreMax1, nombreMax2, nombreMin1, nombreMin2: string; 
     cantMenoresPc: integer;
     masa3galaxy: real; 
     porcentajeMasa: real;  
     masaTotal: real;
begin 
     masa3galaxy:= 0;
     cantMenoresPc:= 0;
     cargaVector (v);
     InicializarVector (t);
     Procesar (nombreMax1, nombreMax2, nombreMin1, nombreMin2, cantMenoresPc, masa3galaxy, porcentajeMasa, v, t,masaTotal);
     Informar (nombreMax1, nombreMax2, nombreMin1, nombreMin2, cantMenoresPc, masa3galaxy, porcentajeMasa, t);
end.

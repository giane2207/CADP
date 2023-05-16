program ej3p4p2;
const
     corte = 0; //stop de la carga del vector
     dimF = 3;
     dia = 31;
type
    //rangos
     subrangoDia = 1..31;
     rangoViaje = 1..dimF;
     rangoContador = 1..dia;
     
    //registro
     RegistroViaje = record 
         diaMes: subrangoDia;
         dinero: real;
         distancia: real;
    end;
    
    //vectores
    vectorViaje = array [rangoViaje] of RegistroViaje;
    vectorContador = array [rangoContador] of integer;
    
//modulos
procedure Leer (var r: RegistroViaje);
begin
     write ('distancia recorrida por el camion:');
     readln (r.distancia);
     if (r.distancia <> corte) then begin
         write ('dia del viaje:');
         readln (r.diaMes);
         write ('Monto de dinero transportado:');
         readln (r.dinero);
         writeln ();
     end;
end;

procedure CargarVector (var dl: integer; var v: vectorViaje; d: RegistroViaje);
begin
     dl:=0;
     while (dl < dimF) and (d.distancia <> corte) do begin
         dl:= dl + 1;
         v[dl]:= d;
         if (dl < dimF)then begin
             Leer (d);
         end;
     end;
     
end;

procedure Inicializar (var v: vectorContador);
var
     i: integer;
begin
     for i:= 1 to dia do begin
         v[i]:= 0;
     end;
end;

procedure CargarVecContador (var v: vectorContador; diaMes: integer);
begin
     v[diaMes]:= (v[diaMes] + 1);
end;

function Promedio (cantViajes: integer; montoTotal: real): real;
begin
     Promedio:= (montoTotal/cantViajes);
end;

procedure MenosDinero (var minDistancia: real; var minDia: integer; var minDinero: real; distancia: real; dinero: real; dia: integer);
begin
     if (dinero < minDinero) then begin
         minDistancia:= distancia;
         minDia:= dia;
         minDinero:= dinero;
     end;
end;

procedure RecorrerVector (var montoPromedio, minDistancia, minDinero: real; var minDia: integer; var vc: vectorContador; var dl: integer; v: vectorViaje);
var
     montoTotal: real;
     i: integer;
begin
     montoTotal:= 0;
     minDinero:= 9999;
     Inicializar (vc);
     for i:= 1 to dl do begin
         CargarVecContador (vc, v[i].diaMes);
         MenosDinero (minDistancia, minDia, minDinero, v[i].distancia, v[i].dinero, v[i].diaMes);
         montoTotal:= montoTotal + v[i].dinero;
     end;
     MontoPromedio:= Promedio (dl, montoTotal);
end;

procedure Informar (v: vectorContador; montoProm, minDist, minDinero: real; minDia: integer);
var
     i: integer;
begin
     writeln ('_____');
     writeln ('El monto promedio transportado de los viajes realizados es ', montoProm:0:1);
     writeln ('_____');
     writeln (minDist:0:1,'km es la distancia recorrida y ',minDia ,' es dia del mes en que se realizo el viaje que transporto menos dinero, con un total de $', minDinero:0:1);
     writeln ('_____');
     
     for i:= 1 to dia do begin
        writeln ('La cantidad de viajes realizados en el dia ', i, ' es de: ', v[i]);
        writeln ();
     end;
end;


var
     montoProm, minDist, minDinero: real;
     minDia, dimL: integer;
     vc: vectorContador;
     v: vectorViaje;
     d: RegistroViaje;
begin
     writeln ('Ingrese los datos de los viajes del mes de Marzo');
     Leer(d);
     if (d.distancia <> corte) then begin        
         CargarVector (diml, v, d);
         RecorrerVector (montoProm, minDist, minDinero, minDia, vc, dimL, v);
         Informar (vc, montoProm, minDist, minDinero, minDia);
     end;
end.

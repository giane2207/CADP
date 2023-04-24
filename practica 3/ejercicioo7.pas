program ej7p3;

type
   CentrosDeInvestigacion = record
      nombreCentro: string;
      nombreUniversidad: string;
      cantInvestigadores: integer;
      cantBecarios: integer;
   end;

procedure Leer (var c: CentrosDeInvestigacion);
begin
  writeln ('Ingrese cantidad de investigadores:');
  readln (c.cantInvestigadores);
  if (c.cantInvestigadores <> 0) then begin
    writeln ('Ingrese  nombre de la universidad:');
    readln (c.nombreUniversidad);
    writeln ('Ingrese nombre del centro:');
    readln (c.nombreCentro);
    writeln ('Ingrese cantidad de becarios:');
    readln (c.cantBecarios);
    writeln ('______________________________');
  end;
end;


procedure ActualizarMaxInvestigadores (var maxCantInvestigadores: integer; var nombreMaxUni: string; nombreUniversidad: string; cantInvestigadores: integer);
begin
   if (cantInvestigadores >= maxCantInvestigadores) then begin
      maxCantInvestigadores:= cantInvestigadores;
      nombreMaxUni:= nombreUniversidad;
   end;
end;

procedure ActualizarMinBecarios (var minCantBecarios1, minCantBecarios2: integer ; var nombreMinCentro1, nombreMinCentro2: string ; cantBecarios: integer; nombreCentro: string);
begin
  if (cantBecarios <= minCantBecarios1) then begin
     minCantBecarios2:= minCantBecarios1;
     nombreMincentro2:= nombreMinCentro1;
     minCantBecarios1:= cantBecarios;
     nombreMinCentro1:= nombreCentro;
  end
  else
     if (cantBecarios <= minCantBecarios2) then begin
        minCantBecarios2:= cantBecarios;
        nombreMinCentro2:= nombreCentro;
     end;
end;

var
  c: CentrosDeInvestigacion;
  cantCentrosxUni: integer;
  cantInvestigadores: integer;
  universidadActual: string;
  
  //variables maximos y minimos 
  
  maxCantInvestigadores: integer; 
  nombreMaxUni: string;
  minCantBecarios1: integer;
  minCantBecarios2: integer ;
  nombreMinCentro1: string;
  nombreMinCentro2: string;
  
begin
  maxCantInvestigadores:= -1; 
  nombreMaxUni:= '';
  minCantBecarios1:= 9999;
  nombreMinCentro1:= '';
  Leer (c);
  while (c.cantInvestigadores <> 0 ) do begin
     cantCentrosxUni:= 0;
     cantInvestigadores:= 0;
     universidadActual:= c.nombreUniversidad;
     while (c.cantInvestigadores <> 0) and (c.nombreUniversidad = universidadActual) do begin
        cantInvestigadores:= cantInvestigadores + c.cantInvestigadores; 
        ActualizarMinBecarios (minCantBecarios1, minCantBecarios2, nombreMinCentro1, nombreMinCentro2, c.cantBecarios, c.nombreCentro);
        cantCentrosxUni:= cantCentrosxUni + 1;
        Leer (c);
     end;
     writeln ('La cantidad total de centros de la universidad: ', universidadActual, ' es: ', cantCentrosxUni);
     ActualizarMaxInvestigadores (maxCantInvestigadores, nombreMaxUni, universidadActual, cantInvestigadores);
  end; //primer while
  writeln (nombreMaxUni ,' es la universidad que mas investigadores tiene en sus centros');
  writeln (nombreMinCentro1, ' es el primer centro con menor cantidad de becarios');
  writeln (nombreMinCentro2, ' es el segundo centro con menor cantidad de becarios');
end.

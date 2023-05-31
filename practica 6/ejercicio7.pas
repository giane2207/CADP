{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:
- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.}

program ej7p6;
type
     sonda = record
         nombre: string [20];
         duracion: integer; {en meses}
         costoC: real; {costo construccion}
         costoM: real; {costo mantenimiento}
         categoria: 1..7;
         end;
     
     lista = ^nodo;
     listaCumplen = ^nodo;  {podrian hacerse de un nuevo nodo q guarde solo el costo total de la sonda}
     listaNoCumplen = ^nodo; 
     
     nodo= record
         elem: sonda;
         sig: lista;
         end;
    
     
//modulos

procedure LeerSondas (var s: sonda);
begin
         writeln ('Ingrese nombre: ');
         readln (s.nombre);        
         writeln ('Ingrese duracion: ');
         readln(s.duracion);         
         writeln ('Ingrese costo de construccion: ');
         readln (s.costoC);        
         writeln ('Ingrese costo de mantenimiento: ');
         readln (s.costoM);        
         writeln ('Ingrese categoria: ');
         readln (s.categoria);
end;

procedure AgregarAdelante (var pri: lista; s: sonda);
var 
     nuevo:lista;
begin 
     new (nuevo);
     nuevo^.elem:= s;
     nuevo^.sig:= pri;
     pri:= nuevo;
end;

procedure CargarListaCumplen (var pri: listaCumplen; L: lista);
var
     nuevo: listaCumplen;
begin
     new (nuevo);
     nuevo^.elem:= L^.elem;
     nuevo^.sig:= pri;
     pri:= nuevo;
end;

procedure CargarListaNoCumplen (var pri: listaNoCumplen; L: lista);
var
     nuevo: listaNoCumplen;
begin
     new (nuevo);
     nuevo^.elem:= L^.elem;
     nuevo^.sig:= pri;
     pri:= nuevo;
end;

procedure CargarLista (var pri: lista);
var
     s: sonda;
begin
     repeat
         LeerSondas(s);
         AgregarAdelante(pri, s);
     until (s.nombre = 'GAIA')
end;

function CalcularCostoTotal (CostoConstruccion, CostoMantenimiento: real): real;
begin
     CalcularCostoTotal:= CostoConstruccion + CostoMantenimiento;
end;

function CumpleFinanciar (costoMant, costoConst: real): boolean;
var
     cumple: boolean;
begin
     cumple:= false;
     if (costoMant <= costoConst) then 
         cumple:= true;
     CumpleFinanciar:= cumple;
end;

procedure Procesar (var Lcumple: listaCumplen; var LnoCumple: listaNoCumplen; var cantNoCumplen: integer; L: lista);
begin
     cantNoCumplen:= 0;
     while (L <> nil) do begin
         if (CumpleFinanciar(L^.elem.costoC, L^.elem.costoM)) then 
             CargarListaCumplen (Lcumple, L)
         else 
             CargarListaNoCumplen(LnoCumple, L);
             cantNoCumplen:= cantNoCumplen + 1;
         
         L:= L^.sig; {avanzo al siguiente nodo}
     end;
end;

procedure InformarNoCumplen (L: listaNoCumplen; cantNoCumplen: integer);
begin
     while (L <> nil) do begin
         writeln ('La cantidad de proyectos de sondas espaciales que no seran financiados por H2020 son ', cantNoCumplen, ' los cuales son nombrados a continuacion: ') ;
         writeln ('El proyecto de nombre: ', L^.elem.nombre, ' tiene un costo total de: ', CalcularCostoTotal(L^.elem.costoC, L^.elem.costoM):0:1); 
         L:= L^.sig;
     end;
end;

{programa principal}
var
     L:lista;
     LSi: listaCumplen;
     LNo: listaNoCumplen;
     cantNoCumplen: integer;
begin
     L:= nil;
     LSi:= nil;
     LNo:= nil; 
     CargarLista (L);
     Procesar (Lsi, LNo,cantNoCumplen, L);
     InformarNoCumplen (LNo, cantNoCumplen);
end.

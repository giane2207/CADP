{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:
- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b.}

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


procedure CargarLista (var pri: lista);
var
     s: sonda;
begin
     repeat
         LeerSondas(s);
         AgregarAdelante(pri, s);
     until (s.nombre = 'GAIA')
end;

{a}
function CumpleFinanciar (costoMant, costoConst: real; categoria: integer): boolean;
var
     cumple: boolean;
begin
     cumple:= false;
     if (costoMant <= costoConst) and (categoria <> 1) then {1:radio}
         cumple:= true;
     CumpleFinanciar:= cumple;
end;
 
 {b}
procedure Procesar (var Lcumple, LnoCumple: lista; var cantNoCumplen: integer; L: lista);
begin
     cantNoCumplen:= 0; 
     while (L <> nil) do begin
         if (CumpleFinanciar(L^.elem.costoC, L^.elem.costoM, L^.elem.categoria)) then  {si la sonda cumple se agregan sus datos a una lista}
             AgregarAdelante(Lcumple, L^.elem)
         else begin
             AgregarAdelante(LnoCumple, L^.elem); {sino cumple se agregan a otra lista}
             cantNoCumplen:= cantNoCumplen + 1;
         end;
         L:= L^.sig; {avanzo al siguiente nodo}
     end;
end;

{c}
procedure InformarNoCumplen (L: lista; cantNoCumplen: integer);
var  
     costo: real;
begin
     writeln ('');
     writeln ('La cantidad de proyectos de sondas espaciales que no seran financiados por H2020 son ', cantNoCumplen, ' los cuales son nombrados a continuacion: ') ;
     while (L <> nil) do begin
         costo:=0;
         costo:= costo + (L^.elem.costoC + L^.elem.costoM);
         writeln ('');
         writeln ('- El proyecto de nombre: ', L^.elem.nombre, ' tiene un costo total de: ', costo:0:1); 
         L:= L^.sig;
     end;
end;


{programa principal}
var
     L: lista;
     LSi: lista;
     LNo: lista;
     cantNoCumplen: integer;
begin
     L:= nil;
     LSi:= nil;
     LNo:= nil; 
     CargarLista (L);
     Procesar (Lsi, LNo,cantNoCumplen, L);
     InformarNoCumplen (Lno, cantNoCumplen);
end.

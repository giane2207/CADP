program ej5p6;
type
     productos = record
         cod: integer;
         descrip: string [30];
         stockAct: integer;
         stockMin: integer;
         precio: real;
     end;
     
     lista = ^ nodo;
     nodo = record
         elem: productos;
         sig: lista;
     end;
     
procedure LeerProductos (var p: productos);
begin
     writeln ('ingrese codigo del producto:');
     readln (p.cod);
     if (p.cod <> -1) then begin
         writeln ('ingrese descripcion del producto:');
         readln (p.descrip);
         writeln ('ingrese stock actual del producto:');
         readln (p.stockAct);
         writeln ('ingrese stock minimo del producto:');
         readln (p.stockMin);
         writeln ('ingrese precio del producto:');
         readln (p.precio);
     end;
end;

procedure AgregarAlFinal (var pri: lista; p: productos);
var
     nuevo: lista;
begin
     new (nuevo);
     nuevo^.elem:= p;
     nuevo^.sig:= pri;
     pri:= nuevo;
     
end;

procedure CargarLista (var pri: lista; var cantTotal: integer);
var
     p: productos;
begin
     LeerProductos (p);
     while (p.cod <> -1) do begin
         cantTotal:= cantTotal + 1;
         AgregarAlFinal (pri, p);
         LeerProductos (p);
     end;
end;

function ElPorcentaje (CantTotal, cant: integer): real;
begin
     ElPorcentaje:= (cant/cantTotal)* 100;
end;

function EsPar (valor: integer): boolean;
begin 
     EsPar:= valor MOD 2 = 0;
end;

function Almenos3Pares (num: integer): boolean;
var
     ok: boolean; 
     aux: integer;
begin
     ok:= false;
     aux:= 3;
     while (num <> 0) and (aux <> 0) do begin
         if (EsPar(num)) then begin
             aux:= aux - 1;
         end;
         num:= num DIV 10;
     end;
     if (aux = 0) then 
         ok:= true;
     Almenos3Pares:= ok;
end;

procedure ProdsEconomicos (var min1, min2: real; var cod1,cod2: integer; precio: real; cod: integer);
begin
     if (precio < min1) then begin
         min2:= min1;
         cod2:= cod1;
         min1:= precio;
         cod1:= cod;
     end
     else 
         if (precio < min2) then begin
             min2:= precio;
             cod2:= cod;
         end;
end;

procedure RecorrerLista (var porcentaje: real; var cod1, cod2: integer; var cantTotal: integer; L: lista); 
var
    min1, min2: real;
    cantStock: integer;
begin
     min1:= 9999;
     min2:= 9999;
     cantStock:= 0;
     while (L <> nil) do begin
         if (L^.elem.stockAct < L^.elem.stockMin) then begin{si el stock actual es menor al stock minimo }
             cantStock:= cantStock + 1; {cuento uno para luego sacar el porcentaje}
         end;
         if (Almenos3Pares(L^.elem.cod)) then begin
             writeln ('Descripcion de aquellos productos con codigo compuesto por al menos tres digitos pares: ', L^.elem.descrip);
         end;
         ProdsEconomicos (min1, min2, cod1, cod2, L^.elem.precio, L^.elem.cod);
         L:= L^.sig; 
     end;
     Porcentaje:= ElPorcentaje (cantTotal, cantStock);
end;

var
     L:lista;
     cod1,cod2, cantTotal: integer;
     porcentaje: real;
     
begin
     L:=nil;
     cantTotal:=0;
     CargarLista (L, cantTotal);
     RecorrerLista (porcentaje, cod1, cod2, cantTotal, L);    
     writeln ('El porcentaje de productos con stock actual por debajo de su stock minimo es: ', porcentaje:0:1);
     writeln ('Codigo de los dos productos más economicos son: ', cod1, ' y ', cod2);
end.
 

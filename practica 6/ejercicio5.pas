{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}

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

procedure AgregarAdelante (var pri: lista; p: productos);
var
     nuevo: lista;
begin
     new (nuevo);
     nuevo^.elem:= p; {guarda el producto nuevo}
     nuevo^.sig:= pri;{hace el enlace con el primero de la lista para no perderlo}
     pri:= nuevo; {ahora q se hizo el enlace actualizamos nuestro primer puntero}
     
end;

procedure CargarLista (var L:lista);
var
     p:productos;
begin
     LeerProductos(p);
     while (p.cod <> -1) do begin
         AgregarAdelante(L, p);
         LeerProductos(p);
     end;
end;

{a}
function ElPorcentaje (CantTotal, cant: integer): real;
begin
     if (cant <> 0) then begin
         ElPorcentaje:= (cant/cantTotal)* 100;
     end;
end;

function EsPar (valor: integer): boolean;
begin 
     EsPar:= valor MOD 2 = 0;
end;

{b}
function CantPares (num: integer): integer;
var
     cant, resto: integer;
begin
     cant:= 0;
     while (num <> 0 ) do begin
         resto:= num MOD 10;
         if (EsPar (resto)) then
             cant:= cant + 1;
         num:= num DIV 10;
     end;
	 CantPares:= cant;
end;

{c}
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

function StockMenorQueMinimo (L: lista): boolean;
begin
     StockMenorQueMinimo:= (L^.elem.stockAct < L^.elem.stockMin);
end;


procedure RecorrerLista (var porcentaje: real; var cod1, cod2: integer; L: lista); 
var
    min1, min2: real;
    cantStock, cantTotal: integer;
begin
     min1:= 9999;
     min2:= 9999;
     cantStock:= 0;
     cantTotal:= 0;
     while (L <> nil) do begin
         cantTotal:= cantTotal + 1; {llevo la cantidad total de productos}
         if (StockMenorQueMinimo(L)) then begin{si el stock actual es menor al stock minimo }
             cantStock:= cantStock + 1; {cuento uno para luego sacar el porcentaje}
         end;
         if (CantPares(L^.elem.cod) >= 3 ) then begin
             writeln ('Descripcion de aquellos productos con codigo compuesto por al menos tres digitos pares: ', L^.elem.descrip);
         end;
         ProdsEconomicos (min1, min2, cod1, cod2, L^.elem.precio, L^.elem.cod);
         L:= L^.sig; 
     end;
     Porcentaje:= ElPorcentaje (cantTotal, cantStock);
end;

var
     L:lista;
     cod1,cod2:integer;
     porcentaje: real;
begin
     L:=nil;
     CargarLista (L);
     RecorrerLista (porcentaje, cod1, cod2, L);    
     writeln ('El porcentaje de productos con stock actual por debajo de su stock minimo es: ', porcentaje:0:1);
     writeln ('El codigo del producto mas economico es: ', cod1, ' seguido de ', cod2);
end.
 

program ej9bp6;
type
     lista = ^nodo;
     
     nodo = record
         num: integer;
         sig: lista;
     end;
     
procedure agregarAdelante (var pri: lista; valor: integer);
var
     nuevo:lista;
begin
     new (nuevo);
     nuevo^.num:= valor;
     nuevo^.sig:= pri;
     pri:= nuevo;
end;

procedure GenerarSubLista (VAR subL: lista; A,B: integer; L:lista);
begin
     while (L <> nil) do begin
         if (L^.num > A) and (L^.num < B) then
             AgregarAdelante (subL, L^.num);
         L:= L^.sig;
     end;
end;

procedure Imprimir (pri: lista);
begin
     while (pri <> nil) do begin
         writeln (pri^.num);
         pri:= pri^.sig;
     end;
end;

var
     pri, subL : lista;
     A, B, valor : integer;
begin
     pri := nil;
     subL:= nil;
     writeln('Ingrese un numero');
     read(valor);
     while (valor <> 0) do begin
         agregarAdelante(pri, valor);
         writeln('Ingrese un numero');
         read(valor);
     end;
     writeln ('Ingrese 2 numeros para crear una lista nueva ');
     writeln ('');
     write ('numero A: ');
     readln (A);
     write ('numero B: ');
     readln (B);
     GenerarSubLista (subL, A, B, pri);
      writeln ('');
     writeln ('LISTA PRINCIPAL ');
     Imprimir (pri);
     writeln ('');
     writeln ('SUBLISTA ');
     Imprimir (subL);
     
end.

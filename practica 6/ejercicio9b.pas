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

procedure Eliminar (var pri: lista;var exito: boolean; valor: integer);
var
     anterior, actual: lista;
begin
     exito:= false;
     actual:= pri;
     anterior:= pri;
     while (actual <> nil) and (actual^.num <> valor) do begin
         anterior:= actual;
         actual:= actual^.sig;
     end;
     if  (actual <> nil) and (actual^.num = valor) then begin 
         exito:= true;
         if (actual = pri) then 
             pri:= pri^.sig {se pasa al de al lado porq sino lo funan al borrarlo pobrecito}
         else 
             anterior^.sig:= actual^.sig; {se hace el puente para borrar el actual}
         dispose (actual); {en cualquiera de los 2 casos hago dispose de actual SIEMPRE DENTRO DEL IF PRINCIPAL}
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
     pri : lista;
     exito: boolean;
     valor : integer;
begin
     pri := nil;
     writeln('Ingrese un numero');
     read(valor);
     while (valor <> 0) do begin
         agregarAdelante(pri, valor);
         writeln('Ingrese un numero');
         read(valor);
     end;
     writeln('Ingrese un numero a eliminar de la lista');
     read(valor);
     Eliminar (pri, exito, valor); {agregue un boolean para probar pero no es necesario}
     if (exito) then 
         writeln ('hubo exito al eliminar el valor de la lista')
     else
         writeln (' NO hubo exito al eliminar el valor de la lista');
    Imprimir (pri); {para ver si elimino realmente}
end.

{a. Indicar qué hace el programa.
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.}

program ej1p6;
type
     lista = ^nodo;
     
     nodo = record
         num: integer;
         sig: lista;
     end;
     
{procedimiento ArmarNodo}
procedure agregarAdelante (var pri: lista; valor: integer);
var
     nuevo:lista;
begin
     new (nuevo);
     nuevo^.num:= valor;
     nuevo^.sig:= pri;
     pri:= nuevo;
end;

{inciso c}
procedure Imprimir (pri: lista);
begin
     while (pri <> nil) do begin
         writeln (pri^.num);
         pri:= pri^.sig;
     end;
end;

{inciso d}
procedure Incrementar (pri: lista; valor: integer);
begin
     while (pri <> nil) do begin
         pri^.num:= pri^.num + valor;
         pri:= pri^.sig;
     end;
end;

var
     pri : lista;
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
     Imprimir (pri);
     writeln('Ingrese un numero para incrementar los valores de la lista');
     read(valor);
     Incrementar(pri, valor);
     Imprimir (pri);
end.
    
    
    
    
    
    
    
    
    
    
    

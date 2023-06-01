program eje7p6;
type
	lista = ^nodo;
	
	nodo = record
		num : integer;
		sig : lista;
	end;

procedure InsertarOrdenado(var pri:lista; p: integer);
var
	anterior, actual, nuevo: lista;
begin
     new (nuevo);
     nuevo^.num:= p;
     nuevo^.sig:= nil;
     if (pri = nil) then pri:= nuevo
     else begin
		anterior:= pri;
		actual:= pri;
		while (actual <> nil) and (actual^.num < nuevo^.num) do begin
		     anterior:= actual; 
		     actual:= actual^.sig;
		 end;
		if (actual = pri) then begin
			 nuevo^.sig:= pri;
			 pri:= nuevo;
		 end
		 else begin
			 anterior^.sig:= nuevo;
			 nuevo^.sig:= actual;
		 end;
	end;
end;

procedure ImprimirLista (L: lista);
begin
     while (L <> nil) do begin
         writeln ('el numero es: ', L^.num);
         L:= L^.sig;
     end;
end;

var
	pri : lista;
	valor : integer;
begin
	pri := nil;
	writeln ('Ingrese un numero');
	read(valor);
	while (valor <> 0) do begin
		InsertarOrdenado(pri, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
	ImprimirLista (pri);
end.


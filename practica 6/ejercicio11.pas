program eje11p6;
type 
	egresado = record
	     numAlu: integer;
	     apellido: string [20];
	     promedio: real;
	     end;
	 lista = ^nodo;
	 
	 nodo = record
	     dato: egresado;
	     sig: lista;
	     end;

procedure Leer (var e: egresado);
begin
         writeln ('Ingrese numero de alumno: ');
         readln (e.numAlu);    
         if (e.numAlu <> 0) then begin    
			 writeln ('Ingrese apellido: ');
			 readln(e.apellido);         
			 writeln ('Ingrese promedio: ');
			 readln (e.promedio);       
	     end; 
end;


procedure InsertarOrdenado(var pri:lista; e: egresado);
var
	anterior, actual, nuevo: lista;
begin
     new (nuevo);
     nuevo^.dato:= e;
     nuevo^.sig:= nil;
     if (pri = nil) then pri:= nuevo
     else begin
		anterior:= pri;
		actual:= pri;
		while (actual <> nil) and (actual^.dato.promedio > nuevo^.dato.promedio) do begin
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

procedure CargarLista (var L: lista);
var 
     e: egresado;
begin
     Leer(e);
     while (e.numAlu <> 0) do begin
         InsertarOrdenado(L, e);
         Leer (e);
     end;
end;

procedure InformarMejorPromedio (L: lista);
var
    i: integer;
begin
     for i:= 1 to 10 do begin {como mi lista esta ordenada de mayor a menor imprimo los primeros 10}
         if (L<> nil) then begin {puede ser q mi lista este vacia o no tenga 10 elementos}
             writeln ('Apellido: ', L^.dato.apellido);
             writeln ('Numero de Alumno: ', L^.dato.numAlu);
             writeln ('Promedio: ', L^.dato.promedio:0:1); {no lo pide, quiero ver}
             L:= L^.sig; {avanzo al siguiente}
         end;
     end;
end;

var
     L: lista;
begin
     L:= nil;
     CargarLista (L);
     InformarMejorPromedio (L);
end.

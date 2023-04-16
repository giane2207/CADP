program anidamientos;

function analizarLetra : boolean;
var 
  letra: char;
begin
   writeln('Ingrese una letra: ');
   readln(letra);
   if (letra >= 'a') and (letra <= 'z') then begin
     analizarLetra := true;
   end
    else
       if (letra >= 'A') and (letra <= 'Z') then begin
          analizarletra := false;
        end
        else begin
          write ('La letra ingresada no es valida');
        end;
end; { fin de la funcion analizarLetra }

procedure leer;
begin
  if (analizarLetra) then begin
     writeln('Se trata de una minuscula');
   end
   else
      writeln('Se trata de una mayuscula');
end; { fin del procedure leer}

var
ok : boolean;
begin { programa principal }
leer;
ok := analizarLetra;
if ok then
writeln('Gracias, vuelva prontosss');
end.

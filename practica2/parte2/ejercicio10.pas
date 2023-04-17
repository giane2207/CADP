{10. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}


program ej10p2p2;

//funcion que recibe un caracter y retorna si es o no vocal minuscula o mayuscula
function EsVocal (c: char): boolean;
begin
  EsVocal:= (c= 'a') or (c= 'e') or (c= 'i') or (c='o') or (c='u') or (c='A') or (c='E') or (c='I') or (c='O') or (c='U');
end;

//proceso para analizar si se cumple la secuencia de A
procedure CumpleA (var cumple: boolean);
var
 c:char;
begin
  writeln ('Ingrese la secuencia A');
  readln (c);
  while (c <> '$') and (cumple) do begin
    if (not EsVocal (c)) then 
       cumple:= false  //sino es vocal pongo cumple en falso
     else 
       writeln ('Ingrese la secuencia A');
       readln (c); //si fue vocal, sigo leyendo
   end;
end;

procedure cumpleB (var cumple: boolean);
var
  ca: char;
begin
  writeln ('Ingrese la secuencia B');
  readln (ca);
  while (ca <> '#') and (cumple) do begin
    if (EsVocal(ca)) then begin
      cumple:= false; //lei un caracter falso entonces es falso
     end
     else 
       writeln ('Ingrese la secuencia B');
       readln (ca); //sino fue vocal sigo leyendo la secuencia;
   end;
end;
  
  
var
 cumple: boolean;
begin
  cumple:= true;
  CumpleA (cumple);
  if (cumple) then begin //if de A
     CumpleB (cumple);
    if (cumple) then begin//if de B
        writeln ('El patron se cumplio');
     end
     else 
       writeln ('El patron  no se cumplio en B');
  end //end de A
  else  
      writeln ('El patron  no se cumplio en A');
end.


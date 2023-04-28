program ej3p3;

const
  dimF = 10;
  
type
   vector = array [1..dimF] of integer;

//modulos

procedure incisoA(v: vector; dimL: integer);
var
  i: integer;
begin
    for i:= 1 to dimL do begin        
         write (v[i], ', ');
     end;
end;

procedure incisoB (v: vector; dimL: integer);
var 
  i: integer;
begin
   for i:= dimL downto 1 do begin
        write (v[i], ', ');
    end;
end;


procedure incisoC (v: vector; dimL: integer);
var 
  i: integer;
begin
   for i:= (dimL DIV 2 )downto 1 do begin      
        write (v[i], ', ');
   end; 
   writeln ('--');
   for i:= (dimL DIV 2 + 1) to dimL do begin    
        write (v[i], ', ');
   end; 
end;        
        





procedure CargarVector (var v: vector; var dimL: integer);
var
  i: integer;
begin
    for i:= 1 to dimF do begin
        writeln ('Ingrese un numero');
        read(v[i]);
        dimL:= dimL + 1;
    end;
end;





//variables del programa principal
var
   v: vector;
   dimL: integer;

begin
  dimL:= 0;
  CargarVector (v, dimL);
  writeln ('IncisoA: ');
  incisoA (v, dimL);
  writeln ('IncisoB: ');
  incisoB (v, dimL);
  writeln ('IncisoC: ');
  incisoC (v, dimL);
end.

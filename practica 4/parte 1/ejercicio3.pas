program ej3p3;

const
     dimF = 10;
  
type
     vector = array [1..dimF] of integer;

//modulos
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

procedure incisoA(v: vector; dimL: integer);
var
    i: integer;
begin
    for i:= 1 to dimL do begin        
         writeln ('Posicion ', i,') ', v[i]);
    end;
end;

procedure incisoB (v: vector; dimL: integer);
var 
     i: integer;
begin
     for i:= dimL downto 1 do begin
         writeln ('Posicion ', i,') ', v[i]);
     end;
end;


procedure incisoC (v: vector; dimL: integer);
var 
     i: integer;
begin
     for i:= (dimL DIV 2 )downto 1 do begin      
        writeln ('Posicion ', i,') ', v[i]);
     end; 
     writeln ('--');
     for i:= (dimL DIV 2 + 1) to dimL do begin    
         writeln ('Posicion ', i,') ', v[i]);
     end; 
end;        
        

procedure xy(x,y: integer; v: vector);
var i:integer;
begin
     if(x > y) then
     begin
          for i:=x downto y do 
          writeln('Posicion ', i,') ', v[i]);
     end
     else begin
          for i:=x to y do 
             writeln ('Posicion ', i,') ', v[i]);
     end;
end;



//variables del programa principal
var
   v: vector;
   dimL: integer;
   X, Y: integer;

begin
  dimL:= 0;
  CargarVector (v, dimL);
  writeln ('_______________________ ');
  writeln ('IncisoA: ');
  incisoA (v, dimL);
  writeln ('_______________________ ');
  writeln ('IncisoB: ');
  incisoB (v, dimL);
  writeln ('_______________________ ');
  writeln ('IncisoC: ');
  incisoC (v, dimL);
  writeln ('_______________________ ');
  writeln ('Ingrese un numero x');
  readln (X);
  writeln ('Ingrese un numero y');
  readln (Y);
  
  xy (X, Y, v)
end.

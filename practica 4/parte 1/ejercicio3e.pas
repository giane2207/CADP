program ej3EP3;

const
  dimF = 10;
  
type
   vector = array [1..dimF] of integer;
   
   
procedure incisoA(v: vector; X, Y: integer);
var
  i: integer;
begin
     if (X > Y) then begin
         for i:= Y to X do begin
            write (v[i], ', ');
         end;
     end
     else 
         if (Y > X) then begin
             for i:= X to Y do begin
                 write (v[i], ', ');
             end;
         end;
end;

procedure incisoB  (v: vector; X, Y: integer);
var 
   i: integer;
begin
  if ( X > Y ) then begin
     for i:= X to Y do begin
         write (v[i], ', ');
     end;
  end
  else 
     if (Y > X ) then begin
        for i:= Y to X do begin
           write (v[i], ', ');
        end;
     end;
end;

procedure IncisoC (v: vector; X, Y: integer);
var
   i : integer;
begin
  if (X > Y) then begin
    for i:= (X DIV 2 )downto Y do begin      
        write (v[i], ', ');
    end; 
    for i:= (X DIV 2 + 1) to Y do begin    
         write (v[i], ', ');
    end; 
  end
  else 
     if (Y > X) then begin
     for i:= (Y DIV 2 )downto X do begin      
         write (v[i], ', ');
     end; 
     for i:= (Y DIV 2 + 1) to X do begin    
         write (v[i], ', ');
     end; 
  end;
end;

procedure CargarVector (var v: vector);
var
  i: integer;
begin
    for i:= 1 to dimF do begin
        writeln ('Ingrese un numero');
        read(v[i]);
    end;
end;

var
   X, Y: integer;
   v: vector;

begin
  CargarVector (v);
  writeln ('Ingrese un numero x');
  readln (X);
  writeln ('Ingrese un numero y');
  readln (Y);
  writeln ('IncisoA: ');
  incisoA (v, X, Y);
  writeln ('IncisoB: ');
  incisoB (v, X, Y);
  writeln ('IncisoC: ');
  incisoC (v, X, Y);
end.

program ej10p2p2;

function EsVocal (c: char): boolean;
begin
  EsVocal:= (c= 'a') or (c= 'e') or (c= 'i') or (c='o') or (c='u');
  
end;

var
 c: char;
begin
  readln (c);
  if (EsVocal(c)) then 
    writeln ('geniaaaaaaaaaaaaa');
end.


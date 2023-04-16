//Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
//Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
//número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
//procesarse. Al finalizar la lectura informar:
//- La cantidad de alumnos aprobados (nota 8 o mayor) y
//- la cantidad de alumnos que obtuvieron un 7 como nota.

program ej3p1p2;
var
  nombre: string;
  nota, aprob, nota7: integer;
begin
  aprob:= 0;
  nota7:= 0;
  repeat 
      write ('Ingrese un nombre: ');
      readln (nombre);
      write ('Ingrese una nota: ');
      readln (nota);
      if (nota >= 8) then begin
        aprob:= aprob + 1
      end;
      if (nota = 7) then begin
        nota7:= nota7 + 1
      end;
  until (nombre = 'ok' );
  writeln ('La cantidad de alumnos aprobados fueron: ', aprob);
  writeln ('La cantidad de alumnos que obtuvieron 7 como nota fueron: ', nota7);
end.
  

      

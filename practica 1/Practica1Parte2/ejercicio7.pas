//Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
//autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
//participaron 100 autos. Informar en pantalla:
//- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
//- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.

program ej7p1p2;
var
  i: integer;
  piloto,  piloto_primero,  piloto_segundo,  piloto_ultimo,  piloto_anteultimo: string;
  tiempo_carrera,  mejor_tiempo1,  mejor_tiempo2,  ultimo_tiempo1,  ultimo_tiempo2: real;
begin
  //inicializo las variables 
  mejor_tiempo1:= -1;
  mejor_tiempo2:= -1;
  ultimo_tiempo1:= -9999;
  ultimo_tiempo2:= -9999;
  piloto_primero:= '';
  piloto_ultimo:= '';
  for i:= 1 to 5 do begin  // 1 to 100
    writeln ('Ingrese nombre del piloto: ');
    readln (piloto);
    writeln ('Ingrese tiempo de carrera del piloto: ');
    readln (tiempo_carrera);
    if (tiempo_carrera < mejor_tiempo1) then begin
      piloto_segundo:= piloto_primero; // guardo el valor viejo del primero en el que pasa a ser el segundo
      mejor_tiempo2:= mejor_tiempo1; 
      piloto_primero:= piloto;
      mejor_tiempo1:= tiempo_carrera;
     end
    else 
      if (tiempo_carrera < mejor_tiempo2) then begin //sino es mas grande que el mejor tiempo 1 pregunto si lo es para el segundo
        mejor_tiempo2:= tiempo_carrera;
        piloto_segundo:= piloto;
       end;
    if (tiempo_carrera > ultimo_tiempo1) then begin 
      piloto_anteultimo:= piloto_ultimo;
      ultimo_tiempo2:= ultimo_tiempo1;
      piloto_ultimo:= piloto;
      ultimo_tiempo1:= tiempo_carrera;
     end
    else 
      if (tiempo_carrera > ultimo_tiempo2) then begin
        piloto_anteultimo:= piloto;
        ultimo_tiempo2:= tiempo_carrera;
       end;
       
  end;
  writeln ('El primer puesto es: ', piloto_primero);
  writeln ('El segundo puesto es: ', piloto_segundo);
  writeln ('El ultimo puesto es: ', piloto_ultimo);
  writeln ('El anteultimo puesto es: ', piloto_anteultimo);
end.

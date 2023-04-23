{Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.}

program ej6p3;

type
  tmicroprocesadores = record
     marca: string;
     linea: string;
     cores: integer;
     veloGhz: real;
     transistoresNM: integer;
     end;

procedure Leer (var m: tmicroprocesadores);
begin
     writeln ('Ingrese cantidad de nucleos: ');
     readln (m.cores);
     if (m.cores <> 0) then begin
         writeln ('Ingrese la marca :');
         readln (m.marca);
         writeln ('Ingrese linea :');
         readln (m.linea);
         writeln ('Ingrese velocidad del reloj:');
         readln (m.veloGhz);
         writeln ('Ingrese tamanio de los transistores:');
         readln (m.transistoresNM);
         end;
end;

function masDe2Cores (core, transistores: integer): boolean;
begin
     masDe2Cores:= (core > 2) and (transistores <= 22);
end;

procedure mayorProcesadores (var maxP1, maxP2: integer; var maxMarca1, maxMarca2: string; cantProcesadores: integer; marca: string);
begin
     if (cantProcesadores > maxP1) then begin
         maxP2:= maxP1;
         maxMarca2:= marca;
         maxP1:= cantProcesadores;
         maxMarca1:= marca;
     end
     else 
         if (cantProcesadores > maxP2) then begin
             maxP2:= cantProcesadores;
             maxMarca2:= marca;
         end;
end;

function Multicore (marca: string; velocidadReloj: real): boolean;
begin
     Multicore:= (((marca = 'intel') or (marca = 'AMD')) and (velocidadReloj >= 2));
end;

var
  max1, max2, cantMulticore, cant14transistores: integer;
  maxMarca1,maxMarca2, marca: string;
  m: tmicroprocesadores;

begin
     max1:= -1; max2:=-1; cantMulticore:= 0; 
     Leer (m);
     while (m.cores <> 0) do begin
        marca:= m.marca;
        cant14transistores:= 0; 
        while (marca = m.marca) and (m.cores <> 0) do begin
        
            if (masDe2Cores (m.cores, m.transistoresNM)) then begin
                writeln ('El procesador de la marca ', marca,' y linea ', m.linea,' tiene mas de 2 cores con transistores de a lo sumo 22 nm');
            end;
            
            if (Multicore(marca, m.veloGhz)) then begin
                cantMulticore:= cantMulticore + 1;
            end;
            
            if (m.transistoresNM = 14) then begin
                cant14transistores:= cant14transistores + 1;
            end;
            
            Leer (m);
        end; //segundo while
     writeln ('marca actual ', marca, ' marca nueva ', m.marca);
	 mayorProcesadores (max1, max2, maxMarca1, maxMarca2, cant14transistores, marca);
     end; //primer while
     writeln (maxMarca1, ' es la marca con transitores con mas de 14 mn y ', maxMarca2, ' es la segunda.');
     writeln(cantMulticore, ' son la cantidad de procesadores multicore de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz.');
end.   

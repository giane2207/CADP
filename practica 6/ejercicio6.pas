{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}

program ej6p6;
type
     Cantcategorias:= 7
     rangocategorias:= 1..cantCategorias;
     
     sonda = record;
         nombre: string [20];
         duracion: integer; {en meses}
         costoC: real; {costo construccion}
         costoM: real; {costo mantenimiento}
         categoria: rangocategorias;
         end;
     
     lista: ^nodo;
     
     nodo= record
         elem: sondas;
         sig: lista;
         end;
     
     vectorCont= array [rangocategorias] of integer;
     
//modulos

procedure LeerSondas (var s: sonda);
begin
         writeln ('Ingrese nombre: ');
         read (s.nombre);
         writeln ('Ingrese duracion: ');
         read (s.duracion);
         writeln ('Ingrese costo de construccion: ');
         read (s.costoC);
         writeln ('Ingrese costo de mantenimiento: ');
         read (s.costoM);
         writeln ('Ingrese categoria: ');
         read (s.categoria);
end;

procedure AgregarAdelante (var pri: lista; s: sonda);
var 
     nuevo:lista;
begin 
     new (nuevo);
     nuevo^.elem:= s;
     nuevo^.sig:= pri;
     pri:= nuevo;
end;

procedure CargarLista (var pri: lista);
var
     s: sondas;
begin
     repeat
         LeerSondas(s);
         AgregarAdelante(pri, s);
     until (s.nombre = 'GAIA')
end;

procedure SondaCostosa (var maxPrecio: real; var maxNombre: string; precio: real; nombre: string);
begin
     if (precio > maxPrecio) then begin
         maxPrecio:= precio;
         nombreMax:= nombre;
     end;
end;     

procedure InicializarVector (var v: vectorCont);
var
     i: integer;
begin
     for i:= 1 to cantcategorias do begin
         v[i]:= 0;
     end;
end;

function DuracionPromedio (sumaMeses, cantSondas: integer): real;
begin
     DuracionPromedio:= sumaMeses/cantSondas; 
end;

function CostoPromedio (sumaPrecios: real; cantSondas: integer): real;
begin
     CostoPromedio:= sumaPrecios/cantSondas;
end;

function CalcularCostoTotal (CostoConstruccion, CostoMantenimiento: real): real; {usar con variable e inicializarla cada vez q lea sonda siguiente}
begin
     CalcularCostoTotal:= CostoConstruccion + CostoMantenimiento;
end;

procedure Promedios (var cantMayorDuracion, cantSondas, totalMeses: integer; var nombreMayorProm: string; var sumaPrecios: real; L:lista);
var
     dPromedio: real;
     cPromedio:real;
    
begin 
     dPromedio:= DuracionPromedio(totalMeses, cantSondas);
     cPromedio:= CostoPromedio(sumaPrecio, cantSondas);
     while (L <> nil) do begin 
         if (L^.elem.duracion > dPromedio) then
             cantMayorDuracion:= cantDuracion + 1;
         if (L^.elem.costoC > cPromedio) then
             nombreMayorProm:= 










     
     
     
     
     
     
     
     

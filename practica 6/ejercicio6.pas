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
const 
     Cantcategorias= 7;
type

     rangocategorias= 1..cantCategorias;
     
     sonda = record
         nombre: string [20];
         duracion: integer; {en meses}
         costoC: real; {costo construccion}
         costoM: real; {costo mantenimiento}
         categoria: rangocategorias;
         end;
     
     lista = ^nodo;
     
     nodo= record
         elem: sonda;
         sig: lista;
         end;
     
     vectorCont= array [rangocategorias] of integer;
     
//modulos

procedure LeerSondas (var s: sonda);
begin
         writeln ('Ingrese nombre: ');
         readln (s.nombre);
         
         writeln ('Ingrese duracion: ');
         readln(s.duracion);
         
         writeln ('Ingrese costo de construccion: ');
         readln (s.costoC);
         
         writeln ('Ingrese costo de mantenimiento: ');
         readln (s.costoM);
         
         writeln ('Ingrese categoria: ');
         readln (s.categoria);
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
     s: sonda;
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
         maxNombre:= nombre;
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

function CalcularCostoTotal (CostoConstruccion, CostoMantenimiento: real): real;
begin
     CalcularCostoTotal:= CostoConstruccion + CostoMantenimiento;
end;


procedure Promedios (var dPromedio, cPromedio: real; L: lista);
var
     sumaPrecios: real;
     totalMeses, cantSondas: integer;
begin
     totalMeses:=0;
     cantSondas:= 0;
     while (L <> nil) do begin
         cantSondas:= cantSondas + 1;
         sumaPrecios:= CalcularCostoTotal(L^.elem.costoC, L^.elem.costoM);
         totalMeses:= totalMeses + L^.elem.duracion;
     end;
     dPromedio:= DuracionPromedio (totalMeses, cantSondas);
     cPromedio:= CostoPromedio(sumaPrecios, cantSondas);
end;

function superaCostoPromedio (costoSonda, costoPromedio: real): boolean;
var 
     ok: boolean;
begin 
     ok:= false;
     if (costoSonda > costoPromedio) then
         ok:= true;
     superaCostoPromedio:= ok;
end;

function superaDuracionPromedio (duracion: integer; duracionPromedio: real): boolean;
var 
     ok: boolean;
begin 
     ok:= false;
     if (duracion > duracionPromedio) then
         ok:= true;
     superaDuracionPromedio:= ok;
end;

procedure CargarVector (var v: vectorCont; categoria: integer);
begin
     v[categoria]:= v[categoria] + 1;
end;

procedure RecorrerLista (var v: vectorCont; var nombreCostosa: string; var cantSuperaDuracion: integer; L:lista);
var
     maxPrecio, CostoSonda: real;
     duracionPromedio, costoPromedio:real;
begin
     maxPrecio:= -1;    
     cantSuperaDuracion:= 0;
     Promedios (duracionPromedio, costoPromedio, L);
     while (L <> nil) do begin
         CostoSonda:= CalcularCostoTotal(L^.elem.costoC, L^.elem.costoM);
         SondaCostosa (maxPrecio, nombreCostosa, CostoSonda, L^.elem.nombre);
         CargarVector (v, L^.elem.categoria);
         if (superaCostoPromedio(costoSonda, costoPromedio)) then 
             writeln ('el nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas es: ', L^.elem.nombre, ' con un costo de: $', costoSonda);
         if (superaDuracionPromedio(L^.elem.duracion, duracionPromedio)) then
             cantSuperaDuracion:= cantSuperaDuracion +1;
         L:= L^.sig;
     end;
end;

procedure ImprimirVector (v: vectorCont);
var i: integer;
begin
     for i:= 1 to cantCategorias do begin
         writeln ('En la categoria ', i, ' se realizaran ', v[i], ' estudios');
     end;
end;

procedure Imprimir (cantSuperaDuracion: integer; nombreCostosa: string; v: vectorCont; L:lista);
begin
    if (L <> nil) then begin
         ImprimirVector (v);
         writeln ('El nombre de la sonda mas costosa es: ', nombreCostosa);
         writeln ('La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas es: ', cantSuperaDuracion);
     end;
end;

var
     cantSuperaDuracion: integer;
     nombreCostosa: string;
     L:lista;
     v: vectorCont;
begin
     CargarLista(L);
     InicializarVector(v);
     RecorrerLista(v, nombreCostosa, cantSuperaDuracion, L);
     Imprimir (cantSuperaDuracion, nombreCostosa, v, L);
end.

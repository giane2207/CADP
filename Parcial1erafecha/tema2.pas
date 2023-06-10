{Un teatro esta analizando la información de los tickets vendidos durante el año 2022. 
Para ello, se dispone de una estructura de datos con la información de todos los tickets vendidos.
 De cada ticket se conoce el código del evento, dni del comprador, mes de la función (entre 1 y 12) 
y ubicación (1: Palco, 2: Pullman, 3: Platea alta, 4:
Platea baja). La información se encuentra ordenada por código de evento.
Además, la empresa dispone de una estructura de datos con información del costo del ticket por ubicación.
Realizar un programa que procese la información de los viajes y:

A. Genere una lista que tenga por cada código de evento, la cantidad de tickets vendidos.

B. Informe el mes con mayor monto recaudado.

C. COMPLETO: Informe el promedio recaudado por cada evento entre todos sus tickets.}

//PD: no esta hecho pa compilar solo ver

program parcialito; {tema2 10:30}
const
    cantMeses = 12;
    cantUbi = 4;
type
	rangoMeses= 1..cantMeses;
	rangoUbi = 1..cantUbi;
	
	ticket = record
		cod: integer;
		dni: integer;
		mes: rangoMeses;
		ubi: rangoUbi;
		end;
	
	listaT = ^ nodo;
	nodo = record
		dato: ticket;
		sig: listaT;
		end;
	
	codycant = record
		cod: integer; {para saber de que evento es la cantidad}
		cant: integer;
		end;
	lista= ^ nodo;
	nodo = record
		dato: codycant;
		sig: lista;
		end;
		
	vectorMeses = array [rangoMeses] of real;
	
	vectorCosto = array [rangoUbi] of real;
	
//programa principal

var
    L: listaT;
    L2: lista;
    v: vectorCosto;
begin
	L:= nil;
	L2:= nil;
	CargarTickets (L); {se dispone}
	CargarCostos (v); {se dispone}
	ProcesarEInformar (L, L2, v);
end.

//modulos

procedure ProcesarEInformar (L: listaT; var L2: lista; V: vectosCosto);
var
     codActual, cantTickets: integer;
     montoEvento: real;
     VM: vectorMeses;
     c: codycant; 
begin
	Inicializar (VM);
	while (L <> nil) do begin {creo q me olvide poner do begin en el parcial}
		codActual:= L^.dato.cod;
		montoEvento:= 0;
		cantTickets:= 0;
		while (L <> nil) and (codActual = L^.dato.cod) do begin
		
			cantTickets:= cantTickets + 1;
			
			VM[L^.dato.mes]:= VM[L^.dato.mes] + V[L^.dato.ubi];
			
			montoEvento:= montoEvento + V[L^.dato.ubi];
			
			L:= L^.sig; {no me olvide}
			
		end;
		
		c.cod:= codActual;
		c.cant:= cantTickets;
		AgregarAdelante (L2, c); {A}
		write ('El promedio recaudado para el evento ', codActual, ' es de: ' , Promedio(montoEvento, cantTickets));  {C}
	end;
	write ('EL mes con mayor monto recaudado es el mes: ', maxMes (VM)); {B}
end;

procedure Inicializar (var V: vectorMeses);
var
	i: rangoMeses;
begin
	for i: 1 to cantMeses do begin
		V[i]:= 0;
	end;
end;

function Promedio (monto: real; cant: integer): real;
begin
	Promedio:= (monto/cant);
end;

function maxMes (v: vectorMeses): rangoMeses;
var
	max: real;
	maxM, i: rangoMeses;
begin
	max:= -1;
	for i: 1 to cantMeses do begin
		if (V[i] > max) then begin
			max:= V[i];
			maxM:= i;
		end;
	end;
	maxMes:= maxM;
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






	

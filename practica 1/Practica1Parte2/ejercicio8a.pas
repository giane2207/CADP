//Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
//del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
//lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
//total acumulado en ventas de todo el mes.
//a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor
//cantidad de ventas.


program ej8ap1p2;

type

  dias = 1..31;
  
var 
 montoDia, montoTotalMes: real;
 ventasDia, MayorCantVentas: integer;
 i, DiaMayorCantVentas: dias;
begin
  MayorCantVentas:=0;
  montoTotalMes:= 0;
  for i:= 1 to 3 do 
   begin
     writeln ('Dia: ', i);
     writeln ('Ingrese el monto de la venta: ');
     readln (montoDia);
     ventasDia:= 0;
     while (montoDia <> 0) do 
       begin
         montoTotalMes:= montoTotalMes + montoDia;
         ventasDia:= ventasDia + 1;
         if (ventasDia > MayorCantVentas) then 
           begin
             DiaMayorCantVentas:= i;
             MayorCantVentas:= ventasDia;
           end;
         writeln ('Ingrese el monto de la venta: ');
         readln (montoDia);
       end;
     writeln ('La cantidad de ventas del dia ', i , ' fueron: ', ventasDia);
   end;
  writeln ('El monto total acumulado en las ventas del mes fue: $', montoTotalMes:1:2);
  writeln ('El dia con la mayor cantidad de ventas fue: ', DiaMayorCantVentas);
end.

{7. a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}



program ej7p2p2;
//modulo
procedure SumaDigitos (var suma, cant: integer; numero: integer);
begin
  suma:=0;
  cant:=0;
  while (numero <> 0) do begin
    suma:= suma + (numero MOD 10);   //descompongo el numero para sumar sus digitos
    cant:= cant + 1;  //cantidad de digitos leidos
    numero:= numero DIV 10;  //elimino el digito sumado para seguir descomponiendo y sumando
   end;
end;
 
//variables del programa principal
var
  sumaDig,cantDigitos, cantDigitosTotal, numero: integer;
  
begin
  cantDigitosTotal:= 0; //inicializo por fuera para saber la totalidad de todos los digitos leidos
 
  repeat 
    writeln ('Ingrese un numero');
    readln (numero);
    SumaDigitos (sumaDig, cantDigitos, numero);
    cantDigitosTotal:=cantDigitosTotal+cantDigitos;
    writeln ('La cantidad de digitos que posee el numero ', numero, ' es: ', cantDigitos);
    writeln('La suma de los digitos es: ', sumaDig);
  until (sumaDig = 10); //leo secuencias de numeros hasta que la suma de los digitos de 10
  
  write ('La cantidad total de digitos leidos fue: ', cantDigitosTotal);
end.

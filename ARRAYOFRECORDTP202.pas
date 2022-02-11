{La empresa Renzo S.A. tiene seis sucursales de venta de automotores. Cada sucursal vende
auto o camiones. Los autos pueden ser  chicos, medianos o grandes. Los camiones  pueden
ser  medianos  o  grandes.    La  empresa  dispone  de  un  array  que  registra  la  información  de
cada  venta  que  se  realiza,  en  todas  las  sucursales:  sucursal,  tipo  de  automotor,  modelo,
tamaño, mes de venta y precio.
Realizar  un procediemiento que permita informar:
a) Cantidad de autos vendidos.
b) Ventas totales por sucursal
c) Tamaño de camión más vendido

Nota: la solución propuesta debe permitir obtener todo lo solicitado recorriendo el array una
sola vez.
}


program Tp20_Ejercicio2;
uses crt,
     math;
type
  registroVehiculos = record
	sucursal : 1..6;
	tipoAutomotor: char;
	modelo: integer;
	tamano: char;
	mes: 1..12;
	precio: integer;
	end;

vectorVehiculos=array [1..8] of registroVehiculos;


Procedure Cargar (var v: vectorVehiculos);
begin
	v[1].sucursal := 5;  v[1].tipoAutomotor:= 'A';	v[1].modelo:= 1999;	v[1].tamano:='C'; v[1].mes:= 3;	v[1].precio:= 100;
	v[2].sucursal := 3;  v[2].tipoAutomotor:= 'C';	v[2].modelo:= 2001;	v[2].tamano:='G'; v[2].mes:= 2;	v[2].precio:= 300;
	v[3].sucursal := 5;  v[3].tipoAutomotor:= 'C';	v[3].modelo:= 2003;	v[3].tamano:='G'; v[3].mes:= 12;v[3].precio:= 300;
	v[4].sucursal := 2;  v[4].tipoAutomotor:= 'A';	v[4].modelo:= 2008;	v[4].tamano:='M'; v[4].mes:= 3;	v[4].precio:= 200;
	v[5].sucursal := 1;  v[5].tipoAutomotor:= 'C';	v[5].modelo:= 2001;	v[5].tamano:='M'; v[5].mes:= 1;	v[5].precio:= 400;
	v[6].sucursal := 2;  v[6].tipoAutomotor:= 'C';	v[6].modelo:= 2019;	v[6].tamano:='G'; v[6].mes:= 8;	v[6].precio:= 200;
	v[7].sucursal := 1;  v[7].tipoAutomotor:= 'A';	v[7].modelo:= 2020;	v[7].tamano:='M'; v[7].mes:= 11;v[7].precio:= 100;
	v[8].sucursal := 6;  v[8].tipoAutomotor:= 'A';	v[8].modelo:= 2017;	v[8].tamano:='C'; v[8].mes:= 1;	v[8].precio:= 300;
end;

Procedure Mostrar (v: vectorVehiculos);
var
  i: integer;
begin
  Writeln('Datos de los vehiculos:');
  for i:= 1 to 8 do
  begin
	Writeln ('Sucursal: ', v[i].sucursal);
	Writeln ('tipo Automotor: ', v[i].tipoAutomotor);
	Writeln ('modelo: ', v[i].modelo);
	Writeln ('tamaño: ', v[i].tamano);
	Writeln ('mes: ', v[i].mes);
	Writeln ('precio: ', v[i].precio);
	Writeln;
  end;
end;

procedure DataProcess (v: vectorVehiculos);
var
	x, ca, cg, cm: integer;
	ventaxsucursal : array [1..6] of integer = (0,0,0,0,0,0);
  cmv : string;
begin
  ca := 0;
  cg := 0;
  cm := 0;
  cmv:='LAS CANTIDADES SON IGUALES ENTRE TAMAÑOS';
  for x := 1 to length(vectorVehiculos) do
  	begin
      if v[x].tipoAutomotor = 'A' then ca := ca + 1; //CANTIDAD DE AUTOS
      ventaxsucursal[v[x].sucursal] :=  ventaxsucursal[v[x].sucursal] + 1; //UN VECTOR CON LA CANTIDAD DE VENTAS POR SUCURSAL
      if (v[x].tipoAutomotor = 'C') AND (v[x].tamano = 'G') then cg := cg + 1;
      if (v[x].tipoAutomotor = 'C') AND (v[x].tamano = 'M') then cm := cm + 1;
  	end;
  writeln('CANTIDAD DE AUTOS VENDIDOS: ',ca);
  writeln('');
  for x := 1 to length(ventaxsucursal) do writeln('SUCURSAL ',x ,' CON ',ventaxsucursal[x], ' UNIDADES VENDIDAS');
  writeln('');
  if (cg<cm) then cmv:= 'LOS CAMIONES MEDIANOS SON LOS MAS VENDIDOS'
  else if (cg>cm) then cmv:= 'LOS CAMIONES GRANDES SON LOS MAS VENDIDOS';
  writeln(cmv,' CON ',max(cg,cm),' UNIDADES VENDIDAS');
end;

var
veh : vectorVehiculos;

BEGIN
	Writeln('Las notas de los alumnos se cargan automáticamente en el vector y luego se muestra sus promedios.');
	Cargar(veh);
	Mostrar(veh);
  readln;
  clrscr;
  DataProcess(veh);
END.

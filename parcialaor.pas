program ParcialArrayReg;
uses crt;

type
  registroCuadros = record
	titulo_cuadro : string;
	nombre_Artista: string;
	precio_venta: integer;
	estado: char;
	end;

vectorCuadros=array [1..10] of registroCuadros;


Procedure Cargar (var v: vectorCuadros);
begin
	v[1].titulo_cuadro := 'Mona Lisa';
	v[1].nombre_Artista:= 'Leonardo da Vinci';
	v[1].precio_venta:= 900;
	v[1].estado:= 'N';

	v[2].titulo_cuadro := 'La Ultima Cena';
	v[2].nombre_Artista:= 'Leonardo da Vinci';
	v[2].precio_venta:= 500;
	v[2].estado:= 'S';

	v[3].titulo_cuadro := 'Guernica';
	v[3].nombre_Artista:= 'Pablo Picasso';
	v[3].precio_venta:= 400;
	v[3].estado:= 'S';

	v[4].titulo_cuadro := 'Las Meninas';
	v[4].nombre_Artista:= 'Diego Velázquez';
	v[4].precio_venta:= 350;
	v[4].estado:= 'S';

	v[5].titulo_cuadro := 'Nunéfares';
	v[5].nombre_Artista:= 'Monet';
	v[5].precio_venta:= 590;
	v[5].estado:= 'N';

	v[6].titulo_cuadro := 'La Noche Estrellada';
	v[6].nombre_Artista:= 'Vincent Van Gogh';
	v[6].precio_venta:= 580;
	v[6].estado:= 'S';

	v[7].titulo_cuadro := 'El Grito';
	v[7].nombre_Artista:= 'Edvard Munch';
	v[7].precio_venta:= 400;
	v[7].estado:= 'S';

	v[8].titulo_cuadro := 'Capilla Sixtina';
	v[8].nombre_Artista:= 'Miguel Angel';
	v[8].precio_venta:= 300;
	v[8].estado:= 'N';


end;

Procedure Mostrar (v: vectorCuadros);
var
  i: integer;
begin
  Writeln('Datos de los Cuadros:');
  for i:= 1 to 8 do
 begin
	Writeln (v[i].titulo_cuadro);
	Writeln (v[i].nombre_Artista);
	Writeln (v[i].precio_venta);
	Writeln (v[i].estado);
	writeln;
  end;
end;

procedure DataProcess1T1(v: vectorCuadros);
var i,c:integer;

begin
  readln;
  clrscr;
  c:=0;
  for i := 1 to 8 do if (v[i].estado = 'S') then c := c + v[i].precio_venta;
  writeln('Los posibles ingresos obtenidos si se venden todos los cuadros es  ', c);
end;

procedure DataProcess1T2(v: vectorCuadros);
var x:integer;

begin
  readln;
  clrscr;
  writeln('CUADROS QUE SUPERAN LOS 600');
  writeln('    TITULO                    ARTISTA');
  for x := 1 to length(vectorCuadros) do
    begin
      if (v[x].precio_venta > 600) then writeln('    ',v[x].titulo_cuadro,'         ',v[x].nombre_Artista);
    end;
end;

procedure DataProcess2T2(v: vectorCuadros);
var x,i:integer;
begin
  i:=0;
  readln;
  clrscr;
  for x := 1 to length(vectorCuadros) do
    begin
      if (v[x].estado = 'N') then i := i+1;
    end;
  writeln('LA CANTIDAD DE OBRAS QUE NO ESTAN A LA VENTA SON ',i);
end;

procedure DataProcess2T1(v: vectorCuadros);
var i:integer;
begin
  readln;
  clrscr;
  writeln('Los artistas y sus respectivas obras a la venta son');
  writeln('');
  for i := 1 to length(vectorCuadros) do
    begin
      if (v[i].estado = 'S') then writeln(v[i].nombre_Artista,'  ', v[i].titulo_cuadro);
    end;
end;



var
vCuadros : vectorCuadros;


BEGIN
	Writeln('Parcial de Array de Registros');
	Cargar(vCuadros);
	Mostrar(vCuadros);
  DataProcess1T2(vCuadros);
  DataProcess2T2(vCuadros);
END.

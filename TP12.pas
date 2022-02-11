program TP12;
uses
  crt;

const
  aSize = 6;

type
  aIndex = 1..aSize;
  aVect = array[aIndex] of integer;
  bVect = array[aIndex] of string;

var
  Debt:aVect = (0 , 1500 , 1800 , 0 , 0 , 670);
  Names:bVect = ('Ana Rodriguez','Carlos Gomez','Pedro Chavez','Margarita Pereyra','Silvia Perez','Mario Gomez');
  x:integer;

begin
  clrscr;
  writeln('Los clientes al dia son: ');
  for x := 1 to aSize do
  begin
    if Debt[x] = 0 then
      begin
        writeln (Names[x]);
      end;
  end;
  writeln(' ');
  writeln('Los clientes deudores son: ');
  for x := 1 to aSize do
  begin
    if Debt[x] <> 0 then
      begin
       writeln (Names[x],' con una deuda de ', Debt[x]);
      end;
  end;
end.

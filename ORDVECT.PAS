program TP10P3;
uses
  crt;

const
  aSize = 10;

type
  aIndex = 1..aSize;
  aVect = array[aIndex] of integer;

var
  v:aVect;
  x:integer;

procedure SelectionSort(var v:aVect);
var i,j,t : integer;
begin
    for i := 1 to aSize-1 do
        for j:=i+1 to aSize do
          if v[i] > v[j] then
            begin
              t := v[i];
              v[i] := v[j];
              v[j] := t;
            end;
end;

procedure WriteArray(var v:aVect);
begin
  for x := 1 to aSize do
    write (v[x] , ',');
end;

procedure UserInput(var v:aVect);
var
  UI:string;
  error:integer;

begin
  for x := 1 to aSize do
  begin
    repeat
      clrscr;
      writeln(v[x]);
      write('INGRESE EL ELEMENTO ', x ,':','  ');
      readln(UI);
      val(UI,v[x],error);
    until error = 0;
    clrscr;
  end;
end;

begin
  UserInput(v);
  WriteArray(v);
  writeln(' ');
  SelectionSort(v);
  WriteArray(v);
end.

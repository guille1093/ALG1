program TP11e04;


uses
  crt,
  cthreads,
  Classes;
var
  numbers:array[1..10] of integer;
  high:integer;
  low:integer;
  x:integer;
  UI:string;
  error:integer;
  highpos:integer;
  lowpos:integer;

procedure quit;
begin
  writeln('//////////////////////////////////////////////////////////////////////////////////////');
  writeln('//////////////////////////////////////////////////////////////////////////////////////');
  writeln;
  writeln;
  writeln;
  writeln('                         Presione enter para salir');
  writeln;
  writeln;
  writeln;
  writeln;
  writeln('//////////////////////////////////////////////////////////////////////////////////////');
  writeln('//////////////////////////////////////////////////////////////////////////////////////');
  readln;
end;

begin
  clrscr;
  for x := 1 to 10 do
  begin
    repeat
        writeln('//////////////////////////////////////////////////////////////////////////////////////');
        writeln('//////////////////////////////////////////////////////////////////////////////////////');
        writeln;
        writeln;
        writeln;
        writeln('                     ingrese el elemento numero ',x);
        writeln;
        writeln;
        writeln;
        writeln;
        writeln('//////////////////////////////////////////////////////////////////////////////////////');
        writeln('//////////////////////////////////////////////////////////////////////////////////////');
        readln(UI);
        val(UI, numbers[x], error);
        clrscr;
    until error = 0;
  end;

  high := numbers[1];
  highpos := 1;
  low := numbers[1];
  lowpos := 1;
  for x := 1 to 10 do
  begin
    if numbers[x] > high then
      begin
        highpos := x;
        high := numbers[x];
      end;


    if numbers[x] < low then
       begin
         lowpos := x;
         low := numbers[x];
       end;
  end;
  writeln('//////////////////////////////////////////////////////////////////////////////////////');
  writeln('//////////////////////////////////////////////////////////////////////////////////////');
  writeln;
  writeln('                   El numero mas alto es: ', high);
  writeln('                   Y se encuentra en la posicion ',highpos);
  writeln;
  writeln('                   El numero mas bajo es: ', low);
  writeln('                   Y se encuentra en la posicion ',lowpos);
  writeln;
  writeln;
  writeln('//////////////////////////////////////////////////////////////////////////////////////');
  writeln('//////////////////////////////////////////////////////////////////////////////////////');
  readln;
  clrscr;
  quit;
end.

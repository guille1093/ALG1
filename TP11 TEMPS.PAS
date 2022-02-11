program TP11;


uses
  crt,
  cthreads,
  Classes;

var
  day:array[1..5] of string = ('LUN', 'MAR', 'MIE', 'JUE', 'VIE');
  high:array[1..5] of integer;
  low:array[1..5] of integer;

  UI:string;
  error:integer;
  x:integer;
  highTEMP:integer;
  lowTEMP:integer;
  highpos:integer;
  lowpos:integer;




procedure quit;
begin
   writeln;
   writeln;
   writeln('PRESIONE ENTER PRA SALIR');
   readln;
end;

begin
  for x := 1 to 5 do
  begin
    repeat
      clrscr;
      writeln(day[x]);
      write('INGRESE LA TEMPERATURA MAS ALTA: ');
      readln(UI);
      val(UI,high[x],error);
    until error = 0;

    repeat
       clrscr;
       writeln(day[x]);
       write('INGRESE LA TEMPERATURA MAS BAJA: ');
       readln(UI);
       val(UI,low[x],error);
    until error = 0;
  end;

  clrscr;



  for x := 1 to 5 do
  begin
    gotoxy(x*10,1);
    write(day[x]);
    gotoxy(x*10,2);
    write(high[x]);
    gotoxy(x*10,3);
    write(low[x]);
  end;
  
  lowTEMP := numbers[1];
  lowpos := 1;
  highTEMP := numbers[1];
  highpos := 1;
  for x := 1 to 6 do
  begin
    if numbers[x] > high then
      begin
        highpos := x;
        highTEMP := numbers[x];
      end;


    if numbers[x] < low then
       begin
         lowpos := x;
         lowTEMP := numbers[x];
       end;

  quit;
end.

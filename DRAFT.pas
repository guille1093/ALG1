program PARCIAL;


uses
  cthreads,
  Classes,
  crt;

const
   n = 4;

type
  i = 1..n;
  iVect = array[i] of integer;
  sVect = array[i] of string;

var
  term:sVect = ('Y','N','L','S');
  total:iVect;
  m:array[i,i] of integer;

  x:integer;
  y:integer;
  t:integer;
  l:integer;

begin
m[1,1] := 500;m[1,2] := 400;m[1,3] := 350;m[1,4] := 200;
m[2,1] := 100;m[2,2] := 150;m[2,3] := 400;m[2,4] := 180;
m[3,1] := 250;m[3,2] := 300;m[3,3] := 200;m[3,4] := 190;
m[4,1] := 130;m[4,2] := 200;m[4,3] := 120;m[4,4] := 300;

clrscr;
  for y := 1 to n do
    begin
      t := 0;
      for x := 1 to n do
        begin
          gotoxy(x*20,y*2);
          delay(n*50);
          write(m[y,x], ' ');
          t := (m[x,y])+t;
          total[y] := t;
          //write(' t:',t);
          {if y = n then
          begin
            gotoxy(x*y*2,y*x*20);
            write(' t:',t);
          end;}
        end;
    end;
writeln('');
writeln('');
for x := 1 to n do
  begin
    writeln('                    TERMINACION ',term[x], ' : ', total[x], '  UNIDADES PRODUCIDAS');
    delay(n*50);
  end;
writeln('');
l := total[1];
for x := 1 to n do
  begin
    if total[x] < l then l := x;
  end;
writeln('                    LA TERMINACION PRODUCIDA A MENOR ESCALA ES ', term[x]);
writeln('');
writeln('');
readln;
end.

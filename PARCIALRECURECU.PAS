program recuperatorio;

uses crt;

const
  f = 5;
  c = 3;

type
  i = 1..f;
  j = 1..c;
  iArray  = array[i]   of integer;
  jArray  = array[j]   of string;
  jsArray = array[j]   of integer;
  matrix  = array[i,j] of integer;

var
  time:iArray;
  m:matrix;
  x, y, t:integer;

procedure matrixload(var m:matrix);
begin
  {}m[1,1]:=  500; {}m[1,2]:=  480; {}m[1,3]:= 2000;
  {}m[2,1]:=  200; {}m[2,2]:=  200; {}m[2,3]:= 3200;
  {}m[3,1]:=  180; {}m[3,2]:=  290; {}m[3,3]:= 1400;
  {}m[4,1]:=  400; {}m[4,2]:=  500; {}m[4,3]:= 8200;
  {}m[5,1]:=  800; {}m[5,2]:=  600; {}m[5,3]:= 9400;
end;

procedure tiempos (var time:iArray);
//VECTOR CON LA SUMA DE LOS TIEMPOS POR ATLETA
begin
    for y := 1 to 5 do
      begin
        t := 0;
        for x := 1 to 3 do
          begin
            t := (m[y,x])+t;
            time[y] := t;
          end;
      end;
for x:=1 to 5 do writeln(time[x]);
//TIEMPO PROMEDIO DEL VECTOR
t:=0;
for x:=1 to 5 do t:= t + time[x];
t:=(t div 5);
writeln('TIEMPO PROMEDIO ',t);
//MOSTRAR ATLETAS QUE SUPERAN EL TIEMPO PROMEDIO
writeln('ATLETAS QUE SUPERARON EL PROMEDIO FUERON: ');
for x:=1 to 5 do if time[x]>t then write(x,',');
end;

begin
matrixload(m);
clrscr;
tiempos(time);

end.

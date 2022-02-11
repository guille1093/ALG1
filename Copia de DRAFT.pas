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
  lab:iArray = (1, 2, 3, 4, 5);
  concep:jArray = ('ELECTRICIDAD', 'AGUA', 'INSUMOS');
  total:iArray;
  conceptotal:jsArray;
  log:iArray;
  time:iArray;
  m:matrix;
  x, y, t, high, highpos:integer;

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
    for y := 1 to 15 do
      begin
        t := 0;
        for x := 1 to 3 do
          begin
            t := (m[y,x])+t;
            time[y] := t;
          end;
      end;
for x:=1 to 15 do writeln(time[x]);
//TIEMPO PROMEDIO DEL VECTOR
t:=0;
for x:=1 to 15 do t:= t + time[x];
t:=(t div 15);
writeln('TIEMPO PROMEDIO ',t);
//MOSTRAR ATLETAS QUE SUPERAN EL TIEMPO PROMEDIO
writeln('ATLETAS QUE SUPERARON EL PROMEDIO FUERON: ');
for x:=1 to 15 do if time[x]>t then write(x,',');
end;




{procedure totals(var total:iArray);
begin
  for y := 1 to f do
    begin
      t := 0;
      for x := 1 to c do
        begin
          gotoxy(x*10,y*2);
          delay(f*c);
          write(m[y,x]);
          t := (m[y,x])+t;
          total[y] := t;
        end;
    end;
end;

procedure totalC(var conceptotal:jsArray);
begin
  for x := 1 to c do
    begin
      t := 0;
      for y := 1 to f do
        begin
          t := (m[y,x])+t;
          conceptotal[x] := t;
        end;
    end;
end;

procedure highlow1(var high, highpos: integer);   //por algun motivo esto no funciono aunque creo que deberia
begin                                             //la idea era operar directamente sobre esa columna
  high := m[x,4];
  highpos := 1;
  for x := 1 to f do
  begin
    if m[x,4] < high then highpos := x;
  end;
end;

procedure logarray(var log:iArray);
begin
  for x := 1 to f do log[x]:= m[x,4];
end;

procedure highlow(var high, highpos: integer);
begin
  high := log[1];
  highpos := 1;
  for x := 1 to f do
  begin
    if log[x] > high then highpos := x;
  end;
end;
}
begin
matrixload(m);
clrscr;
tiempos(time);
{totals(total);
writeln('');
writeln('');

for x := 1 to f do
  begin
    writeln('            GASTO TOTAL DEL LABORATORIO ',lab[x], ' : ', total[x]);
    delay(f*c);
  end;
writeln('');

totalC(conceptotal);

for x := 1 to c do
  begin
    writeln('            GASTO TOTAL CONCEPTOS ',concep[x], ' : ', conceptotal[x]);
    delay(60);
  end;

writeln('');
logarray(log);
highlow(high, highpos);
writeln('            EL LABORATORIO CON MAYOR GASTO DE LOGISTICA ES EL: ',lab[highpos]);
writeln;
writeln;
readln;}
end.

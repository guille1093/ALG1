program recuperatorio;

uses crt;

const
  5 = 5;
  c = 4;

type
  i = 1..5;
  j = 1..c;
  iArray  = array[i]   of integer;
  jArray  = array[j]   of string;
  jsArray = array[j]   of integer;
  matrix  = array[i,j] of integer;

var
  lab:iArray = (1, 2, 3, 4, 5);
  concep:jArray = ('ELECTRICIDAD', 'AGUA', 'INSUMOS','LOGISTICA');
  total:iArray;
  conceptotal:jsArray;
  log:iArray;
  m:matrix;
  x, y, t, high, highpos:integer;

procedure totals(var total:iArray);

end;

procedure totalC(var conceptotal:jsArray);
begin
  for x := 1 to c do
    begin
      t := 0;
      for y := 1 to 5 do
        begin
          t := (m[y,x])+t;
          conceptotal[x] := t;
        end;
    end;
end;


begin
  m[1,1]:=  500;  m[1,2]:=  480;  m[1,3]:= 2000;  m[1,4]:= 4500;
  m[2,1]:=  200;  m[2,2]:=  200;  m[2,3]:= 3200;  m[2,4]:= 1600;
  m[3,1]:=  180;  m[3,2]:=  290;  m[3,3]:= 1400;  m[3,4]:= 20000;
  m[4,1]:=  400;  m[4,2]:=  500;  m[4,3]:= 8200;  m[4,4]:= 1400;
  m[5,1]:=  800;  m[5,2]:=  600;  m[5,3]:= 9400;  m[5,4]:= 1800;

  for y := 1 to 5 do
    begin
      t := 0;
      for x := 1 to c do
        begin
          t := (m[y,x])+t;
          total[y] := t;
        end;
    end;
    begin
      for y := 1 to 5 do
        begin
          t := 0;
          for x := 1 to c do
            begin
              t := (m[y,x])+t;
              total[y] := t;
            end;
        end;
        
for x := 1 to 5 do
  begin
    writeln('GASTO TOTAL DEL LABORATORIO ',lab[x], ' : ', total[x]);
  end;
writeln('');

for x := 1 to c do
  begin
    t := 0;
    for y := 1 to 5 do
      begin
        t := (m[y,x])+t;
        conceptotal[x] := t;
      end;
  end;


for x := 1 to c do
  begin
    writeln('            GASTO TOTAL CONCEPTOS ',concep[x], ' : ', conceptotal[x]);
  end;

writeln('');
log[1] := m[1,4];
log[2] := m[2,4];
log[3] := m[3,4];
log[4] := m[4,4];
log[5] := m[5,4];

 begin
   high := log[1];
   highpos := 1;
   for x := 1 to 5 do
   begin
     if log[x] > high then highpos := x;
   end;

writeln('MAYOR GASTO DE LOGISTICA: ',lab[highpos]);
writeln;
writeln;
end.

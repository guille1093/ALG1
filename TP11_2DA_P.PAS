program TP10P3;


uses crt,StrUtils,sysutils;

  var
    UserAnswer:string;
    UserOption:string;
    numbers:array[1..6] of integer;
    x:integer;
    UI:string;
    error:integer;
    zeropos:string;
    TMPint:integer;
    TMPstring:string;

    procedure DB;
    begin
      writeln('//////////////////////////////////////////////////////////////////////////////////////');
      writeln('//////////////////////////////////////////////////////////////////////////////////////');
    end;

    procedure W;
    begin
      writeln;
    end;

    procedure quit;
    begin
      DB;
      DB;
      W;
      W;
      W;
      writeln('Presione enter para salir');
      W;
      W;
      W;
      W;
      DB;
      DB;
      readln;
    end;



    procedure OptionA;
    begin
      for x := 1 to 6 do
      begin
        repeat
            DB;
            W;
            W;
            W;
            writeln('ingrese el elemento numero ',x);
            W;
            W;
            W;
            W;
            DB;
            readln(UI);
            val(UI, numbers[x], error);
            clrscr;
        until error = 0;
      end;

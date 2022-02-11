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

      zeropos:='';
      TMPstring:='';
      TMPint:=1;

      for x := 1 to 6 do
      begin
        if numbers[x] = 0 then
          begin
            TMPint := x;
            TMPstring := inttostr(TMPint);
            zeropos := zeropos + '  ' + TMPstring;
          end;

      end;

      DB;
      DB;
      W;
      W;
      writeln('Los "0" se encuentran en las posiciones ',zeropos);
      W;
      W;
      W;
      W;
      W;
      DB;
      DB;
      readln;
      clrscr;
      quit;
      end;



    begin
      repeat
        repeat
          clrscr;
          DB;
          DB;
          W;
          writeln('Seleccione la salida del programa: ');
          W;
          writeln('A)');
          writeln('B)');
          writeln('C)');
          writeln('D)');
          W;
          DB;
          DB;
          write('Ingrese una opcion: ');
          readln(UserOption);
          UserOption:=upcase(UserOption);
        until (UserOption = 'A') or (UserOption = 'B') or (UserOption = 'C') or (UserOption = 'D');
        clrscr;
        case UserOption of
        'A': begin
                DB;
                DB;
                W;
                W;
                W;
                writeln('LA OPCION A FUE SELECCIONADA');
                W;
                W;
                W;
                W;
                DB;
                DB;
                readln;
                clrscr;
                OptionA;
              end;


        'B': begin
                DB;
                DB;
                W;
                W;
                W;
                writeln('LA OPCION B FUE SELECCIONADA');
                W;
                W;
                W;
                W;
                DB;
                DB;
                readln;
             end;

        'C': begin
                DB;
                DB;
                W;
                W;
                W;
                writeln('LA OPCION C FUE SELECCIONADA');
                W;
                W;
                W;
                W;
                DB;
                DB;
                readln;
             end;

        'D': begin
                DB;
                DB;
                W;
                W;
                W;
                writeln('LA OPCION D FUE SELECCIONADA');
                W;
                W;
                W;
                W;
                DB;
                DB;
                readln;

             end;

        end;
        clrscr;

      repeat
          DB;
          DB;
          W;
          W;
          W;
          writeln('Desea seguir utilizando el programa? S/N: ');
          W;
          W;
          W;
          W;
          DB;
          DB;
          readln(UserAnswer);
          clrscr;
      until (UserAnswer = 'S') or (UserAnswer = 's') or (UserAnswer = 'N') or (UserAnswer = 'n');
    until (UserAnswer = 'N') or (UserAnswer = 'n');

end.
